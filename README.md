##      Docker calibre-web Install

Github Automated Docker Install of calibre-web on a Raspberry PI or unix based distro.

## Install

#### Quick Install (option 1)
Press GitHub copy icon on right side of code box below.  Copied! will be displayed.   

    curl -L https://raw.github.com/pageauc/docker-calibre-web/master/download.sh | bash

On RPI putty SSH or terminal session right click, select paste then Enter to Download and Run **download.sh** script.  

#### Manual Install (option 2)
Copy command below and past into the SSH or terlmial session

    wget -O download.sh -q --show-progress https://raw.github.com/pageauc/docker-calibre-web/master/download.sh

Review file and Run download.sh script

    cat download.sh
    bash download.sh

The download.sh script will run and performs the following actions.

* Perform a sudo apt update and upgrade if required
* install/upgrade docker, docker-compose and cifs-util as required
* Download required github files install.sh, docker-compose.yml, Etc.
* Create docker group and add current user to group if required.
* Give some basic instructions for running install.sh

## Instructions

On the RPI, Edit ***docker-compose.yml*** file per commands below

	cd ~/calibre-web
    cp docker-compose.yml docker-compose.yml.bak
    nano docker-compose.yml

See comments and make changes as required.  ctr-x y  saves changes and exits.

#### Note: 
The default location of ebooks library is a mount point at **/mnt/ebooks/**
See link below for details on how to mount a share

    https://ponnala.medium.com/mounting-an-smb-path-on-raspberry-pi-or-linux-using-cifs-utilities-372fd9622c3c

Make sure your calibre library folder is mounted at specified share path or
local disk folder path per setting in docker-compose.yml

When Ready Run command below

    ./install.sh
    docker-compose ps
	
This will run calibre-web docker-compose install and provide additional Instructions

for more details see 

    https://github.com/pageauc/ 
    https://github.com/janeczku/calibre-web/wiki
	https://github.com/janeczku/calibre-web

## Getting Started

calibre-web login page should be available from your web browser at

    http://hostname/IP:port

Where host is the IP address or hostname

    Eg http://rpi-books.local:8083 or http://192.168.1.124:8083

Login to calibre-web as login **admin**  password **admin123**

After login navigate to /books folder and select the metadata.db file (should be at bottom of folders listing,
Depending on the size of your calibre library this may take a while. Be patient.
Save setting and select books button on left and you should see your book covers. 
If there is a problem check the docker-compose.yml 
and verify library is at spcifield path share point or disk local folder.

Once logged in as admin, add/edit users and set comfiguration options using the top right admin pick

For details see https://github.com/janeczku/calibre-web/wiki/Configuration#basic-configuration

various docker commads you can run (please note docker-compose is depricated but is the default on bookworm and earlier.

    docker-compose down
	docker-compose pull
	docker-compose up -d
	docker-compose ps
	docker ps

Good Luck