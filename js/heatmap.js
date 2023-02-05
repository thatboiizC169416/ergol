window.addEventListener('DOMContentLoaded', () => {
  'use strict'; // eslint-disable-line

  const keyboard = document.querySelector('x-keyboard');

  let keyChars = {};
  let corpus = {};
  let digrams = {};
  let corpusName = '';

  // create an efficient hash table to parse a text
  const supportedChars = (keymap, deadkeys) => {
    const charTable = {};
    const deadTable = {};

    // main chars, directly accessible (or with Shift / AltGr)
    Object.entries(keymap).forEach(([key, values]) => {
      values.forEach((char) => {
        if (!(char in charTable)) {
          if (char.length === 1) {
            charTable[char] = [key];
          } else if (!(char in deadTable)) {
            deadTable[char] = key;
          }
        }
      });
    });

    // additional chars, requiring dead keys
    Object.entries(deadkeys).forEach(([key, dict]) => {
      Object.entries(dict).forEach(([orig, char]) => {
        if (!(char in charTable) && charTable[orig]) {
          charTable[char] = [deadTable[key]].concat(charTable[orig]);
        }
      });
    });

    return charTable;
  };

  // display a percentage value
  const fmtPercent = (num, p) => `${Math.round(10 ** p * num) / 10 ** p}%`;
  const showPercent = (sel, num, precision) => {
    document.querySelector(sel).innerText = fmtPercent(num, precision);
  };

  // display a finger/frequency table and bar graph
  const showFingerData = (sel, values, maxValue, precision) => {
    const canvas = document.querySelector(`${sel} canvas`);
    const table = document.querySelector(`${sel} table`);

    canvas.width = 1000;
    canvas.height = 100;
    const ctx = canvas.getContext('2d');
    ctx.save();
    ctx.fillStyle = '#88f';
    const width = canvas.width / 11;
    const margin = 20;
    const scale = 100 / maxValue;

    let cols = '';
    Object.values(values).forEach((value, i) => {
      const idx = i >= 4 ? i + 2 : i + 1;
      cols += (i === 4 ? '<td></td>' : '')
           + `<td>${fmtPercent(value, precision)}</td>`;
      ctx.fillRect(idx * width + margin / 2, canvas.height - value * scale,
        width - margin / 2, value * scale);
    });
    ctx.restore();
    table.innerHTML = `<tr><td></td>${cols}<td></td></tr>`;
  };

  // display a string/frequency table
  const showTableData = (tableSelector, title, values, precision) => {
    document.querySelector(tableSelector).innerHTML =
      `<tr><th colspan="2">${title}</td><th></tr>` + Object.entries(values)
      .filter(([digram, freq]) => freq >= 10 ** (-precision))
      .map(([digram, freq]) =>
        `<tr><td>${digram}</td><td>${fmtPercent(freq, precision)}</td></tr>`)
      .join('');
  };

  // compute the same-finger and same-key usages
  const sfu = () => {
    const skuCount = {}; // same-key usage
    const sfuCount = {}; // same-finger usage
    const skuDigrams = {};
    const sfuDigrams = {};
    const fingers = ['l5', 'l4', 'l3', 'l2', 'r2', 'r3', 'r4', 'r5'];
    fingers.forEach((finger) => {
      sfuCount[finger] = 0;
      skuCount[finger] = 0;
    });

    const keyFinger = {};
    Object.entries(keyboard.fingerAssignments).forEach(([f, keys]) => {
      keys.forEach((keyName) => { keyFinger[keyName] = f; });
    });

    // note: in Ergol, ï and î are same-finger digrams even though they are
    // single characters => count symbols, too?
    const sum = (acc, freq) => acc + freq;
    const total = Object.values(digrams).reduce(sum, 0);
    Object.entries(digrams)
      .map(([digram, frequency]) => [digram, 100 * frequency / total])
      .forEach(([digram, frequency]) => {
        keyboard.layout.getKeySequence(digram).reduce((acc, key) => {
          const finger = keyFinger[key.id];
          if (finger) { // in case there's no key for the current character...
            if (acc === key.id) {
              skuDigrams[digram] = frequency;
              skuCount[finger] += frequency;
            }
            else if (keyFinger[acc] === finger) {
              sfuDigrams[digram] = frequency;
              sfuCount[finger] += frequency;
            }
          }
          return key.id;
        }, '');
      });

    showPercent('#sfu-all', Object.values(sfuCount).reduce(sum, 0), 2);
    showPercent('#sku-all', Object.values(skuCount).reduce(sum, 0), 2);

    // display metrics
    showFingerData('#sfu', sfuCount, 3.5, 2);
    showFingerData('#sku', skuCount, 3.5, 2);
    showTableData('#sfu-digrams', 'SFU', sfuDigrams, 2);
    showTableData('#sku-digrams', 'SKU', skuDigrams, 2);
  };

  // compute the heatmap for a text on a given layout
  const heatmap = () => {
    const keyCount = {};
    Object.values(keyChars).forEach((keys) => {
      keys.forEach((key) => {
        keyCount[key] = 0;
      });
    });

    // count the key strokes in the corpus
    const unsupportedChars = {};
    Object.entries(corpus).forEach(([char, count]) => {
      const keys = keyChars[char];
      if (keys) {
        keys.forEach((key) => { keyCount[key] += count; });
      } else {
        unsupportedChars[char] = count;
      }
    });

    // display the heatmap
    const colormap = {};
    const contrast = 5;
    const total = Object.values(corpus).reduce((acc, n) => n + acc, 0);
    Object.keys(keyboard.layout.keyMap).forEach((key) => {
      if (key !== 'Space') {
        const count = key in keyCount ? keyCount[key] : 0;
        const lvl = 255 - Math.floor((255 * contrast * count) / total);
        colormap[key] = `rgb(${lvl}, ${lvl}, 255)`; // blue scale
      }
    });
    keyboard.setCustomColors(colormap);

    // give some metrics
    const fingerCount = {};
    const fingerLoad = {};
    let keystrokes = 0;
    Object.entries(keyboard.fingerAssignments).forEach(([f, keys]) => {
      fingerCount[f] = keys.filter((id) => id in keyCount)
        .reduce((acc, id) => acc + keyCount[id], 0);
      keystrokes += fingerCount[f];
    });
    Object.entries(fingerCount).forEach(([f, count]) => {
      fingerLoad[f] = (100 * count) / keystrokes;
    });
    const sum = (acc, id) => fingerLoad[id] + acc;
    showPercent('#load-left', ['l2', 'l3', 'l4', 'l5'].reduce(sum, 0), 1);
    showPercent('#load-right', ['r2', 'r3', 'r4', 'r5'].reduce(sum, 0), 1);

    // display metrics
    showFingerData('#load', fingerLoad, 25.0, 1);
    showTableData('#unsupported', 'non-support\u00e9', unsupportedChars, 3);
  };

  // keyboard state: these <select> element IDs match the x-keyboard properties
  // -- but the `layout` property requires a JSON fetch
  const IDs = [ 'layout', 'geometry', 'corpus' ];
  const setProp = (key, value) => {
    if (key === 'layout') {
      if (value) {
        fetch(`layouts.heatmap/${value}.json`)
          .then((response) => response.json())
          .then((data) => {
            keyboard.setKeyboardLayout(data.keymap, data.deadkeys,
              data.geometry.replace('ergo', 'iso'));
            data.keymap.Enter = [ '\r', '\n' ];
            keyChars = supportedChars(data.keymap, data.deadkeys);
            if (Object.keys(corpus).length > 0) {
              heatmap();
              sfu();
            }
          });
      } else {
        keyboard.setKeyboardLayout();
        keyChars = {};
        // input.placeholder = 'select a keyboard layout';
      }
    } else if (key === 'corpus') {
      if (value && value !== corpusName) {
        fetch(`corpus/${value}.json`)
          .then((response) => response.json())
          .then((data) => {
            corpus = data.symbols;
            digrams = data.digrams;
            if (Object.keys(keyChars).length > 0) {
              heatmap();
              sfu();
            }
          });
        corpusName = value;
      }
    } else {
      keyboard[key] = value;
    }
    document.getElementById(key).value = value;
  };

  // store the keyboard state in the URL hash like it's 1995 again! :-)
  const state = {};
  const updateHashState = (key, value) => {
    state[key] = value;
    window.location.hash = IDs
      .reduce((hash, prop) => `${hash}/${state[prop]}`, '')
      .replace(/\/+$/, '');
  };
  const applyHashState = () => {
    const hashState = window.location.hash.split('/').slice(1);
    IDs.forEach((key, i) => {
      setProp(key, hashState[i] || '');
      state[key] = hashState[i] || '';
    });
  };
  IDs.forEach((key) => {
    document.getElementById(key).addEventListener('change',
      (event) => updateHashState(key, event.target.value));
  });
  window.addEventListener('hashchange', applyHashState);
  applyHashState();
});
