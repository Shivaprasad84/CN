BEGIN{tcp=0;cbr=0}
{
if ($1 == "d" && $5 =="cbr")
{
	cbr++;
}
else if ($1 == "d" && $5 == "tcp")
{
	tcp++;
}
}
END{
printf("Number of packets dropped by TCP=%d\n",tcp);
printf("Number of packets dropped by UDP=%d\n",cbr);
}

