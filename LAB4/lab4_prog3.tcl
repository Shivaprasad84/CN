set ns [new Simulator]

$ns color 1 Red
$ns color 2 Yellow
$ns color 3 Green

set nf [open sim.nam w]
set nt [open ag2.tr w]

$ns namtrace-all $nf
$ns trace-all $nt

set n0 [$ns node]
$n0 color red
set n1 [$ns node]
$n1 color blue
set n2 [$ns node]
$n2 color pink
set n3 [$ns node]
$n2 color green

$ns duplex-link $n0 $n2 10Mb 30ms DropTail
$ns duplex-link-op $n0 $n2 orient left-up
$ns queue-limit $n0 $n2 3
$ns duplex-link $n1 $n2 10Mb 30ms DropTail
$ns duplex-link-op $n1 $n2 orient left-down
$ns queue-limit $n1 $n2 3
$ns duplex-link $n2 $n3 10Mb 30ms DropTail
$ns queue-limit $n2 $n3 3
 

set tcp [new Agent/TCP]
$tcp set fid_ 1
$ns attach-agent $n0 $tcp

set udp [new Agent/UDP]
$udp set fid_ 2
$ns attach-agent $n1 $udp

set sink [new Agent/TCPSink]
$ns attach-agent $n3 $sink

set null [new Agent/Null]
$ns attach-agent $n3 $null

$ns connect $tcp $sink
$ns connect $udp $null


set ftp [new Application/FTP]
$ftp attach-agent $tcp

set cbr [new Application/Traffic/CBR]
$cbr attach-agent $udp

proc finish {} {
	global ns nf nt
	$ns flush-trace
	close $nf
	close $nt
	exec nam sim.nam &
	exit 0
}

$ns at 0.1ms "$ftp start"
$ns at 0.3ms "$cbr start"
$ns at 4ms finish
$ns run








