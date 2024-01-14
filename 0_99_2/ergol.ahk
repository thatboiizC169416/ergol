; This is an AutoHotKey 1.1 script. PKL and EPKL still rely on AHK 1.1, too.
; AutoHot4Key 2.0 is way too slow to emulate keyboard layouts at the moment
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

SetState(state) {
  global DeadKey
  if DeadKey == state
    SendChar("*") ; terminator character
  else
    DeadKey := state
}

SendChar(char) {
  global DeadKey
  Send {%char%}
  DeadKey := ""
}

; Layout

SC002::
  global DeadKey
  if (DeadKey == "")
    Send 1
  else if (DeadKey == "**")
    SendChar("„")
  else if (DeadKey == "*^")
    SendChar("¹")
  return

+SC002::
  global DeadKey
  if (DeadKey == "")
    Send {U+0021} ; !
  else if (DeadKey == "**")
    SendChar("¡")
  return

SC003::
  global DeadKey
  if (DeadKey == "")
    Send 2
  else if (DeadKey == "**")
    SendChar("“")
  else if (DeadKey == "*^")
    SendChar("²")
  return

+SC003::
  global DeadKey
  if (DeadKey == "")
    Send @
  else if (DeadKey == "**")
    SendChar("‘")
  return

SC004::
  global DeadKey
  if (DeadKey == "")
    Send 3
  else if (DeadKey == "**")
    SendChar("”")
  else if (DeadKey == "*^")
    SendChar("³")
  return

+SC004::Send {U+0023} ; #

SC005::
  global DeadKey
  if (DeadKey == "")
    Send 4
  else if (DeadKey == "**")
    SendChar("£")
  else if (DeadKey == "*^")
    SendChar("⁴")
  return

+SC005::Send $

SC006::
  global DeadKey
  if (DeadKey == "")
    Send 5
  else if (DeadKey == "**")
    SendChar("€")
  else if (DeadKey == "*^")
    SendChar("⁵")
  return

+SC006::Send `%

SC007::
  global DeadKey
  if (DeadKey == "")
    Send 6
  else if (DeadKey == "**")
    SendChar("¥")
  else if (DeadKey == "*^")
    SendChar("⁶")
  return

+SC007::Send {U+005E} ; ^

SC008::
  global DeadKey
  if (DeadKey == "")
    Send 7
  else if (DeadKey == "**")
    SendChar("¤")
  else if (DeadKey == "*^")
    SendChar("⁷")
  return

+SC008::Send &

SC009::
  global DeadKey
  if (DeadKey == "")
    Send 8
  else if (DeadKey == "**")
    SendChar("§")
  else if (DeadKey == "*^")
    SendChar("⁸")
  return

+SC009::Send *

SC00a::
  global DeadKey
  if (DeadKey == "")
    Send 9
  else if (DeadKey == "**")
    SendChar("¶")
  else if (DeadKey == "*^")
    SendChar("⁹")
  return

+SC00a::Send «

SC00b::
  global DeadKey
  if (DeadKey == "")
    Send 0
  else if (DeadKey == "**")
    SendChar("°")
  else if (DeadKey == "*^")
    SendChar("⁰")
  return

+SC00b::Send »

SC00c::
  global DeadKey
  if (DeadKey == "")
    Send /
  else if (DeadKey == "**")
    SendChar("÷")
  return

+SC00c::
  global DeadKey
  if (DeadKey == "")
    Send _
  else if (DeadKey == "**")
    SendChar("–")
  return

SC00d::
  global DeadKey
  if (DeadKey == "")
    Send `=
  else if (DeadKey == "**")
    SendChar("≠")
  else if (DeadKey == "*^")
    SendChar("⁼")
  else if (DeadKey == "*/")
    SendChar("≠")
  else if (DeadKey == "*`~")
    SendChar("≃")
  return

+SC00d::
  global DeadKey
  if (DeadKey == "")
    Send {U+002B} ; +
  else if (DeadKey == "**")
    SendChar("±")
  else if (DeadKey == "*^")
    SendChar("⁺")
  return

SC010::
  global DeadKey
  if (DeadKey == "")
    Send q
  else if (DeadKey == "**")
    SendChar("â")
  else if (DeadKey == "*µ")
    SendChar("χ")
  return

+SC010::
  global DeadKey
  if (DeadKey == "")
    Send Q
  else if (DeadKey == "**")
    SendChar("Â")
  else if (DeadKey == "*µ")
    SendChar("Χ")
  return

SC011::
  global DeadKey
  if (DeadKey == "")
    Send c
  else if (DeadKey == "**")
    SendChar("ç")
  else if (DeadKey == "*¤")
    SendChar("¢")
  else if (DeadKey == "*^")
    SendChar("ĉ")
  else if (DeadKey == "*´")
    SendChar("ć")
  else if (DeadKey == "*/")
    SendChar("ȼ")
  else if (DeadKey == "*¸")
    SendChar("ç")
  return

+SC011::
  global DeadKey
  if (DeadKey == "")
    Send C
  else if (DeadKey == "**")
    SendChar("Ç")
  else if (DeadKey == "*¤")
    SendChar("₡")
  else if (DeadKey == "*^")
    SendChar("Ĉ")
  else if (DeadKey == "*´")
    SendChar("Ć")
  else if (DeadKey == "*/")
    SendChar("Ȼ")
  else if (DeadKey == "*¸")
    SendChar("Ç")
  return

SC012::
  global DeadKey
  if (DeadKey == "")
    Send o
  else if (DeadKey == "**")
    SendChar("œ")
  else if (DeadKey == "*¨")
    SendChar("ö")
  else if (DeadKey == "*¤")
    SendChar("௹")
  else if (DeadKey == "*^")
    SendChar("ô")
  else if (DeadKey == "*µ")
    SendChar("ο")
  else if (DeadKey == "*´")
    SendChar("ó")
  else if (DeadKey == "*``")
    SendChar("ò")
  else if (DeadKey == "*/")
    SendChar("ø")
  else if (DeadKey == "*`~")
    SendChar("õ")
  return

+SC012::
  global DeadKey
  if (DeadKey == "")
    Send O
  else if (DeadKey == "**")
    SendChar("Œ")
  else if (DeadKey == "*¨")
    SendChar("Ö")
  else if (DeadKey == "*¤")
    SendChar("૱")
  else if (DeadKey == "*^")
    SendChar("Ô")
  else if (DeadKey == "*µ")
    SendChar("Ο")
  else if (DeadKey == "*´")
    SendChar("Ó")
  else if (DeadKey == "*``")
    SendChar("Ò")
  else if (DeadKey == "*/")
    SendChar("Ø")
  else if (DeadKey == "*`~")
    SendChar("Õ")
  return

SC013::
  global DeadKey
  if (DeadKey == "")
    Send p
  else if (DeadKey == "**")
    SendChar("ô")
  else if (DeadKey == "*¤")
    SendChar("₰")
  else if (DeadKey == "*µ")
    SendChar("π")
  else if (DeadKey == "*´")
    SendChar("ṕ")
  else if (DeadKey == "*/")
    SendChar("ᵽ")
  return

+SC013::
  global DeadKey
  if (DeadKey == "")
    Send P
  else if (DeadKey == "**")
    SendChar("Ô")
  else if (DeadKey == "*¤")
    SendChar("₧")
  else if (DeadKey == "*µ")
    SendChar("Π")
  else if (DeadKey == "*´")
    SendChar("Ṕ")
  else if (DeadKey == "*/")
    SendChar("Ᵽ")
  return

SC014::
  global DeadKey
  if (DeadKey == "")
    Send w
  else if (DeadKey == "**") {
    Send {U+2019}w
    DeadKey := ""
  }
  else if (DeadKey == "*¨")
    SendChar("ẅ")
  else if (DeadKey == "*¤")
    SendChar("₩")
  else if (DeadKey == "*^")
    SendChar("ŵ")
  else if (DeadKey == "*µ")
    SendChar("ω")
  else if (DeadKey == "*´")
    SendChar("ẃ")
  else if (DeadKey == "*``")
    SendChar("ẁ")
  return

+SC014::
  global DeadKey
  if (DeadKey == "")
    Send W
  else if (DeadKey == "**") {
    Send {U+2019}W
    DeadKey := ""
  }
  else if (DeadKey == "*¨")
    SendChar("Ẅ")
  else if (DeadKey == "*¤")
    SendChar("₩")
  else if (DeadKey == "*^")
    SendChar("Ŵ")
  else if (DeadKey == "*µ")
    SendChar("Ω")
  else if (DeadKey == "*´")
    SendChar("Ẃ")
  else if (DeadKey == "*``")
    SendChar("Ẁ")
  return

SC015::
  global DeadKey
  if (DeadKey == "")
    Send j
  else if (DeadKey == "**") {
    Send {U+2019}j
    DeadKey := ""
  }
  else if (DeadKey == "*^")
    SendChar("ĵ")
  else if (DeadKey == "*µ")
    SendChar("θ")
  else if (DeadKey == "*/")
    SendChar("ɉ")
  return

+SC015::
  global DeadKey
  if (DeadKey == "")
    Send J
  else if (DeadKey == "**") {
    Send {U+2019}J
    DeadKey := ""
  }
  else if (DeadKey == "*^")
    SendChar("Ĵ")
  else if (DeadKey == "*µ")
    SendChar("Θ")
  else if (DeadKey == "*/")
    SendChar("Ɉ")
  return

SC016::
  global DeadKey
  if (DeadKey == "")
    Send m
  else if (DeadKey == "**")
    SendChar("µ")
  else if (DeadKey == "*¤")
    SendChar("₥")
  else if (DeadKey == "*µ")
    SendChar("μ")
  else if (DeadKey == "*´")
    SendChar("ḿ")
  return

+SC016::
  global DeadKey
  if (DeadKey == "")
    Send M
  else if (DeadKey == "*¤")
    SendChar("ℳ")
  else if (DeadKey == "*µ")
    SendChar("Μ")
  else if (DeadKey == "*´")
    SendChar("Ḿ")
  return

SC017::
  global DeadKey
  if (DeadKey == "")
    Send d
  else if (DeadKey == "**")
    SendChar("_")
  else if (DeadKey == "*¤")
    SendChar("₫")
  else if (DeadKey == "*µ")
    SendChar("δ")
  else if (DeadKey == "*/")
    SendChar("đ")
  else if (DeadKey == "*¸")
    SendChar("ḑ")
  return

+SC017::
  global DeadKey
  if (DeadKey == "")
    Send D
  else if (DeadKey == "**")
    SendChar("_")
  else if (DeadKey == "*¤")
    SendChar("₯")
  else if (DeadKey == "*µ")
    SendChar("Δ")
  else if (DeadKey == "*/")
    SendChar("Đ")
  else if (DeadKey == "*¸")
    SendChar("Ḑ")
  return

SC018::
+SC018::
  global DeadKey
  if (DeadKey == "")
    SetState("**")
  else if (DeadKey == "**")
    SetState("*¨")
  return

SC019::
  global DeadKey
  if (DeadKey == "")
    Send f
  else if (DeadKey == "**")
    SendChar("ŭ")
  else if (DeadKey == "*¤")
    SendChar("ƒ")
  else if (DeadKey == "*µ")
    SendChar("φ")
  return

+SC019::
  global DeadKey
  if (DeadKey == "")
    Send F
  else if (DeadKey == "**")
    SendChar("Ŭ")
  else if (DeadKey == "*¤")
    SendChar("₣")
  else if (DeadKey == "*µ")
    SendChar("Φ")
  return

SC01a::Send [
+SC01a::Send {U+007B} ; {

SC01b::Send ]
+SC01b::Send {U+007D} ; }

SC01e::
  global DeadKey
  if (DeadKey == "")
    Send a
  else if (DeadKey == "**")
    SendChar("à")
  else if (DeadKey == "*¨")
    SendChar("ä")
  else if (DeadKey == "*¤")
    SendChar("؋")
  else if (DeadKey == "*^")
    SendChar("â")
  else if (DeadKey == "*µ")
    SendChar("α")
  else if (DeadKey == "*´")
    SendChar("á")
  else if (DeadKey == "*``")
    SendChar("à")
  else if (DeadKey == "*/")
    SendChar("ⱥ")
  else if (DeadKey == "*`~")
    SendChar("ã")
  return

+SC01e::
  global DeadKey
  if (DeadKey == "")
    Send A
  else if (DeadKey == "**")
    SendChar("À")
  else if (DeadKey == "*¨")
    SendChar("Ä")
  else if (DeadKey == "*¤")
    SendChar("₳")
  else if (DeadKey == "*^")
    SendChar("Â")
  else if (DeadKey == "*µ")
    SendChar("Α")
  else if (DeadKey == "*´")
    SendChar("Á")
  else if (DeadKey == "*``")
    SendChar("À")
  else if (DeadKey == "*/")
    SendChar("Ⱥ")
  else if (DeadKey == "*`~")
    SendChar("Ã")
  return

SC01f::
  global DeadKey
  if (DeadKey == "")
    Send s
  else if (DeadKey == "**")
    SendChar("é")
  else if (DeadKey == "*¤")
    SendChar("₪")
  else if (DeadKey == "*^")
    SendChar("ŝ")
  else if (DeadKey == "*µ")
    SendChar("σ")
  else if (DeadKey == "*´")
    SendChar("ś")
  else if (DeadKey == "*¸")
    SendChar("ş")
  return

+SC01f::
  global DeadKey
  if (DeadKey == "")
    Send S
  else if (DeadKey == "**")
    SendChar("É")
  else if (DeadKey == "*¤")
    SendChar("$")
  else if (DeadKey == "*^")
    SendChar("Ŝ")
  else if (DeadKey == "*µ")
    SendChar("Σ")
  else if (DeadKey == "*´")
    SendChar("Ś")
  else if (DeadKey == "*¸")
    SendChar("Ş")
  return

SC020::
  global DeadKey
  if (DeadKey == "")
    Send e
  else if (DeadKey == "**")
    SendChar("è")
  else if (DeadKey == "*¨")
    SendChar("ë")
  else if (DeadKey == "*¤")
    SendChar("€")
  else if (DeadKey == "*^")
    SendChar("ê")
  else if (DeadKey == "*µ")
    SendChar("ε")
  else if (DeadKey == "*´")
    SendChar("é")
  else if (DeadKey == "*``")
    SendChar("è")
  else if (DeadKey == "*/")
    SendChar("ɇ")
  else if (DeadKey == "*`~")
    SendChar("ẽ")
  else if (DeadKey == "*¸")
    SendChar("ȩ")
  return

+SC020::
  global DeadKey
  if (DeadKey == "")
    Send E
  else if (DeadKey == "**")
    SendChar("È")
  else if (DeadKey == "*¨")
    SendChar("Ë")
  else if (DeadKey == "*¤")
    SendChar("₠")
  else if (DeadKey == "*^")
    SendChar("Ê")
  else if (DeadKey == "*µ")
    SendChar("Ε")
  else if (DeadKey == "*´")
    SendChar("É")
  else if (DeadKey == "*``")
    SendChar("È")
  else if (DeadKey == "*/")
    SendChar("Ɇ")
  else if (DeadKey == "*`~")
    SendChar("Ẽ")
  else if (DeadKey == "*¸")
    SendChar("Ȩ")
  return

SC021::
  global DeadKey
  if (DeadKey == "")
    Send n
  else if (DeadKey == "**")
    SendChar("ê")
  else if (DeadKey == "*¤")
    SendChar("₦")
  else if (DeadKey == "*µ")
    SendChar("ν")
  else if (DeadKey == "*´")
    SendChar("ń")
  else if (DeadKey == "*``")
    SendChar("ǹ")
  else if (DeadKey == "*`~")
    SendChar("ñ")
  else if (DeadKey == "*¸")
    SendChar("ņ")
  return

+SC021::
  global DeadKey
  if (DeadKey == "")
    Send N
  else if (DeadKey == "**")
    SendChar("Ê")
  else if (DeadKey == "*¤")
    SendChar("₦")
  else if (DeadKey == "*µ")
    SendChar("Ν")
  else if (DeadKey == "*´")
    SendChar("Ń")
  else if (DeadKey == "*``")
    SendChar("Ǹ")
  else if (DeadKey == "*`~")
    SendChar("Ñ")
  else if (DeadKey == "*¸")
    SendChar("Ņ")
  return

SC022::
  global DeadKey
  if (DeadKey == "")
    Send `,
  else if (DeadKey == "**")
    SendChar("·")
  return

+SC022::
  global DeadKey
  if (DeadKey == "")
    Send `;
  else if (DeadKey == "**")
    SendChar("•")
  return

SC023::
  global DeadKey
  if (DeadKey == "")
    Send l
  else if (DeadKey == "**") {
    Send {U+2019}l
    DeadKey := ""
  }
  else if (DeadKey == "*¤")
    SendChar("£")
  else if (DeadKey == "*µ")
    SendChar("λ")
  else if (DeadKey == "*´")
    SendChar("ĺ")
  else if (DeadKey == "*/")
    SendChar("ł")
  else if (DeadKey == "*¸")
    SendChar("ļ")
  return

+SC023::
  global DeadKey
  if (DeadKey == "")
    Send L
  else if (DeadKey == "**") {
    Send {U+2019}L
    DeadKey := ""
  }
  else if (DeadKey == "*¤")
    SendChar("₤")
  else if (DeadKey == "*µ")
    SendChar("Λ")
  else if (DeadKey == "*´")
    SendChar("Ĺ")
  else if (DeadKey == "*/")
    SendChar("Ł")
  else if (DeadKey == "*¸")
    SendChar("Ļ")
  return

SC024::
  global DeadKey
  if (DeadKey == "")
    Send r
  else if (DeadKey == "**") {
    Send {U+2019}r
    DeadKey := ""
  }
  else if (DeadKey == "*¤")
    SendChar("₢")
  else if (DeadKey == "*µ")
    SendChar("ρ")
  else if (DeadKey == "*´")
    SendChar("ŕ")
  else if (DeadKey == "*/")
    SendChar("ɍ")
  else if (DeadKey == "*¸")
    SendChar("ŗ")
  return

+SC024::
  global DeadKey
  if (DeadKey == "")
    Send R
  else if (DeadKey == "**") {
    Send {U+2019}R
    DeadKey := ""
  }
  else if (DeadKey == "*¤")
    SendChar("₨")
  else if (DeadKey == "*µ")
    SendChar("Ρ")
  else if (DeadKey == "*´")
    SendChar("Ŕ")
  else if (DeadKey == "*/")
    SendChar("Ɍ")
  else if (DeadKey == "*¸")
    SendChar("Ŗ")
  return

SC025::
  global DeadKey
  if (DeadKey == "")
    Send t
  else if (DeadKey == "**")
    SendChar("î")
  else if (DeadKey == "*¨")
    SendChar("ẗ")
  else if (DeadKey == "*¤")
    SendChar("৳")
  else if (DeadKey == "*µ")
    SendChar("τ")
  else if (DeadKey == "*/")
    SendChar("ŧ")
  else if (DeadKey == "*¸")
    SendChar("ţ")
  return

+SC025::
  global DeadKey
  if (DeadKey == "")
    Send T
  else if (DeadKey == "**")
    SendChar("Î")
  else if (DeadKey == "*¤")
    SendChar("₮")
  else if (DeadKey == "*µ")
    SendChar("Τ")
  else if (DeadKey == "*/")
    SendChar("Ŧ")
  else if (DeadKey == "*¸")
    SendChar("Ţ")
  return

SC026::
  global DeadKey
  if (DeadKey == "")
    Send i
  else if (DeadKey == "**")
    SendChar("û")
  else if (DeadKey == "*¨")
    SendChar("ï")
  else if (DeadKey == "*¤")
    SendChar("﷼")
  else if (DeadKey == "*^")
    SendChar("î")
  else if (DeadKey == "*µ")
    SendChar("ι")
  else if (DeadKey == "*´")
    SendChar("í")
  else if (DeadKey == "*``")
    SendChar("ì")
  else if (DeadKey == "*/")
    SendChar("ɨ")
  else if (DeadKey == "*`~")
    SendChar("ĩ")
  return

+SC026::
  global DeadKey
  if (DeadKey == "")
    Send I
  else if (DeadKey == "**")
    SendChar("Û")
  else if (DeadKey == "*¨")
    SendChar("Ï")
  else if (DeadKey == "*¤")
    SendChar("៛")
  else if (DeadKey == "*^")
    SendChar("Î")
  else if (DeadKey == "*µ")
    SendChar("Ι")
  else if (DeadKey == "*´")
    SendChar("Í")
  else if (DeadKey == "*``")
    SendChar("Ì")
  else if (DeadKey == "*/")
    SendChar("Ɨ")
  else if (DeadKey == "*`~")
    SendChar("Ĩ")
  return

SC027::
  global DeadKey
  if (DeadKey == "")
    Send u
  else if (DeadKey == "**")
    SendChar("ù")
  else if (DeadKey == "*¨")
    SendChar("ü")
  else if (DeadKey == "*¤")
    SendChar("元")
  else if (DeadKey == "*^")
    SendChar("û")
  else if (DeadKey == "*µ")
    SendChar("υ")
  else if (DeadKey == "*´")
    SendChar("ú")
  else if (DeadKey == "*``")
    SendChar("ù")
  else if (DeadKey == "*/")
    SendChar("ʉ")
  else if (DeadKey == "*`~")
    SendChar("ũ")
  return

+SC027::
  global DeadKey
  if (DeadKey == "")
    Send U
  else if (DeadKey == "**")
    SendChar("Ù")
  else if (DeadKey == "*¨")
    SendChar("Ü")
  else if (DeadKey == "*¤")
    SendChar("圓")
  else if (DeadKey == "*^")
    SendChar("Û")
  else if (DeadKey == "*µ")
    SendChar("Υ")
  else if (DeadKey == "*´")
    SendChar("Ú")
  else if (DeadKey == "*``")
    SendChar("Ù")
  else if (DeadKey == "*/")
    SendChar("Ʉ")
  else if (DeadKey == "*`~")
    SendChar("Ũ")
  return

SC028::Send `'
+SC028::Send `"

SC029::Send ``
+SC029::Send `~

SC02b::Send \
+SC02b::Send |

SC02c::
  global DeadKey
  if (DeadKey == "")
    Send z
  else if (DeadKey == "**")
    SendChar("æ")
  else if (DeadKey == "*^")
    SendChar("ẑ")
  else if (DeadKey == "*µ")
    SendChar("ζ")
  else if (DeadKey == "*´")
    SendChar("ź")
  else if (DeadKey == "*/")
    SendChar("ƶ")
  return

+SC02c::
  global DeadKey
  if (DeadKey == "")
    Send Z
  else if (DeadKey == "**")
    SendChar("Æ")
  else if (DeadKey == "*^")
    SendChar("Ẑ")
  else if (DeadKey == "*µ")
    SendChar("Ζ")
  else if (DeadKey == "*´")
    SendChar("Ź")
  else if (DeadKey == "*/")
    SendChar("Ƶ")
  return

SC02d::
  global DeadKey
  if (DeadKey == "")
    Send x
  else if (DeadKey == "**")
    SendChar("ß")
  else if (DeadKey == "*¨")
    SendChar("ẍ")
  else if (DeadKey == "*µ")
    SendChar("ξ")
  return

+SC02d::
  global DeadKey
  if (DeadKey == "")
    Send X
  else if (DeadKey == "**")
    SendChar("ẞ")
  else if (DeadKey == "*¨")
    SendChar("Ẍ")
  else if (DeadKey == "*µ")
    SendChar("Ξ")
  return

SC02e::
  global DeadKey
  if (DeadKey == "")
    Send -
  else if (DeadKey == "**")
    SendChar("—")
  else if (DeadKey == "*^")
    SendChar("⁻")
  return

+SC02e::
  global DeadKey
  if (DeadKey == "")
    Send ?
  else if (DeadKey == "**")
    SendChar("¿")
  return

SC02f::
  global DeadKey
  if (DeadKey == "")
    Send v
  else if (DeadKey == "**")
    SendChar("ñ")
  else if (DeadKey == "*`~")
    SendChar("ṽ")
  return

+SC02f::
  global DeadKey
  if (DeadKey == "")
    Send V
  else if (DeadKey == "**")
    SendChar("Ñ")
  else if (DeadKey == "*`~")
    SendChar("Ṽ")
  return

SC030::
  global DeadKey
  if (DeadKey == "")
    Send b
  else if (DeadKey == "**") {
    Send {U+2019}b
    DeadKey := ""
  }
  else if (DeadKey == "*¤")
    SendChar("฿")
  else if (DeadKey == "*µ")
    SendChar("β")
  else if (DeadKey == "*/")
    SendChar("ƀ")
  return

+SC030::
  global DeadKey
  if (DeadKey == "")
    Send B
  else if (DeadKey == "**") {
    Send {U+2019}B
    DeadKey := ""
  }
  else if (DeadKey == "*¤")
    SendChar("₱")
  else if (DeadKey == "*µ")
    SendChar("Β")
  else if (DeadKey == "*/")
    SendChar("Ƀ")
  return

SC031::
  global DeadKey
  if (DeadKey == "")
    Send .
  else if (DeadKey == "**")
    SendChar("…")
  return

+SC031::Send :

SC032::
  global DeadKey
  if (DeadKey == "")
    Send h
  else if (DeadKey == "**") {
    Send {U+2019}h
    DeadKey := ""
  }
  else if (DeadKey == "*¨")
    SendChar("ḧ")
  else if (DeadKey == "*¤")
    SendChar("₴")
  else if (DeadKey == "*^")
    SendChar("ĥ")
  else if (DeadKey == "*µ")
    SendChar("η")
  else if (DeadKey == "*/")
    SendChar("ħ")
  else if (DeadKey == "*¸")
    SendChar("ḩ")
  return

+SC032::
  global DeadKey
  if (DeadKey == "")
    Send H
  else if (DeadKey == "**") {
    Send {U+2019}H
    DeadKey := ""
  }
  else if (DeadKey == "*¨")
    SendChar("Ḧ")
  else if (DeadKey == "*¤")
    SendChar("₴")
  else if (DeadKey == "*^")
    SendChar("Ĥ")
  else if (DeadKey == "*µ")
    SendChar("Η")
  else if (DeadKey == "*/")
    SendChar("Ħ")
  else if (DeadKey == "*¸")
    SendChar("Ḩ")
  return

SC033::
  global DeadKey
  if (DeadKey == "")
    Send g
  else if (DeadKey == "**")
    SendChar("µ")
  else if (DeadKey == "*¤")
    SendChar("₲")
  else if (DeadKey == "*^")
    SendChar("ĝ")
  else if (DeadKey == "*µ")
    SendChar("γ")
  else if (DeadKey == "*´")
    SendChar("ǵ")
  else if (DeadKey == "*/")
    SendChar("ǥ")
  else if (DeadKey == "*¸")
    SendChar("ģ")
  return

+SC033::
  global DeadKey
  if (DeadKey == "")
    Send G
  else if (DeadKey == "**") {
    Send {U+2019}G
    DeadKey := ""
  }
  else if (DeadKey == "*¤")
    SendChar("₲")
  else if (DeadKey == "*^")
    SendChar("Ĝ")
  else if (DeadKey == "*µ")
    SendChar("Γ")
  else if (DeadKey == "*´")
    SendChar("Ǵ")
  else if (DeadKey == "*/")
    SendChar("Ǥ")
  else if (DeadKey == "*¸")
    SendChar("Ģ")
  return

SC034::
  global DeadKey
  if (DeadKey == "")
    Send y
  else if (DeadKey == "**") {
    Send {U+2019}y
    DeadKey := ""
  }
  else if (DeadKey == "*¨")
    SendChar("ÿ")
  else if (DeadKey == "*¤")
    SendChar("¥")
  else if (DeadKey == "*^")
    SendChar("ŷ")
  else if (DeadKey == "*µ")
    SendChar("ψ")
  else if (DeadKey == "*´")
    SendChar("ý")
  else if (DeadKey == "*``")
    SendChar("ỳ")
  else if (DeadKey == "*/")
    SendChar("ɏ")
  else if (DeadKey == "*`~")
    SendChar("ỹ")
  return

+SC034::
  global DeadKey
  if (DeadKey == "")
    Send Y
  else if (DeadKey == "**") {
    Send {U+2019}Y
    DeadKey := ""
  }
  else if (DeadKey == "*¨")
    SendChar("Ÿ")
  else if (DeadKey == "*¤")
    SendChar("円")
  else if (DeadKey == "*^")
    SendChar("Ŷ")
  else if (DeadKey == "*µ")
    SendChar("Ψ")
  else if (DeadKey == "*´")
    SendChar("Ý")
  else if (DeadKey == "*``")
    SendChar("Ỳ")
  else if (DeadKey == "*/")
    SendChar("Ɏ")
  else if (DeadKey == "*`~")
    SendChar("Ỹ")
  return

SC035::
  global DeadKey
  if (DeadKey == "")
    Send k
  else if (DeadKey == "**") {
    Send {U+2019}k
    DeadKey := ""
  }
  else if (DeadKey == "*¤")
    SendChar("₭")
  else if (DeadKey == "*µ")
    SendChar("κ")
  else if (DeadKey == "*´")
    SendChar("ḱ")
  else if (DeadKey == "*¸")
    SendChar("ķ")
  return

+SC035::
  global DeadKey
  if (DeadKey == "")
    Send K
  else if (DeadKey == "**") {
    Send {U+2019}K
    DeadKey := ""
  }
  else if (DeadKey == "*¤")
    SendChar("₭")
  else if (DeadKey == "*µ")
    SendChar("Κ")
  else if (DeadKey == "*´")
    SendChar("Ḱ")
  else if (DeadKey == "*¸")
    SendChar("Ķ")
  return

SC039::
  global DeadKey
  if (DeadKey == "")
    Send {U+0020} ; space
  else if (DeadKey == "**") {
    Send {U+2019}
    DeadKey := ""
  }
  else if (DeadKey == "*¨") {
    Send {U+0022}
    DeadKey := ""
  }
  else if (DeadKey == "*¤")
    SendChar("¤")
  else if (DeadKey == "*^")
    SendChar("^")
  else if (DeadKey == "*µ")
    SendChar("µ")
  else if (DeadKey == "*´")
    SendChar("'")
  else if (DeadKey == "*``")
    SendChar("``")
  else if (DeadKey == "*/")
    SendChar("/")
  else if (DeadKey == "*`~")
    SendChar("~")
  else if (DeadKey == "*¸")
    SendChar("¸")
  return

+SC039::
  global DeadKey
  if (DeadKey == "")
    Send {U+202F} ; narrow no-break space
  else if (DeadKey == "**") {
    Send {U+2019}
    DeadKey := ""
  }
  else if (DeadKey == "*¨") {
    Send {U+0022}
    DeadKey := ""
  }
  else if (DeadKey == "*¤")
    SendChar("¤")
  else if (DeadKey == "*^")
    SendChar("^")
  else if (DeadKey == "*µ")
    SendChar("µ")
  else if (DeadKey == "*´")
    SendChar("'")
  else if (DeadKey == "*``")
    SendChar("``")
  else if (DeadKey == "*/")
    SendChar("/")
  else if (DeadKey == "*`~")
    SendChar("~")
  else if (DeadKey == "*¸")
    SendChar("¸")
  return

SC056::
  global DeadKey
  if (DeadKey == "")
    Send <
  else if (DeadKey == "**") {
    Send {U+2019}<
    DeadKey := ""
  }
  else if (DeadKey == "*/")
    SendChar("≮")
  else if (DeadKey == "*`~")
    SendChar("≲")
  return

+SC056::
  global DeadKey
  if (DeadKey == "")
    Send >
  else if (DeadKey == "**") {
    Send {U+2019}>
    DeadKey := ""
  }
  else if (DeadKey == "*/")
    SendChar("≯")
  else if (DeadKey == "*`~")
    SendChar("≳")
  return

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
<^>!+SC015::SetState("*^")

<^>!SC016::Send &
<^>!+SC016::SetState("*µ")

<^>!SC017::Send *
<^>!+SC017::Send ×

<^>!SC018::Send '
<^>!+SC018::SetState("*´")

<^>!SC019::Send ``
<^>!+SC019::SetState("*``")

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
<^>!+SC027::SetState("*¨")

<^>!SC02c::Send ~
<^>!+SC02c::SetState("*~")

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
