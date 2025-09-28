##      Calibre-web Docker Install

### Quick Install

#### Step 1
Press GitHub copy icon on right side of code box below.  Copied! will be displayed.   

    curl -L https://raw.github.com/pageauc/docker-calibre-web/master/download.sh | bash

#### Step 2
On RPI putty SSH or terminal session right click, select paste then Enter to Download and Run **download.sh** script.  

The download.sh script will run and perform the following actions.

* Perform a sudo apt update and upgrade if required
* install/upgrade docker, docker-compose and cifs-util well as required
* Download required github files
* Create docker group and add current user to group
* Give some basic instructions for running install.sh


### Instructions

To get started, see Instructions at the end of the install script. Initial default config.py setting is CALIBRATE_ON=True.
You may also need to Align Camera using config.py ALIGN_CAM_ON=True setting.  Once calibration is complete set CALIBRATE_ON=False


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

For details see https://github.com/janeczku/calibre-web/wiki/Configuration#basic-configuration

various commads you can run

    docker-compose down
	docker-compose pull
	docker-compose up -db
	docker-compose ps

Once logged in as admin, add/edit users and set comfiguration options using the top right admin pick
