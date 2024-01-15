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

SendMode Event ; either Event or Input
SetKeyDelay,   -1
SetBatchLines, -1
Process, Priority, , R
SetWorkingDir, %A_ScriptDir%
StringCaseSense, On

;-------------------------------------------------------------------------------
; On/Off Switch
;-------------------------------------------------------------------------------

global Active := True

HideTrayTip() {
  TrayTip  ; Attempt to hide it the normal way.
  if SubStr(A_OSVersion,1,3) = "10." {
    Menu Tray, NoIcon
    Sleep 200  ; It may be necessary to adjust this sleep.
    Menu Tray, Icon
  }
}

ShowTrayTip() {
  title := "Ergo-L"
  text := Active ? "ON" : "OFF"
  HideTrayTip()
  TrayTip, %title% , %text%, 1, 0x31
  SetTimer, HideTrayTip, -1500
}

RAlt & Alt::
Alt & RAlt::
  global Active
  Active := !Active
  ShowTrayTip()
  return

#If Active
SetTimer, ShowTrayTip, -1000  ; not working

;-------------------------------------------------------------------------------
; DeadKey Helpers
;-------------------------------------------------------------------------------

global DeadKey := ""

DoTerm(base:="") {
  global DeadKey

  term := SubStr(DeadKey, 2, 1)
  Send, {%term%}
  Send, {%base%}
  DeadKey := ""
}

DoAction(action:="") {
  global DeadKey

  if (StrLen(action) != 2) {
    Send, {%action%}
    DeadKey := ""
  }
  else if (action == DeadKey) {
    DoTerm(SubStr(DeadKey, 2, 1))
  }
  else {
    DeadKey := action
  }
}

SendKey(base, deadkeymap) {
  if (!DeadKey) {
	DoAction(base)
  }
  else if (deadkeymap.HasKey(DeadKey)) {
    DoAction(deadkeymap[DeadKey])
  }
  else {
    DoTerm(base)
  }
}

;-------------------------------------------------------------------------------
; Layout
;-------------------------------------------------------------------------------

 SC002::SendKey("1", { "**": "„", "*^": "¹" })
+SC002::SendKey("!", { "**": "¡"            })

 SC003::SendKey("2", { "**": "“", "*^": "²" })
+SC003::SendKey("@", { "**": "U+2018" }) ; ‘ left single quotation mark

 SC004::SendKey("3", { "**": "“", "*^": "³" })
+SC004::SendKey("#", { "**": "U+2019" }) ; ’ right single quotation mark

 SC005::SendKey("4", { "**": "£", "*^": "⁴" })
+SC005::SendKey("$", { "**": "¢"            })

 SC006::SendKey("5", { "**": "€", "*^": "⁵" })
+SC006::SendKey("%", { "**": "£"            })

 SC007::SendKey("6", { "**": "¥", "*^": "⁶" })
+SC007::SendKey("U+005E", {}) ; ^ circumflex accent

 SC008::SendKey("7", { "**": "¤", "*^": "⁷" })
+SC008::SendKey("&", {                      })

 SC009::SendKey("8", { "**": "§", "*^": "⁸" })
+SC009::SendKey("*", {                      })

 SC00a::SendKey("9", { "**": "¶", "*^": "⁹" })
+SC00a::SendKey("«", { "**": "‹"            })

 SC00b::SendKey("0", { "**": "°", "*^": "⁰" })
+SC00b::SendKey("»", { "**": "›"            })

 SC00c::SendKey("/", { "**": "÷" })
+SC00c::SendKey("_", { "**": "–" })

 SC00d::SendKey("=", { "**": "≠", "*^": "⁼", "*~": "≃" })
+SC00d::SendKey("+", { "**": "±", "*^": "⁺"             })

 SC010::SendKey("q", { "**": "â", "*µ": "χ" })
+SC010::SendKey("Q", { "**": "Â", "*µ": "Χ" })

 SC011::SendKey("c", { "**": "ç", "*¤": "¢", "*^": "ĉ", "*´": "ć", "*/": "ȼ", "*¸": "ç" })
+SC011::SendKey("C", { "**": "Ç", "*¤": "₡", "*^": "Ĉ", "*´": "Ć", "*/": "Ȼ", "*¸": "Ç" })

 SC012::SendKey("o", { "**": "œ", "*¨": "ö", "*¤": "௹", "*^": "ô", "*µ": "ο", "*´": "ó", "*``": "ò", "*/": "ø", "*~": "õ" })
+SC012::SendKey("O", { "**": "Œ", "*¨": "Ö", "*¤": "૱", "*^": "Ô", "*µ": "Ο", "*´": "Ó", "*``": "Ò", "*/": "Ø", "*~": "Õ" })

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

 SC01a::SendKey("[", {})
+SC01a::SendKey("{", {})

 SC01b::SendKey("]", {})
+SC01b::SendKey("}", {})

 SC01e::SendKey("a", { "**": "à", "*¨": "ä", "*¤": "؋", "*^": "â", "*µ": "α", "*´": "á", "*``": "à", "*/": "ⱥ", "*~": "ã" })
+SC01e::SendKey("A", { "**": "À", "*¨": "Ä", "*¤": "₳", "*^": "Â", "*µ": "Α", "*´": "Á", "*``": "À", "*/": "Ⱥ", "*~": "Ã" })

 SC01f::SendKey("s", { "**": "é", "*¤": "₪", "*^": "ŝ", "*µ": "σ", "*´": "ś", "*¸": "ş" })
+SC01f::SendKey("S", { "**": "É", "*¤": "$", "*^": "Ŝ", "*µ": "Σ", "*´": "Ś", "*¸": "Ş" })

 SC020::SendKey("e", { "**": "è", "*¨": "ë", "*¤": "€", "*^": "ê", "*µ": "ε", "*´": "é", "*``": "è", "*/": "ɇ", "*~": "ẽ", "*¸": "ȩ" })
+SC020::SendKey("E", { "**": "È", "*¨": "Ë", "*¤": "₠", "*^": "Ê", "*µ": "Ε", "*´": "É", "*``": "È", "*/": "Ɇ", "*~": "Ẽ", "*¸": "Ȩ" })

 SC021::SendKey("n", { "**": "ê", "*¤": "₦", "*µ": "ν", "*´": "ń", "*``": "ǹ", "*~": "ñ", "*¸": "ņ" })
+SC021::SendKey("N", { "**": "Ê", "*¤": "₦", "*µ": "Ν", "*´": "Ń", "*``": "Ǹ", "*~": "Ñ", "*¸": "Ņ" })

 SC022::SendKey(",", { "**": "·" })
+SC022::SendKey(";", { "**": "•" })

 SC023::SendKey("l", { "*¤": "£", "*µ": "λ", "*´": "ĺ", "*/": "ł", "*¸": "ļ" })
+SC023::SendKey("L", { "*¤": "₤", "*µ": "Λ", "*´": "Ĺ", "*/": "Ł", "*¸": "Ļ" })

 SC024::SendKey("r", { "*¤": "₢", "*µ": "ρ", "*´": "ŕ", "*/": "ɍ", "*¸": "ŗ" })
+SC024::SendKey("R", { "*¤": "₨", "*µ": "Ρ", "*´": "Ŕ", "*/": "Ɍ", "*¸": "Ŗ" })

 SC025::SendKey("t", { "**": "î", "*¨": "ẗ", "*¤": "৳", "*µ": "τ", "*/": "ŧ", "*¸": "ţ" })
+SC025::SendKey("T", { "**": "Î",            "*¤": "₮", "*µ": "Τ", "*/": "Ŧ", "*¸": "Ţ" })

 SC026::SendKey("i", { "**": "û", "*¨": "ï", "*¤": "﷼", "*^": "î", "*µ": "ι", "*´": "í", "*``": "ì", "*/": "ɨ", "*~": "ĩ" })
+SC026::SendKey("I", { "**": "Û", "*¨": "Ï", "*¤": "៛", "*^": "Î", "*µ": "Ι", "*´": "Í", "*``": "Ì", "*/": "Ɨ", "*~": "Ĩ" })

 SC027::SendKey("u", { "**": "ù", "*¨": "ü", "*¤": "元", "*^": "û", "*µ": "υ", "*´": "ú", "*``": "ù", "*/": "ʉ", "*~": "ũ" })
+SC027::SendKey("U", { "**": "Ù", "*¨": "Ü", "*¤": "圓", "*^": "Û", "*µ": "Υ", "*´": "Ú", "*``": "Ù", "*/": "Ʉ", "*~": "Ũ" })

 SC028::SendKey("U+0027", {}) ; ' apostrophe
+SC028::SendKey("U+0022", {}) ; " quotation mark

 SC029::SendKey("U+0060", {}) ; ` grave accent
+SC029::SendKey("U+007E", {}) ; ~ tilde

 SC02b::SendKey("\", {})
+SC02b::SendKey("|", {})

 SC02c::SendKey("z", { "**": "æ", "*^": "ẑ", "*µ": "ζ", "*´": "ź", "*/": "ƶ" })
+SC02c::SendKey("Z", { "**": "Æ", "*^": "Ẑ", "*µ": "Ζ", "*´": "Ź", "*/": "Ƶ" })

 SC02d::SendKey("x", { "**": "ß", "*¨": "ẍ", "*µ": "ξ" })
+SC02d::SendKey("X", { "**": "ẞ", "*¨": "Ẍ", "*µ": "Ξ" })

 SC02e::SendKey("-", { "**": "—", "*^": "⁻" })
+SC02e::SendKey("?", { "**": "¿"            })

 SC02f::SendKey("v", { "**": "ñ", "*~": "ṽ" })
+SC02f::SendKey("V", { "**": "Ñ", "*~": "Ṽ" })

 SC030::SendKey("b", { "*¤": "฿", "*µ": "β", "*/": "ƀ" })
+SC030::SendKey("B", { "*¤": "₱", "*µ": "Β", "*/": "Ƀ" })

 SC031::SendKey(".", { "**": "…" })
+SC031::SendKey(":", {           })

 SC032::SendKey("h", { "*¨": "ḧ", "*¤": "₴", "*^": "ĥ", "*µ": "η", "*/": "ħ", "*¸": "ḩ" })
+SC032::SendKey("H", { "*¨": "Ḧ", "*¤": "₴", "*^": "Ĥ", "*µ": "Η", "*/": "Ħ", "*¸": "Ḩ" })

 SC033::SendKey("g", { "**": "µ", "*¤": "₲", "*^": "ĝ", "*µ": "γ", "*´": "ǵ", "*/": "ǥ", "*¸": "ģ" })
+SC033::SendKey("G", { "*¤": "₲",            "*^": "Ĝ", "*µ": "Γ", "*´": "Ǵ", "*/": "Ǥ", "*¸": "Ģ" })

 SC034::SendKey("y", { "*¨": "ÿ", "*¤": "¥", "*^": "ŷ", "*µ": "ψ", "*´": "ý", "*``": "ỳ", "*/": "ɏ", "*~": "ỹ" })
+SC034::SendKey("Y", { "*¨": "Ÿ", "*¤": "円", "*^": "Ŷ", "*µ": "Ψ", "*´": "Ý", "*``": "Ỳ", "*/": "Ɏ", "*~": "Ỹ" })

 SC035::SendKey("k", { "*¤": "₭", "*µ": "κ", "*´": "ḱ", "*¸": "ķ" })
+SC035::SendKey("K", { "*¤": "₭", "*µ": "Κ", "*´": "Ḱ", "*¸": "Ķ" })

; {U+0020}   space
; {U+202F}   narrow no-break space
; {U+2019} ’ right single quotation mark
; {U+0022} " quotation mark
 SC039::SendKey("U+0020", { "**": "U+2019", "*¨": "U+0022", "*¤": "¤", "*^": "^", "*µ": "µ", "*´": "'", "*``": "``", "*/": "/", "*~": "~", "*¸": "¸" })
+SC039::SendKey("U+202F", { "**": "U+2019", "*¨": "U+0022", "*¤": "¤", "*^": "^", "*µ": "µ", "*´": "'", "*``": "``", "*/": "/", "*~": "~", "*¸": "¸" })

 SC056::SendKey("<", { "*/": "≮", "*~": "≲" })
+SC056::SendKey(">", { "*/": "≯", "*~": "≳" })

;-------------------------------------------------------------------------------
; Symbols
;-------------------------------------------------------------------------------

 <^>!SC002::DoAction("₁")
<^>!+SC002::DoAction("¹")

 <^>!SC003::DoAction("₂")
<^>!+SC003::DoAction("²")

 <^>!SC004::DoAction("₃")
<^>!+SC004::DoAction("³")

 <^>!SC005::DoAction("₄")
<^>!+SC005::DoAction("⁴")

 <^>!SC006::DoAction("₅")
<^>!+SC006::DoAction("⁵")

 <^>!SC007::DoAction("₆")
<^>!+SC007::DoAction("⁶")

 <^>!SC008::DoAction("₇")
<^>!+SC008::DoAction("⁷")

 <^>!SC009::DoAction("₈")
<^>!+SC009::DoAction("⁸")

 <^>!SC00a::DoAction("₉")
<^>!+SC00a::DoAction("⁹")

 <^>!SC00b::DoAction("₀")
<^>!+SC00b::DoAction("⁰")

 <^>!SC010::DoAction("@")
<^>!+SC010::DoAction()

 <^>!SC011::DoAction("<")
<^>!+SC011::DoAction("≤")

 <^>!SC012::DoAction(">")
<^>!+SC012::DoAction("≥")

 <^>!SC013::DoAction("$")
<^>!+SC013::DoAction()

 <^>!SC014::DoAction("%")
<^>!+SC014::DoAction("‰")

 <^>!SC015::DoAction("^")
<^>!+SC015::DoAction("*^")

 <^>!SC016::DoAction("&")
<^>!+SC016::DoAction("*µ")

 <^>!SC017::DoAction("*")
<^>!+SC017::DoAction("×")

 <^>!SC018::DoAction("'")
<^>!+SC018::DoAction("*´")

 <^>!SC019::DoAction("``")
<^>!+SC019::DoAction("*``")

 <^>!SC01e::DoAction("{")
<^>!+SC01e::DoAction()

 <^>!SC01f::DoAction("(")
<^>!+SC01f::DoAction("⁽")

 <^>!SC020::DoAction(")")
<^>!+SC020::DoAction("⁾")

 <^>!SC021::DoAction("}")
<^>!+SC021::DoAction()

 <^>!SC022::DoAction("=")
<^>!+SC022::DoAction("≠")

 <^>!SC023::DoAction("\")
<^>!+SC023::DoAction()

 <^>!SC024::DoAction("+")
<^>!+SC024::DoAction("±")

 <^>!SC025::DoAction("-")
<^>!+SC025::DoAction("—")

 <^>!SC026::DoAction("/")
<^>!+SC026::DoAction("÷")

 <^>!SC027::DoAction("U+0022") ; " quotation mark
<^>!+SC027::DoAction("*¨")

 <^>!SC02c::DoAction("~")
<^>!+SC02c::DoAction("*~")

 <^>!SC02d::DoAction("[")
<^>!+SC02d::DoAction()

 <^>!SC02e::DoAction("]")
<^>!+SC02e::DoAction()

 <^>!SC02f::DoAction("_")
<^>!+SC02f::DoAction("–")

 <^>!SC030::DoAction("#")
<^>!+SC030::DoAction("")

 <^>!SC031::DoAction("|")
<^>!+SC031::DoAction("¦")

 <^>!SC032::DoAction("!")
<^>!+SC032::DoAction("¬")

 <^>!SC033::DoAction(";")
<^>!+SC033::DoAction()

 <^>!SC034::DoAction(":")
<^>!+SC034::DoAction()

 <^>!SC035::DoAction("?")
<^>!+SC035::DoAction()

 <^>!SC039::DoAction("U+0020") ; space
<^>!+SC039::DoAction("U+00A0") ; no-break space

; Special Keys
$<^>!Esc::       Send {SC01}
$<^>!End::       Send {SC4f}
$<^>!Home::      Send {SC47}
$<^>!Enter::     Send {SC1c}
$<^>!Delete::    Send {SC53}
$<^>!Backspace:: Send {SC0e}

;-------------------------------------------------------------------------------
; Shortcuts
;-------------------------------------------------------------------------------

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
