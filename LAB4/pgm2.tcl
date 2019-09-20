set ns [new Simulator]

set nf [open sim.nam w]
set nt [open ag1.tr w]

$ns namtrace-all $nf
$ns trace-all $nt

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]

$ns duplex-link $n0 $n1 10Mb 2ms DropTail
$ns queue-limit $n1 $n0 3
$ns duplex-link $n0 $n2 10Mb 2ms DropTail
$ns queue-limit $n2 $n0 3
 

set tcp1 [new Agent/TCP]
$ns attach-agent $n1 $tcp1

set tcp2 [new Agent/TCP]
$ns attach-agent $n2 $tcp2

set sink1 [new Agent/TCPSink]
$ns attach-agent $n0 $sink1

set sink2 [new Agent/TCPSink]
$ns attach-agent $n0 $sink2

$ns connect $tcp1 $sink1
$ns connect $tcp2 $sink2


set ftp1 [new Application/FTP]
$ftp1 attach-agent $tcp1

set ftp2 [new Application/FTP]
$ftp2 attach-agent $tcp2

proc finish {} {
	global ns nf nt
	$ns flush-trace
	close $nf
	close $nt
	exec nam sim.nam &
	exit 0
}

$ns at 0.1ms "$ftp1 start"
$ns at 0.3ms "$ftp2 start"
$ns at 4ms "finish"
$ns run








