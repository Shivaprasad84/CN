b=`ifconfig | grep 192. | cut -f2 -d ":" | cut -f1-3 -d "."`
echo pinging to $b.$1
ping $b.$1 -c 5 -i 2
