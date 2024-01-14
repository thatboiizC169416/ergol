#Requires AutoHotkey v2.0

; Tentative de support minimal d’Ergo‑L via AHK, sans touches mortes.
; Le script ne contient donc que des assignations et devrait être le plus 
; rapide et le plus stable possible… mais il est inutilisable en l’état.

global Active := true

Alt & RAlt::
RAlt & Alt:: {
  global Active
  Active := !Active
  if Active
    ToolTip "Ergo-L est actif"
  else
    ToolTip "Ergo-L est inactif"
  SetTimer () => ToolTip(), -1500
}

#HotIf Active

; Layout

SC002::Send "1"
+SC002::SendText "!"

SC003::Send "2"
+SC003::Send "@"

SC004::Send "3"
+SC004::SendText "#"

SC005::Send "4"
+SC005::Send "$"

SC006::Send "5"
+SC006::Send "%"

SC007::Send "6"
+SC007::SendText "^"

SC008::Send "7"
+SC008::Send "&"

SC009::Send "8"
+SC009::Send "*"

SC00a::Send "9"
+SC00a::Send "«"

SC00b::Send "0"
+SC00b::Send "»"

SC00c::Send "/"
+SC00c::Send "_"

SC00d::Send "="
+SC00d::SendText "+"

SC010::Send "q"
+SC010::Send "Q"

SC011::Send "c"
+SC011::Send "C"

SC012::Send "o"
+SC012::Send "O"

SC013::Send "p"
+SC013::Send "P"

SC014::Send "w"
+SC014::Send "W"

SC015::Send "j"
+SC015::Send "J"

SC016::Send "m"
+SC016::Send "M"

SC017::Send "d"
+SC017::Send "D"

SC018::
+SC018::Send "’"

SC019::Send "f"
+SC019::Send "F"

SC01a::Send "["
+SC01a::Send "`{"

SC01b::Send "]"
+SC01b::Send "`}"

SC01e::Send "a"
+SC01e::Send "A"

SC01f::Send "s"
+SC01f::Send "S"

SC020::Send "e"
+SC020::Send "E"

SC021::Send "n"
+SC021::Send "N"

SC022::Send ","
+SC022::Send ";"

SC023::Send "l"
+SC023::Send "L"

SC024::Send "r"
+SC024::Send "R"

SC025::Send "t"
+SC025::Send "T"

SC026::Send "i"
+SC026::Send "I"

SC027::Send "u"
+SC027::Send "U"

SC028::Send "`'"
+SC028::Send "`""

SC029::Send "``"
+SC029::Send "`~"

SC02b::Send "\"
+SC02b::Send "|"

SC02c::Send "z"
+SC02c::Send "Z"

SC02d::Send "x"
+SC02d::Send "X"

SC02e::Send "-"
+SC02e::Send "?"

SC02f::Send "v"
+SC02f::Send "V"

SC030::Send "b"
+SC030::Send "B"

SC031::Send "."
+SC031::Send ":"

SC032::Send "h"
+SC032::Send "H"

SC033::Send "g"
+SC033::Send "G"

SC034::Send "y"
+SC034::Send "Y"

SC035::Send "k"
+SC035::Send "K"

SC039::
+SC039::Send " "

SC056::Send "<"
+SC056::Send ">"

; Shortcuts

^SC010::Send "^q"
^+SC010::Send "^+q"

^SC011::Send "^c"
^+SC011::Send "^+c"

^SC012::Send "^o"
^+SC012::Send "^+o"

^SC013::Send "^p"
^+SC013::Send "^+p"

^SC014::Send "^w"
^+SC014::Send "^+w"

^SC015::Send "^j"
^+SC015::Send "^+j"

^SC016::Send "^m"
^+SC016::Send "^+m"

^SC017::Send "^d"
^+SC017::Send "^+d"

^SC019::Send "^f"
^+SC019::Send "^+f"

^SC01e::Send "^a"
^+SC01e::Send "^+a"

^SC01f::Send "^s"
^+SC01f::Send "^+s"

^SC020::Send "^e"
^+SC020::Send "^+e"

^SC021::Send "^n"
^+SC021::Send "^+n"

^SC023::Send "^l"
^+SC023::Send "^+l"

^SC024::Send "^r"
^+SC024::Send "^+r"

^SC025::Send "^t"
^+SC025::Send "^+t"

^SC026::Send "^i"
^+SC026::Send "^+i"

^SC027::Send "^u"
^+SC027::Send "^+u"

^SC02c::Send "^z"
^+SC02c::Send "^+z"

^SC02d::Send "^x"
^+SC02d::Send "^+x"

^SC02f::Send "^v"
^+SC02f::Send "^+v"

^SC030::Send "^b"
^+SC030::Send "^+b"

^SC032::Send "^h"
^+SC032::Send "^+h"

^SC033::Send "^g"
^+SC033::Send "^+g"

^SC034::Send "^y"
^+SC034::Send "^+y"

^SC035::Send "^k"
^+SC035::Send "^+k"

; Symbols

<^>!SC002::Send "₁"
<^>!+SC002::Send "¹"

<^>!SC003::Send "₂"
<^>!+SC003::Send "²"

<^>!SC004::Send "₃"
<^>!+SC004::Send "³"

<^>!SC005::Send "₄"
<^>!+SC005::Send "⁴"

<^>!SC006::Send "₅"
<^>!+SC006::Send "⁵"

<^>!SC007::Send "₆"
<^>!+SC007::Send "⁶"

<^>!SC008::Send "₇"
<^>!+SC008::Send "⁷"

<^>!SC009::Send "₈"
<^>!+SC009::Send "⁸"

<^>!SC00a::Send "₉"
<^>!+SC00a::Send "⁹"

<^>!SC00b::Send "₀"
<^>!+SC00b::Send "⁰"

<^>!SC010::Send "@"

<^>!SC011::Send "<"
<^>!+SC011::Send "≤"

<^>!SC012::Send ">"
<^>!+SC012::Send "≥"

<^>!SC013::Send "$"

<^>!SC014::Send "%"
<^>!+SC014::Send "‰"

<^>!SC015::SendText "^"

<^>!SC016::Send "&"

<^>!SC017::Send "*"
<^>!+SC017::Send "×"

<^>!SC018::Send "'"

<^>!SC019::Send "``"

<^>!SC01e::SendText "{"

<^>!SC01f::Send "("
<^>!+SC01f::Send "⁽"

<^>!SC020::Send ")"
<^>!+SC020::Send "⁾"

<^>!SC021::SendText "}"

<^>!SC022::Send "="
<^>!+SC022::Send "≠"

<^>!SC023::Send "\"

<^>!SC024::SendText "+"
<^>!+SC024::Send "±"

<^>!SC025::Send "-"
<^>!+SC025::Send "—"

<^>!SC026::Send "/"
<^>!+SC026::Send "÷"

<^>!SC027::Send '"'

<^>!SC02c::Send "~"

<^>!SC02d::Send "["

<^>!SC02e::Send "]"

<^>!SC02f::Send "_"
<^>!+SC02f::Send "–"

<^>!SC030::SendText "#"

<^>!SC031::Send "|"
<^>!+SC031::Send "¦"

<^>!SC032::SendText "!"
<^>!+SC032::Send "¬"

<^>!SC033::Send ";"

<^>!SC034::Send ":"

<^>!SC035::Send "?"

<^>!SC039::
<^>!+SC039::Send " "
