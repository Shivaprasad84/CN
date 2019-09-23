BEGIN {udp0 = 0; udp1 = 0; d0 = 0; d1 = 0}
{
	if($1 == "r") {
		if($8 == "1")
		{
			udp0++;
		}
		else if($8 == "2")
		{
			udp1++;
		}
		
	}
	else if($1 == "d") {
		if($8 == "1")
		{
			d0++;
		}
		else if($8 == "2")
		{
			d1++;
		}
	}
}
END {
	printf("No of packets sent by udp0 = %d\n", udp0);
	printf("No of packets sent by udp1 = %d\n", udp1);
	printf("No of packets dropped by udp0 = %d\n", d0);
	printf("No of packets dropped by udp1 = %d\n", d1);
}
