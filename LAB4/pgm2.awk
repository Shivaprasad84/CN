BEGIN {tcp = 0; ack = 0; d = 0}
{
if($1 == "d") d++;
else if($1 == "r") ($5 == "ack") ? ack++ : tcp++;
}
END {
printf("Number of packets sent by tcp: %d\n", tcp);
printf("Number of packets sent as ack: %d\n", ack);
printf("Number of packets dropped: %d\n", d);
}
