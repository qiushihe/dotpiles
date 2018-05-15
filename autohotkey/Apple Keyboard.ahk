; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN

#Up::SendInput {PgUp}
#Down::SendInput {PgDn}
#+Up::SendInput +{PgUp}
#+Down::SendInput +{PgDn}
#Left::SendInput {Home}
#Right::SendInput {End}
#+Left::sendInput +{Home}
#+Right::SendInput +{End}
!Left::SendInput ^{Left}
!Right::SendInput ^{Right}
!+Left::SendInput ^+{Left}
!+Right::SendInput ^+{Right}

#n::Send {Ctrl down}n{Ctrl up}
#c::Send {Ctrl down}c{Ctrl up}
#s::Send {Ctrl down}s{Ctrl up}
#a::Send {Ctrl down}a{Ctrl up}
#v::Send {Ctrl down}v{Ctrl up}
#x::Send {Ctrl down}x{Ctrl up}
#o::Send {Ctrl down}o{Ctrl up}
#f::Send {Ctrl down}f{Ctrl up}
#z::Send {Ctrl down}z{Ctrl up}
#y::Send {Ctrl down}y{Ctrl up}
#t::Send {Ctrl down}t{Ctrl up}
#w::Send {Ctrl down}w{Ctrl up}
#q::Send !{F4}
Lwin & Tab::AltTab
