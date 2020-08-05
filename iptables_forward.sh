iptables -t nat -A PREROUTING -p tcp -m tcp --dport 44321 -j DNAT --to-destination 192.168.0.1:22242
iptables -t nat -A POSTROUTING -d 192.168.0.1 -p tcp --dport 22242 -j SNAT --to 192.168.0.17

iptables -t nat -A PREROUTING -p tcp -m tcp --dport 44324 -j DNAT --to-destination 192.168.0.4:22138
iptables -t nat -A POSTROUTING -d 192.168.0.4 -p tcp --dport 22138 -j SNAT --to 192.168.0.17

iptables -t nat -A PREROUTING -p tcp -m tcp --dport 44325 -j DNAT --to-destination 192.168.0.5:22242
iptables -t nat -A POSTROUTING -d 192.168.0.5 -p tcp --dport 22242 -j SNAT --to 192.168.0.17

iptables -t nat -A PREROUTING -p tcp -m tcp --dport 44327 -j DNAT --to-destination 192.168.0.7:22018
iptables -t nat -A POSTROUTING -d 192.168.0.7 -p tcp --dport 22018 -j SNAT --to 192.168.0.17

iptables -t nat -A PREROUTING -p tcp -m tcp --dport 9999 -j DNAT --to-destination 192.168.0.1:9999
iptables -t nat -A POSTROUTING -d 192.168.0.1 -p tcp --dport 9999 -j SNAT --to 192.168.0.17

iptables -t nat -A PREROUTING -p tcp -m tcp --dport 44323 -j DNAT --to-destination 192.168.0.3:22218
iptables -t nat -A POSTROUTING -d 192.168.0.3 -p tcp --dport 22218 -j SNAT --to 192.168.0.17

iptables -t nat -A PREROUTING -p tcp -m tcp --dport 42220 -j DNAT --to-destination 192.168.0.20:22
iptables -t nat -A POSTROUTING -d 192.168.0.20 -p tcp --dport 22 -j SNAT --to-source 192.168.0.17

iptables -t nat -A PREROUTING -p tcp -m tcp --dport 44315 -j DNAT --to-destination 192.168.0.15:33899
iptables -t nat -A POSTROUTING -d 192.168.0.15 -p tcp --dport 33899 -j SNAT --to 192.168.0.17

iptables -t nat -A PREROUTING -p tcp -m tcp --dport 19999 -j DNAT --to-destination 192.168.0.4:19999
iptables -t nat -A POSTROUTING -d 192.168.0.4 -p tcp --dport 19999 -j SNAT --to 192.168.0.17

iptables -t nat -A PREROUTING -p tcp -m tcp --dport 29999 -j DNAT --to-destination 192.168.0.7:19999
iptables -t nat -A POSTROUTING -d 192.168.0.7 -p tcp --dport 19999 -j SNAT --to 192.168.0.17

iptables -t nat -A PREROUTING -p tcp -m tcp --dport 39999 -j DNAT --to-destination 192.168.0.3:19999
iptables -t nat -A POSTROUTING -d 192.168.0.3 -p tcp --dport 19999 -j SNAT --to 192.168.0.17

iptables -t nat -A PREROUTING -p tcp -m tcp --dport 49999 -j DNAT --to-destination 192.168.0.4:29999
iptables -t nat -A POSTROUTING -d 192.168.0.4 -p tcp --dport 29999 -j SNAT --to 192.168.0.17

iptables -t nat -A PREROUTING -p tcp -m tcp --dport 50002 -j DNAT --to-destination 192.168.0.5:50002
iptables -t nat -A POSTROUTING -d 192.168.0.5 -p tcp --dport 50002 -j SNAT --to 192.168.0.17