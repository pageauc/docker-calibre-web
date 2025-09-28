#!/bin/bash

CONTAINER_NAME='calibre-web'
CURRENT_USER=$(whoami)

cd ~
mkdir -p $CONTAINER_NAME
cd $CONTAINER_NAME
mkdir -p library

echo "Check if there are upgradable operating system packages."
if apt list --upgradable 2>/dev/null | grep -q "Listing..."; then
    echo "No packages need upgrading."
else
    echo "Packages are available for upgrade. Running sudo apt update and sudo apt upgrade"
	sudo apt update
	sudo apt upgrade -y
fi

echo "Install required OS packages if Required."
sudo apt install cifs-utils -y   # Required for mounting remote ebook share if Required
sudo apt install docker docker-compose -y  # install docker and docker-compose

echo "Downloading calibre-web docker installation files"
echo "-------------------------------------------------"
wget -O download.sh -q --show-progress https://raw.github.com/pageauc/docker-calibre-web/master/download.sh
wget -O docker-compose.yml -q --show-progress https://raw.github.com/pageauc/docker-calibre-web/master/docker-compose.yml
wget -O install.sh -q --show-progress https://raw.github.com/pageauc/docker-calibre-web/master/install.sh
wget -O library/metadata.db -q --show-progress https://raw.github.com/pageauc/docker-calibre-web/master/metadata.db
wget -O Readme.md -q --show-progress https://raw.github.com/pageauc/docker-calibre-web/master/Readme.md
chmod +x *sh

if getent group "$GROUP_NAME" >/dev/null; then
    echo "Adding docker group"
    sudo groupadd docker
fi

# Check if the user is a member of the group
if ! id -Gn "$CURRENT_USER" | grep -q -w "docker"; then
    echo "Add $CURRENT_USER to group"
    sudo usermod -aG docker $CURRENT_USER
	echo "

Logout and login to ensure you are in the docker group otherwise
you will need to manually run

	sudo docker-compose up

	"
fi

echo "
                     Instructions

Edit the docker-compose.yml file per commands below

    cp docker-compose.yml docker-compose.yml.bak
    nano docker-compose.yml

See comments and make changes as required.  ctr-x y  saves changes and exits.

Make sure your calibre library folder is mounted at specified share path or
local disk folder path per setting in docker-compose.yml

When Ready Run command below

    ./install.sh

This will run calibre-web docker-compose install and provide additional Instructions

for more details see https://github.com/pageauc/

Exiting

"
exit 0
