#!/bin/ash

#sleep 3 && ifconfig > /root/ifconfig.log && /etc/init.d/dropbear restart > /root/dropbear.log &

init(){
#       can't seem to find a way of specifying that something should happen upon ppp0 coming up
#       so we just assume that it will be up after 2 seconds
        sleep 2
        /etc/init.d/ttyd restart
        #netcat -s 192.168.100.1 -p 7681 --tunnel=127.0.0.1:7681 -t > /dev/null &
        /etc/init.d/uhttpd restart 
}

init &
pppd 115200 defaultroute 192.168.100.1:192.168.100.2 noauth nopersist ifname ppp0 deflate 15,15
