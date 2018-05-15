; Quisk reference
; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN

SendMode Input

; Prevent left Windows from doing anything by itself.
LWin::
Return

; Map Mac-style movement keys
; Note: There is no such thing sd "go to beginning/end of file" in Windows so here
;       we map Cmd-Up and Cmd-Down to page-up and page-down instead.
#Up::SendInput {PgUp}
#Down::SendInput {PgDn}
#+Up::SendInput +{PgUp}
#+Down::SendInput +{PgDn}
#Left::SendInput {Home}
#Right::SendInput {End}
#+Left::SendInput +{Home}
#+Right::SendInput +{End}
!Left::SendInput ^{Left}
!Right::SendInput ^{Right}
!+Left::SendInput ^+{Left}
!+Right::SendInput ^+{Right}

; Map Cmd-tab to Alt-tab
Lwin & Tab::AltTab

; Map Cmd-Space to search/launcher
Lwin & Space::#s

; Map the rest of latter/number/whatnot from Cmd-* to Ctrl-*
; But really, what I really want to do is:
;   - Replace Lwin with Lctrl for all keys
;   - Ensure Cmd-tab still works
; ... however due to the unique way things are implemented what I want
; can't be done. So I just have to map each keys individually, which is
; far less elegent, is you ask me.

Lwin & a::Send {Ctrl down}a{Ctrl up}
Lwin & b::Send {Ctrl down}b{Ctrl up}
Lwin & c::Send {Ctrl down}c{Ctrl up}
Lwin & d::Send {Ctrl down}d{Ctrl up}
Lwin & e::Send {Ctrl down}e{Ctrl up}
Lwin & f::Send {Ctrl down}f{Ctrl up}
Lwin & g::Send {Ctrl down}g{Ctrl up}
Lwin & h::Send {Ctrl down}h{Ctrl up}
Lwin & i::Send {Ctrl down}i{Ctrl up}
Lwin & j::Send {Ctrl down}j{Ctrl up}
Lwin & k::Send {Ctrl down}k{Ctrl up}
Lwin & l::Send {Ctrl down}l{Ctrl up}
Lwin & m::Send {Ctrl down}m{Ctrl up}
Lwin & n::Send {Ctrl down}n{Ctrl up}
Lwin & o::Send {Ctrl down}o{Ctrl up}
Lwin & p::Send {Ctrl down}p{Ctrl up}
Lwin & q::Send {Ctrl down}q{Ctrl up}
Lwin & r::Send {Ctrl down}r{Ctrl up}
Lwin & s::Send {Ctrl down}s{Ctrl up}
Lwin & t::Send {Ctrl down}t{Ctrl up}
Lwin & u::Send {Ctrl down}u{Ctrl up}
Lwin & v::Send {Ctrl down}v{Ctrl up}
Lwin & w::Send {Ctrl down}w{Ctrl up}
Lwin & x::Send {Ctrl down}x{Ctrl up}
Lwin & y::Send {Ctrl down}y{Ctrl up}
Lwin & z::Send {Ctrl down}z{Ctrl up}

Lwin & 1::Send {Ctrl down}1{Ctrl up}
Lwin & 2::Send {Ctrl down}2{Ctrl up}
Lwin & 3::Send {Ctrl down}3{Ctrl up}
Lwin & 4::Send {Ctrl down}4{Ctrl up}
Lwin & 5::Send {Ctrl down}5{Ctrl up}
Lwin & 6::Send {Ctrl down}6{Ctrl up}
Lwin & 7::Send {Ctrl down}7{Ctrl up}
Lwin & 8::Send {Ctrl down}8{Ctrl up}
Lwin & 9::Send {Ctrl down}9{Ctrl up}
Lwin & 0::Send {Ctrl down}0{Ctrl up}

Lwin & ,::Send {Ctrl down},{Ctrl up}
Lwin & /::Send {Ctrl down}/{Ctrl up}
