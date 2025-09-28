#!/bin/bash
echo $0

echo "Building/upgrading calibre-web docker-web image.  Please Wait ...."

docker-compose up -d

echo "
                   - INSTRUCIONS -

calibre-web login page should be available from your web browser at

    http://host:port

where host is the IP address or hostname  eg http://rpi-media.local:8083 or http://192.168.1.124:8083

Login to calibre-web as administrator login admin  password admin123
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

for more details see https://github.com/pageauc/

docker-compose ps
-----------------
"
docker-compose ps
echo "-----------------
If calibre-web is running per above
From a Web Browser, Access the login page Eg. http://$HOSTNAME.local:8083
default admin Username is admin with Password admin123
For more Details See Instructions above.  

"
echo "$0 Bye ...."

