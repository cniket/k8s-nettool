# k8s-nettool

This will create a docker container/pod with multiple network troubleshooting utilities/commands listed below inbuild in it.

### Below are the network utilities included in the image

 * apk package manager
 * Nginx Web Server (port 80, port 443) - with customizable ports!
 * awk, cut, diff, find, grep, sed, vi editor, wc
 * curl, wget
 * dig, nslookup
 * ip, ifconfig, route
 * traceroute, tracepath, mtr, tcptraceroute
 * ps, ping, arp, arping
 * gzip, cpio, tar
 * telnet client
 * tcpdump
 * ss, netstat, nmap
 * jq
 * bash
 * iperf3
 * ethtool, mii-tool
 * ssh client, lftp client, rsync, scp
 * netcat (nc), socat
 * ApacheBench (ab)
 * mysql & postgresql client
 * git


#### Usage;
1. Copy / Download the yaml.
2. $ kubectl apply nettools.yaml -n <namespace>
