	iptables -t nat -A PREROUTING -p tcp -m tcp --dport 53301 -j DNAT --to-destination 192.168.1.161:22
	iptables -t nat -A POSTROUTING -d 192.168.1.161 -p tcp --dport 22 -j SNAT --to  192.168.1.234
		
	iptables -t nat -A PREROUTING -p tcp -m tcp --dport 53302 -j DNAT --to-destination 192.168.1.59:22
	iptables -t nat -A POSTROUTING -d 192.168.1.59 -p tcp --dport 22 -j SNAT --to  192.168.1.234
	
	iptables -t nat -A PREROUTING -p tcp -m tcp --dport 53303 -j DNAT --to-destination 192.168.1.26:22
	iptables -t nat -A POSTROUTING -d 192.168.1.26 -p tcp --dport 22 -j SNAT --to  192.168.1.234

	iptables -t nat -A PREROUTING -p tcp -m tcp --dport 53304 -j DNAT --to-destination 192.168.1.245:22
	iptables -t nat -A POSTROUTING -d 192.168.1.245 -p tcp --dport 22 -j SNAT --to  192.168.1.234
        iptables -t nat -A PREROUTING -p tcp -m tcp --dport 53305 -j DNAT --to-destination 192.168.1.230:22
        iptables -t nat -A POSTROUTING -d 192.168.1.230 -p tcp --dport 22 -j SNAT --to  192.168.1.234

