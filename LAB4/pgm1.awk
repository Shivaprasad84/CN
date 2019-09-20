BEGIN {tcp = 0; ack = 0}
{
if($1 == "r")
{
	($5 == "ack") ? ack++ : tcp++;
}
}
END {
printf("Number of packets sent by TCP = %d\n", tcp);
printf("Number of packets sent as ACK = %d\n", ack);
}
