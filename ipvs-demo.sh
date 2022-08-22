#Configuer the "Director"
ssh gary@192.168.0.14

#Install ipvsadm.It used to set up,maintain or inspect the virtual server table in the Linux kernel.
sudo apt install ipvsadm -y

#Our "Real servers"
curl http://192.168.0.13:8080/computer
curl http://192.168.0.89:8080/computer


#"A":Add service,"-t":tcp "s":Scheduling algorithm,"rr":Round robin
sudo ipvsadm -A -t 192.168.0.14:80 -s rr

#Add servers
#"a":Add service to a virtual service,"r":Real server,"m",Masquerading (NAT)
sudo ipvsadm -a- t 192.168.0.14:80 -r 192.168.0.13:8080 -m
sudo ipvsadm -a- t 192.168.0.14:80 -r 192.168.0.89:8080 -m


#List the virtual server table
sudo ipvsadm -L

curl http://192.168.0.14:80/computer

#"c":connection table,"n":Numeric output.IP addresses and port numbers will be printed in numeric format
sudo ipvsadm -1cn

#Delete the service
sudo ipvsadm -D -t 192.168.0.14:80