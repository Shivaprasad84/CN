set ns [new Simulator]

set nf [open sim.nam w]   
$ns namtrace-all $nf 
   
set n0 [$ns node]     
set n1 [$ns node]

$ns duplex-link $n0 $n1 1Mb 8ms DropTail   
$ns duplex-link-op $n0 $n1 orient left-down 

set tcp [new Agent/TCP] 
$ns attach-agent $n0 $tcp   

set sink [new Agent/TCPSink]  
$ns attach-agent $n1 $sink   

$ns connect $tcp $sink 
set ftp [new Application/FTP]  
$ftp attach-agent $tcp  

$ns at 0.1ms "$ftp start"  
$ns at 4ms exit      
$ns run       
