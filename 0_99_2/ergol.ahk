#Requires AutoHotkey v2.0

;SetWorkingDir %A_ScriprDir%
;#SingleInstance, force

;SendMode "Input"
SetKeyDelay 0

; il y a trois modificateurs de base : Shift, AltGr, Shift+AltGr
; dans le cas de base, on prend un code de touche, on regarde le ou les modificateurs actifs, et on renvoie le caractère correspondant
; si une touche morte est pressée, on passe dans un autre état, dans lequel à chaque caractère possible dans l'état de base, tous modificateurs compris,
; est associé un nouveau caractère ou une nouvelle touche morte qui déclenchera un autre état etc...

; l'état peut donc être '' (base) ou '**', '*¨', ...

global State := ""
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

SetState(new_state) {
  global State
  State := new_state
}

SendChar(char) {
  global State
  Send char
  State := ""
}

#HotIf Active

SC018::
+SC018:: {
  global State
  if (State == "")
    SetState("**")
  else if (State == "**")
    SetState("*¨")
}

SC039::
+SC039:: {
  global State
  if (State == "")
    Send " "
  else if (State == "**")
    SendChar("’")
  else if (State == "*¨")
    SendChar('"')
  else if (State == "*¤")
    SendChar("¤")
  else if (State == "*^")
    SendChar("^")
  else if (State == "*µ")
    SendChar("µ")
  else if (State == "*´")
    SendChar("'")
  else if (State == "*``")
    SendChar("``")
  else if (State == "*/")
    SendChar("/")
  else if (State == "*`~")
    SendChar("~")
  else if (State == "*¸")
    SendChar("¸")
}

+SC002:: {
  global State
  if (State == "")
    SendText "!"
  else if (State == "**")
    SendChar("¡")
}

SC002:: {
  global State
  if (State == "")
    Send "1"
  else if (State == "**")
    SendChar("„")
  else if (State == "*^")
    SendChar("¹")
}

+SC032:: {
  global State
  if (State == "")
    Send "H"
  else if (State == "*¨")
    SendChar("Ḧ")
  else if (State == "*¤")
    SendChar("₴")
  else if (State == "*^")
    SendChar("Ĥ")
  else if (State == "*µ")
    SendChar("Η")
  else if (State == "*/")
    SendChar("Ħ")
  else if (State == "*¸")
    SendChar("Ḩ")
}

SC032:: {
  global State
  if (State == "")
    Send "h"
  else if (State == "*¨")
    SendChar("ḧ")
  else if (State == "*¤")
    SendChar("₴")
  else if (State == "*^")
    SendChar("ĥ")
  else if (State == "*µ")
    SendChar("η")
  else if (State == "*/")
    SendChar("ħ")
  else if (State == "*¸")
    SendChar("ḩ")
}

+SC003:: {
  global State
  if (State == "")
    Send "@"
  else if (State == "**")
    SendChar("‘")
}

SC003:: {
  global State
  if (State == "")
    Send "2"
  else if (State == "**")
    SendChar("“")
  else if (State == "*^")
    SendChar("²")
}

+SC010:: {
  global State
  if (State == "")
    Send "Q"
  else if (State == "**")
    SendChar("Â")
  else if (State == "*µ")
    SendChar("Χ")
}

SC010:: {
  global State
  if (State == "")
    Send "q"
  else if (State == "**")
    SendChar("â")
  else if (State == "*µ")
    SendChar("χ")
}

+SC004:: {
  global State
  if (State == "")
    SendText "#"
  else if (State == "**")
    SendChar("’")
}

SC004:: {
  global State
  if (State == "")
    Send "3"
  else if (State == "**")
    SendChar("”")
  else if (State == "*^")
    SendChar("³")
}

+SC030:: {
  global State
  if (State == "")
    Send "B"
  else if (State == "*¤")
    SendChar("₱")
  else if (State == "*µ")
    SendChar("Β")
  else if (State == "*/")
    SendChar("Ƀ")
}

SC030:: {
  global State
  if (State == "")
    Send "b"
  else if (State == "*¤")
    SendChar("฿")
  else if (State == "*µ")
    SendChar("β")
  else if (State == "*/")
    SendChar("ƀ")
}

+SC005:: {
  global State
  if (State == "")
    Send "$"
  else if (State == "**")
    SendChar("¢")
}

SC005:: {
  global State
  if (State == "")
    Send "4"
  else if (State == "**")
    SendChar("£")
  else if (State == "*^")
    SendChar("⁴")
}

+SC013:: {
  global State
  if (State == "")
    Send "P"
  else if (State == "**")
    SendChar("Ô")
  else if (State == "*¤")
    SendChar("₧")
  else if (State == "*µ")
    SendChar("Π")
  else if (State == "*´")
    SendChar("Ṕ")
  else if (State == "*/")
    SendChar("Ᵽ")
}

SC013:: {
  global State
  if (State == "")
    Send "p"
  else if (State == "**")
    SendChar("ô")
  else if (State == "*¤")
    SendChar("₰")
  else if (State == "*µ")
    SendChar("π")
  else if (State == "*´")
    SendChar("ṕ")
  else if (State == "*/")
    SendChar("ᵽ")
}

+SC006:: {
  global State
  if (State == "")
    Send "%"
  else if (State == "**")
    SendChar("‰")
}

SC006:: {
  global State
  if (State == "")
    Send "5"
  else if (State == "**")
    SendChar("€")
  else if (State == "*^")
    SendChar("⁵")
}

+SC014:: {
  global State
  if (State == "")
    Send "W"
  else if (State == "*¨")
    SendChar("Ẅ")
  else if (State == "*¤")
    SendChar("₩")
  else if (State == "*^")
    SendChar("Ŵ")
  else if (State == "*µ")
    SendChar("Ω")
  else if (State == "*´")
    SendChar("Ẃ")
  else if (State == "*``")
    SendChar("Ẁ")
}

SC014:: {
  global State
  if (State == "")
    Send "w"
  else if (State == "*¨")
    SendChar("ẅ")
  else if (State == "*¤")
    SendChar("₩")
  else if (State == "*^")
    SendChar("ŵ")
  else if (State == "*µ")
    SendChar("ω")
  else if (State == "*´")
    SendChar("ẃ")
  else if (State == "*``")
    SendChar("ẁ")
}

SC007:: {
  global State
  if (State == "")
    Send "6"
  else if (State == "**")
    SendChar("¥")
  else if (State == "*^")
    SendChar("⁶")
}

+SC007::SendText "^"

SC008:: {
  global State
  if (State == "")
    Send "7"
  else if (State == "**")
    SendChar("¤")
  else if (State == "*^")
    SendChar("⁷")
}

+SC008::Send chr(38) ; &

SC009:: {
  global State
  if (State == "")
    Send "8"
  else if (State == "**")
    SendChar("§")
  else if (State == "*^")
    SendChar("⁸")
}

+SC009::Send chr(42) ; *

SC00a:: {
  global State
  if (State == "")
    Send "9"
  else if (State == "**")
    SendChar("¶")
  else if (State == "*^")
    SendChar("⁹")
}

+SC00a::Send chr(171) ; «

SC00b:: {
  global State
  if (State == "")
    Send "0"
  else if (State == "**")
    SendChar("°")
  else if (State == "*^")
    SendChar("⁰")
}

+SC00b::Send chr(187) ; »

+SC011:: {
  global State
  if (State == "")
    Send "C"
  else if (State == "**")
    SendChar("Ç")
  else if (State == "*¤")
    SendChar("₡")
  else if (State == "*^")
    SendChar("Ĉ")
  else if (State == "*´")
    SendChar("Ć")
  else if (State == "*/")
    SendChar("Ȼ")
  else if (State == "*¸")
    SendChar("Ç")
}

SC011:: {
  global State
  if (State == "")
    Send "c"
  else if (State == "**")
    SendChar("ç")
  else if (State == "*¤")
    SendChar("¢")
  else if (State == "*^")
    SendChar("ĉ")
  else if (State == "*´")
    SendChar("ć")
  else if (State == "*/")
    SendChar("ȼ")
  else if (State == "*¸")
    SendChar("ç")
}

+SC012:: {
  global State
  if (State == "")
    Send "O"
  else if (State == "**")
    SendChar("Œ")
  else if (State == "*¨")
    SendChar("Ö")
  else if (State == "*¤")
    SendChar("૱")
  else if (State == "*^")
    SendChar("Ô")
  else if (State == "*µ")
    SendChar("Ο")
  else if (State == "*´")
    SendChar("Ó")
  else if (State == "*``")
    SendChar("Ò")
  else if (State == "*/")
    SendChar("Ø")
  else if (State == "*`~")
    SendChar("Õ")
}

SC012:: {
  global State
  if (State == "")
    Send "o"
  else if (State == "**")
    SendChar("œ")
  else if (State == "*¨")
    SendChar("ö")
  else if (State == "*¤")
    SendChar("௹")
  else if (State == "*^")
    SendChar("ô")
  else if (State == "*µ")
    SendChar("ο")
  else if (State == "*´")
    SendChar("ó")
  else if (State == "*``")
    SendChar("ò")
  else if (State == "*/")
    SendChar("ø")
  else if (State == "*`~")
    SendChar("õ")
}

SC016:: {
  global State
  if (State == "")
    Send "m"
  else if (State == "**")
    SendChar("µ")
  else if (State == "*¤")
    SendChar("₥")
  else if (State == "*µ")
    SendChar("μ")
  else if (State == "*´")
    SendChar("ḿ")
}

+SC016:: {
  global State
  if (State == "")
    Send "M"
  else if (State == "*¤")
    SendChar("ℳ")
  else if (State == "*µ")
    SendChar("Μ")
  else if (State == "*´")
    SendChar("Ḿ")
}

SC017:: {
  global State
  if (State == "")
    Send "d"
  else if (State == "**")
    SendChar("_")
  else if (State == "*¤")
    SendChar("₫")
  else if (State == "*µ")
    SendChar("δ")
  else if (State == "*/")
    SendChar("đ")
  else if (State == "*¸")
    SendChar("ḑ")
}

+SC017:: {
  global State
  if (State == "")
    Send "D"
  else if (State == "*¤")
    SendChar("₯")
  else if (State == "*µ")
    SendChar("Δ")
  else if (State == "*/")
    SendChar("Đ")
  else if (State == "*¸")
    SendChar("Ḑ")
}

+SC019:: {
  global State
  if (State == "")
    Send "F"
  else if (State == "**")
    SendChar("Ŭ")
  else if (State == "*¤")
    SendChar("₣")
  else if (State == "*µ")
    SendChar("Φ")
}

SC019:: {
  global State
  if (State == "")
    Send "f"
  else if (State == "**")
    SendChar("ŭ")
  else if (State == "*¤")
    SendChar("ƒ")
  else if (State == "*µ")
    SendChar("φ")
}

+SC01e:: {
  global State
  if (State == "")
    Send "A"
  else if (State == "**")
    SendChar("À")
  else if (State == "*¨")
    SendChar("Ä")
  else if (State == "*¤")
    SendChar("₳")
  else if (State == "*^")
    SendChar("Â")
  else if (State == "*µ")
    SendChar("Α")
  else if (State == "*´")
    SendChar("Á")
  else if (State == "*``")
    SendChar("À")
  else if (State == "*/")
    SendChar("Ⱥ")
  else if (State == "*`~")
    SendChar("Ã")
}

SC01e:: {
  global State
  if (State == "")
    Send "a"
  else if (State == "**")
    SendChar("à")
  else if (State == "*¨")
    SendChar("ä")
  else if (State == "*¤")
    SendChar("؋")
  else if (State == "*^")
    SendChar("â")
  else if (State == "*µ")
    SendChar("α")
  else if (State == "*´")
    SendChar("á")
  else if (State == "*``")
    SendChar("à")
  else if (State == "*/")
    SendChar("ⱥ")
  else if (State == "*`~")
    SendChar("ã")
}

+SC01f:: {
  global State
  if (State == "")
    Send "S"
  else if (State == "**")
    SendChar("É")
  else if (State == "*¤")
    SendChar("$")
  else if (State == "*^")
    SendChar("Ŝ")
  else if (State == "*µ")
    SendChar("Σ")
  else if (State == "*´")
    SendChar("Ś")
  else if (State == "*¸")
    SendChar("Ş")
}

SC01f:: {
  global State
  if (State == "")
    Send "s"
  else if (State == "**")
    SendChar("é")
  else if (State == "*¤")
    SendChar("₪")
  else if (State == "*^")
    SendChar("ŝ")
  else if (State == "*µ")
    SendChar("σ")
  else if (State == "*´")
    SendChar("ś")
  else if (State == "*¸")
    SendChar("ş")
}

+SC020:: {
  global State
  if (State == "")
    Send "E"
  else if (State == "**")
    SendChar("È")
  else if (State == "*¨")
    SendChar("Ë")
  else if (State == "*¤")
    SendChar("₠")
  else if (State == "*^")
    SendChar("Ê")
  else if (State == "*µ")
    SendChar("Ε")
  else if (State == "*´")
    SendChar("É")
  else if (State == "*``")
    SendChar("È")
  else if (State == "*/")
    SendChar("Ɇ")
  else if (State == "*`~")
    SendChar("Ẽ")
  else if (State == "*¸")
    SendChar("Ȩ")
}

SC020:: {
  global State
  if (State == "")
    Send "e"
  else if (State == "**")
    SendChar("è")
  else if (State == "*¨")
    SendChar("ë")
  else if (State == "*¤")
    SendChar("€")
  else if (State == "*^")
    SendChar("ê")
  else if (State == "*µ")
    SendChar("ε")
  else if (State == "*´")
    SendChar("é")
  else if (State == "*``")
    SendChar("è")
  else if (State == "*/")
    SendChar("ɇ")
  else if (State == "*`~")
    SendChar("ẽ")
  else if (State == "*¸")
    SendChar("ȩ")
}

+SC021:: {
  global State
  if (State == "")
    Send "N"
  else if (State == "**")
    SendChar("Ê")
  else if (State == "*¤")
    SendChar("₦")
  else if (State == "*µ")
    SendChar("Ν")
  else if (State == "*´")
    SendChar("Ń")
  else if (State == "*``")
    SendChar("Ǹ")
  else if (State == "*`~")
    SendChar("Ñ")
  else if (State == "*¸")
    SendChar("Ņ")
}

SC021:: {
  global State
  if (State == "")
    Send "n"
  else if (State == "**")
    SendChar("ê")
  else if (State == "*¤")
    SendChar("₦")
  else if (State == "*µ")
    SendChar("ν")
  else if (State == "*´")
    SendChar("ń")
  else if (State == "*``")
    SendChar("ǹ")
  else if (State == "*`~")
    SendChar("ñ")
  else if (State == "*¸")
    SendChar("ņ")
}

+SC022:: {
  global State
  if (State == "")
    Send ";"
  else if (State == "**")
    SendChar("•")
}

SC022:: {
  global State
  if (State == "")
    Send ","
  else if (State == "**")
    SendChar("·")
}

+SC033:: {
  global State
  if (State == "")
    Send "G"
  else if (State == "*¤")
    SendChar("₲")
  else if (State == "*^")
    SendChar("Ĝ")
  else if (State == "*µ")
    SendChar("Γ")
  else if (State == "*´")
    SendChar("Ǵ")
  else if (State == "*/")
    SendChar("Ǥ")
  else if (State == "*¸")
    SendChar("Ģ")
}

SC033:: {
  global State
  if (State == "")
    Send "g"
  else if (State == "*¤")
    SendChar("₲")
  else if (State == "*^")
    SendChar("ĝ")
  else if (State == "*µ")
    SendChar("γ")
  else if (State == "*´")
    SendChar("ǵ")
  else if (State == "*/")
    SendChar("ǥ")
  else if (State == "*¸")
    SendChar("ģ")
}

+SC025:: {
  global State
  if (State == "")
    Send "T"
  else if (State == "**")
    SendChar("Î")
  else if (State == "*¤")
    SendChar("₮")
  else if (State == "*µ")
    SendChar("Τ")
  else if (State == "*/")
    SendChar("Ŧ")
  else if (State == "*¸")
    SendChar("Ţ")
}

SC025:: {
  global State
  if (State == "")
    Send "t"
  else if (State == "**")
    SendChar("î")
  else if (State == "*¨")
    SendChar("ẗ")
  else if (State == "*¤")
    SendChar("৳")
  else if (State == "*µ")
    SendChar("τ")
  else if (State == "*/")
    SendChar("ŧ")
  else if (State == "*¸")
    SendChar("ţ")
}

+SC026:: {
  global State
  if (State == "")
    Send "I"
  else if (State == "**")
    SendChar("Û")
  else if (State == "*¨")
    SendChar("Ï")
  else if (State == "*¤")
    SendChar("៛")
  else if (State == "*^")
    SendChar("Î")
  else if (State == "*µ")
    SendChar("Ι")
  else if (State == "*´")
    SendChar("Í")
  else if (State == "*``")
    SendChar("Ì")
  else if (State == "*/")
    SendChar("Ɨ")
  else if (State == "*`~")
    SendChar("Ĩ")
}

SC026:: {
  global State
  if (State == "")
    Send "i"
  else if (State == "**")
    SendChar("û")
  else if (State == "*¨")
    SendChar("ï")
  else if (State == "*¤")
    SendChar("﷼")
  else if (State == "*^")
    SendChar("î")
  else if (State == "*µ")
    SendChar("ι")
  else if (State == "*´")
    SendChar("í")
  else if (State == "*``")
    SendChar("ì")
  else if (State == "*/")
    SendChar("ɨ")
  else if (State == "*`~")
    SendChar("ĩ")
}

+SC027:: {
  global State
  if (State == "")
    Send "U"
  else if (State == "**")
    SendChar("Ù")
  else if (State == "*¨")
    SendChar("Ü")
  else if (State == "*¤")
    SendChar("圓")
  else if (State == "*^")
    SendChar("Û")
  else if (State == "*µ")
    SendChar("Υ")
  else if (State == "*´")
    SendChar("Ú")
  else if (State == "*``")
    SendChar("Ù")
  else if (State == "*/")
    SendChar("Ʉ")
  else if (State == "*`~")
    SendChar("Ũ")
}

SC027:: {
  global State
  if (State == "")
    Send "u"
  else if (State == "**")
    SendChar("ù")
  else if (State == "*¨")
    SendChar("ü")
  else if (State == "*¤")
    SendChar("元")
  else if (State == "*^")
    SendChar("û")
  else if (State == "*µ")
    SendChar("υ")
  else if (State == "*´")
    SendChar("ú")
  else if (State == "*``")
    SendChar("ù")
  else if (State == "*/")
    SendChar("ʉ")
  else if (State == "*`~")
    SendChar("ũ")
}

+SC02c:: {
  global State
  if (State == "")
    Send "Z"
  else if (State == "**")
    SendChar("Æ")
  else if (State == "*^")
    SendChar("Ẑ")
  else if (State == "*µ")
    SendChar("Ζ")
  else if (State == "*´")
    SendChar("Ź")
  else if (State == "*/")
    SendChar("Ƶ")
}

SC02c:: {
  global State
  if (State == "")
    Send "z"
  else if (State == "**")
    SendChar("æ")
  else if (State == "*^")
    SendChar("ẑ")
  else if (State == "*µ")
    SendChar("ζ")
  else if (State == "*´")
    SendChar("ź")
  else if (State == "*/")
    SendChar("ƶ")
}

+SC02d:: {
  global State
  if (State == "")
    Send "X"
  else if (State == "**")
    SendChar("ẞ")
  else if (State == "*¨")
    SendChar("Ẍ")
  else if (State == "*µ")
    SendChar("Ξ")
}

SC02d:: {
  global State
  if (State == "")
    Send "x"
  else if (State == "**")
    SendChar("ß")
  else if (State == "*¨")
    SendChar("ẍ")
  else if (State == "*µ")
    SendChar("ξ")
}

+SC02e:: {
  global State
  if (State == "")
    Send "?"
  else if (State == "**")
    SendChar("¿")
}

SC02e:: {
  global State
  if (State == "")
    Send "-"
  else if (State == "**")
    SendChar("—")
  else if (State == "*^")
    SendChar("⁻")
}

+SC035:: {
  global State
  if (State == "")
    Send "K"
  else if (State == "*¤")
    SendChar("₭")
  else if (State == "*µ")
    SendChar("Κ")
  else if (State == "*´")
    SendChar("Ḱ")
  else if (State == "*¸")
    SendChar("Ķ")
}

SC035:: {
  global State
  if (State == "")
    Send "k"
  else if (State == "*¤")
    SendChar("₭")
  else if (State == "*µ")
    SendChar("κ")
  else if (State == "*´")
    SendChar("ḱ")
  else if (State == "*¸")
    SendChar("ķ")
}

+SC02f:: {
  global State
  if (State == "")
    Send "V"
  else if (State == "**")
    SendChar("Ñ")
  else if (State == "*`~")
    SendChar("Ṽ")
}

SC02f:: {
  global State
  if (State == "")
    Send "v"
  else if (State == "**")
    SendChar("ñ")
  else if (State == "*`~")
    SendChar("ṽ")
}

SC031:: {
  global State
  if (State == "")
    Send "."
  else if (State == "**")
    SendChar("…")
}

+SC031::Send ":"

+SC00c:: {
  global State
  if (State == "")
    Send "_"
  else if (State == "**")
    SendChar("–")
}

SC00c:: {
  global State
  if (State == "")
    Send "/"
  else if (State == "**")
    SendChar("÷")
}

+SC024:: {
  global State
  if (State == "")
    Send "R"
  else if (State == "*¤")
    SendChar("₨")
  else if (State == "*µ")
    SendChar("Ρ")
  else if (State == "*´")
    SendChar("Ŕ")
  else if (State == "*/")
    SendChar("Ɍ")
  else if (State == "*¸")
    SendChar("Ŗ")
}

SC024:: {
  global State
  if (State == "")
    Send "r"
  else if (State == "*¤")
    SendChar("₢")
  else if (State == "*µ")
    SendChar("ρ")
  else if (State == "*´")
    SendChar("ŕ")
  else if (State == "*/")
    SendChar("ɍ")
  else if (State == "*¸")
    SendChar("ŗ")
}

+SC00d:: {
  global State
  if (State == "")
    SendText "+"
  else if (State == "**")
    SendChar("±")
  else if (State == "*^")
    SendChar("⁺")
}

SC00d:: {
  global State
  if (State == "")
    Send "="
  else if (State == "**")
    SendChar("≠")
  else if (State == "*^")
    SendChar("⁼")
  else if (State == "*/")
    SendChar("≠")
  else if (State == "*`~")
    SendChar("≃")
}

+SC034:: {
  global State
  if (State == "")
    Send "Y"
  else if (State == "*¨")
    SendChar("Ÿ")
  else if (State == "*¤")
    SendChar("円")
  else if (State == "*^")
    SendChar("Ŷ")
  else if (State == "*µ")
    SendChar("Ψ")
  else if (State == "*´")
    SendChar("Ý")
  else if (State == "*``")
    SendChar("Ỳ")
  else if (State == "*/")
    SendChar("Ɏ")
  else if (State == "*`~")
    SendChar("Ỹ")
}

SC034:: {
  global State
  if (State == "")
    Send "y"
  else if (State == "*¨")
    SendChar("ÿ")
  else if (State == "*¤")
    SendChar("¥")
  else if (State == "*^")
    SendChar("ŷ")
  else if (State == "*µ")
    SendChar("ψ")
  else if (State == "*´")
    SendChar("ý")
  else if (State == "*``")
    SendChar("ỳ")
  else if (State == "*/")
    SendChar("ɏ")
  else if (State == "*`~")
    SendChar("ỹ")
}

+SC023:: {
  global State
  if (State == "")
    Send "L"
  else if (State == "*¤")
    SendChar("₤")
  else if (State == "*µ")
    SendChar("Λ")
  else if (State == "*´")
    SendChar("Ĺ")
  else if (State == "*/")
    SendChar("Ł")
  else if (State == "*¸")
    SendChar("Ļ")
}

SC023:: {
  global State
  if (State == "")
    Send "l"
  else if (State == "*¤")
    SendChar("£")
  else if (State == "*µ")
    SendChar("λ")
  else if (State == "*´")
    SendChar("ĺ")
  else if (State == "*/")
    SendChar("ł")
  else if (State == "*¸")
    SendChar("ļ")
}

+SC015:: {
  global State
  if (State == "")
    Send "J"
  else if (State == "*^")
    SendChar("Ĵ")
  else if (State == "*µ")
    SendChar("Θ")
  else if (State == "*/")
    SendChar("Ɉ")
}

SC015:: {
  global State
  if (State == "")
    Send "j"
  else if (State == "*^")
    SendChar("ĵ")
  else if (State == "*µ")
    SendChar("θ")
  else if (State == "*/")
    SendChar("ɉ")
}

SC056:: {
  global State
  if (State == "")
    Send "<"
  else if (State == "*/")
    SendChar("≮")
  else if (State == "*`~")
    SendChar("≲")
}

+SC056:: {
  global State
  if (State == "")
    Send ">"
  else if (State == "*/")
    SendChar("≯")
  else if (State == "*`~")
    SendChar("≳")
}

SC01a::Send chr(91) ; [
+SC01a::Send "`{" ; {

SC01b::Send chr(93) ; ]
+SC01b::Send "`}" ; }

SC028::Send "`'"
+SC028::Send "`""

SC029::Send "``"
+SC029::Send "`~"

SC02b::Send chr(92) ; \
+SC02b::Send chr(124) ; |

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
<^>!+SC013::SetState("*¤")

<^>!SC014::Send "%"
<^>!+SC014::Send "‰"

<^>!SC015::SendText "^"
<^>!+SC015::SetState("*^")

<^>!SC016::Send "&"
<^>!+SC016::SetState("*µ")

<^>!SC017::Send "*"
<^>!+SC017::Send "×"

<^>!SC018::Send "'"
<^>!+SC018::SetState("*´")

<^>!SC019::Send "``"
<^>!+SC019::SetState("*``")

<^>!SC01e::SendText "{"

<^>!SC01f::Send "("
<^>!+SC01f::Send "⁽"

<^>!SC020::Send ")"
<^>!+SC020::Send "⁾"

<^>!SC021::SendText "}"

<^>!SC022::Send "="
<^>!+SC022::Send "≠"

<^>!SC023::Send "\"
<^>!+SC023::SetState("*/")

<^>!SC024::SendText "+"
<^>!+SC024::Send "±"

<^>!SC025::Send "-"
<^>!+SC025::Send "—"

<^>!SC026::Send "/"
<^>!+SC026::Send "÷"

<^>!SC027::Send '"'
<^>!+SC027::SetState("*¨")

<^>!SC02c::Send "~"
<^>!+SC02c::SetState("*~")

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
<^>!+SC033::SetState("*¸")

<^>!SC034::Send ":"

<^>!SC035::Send "?"

<^>!SC039::Send " "
<^>!+SC039::Send " "
