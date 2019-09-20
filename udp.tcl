set ns [new Simulator]

set nf [open min.nam w]

$ns namtrace-all $nf

set n0 [$ns node]
set n1 [$ns node]

$ns duplex-link $n0 $n1 5Mb 2ms DropTail

set udp0 [new Agent/UDP]
$ns attach-agent $n0 $udp0
set cbr0 [new Application/Traffic/CBR]
$cbr0 attach-agent $udp0
$udp0 set packetSize_ 536	# set MSS to 536 bytes;

set null0 [new Agent/Null]
$ns attach-agent $n1 $null0
$ns connect $udp0 $null0

proc finish {} {
	global ns nf
	$ns flush-trace
	close $nf
	exec nam min.nam &
	exit 0
}

$ns at 0.1ms "$cbr0 start"

$ns at 4ms "finish"
$ns run
      
        
