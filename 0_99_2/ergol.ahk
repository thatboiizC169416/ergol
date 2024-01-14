; This is an AutoHotKey 1.1 script. PKL and EPKL still rely on AHK 1.1, too.
; AutoHotKey 2.0 is way too slow to emulate keyboard layouts at the moment
; — or maybe we’ve missed the proper options to speed it up.

#NoEnv
#Persistent
#InstallKeybdHook
#SingleInstance,       force
#MaxThreadsBuffer
#MaxThreadsPerHotKey   3
#MaxHotkeysPerInterval 300
#MaxThreads            20

; SendMode Input
SendMode Event
SetKeyDelay,   -1
SetBatchLines, -1
Process, Priority, , R
SetWorkingDir, %A_ScriptDir%
StringCaseSense, On

; DeadKey Helpers

global DeadKey := ""

DoAction(action) {
  global DeadKey

  if (StrLen(action) == 2) {
    DeadKey := action
  }
  else {
    Send, {%action%}
    DeadKey := ""
  }
}

SendKey(base, keymap) {
  global DeadKey

  if (DeadKey == "") {
    DoAction(base)
  }
  else if keymap.HasKey(DeadKey) {
    DoAction(keymap[DeadKey])
  }
  else {
    term := SubStr(DeadKey, 2, 1)
    Send {%term%}
    Send {%base%}
    DeadKey := ""
  }
}

; Layout

 SC002::SendKey("1", { "**": "„", "*^": "¹" })
+SC002::SendKey("!", { "**": "¡"            })

 SC003::SendKey("2", { "**": "“", "*^": "²" })
+SC003::SendKey("@", { "**": "‘"            })

 SC004::SendKey("3", { "**": "“", "*^": "³" })
+SC004::Send {U+0023} ; #

 SC005::SendKey("4", { "**": "£", "*^": "⁴" })
+SC005::Send $

 SC006::SendKey("5", { "**": "£", "*^": "⁵" })
+SC006::Send `%

 SC007::SendKey("6", { "**": "¥", "*^": "⁶" })
+SC007::Send {U+005E} ; ^

 SC008::SendKey("7", { "**": "¤", "*^": "⁷" })
+SC008::Send &

 SC009::SendKey("8", { "**": "§", "*^": "⁸" })
+SC009::Send *

 SC00a::SendKey("9", { "**": "¶", "*^": "⁹" })
+SC00a::Send «

 SC00b::SendKey("0", { "**": "°", "*^": "⁰" })
+SC00b::Send »

 SC00c::SendKey("/", { "**": "÷" })
+SC00c::SendKey("_", { "**": "–" })

; {U+002B} +
 SC00d::SendKey("=", { "**": "≠", "*^": "⁼", "*`~": "≃" })
;+SC00d::SendKey("+`, { "**": "±", "*^": "⁺"             })

 SC010::SendKey("q", { "**": "â", "*µ": "χ" })
+SC010::SendKey("Q", { "**": "Â", "*µ": "Χ" })

 SC011::SendKey("c", { "**": "ç", "*¤": "¢", "*^": "ĉ", "*´": "ć", "*/": "ȼ", "*¸": "ç" })
+SC011::SendKey("C", { "**": "Ç", "*¤": "₡", "*^": "Ĉ", "*´": "Ć", "*/": "Ȼ", "*¸": "Ç" })

 SC012::SendKey("o", { "**": "œ", "*¨": "ö", "*¤": "௹", "*^": "ô", "*µ": "ο", "*´": "ó", "*``": "ò", "*/": "ø", "*`~": "õ" })
+SC012::SendKey("O", { "**": "Œ", "*¨": "Ö", "*¤": "૱", "*^": "Ô", "*µ": "Ο", "*´": "Ó", "*``": "Ò", "*/": "Ø", "*`~": "Õ" })

 SC013::SendKey("p", { "**": "ô", "*¤": "₰", "*µ": "π", "*´": "ṕ", "*/": "ᵽ" })
+SC013::SendKey("P", { "**": "Ô", "*¤": "₧", "*µ": "Π", "*´": "Ṕ", "*/": "Ᵽ" })

 SC014::SendKey("w", { "*¨": "ẅ", "*¤": "₩", "*^": "ŵ", "*µ": "ω", "*´": "ẃ", "*``": "ẁ" })
+SC014::SendKey("W", { "*¨": "Ẅ", "*¤": "₩", "*^": "Ŵ", "*µ": "Ω", "*´": "Ẃ", "*``": "Ẁ" })

 SC015::SendKey("j", { "*^": "ĵ", "*µ": "θ", "*/": "ɉ" })
+SC015::SendKey("J", { "*^": "Ĵ", "*µ": "Θ", "*/": "Ɉ" })

 SC016::SendKey("m", { "**": "µ", "*¤": "₥", "*´": "ḿ", "*µ": "μ" })
+SC016::SendKey("M", { "*¤": "ℳ", "*µ": "Μ", "*´": "Ḿ"            })

 SC017::SendKey("d", { "**": "_", "*¤": "₫", "*µ": "δ", "*/": "đ", "*¸": "ḑ" })
+SC017::SendKey("D", { "**": "_", "*¤": "₯", "*µ": "Δ", "*/": "Đ", "*¸": "Ḑ" })

 SC018::
+SC018::SendKey("**", { "**": "*¨" })

 SC019::SendKey("f", { "**": "ŭ", "*¤": "ƒ", "*µ": "φ" })
+SC019::SendKey("F", { "**": "Ŭ", "*¤": "₣", "*µ": "Φ" })

 SC01a::Send [
+SC01a::Send {U+007B} ; {

 SC01b::Send ]
+SC01b::Send {U+007D} ; }

 SC01e::SendKey("a", { "**": "à", "*¨": "ä", "*¤": "؋", "*^": "â", "*µ": "α", "*´": "á", "*``": "à", "*/": "ⱥ", "*`~": "ã" })
+SC01e::SendKey("A", { "**": "À", "*¨": "Ä", "*¤": "₳", "*^": "Â", "*µ": "Α", "*´": "Á", "*``": "À", "*/": "Ⱥ", "*`~": "Ã" })

 SC01f::SendKey("s", { "**": "é", "*¤": "₪", "*^": "ŝ", "*µ": "σ", "*´": "ś", "*¸": "ş" })
+SC01f::SendKey("S", { "**": "É", "*¤": "$", "*^": "Ŝ", "*µ": "Σ", "*´": "Ś", "*¸": "Ş" })

 SC020::SendKey("e", { "**": "è", "*¨": "ë", "*¤": "€", "*^": "ê", "*µ": "ε", "*´": "é", "*``": "è", "*/": "ɇ", "*`~": "ẽ", "*¸": "ȩ" })
+SC020::SendKey("E", { "**": "È", "*¨": "Ë", "*¤": "₠", "*^": "Ê", "*µ": "Ε", "*´": "É", "*``": "È", "*/": "Ɇ", "*`~": "Ẽ", "*¸": "Ȩ" })

 SC021::SendKey("n", { "**": "ê", "*¤": "₦", "*µ": "ν", "*´": "ń", "*``": "ǹ", "*`~": "ñ", "*¸": "ņ" })
+SC021::SendKey("N", { "**": "Ê", "*¤": "₦", "*µ": "Ν", "*´": "Ń", "*``": "Ǹ", "*`~": "Ñ", "*¸": "Ņ" })

 SC022::SendKey("`,", { "**": "·" })
+SC022::SendKey("`;", { "**": "•" })

 SC023::SendKey("l", { "*¤": "£", "*µ": "λ", "*´": "ĺ", "*/": "ł", "*¸": "ļ" })
+SC023::SendKey("L", { "*¤": "₤", "*µ": "Λ", "*´": "Ĺ", "*/": "Ł", "*¸": "Ļ" })

 SC024::SendKey("r", { "*¤": "₢", "*µ": "ρ", "*´": "ŕ", "*/": "ɍ", "*¸": "ŗ" })
+SC024::SendKey("R", { "*¤": "₨", "*µ": "Ρ", "*´": "Ŕ", "*/": "Ɍ", "*¸": "Ŗ" })

 SC025::SendKey("t", { "**": "î", "*¨": "ẗ", "*¤": "৳", "*µ": "τ", "*/": "ŧ", "*¸": "ţ" })
+SC025::SendKey("T", { "**": "Î",            "*¤": "₮", "*µ": "Τ", "*/": "Ŧ", "*¸": "Ţ" })

 SC026::SendKey("i", { "**": "û", "*¨": "ï", "*¤": "﷼", "*^": "î", "*µ": "ι", "*´": "í", "*``": "ì", "*/": "ɨ", "*`~": "ĩ" })
+SC026::SendKey("I", { "**": "Û", "*¨": "Ï", "*¤": "៛", "*^": "Î", "*µ": "Ι", "*´": "Í", "*``": "Ì", "*/": "Ɨ", "*`~": "Ĩ" })

 SC027::SendKey("u", { "**": "ù", "*¨": "ü", "*¤": "元", "*^": "û", "*µ": "υ", "*´": "ú", "*``": "ù", "*/": "ʉ", "*`~": "ũ" })
+SC027::SendKey("U", { "**": "Ù", "*¨": "Ü", "*¤": "圓", "*^": "Û", "*µ": "Υ", "*´": "Ú", "*``": "Ù", "*/": "Ʉ", "*`~": "Ũ" })

 SC028::Send `'
+SC028::Send `"

 SC029::Send ``
+SC029::Send `~

 SC02b::Send \
+SC02b::Send |

 SC02c::SendKey("z", { "**": "æ", "*^": "ẑ", "*µ": "ζ", "*´": "ź", "*/": "ƶ" })
+SC02c::SendKey("Z", { "**": "Æ", "*^": "Ẑ", "*µ": "Ζ", "*´": "Ź", "*/": "Ƶ" })

 SC02d::SendKey("x", { "**": "ß", "*¨": "ẍ", "*µ": "ξ" })
+SC02d::SendKey("X", { "**": "ẞ", "*¨": "Ẍ", "*µ": "Ξ" })

 SC02e::SendKey("-", { "**": "—", "*^": "⁻" })
+SC02e::SendKey("?", { "**": "¿"            })

 SC02f::SendKey("v", { "**": "ñ", "*`~": "ṽ" })
+SC02f::SendKey("V", { "**": "Ñ", "*`~": "Ṽ" })

 SC030::SendKey("b", { "*¤": "฿", "*µ": "β", "*/": "ƀ" })
+SC030::SendKey("B", { "*¤": "₱", "*µ": "Β", "*/": "Ƀ" })

 SC031::SendKey(".", { "**": "…" })
+SC031::Send :

 SC032::SendKey("h", { "*¨": "ḧ", "*¤": "₴", "*^": "ĥ", "*µ": "η", "*/": "ħ", "*¸": "ḩ" })
+SC032::SendKey("H", { "*¨": "Ḧ", "*¤": "₴", "*^": "Ĥ", "*µ": "Η", "*/": "Ħ", "*¸": "Ḩ" })

 SC033::SendKey("g", { "**": "µ", "*¤": "₲", "*^": "ĝ", "*µ": "γ", "*´": "ǵ", "*/": "ǥ", "*¸": "ģ" })
+SC033::SendKey("G", { "*¤": "₲",            "*^": "Ĝ", "*µ": "Γ", "*´": "Ǵ", "*/": "Ǥ", "*¸": "Ģ" })

 SC034::SendKey("y", { "*¨": "ÿ", "*¤": "¥", "*^": "ŷ", "*µ": "ψ", "*´": "ý", "*``": "ỳ", "*/": "ɏ", "*`~": "ỹ" })
+SC034::SendKey("Y", { "*¨": "Ÿ", "*¤": "円", "*^": "Ŷ", "*µ": "Ψ", "*´": "Ý", "*``": "Ỳ", "*/": "Ɏ", "*`~": "Ỹ" })

 SC035::SendKey("k", { "*¤": "₭", "*µ": "κ", "*´": "ḱ", "*¸": "ķ" })
+SC035::SendKey("K", { "*¤": "₭", "*µ": "Κ", "*´": "Ḱ", "*¸": "Ķ" })

; {U+0020} space
; {U+202F} narrow no-break space
; {U+2019} ’
 SC039::SendKey("U+0020", { "**": "U+2019", "*¤": "¤", "*^": "^", "*µ": "µ", "*´": "'", "*``": "``", "*/": "/", "*`~": "~", "*¸": "¸" })
+SC039::SendKey("U+202F", { "**": "U+2019", "*¤": "¤", "*^": "^", "*µ": "µ", "*´": "'", "*``": "``", "*/": "/", "*`~": "~", "*¸": "¸" })

 SC056::SendKey("<", { "*/": "≮", "*~": "≲" })
+SC056::SendKey(">", { "*/": "≯", "*~": "≳" })

; Shortcuts

 ^SC010::Send ^q
^+SC010::Send ^+q

 ^SC011::Send ^c
^+SC011::Send ^+c

 ^SC012::Send ^o
^+SC012::Send ^+o

 ^SC013::Send ^p
^+SC013::Send ^+p

 ^SC014::Send ^w
^+SC014::Send ^+w

 ^SC015::Send ^j
^+SC015::Send ^+j

 ^SC016::Send ^m
^+SC016::Send ^+m

 ^SC017::Send ^d
^+SC017::Send ^+d

 ^SC019::Send ^f
^+SC019::Send ^+f

 ^SC01e::Send ^a
^+SC01e::Send ^+a

 ^SC01f::Send ^s
^+SC01f::Send ^+s

 ^SC020::Send ^e
^+SC020::Send ^+e

 ^SC021::Send ^n
^+SC021::Send ^+n

 ^SC023::Send ^l
^+SC023::Send ^+l

 ^SC024::Send ^r
^+SC024::Send ^+r

 ^SC025::Send ^t
^+SC025::Send ^+t

 ^SC026::Send ^i
^+SC026::Send ^+i

 ^SC027::Send ^u
^+SC027::Send ^+u

 ^SC02c::Send ^z
^+SC02c::Send ^+z

 ^SC02d::Send ^x
^+SC02d::Send ^+x

 ^SC02e::Send ^c
^+SC02e::Send ^+c

 ^SC02f::Send ^v
^+SC02f::Send ^+v

 ^SC030::Send ^b
^+SC030::Send ^+b

 ^SC032::Send ^h
^+SC032::Send ^+h

 ^SC033::Send ^g
^+SC033::Send ^+g

 ^SC034::Send ^y
^+SC034::Send ^+y

 ^SC035::Send ^k
^+SC035::Send ^+k

; Symbols

 <^>!SC002::Send ₁
<^>!+SC002::Send ¹

 <^>!SC003::Send ₂
<^>!+SC003::Send ²

 <^>!SC004::Send ₃
<^>!+SC004::Send ³

 <^>!SC005::Send ₄
<^>!+SC005::Send ⁴

 <^>!SC006::Send ₅
<^>!+SC006::Send ⁵

 <^>!SC007::Send ₆
<^>!+SC007::Send ⁶

 <^>!SC008::Send ₇
<^>!+SC008::Send ⁷

 <^>!SC009::Send ₈
<^>!+SC009::Send ⁸

 <^>!SC00a::Send ₉
<^>!+SC00a::Send ⁹

 <^>!SC00b::Send ₀
<^>!+SC00b::Send ⁰

 <^>!SC010::Send @

 <^>!SC011::Send <
<^>!+SC011::Send ≤

 <^>!SC012::Send >
<^>!+SC012::Send ≥

 <^>!SC013::Send $

 <^>!SC014::Send `%
<^>!+SC014::Send ‰

 <^>!SC015::Send {U+005E} ; ^
<^>!+SC015::SendKey("*^", {})

 <^>!SC016::Send &
<^>!+SC016::SendKey("*µ", {})

 <^>!SC017::Send *
<^>!+SC017::Send ×

 <^>!SC018::Send '
<^>!+SC018::SendKey("*´", {})

 <^>!SC019::Send ``
<^>!+SC019::SendKey("*``", {})

 <^>!SC01e::Send {U+007B} ; {

 <^>!SC01f::Send (
<^>!+SC01f::Send ⁽

 <^>!SC020::Send )
<^>!+SC020::Send ⁾

 <^>!SC021::Send {U+007D} ; }

 <^>!SC022::Send `=
<^>!+SC022::Send ≠

 <^>!SC023::Send \

 <^>!SC024::Send {U+002B} ; +
<^>!+SC024::Send ±

 <^>!SC025::Send -
<^>!+SC025::Send —

 <^>!SC026::Send {U+002F} ; /
<^>!+SC026::Send ÷

 <^>!SC027::Send "
<^>!+SC027::SendKey("*¨", {})

 <^>!SC02c::Send ~
<^>!+SC02c::SendKey("*~", {})

 <^>!SC02d::Send [

 <^>!SC02e::Send ]

 <^>!SC02f::Send _
<^>!+SC02f::Send –

 <^>!SC030::Send {U+0023} ; #

 <^>!SC031::Send |
<^>!+SC031::Send ¦

 <^>!SC032::Send {U+0021} ; !
<^>!+SC032::Send ¬

 <^>!SC033::Send `;

 <^>!SC034::Send :

 <^>!SC035::Send ?

 <^>!SC039::Send {U+0020} ; space
<^>!+SC039::Send {U+00A0} ; no-break space

; Special Keys
$<^>!Esc::       Send {SC01}
$<^>!End::       Send {SC4f}
$<^>!Home::      Send {SC47}
$<^>!Enter::     Send {SC1c}
$<^>!Delete::    Send {SC53}
$<^>!Backspace:: Send {SC0e}
