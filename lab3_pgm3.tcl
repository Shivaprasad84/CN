set ns [new Simulator]

set nf [open sim.nam w]

$ns namtrace-all $nf

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]

$ns duplex-link
