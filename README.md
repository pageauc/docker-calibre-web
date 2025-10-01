##      Docker calibre-web Install

Github Automated Docker Install of calibre-web on a Raspberry PI or unix based distro.

### Quick Install

#### Step 1
Press GitHub copy icon on right side of code box below.  Copied! will be displayed.   

    curl -L https://raw.github.com/pageauc/docker-calibre-web/master/download.sh | bash

#### Step 2
On RPI putty SSH or terminal session right click, select paste then Enter to Download and Run **download.sh** script.  

The download.sh script will run and perform the following actions.

* Perform a sudo apt update and upgrade if required
* install/upgrade docker, docker-compose and cifs-util as required
* Download required github files install.sh, docker-compose.yml, Etc.
* Create docker group and add current user to group if required.
* Give some basic instructions for running install.sh

#### Step 3

On the RPI, Edit the docker-compose.yml file per commands below

	cd ~/calibre-web
    cp docker-compose.yml docker-compose.yml.bak
    nano docker-compose.yml

See comments and make changes as required.  ctr-x y  saves changes and exits.

Make sure your calibre library folder is mounted at specified share path or
local disk folder path per setting in docker-compose.yml

When Ready Run command below

    ./install.sh

This will run calibre-web docker-compose install and provide additional Instructions

for more details see https://github.com/pageauc/

### Instructions

To get started, see Instructions at the end of the install script. 

see the calibre-web wiki at https://github.com/janeczku/calibre-web/wiki

calibre-web login page should be available from your web browser at

    http://host:port

Where host is the IP address or hostname  

    eg http://rpi-media.local:8083 or http://192.168.1.124:8083

Login to calibre-web as login admin  password admin123
After login navigate to /books folder and select the metadata.db file (should be at bottom of folders listing,
Depending on the size of your calibre library this may take a while. Be patient.
Save setting and select books button on left.  I there is a problem check the docker-compose.yml 
and verify library is at spcifield path share point or local folder.

Once logged in as admin, add/edit users and set comfiguration options using the top right admin pick

For details see https://github.com/janeczku/calibre-web/wiki/Configuration#basic-configuration

various docker commads you can run

    docker-compose down
	docker-compose pull
	docker-compose up -d
	docker-compose ps
