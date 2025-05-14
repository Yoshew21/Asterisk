#!/bin/bash

# Made by Yoshew GRIBALDO with all his heart for the Hesias students <3 !

# Ensure script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "You must run this script as root. (Sudo is there for you ;) )" >&2
    exit 1
fi

echo "=== Updating system packages ==="
apt update
apt full-upgrade -y
apt autoremove -y
apt autoclean -y

echo "=== Downloading Asterisk sources ==="
cd /usr/src/
wget https://downloads.asterisk.org/pub/telephony/asterisk/asterisk-22-current.tar.gz

echo "=== Extracting sources ==="
tar xvf asterisk-22-current.tar.gz

echo "=== Removing sources ==="
rm -rf asterisk-22-current.tar.gz

# Enter the extracted directory
cd asterisk-22*/

echo "=== Installing build dependencies ==="
contrib/scripts/install_prereq install

echo "=== Fetching MP3 support files ==="
contrib/scripts/get_mp3_source.sh

echo "=== Configuring build ==="
./configure

echo "=== Compiling Asterisk (this may take a while) ==="
make -j"$(nproc)"

echo "=== Installing Asterisk ==="
make install

echo "=== Installing sample configuration and basic PBX ==="
make samples
make basic-pbx

echo "=== Installing init scripts ==="
make config

echo "=== Saving default config files ==="
mkdir /etc/asterisk/samples
cp /etc/asterisk/*.* /etc/asterisk/samples/

echo "=== Enabling and starting the Asterisk service ==="
systemctl enable asterisk
systemctl start asterisk

echo "=== Verifying some things ==="
cd /usr/src/asterisk-22*/
make samples
make basic-pbx
make config
systemctl restart asterisk

echo "=== Verifying if the Asterisk service is running ==="
systemctl status asterisk

echo
echo "=== Installation complete! ==="
echo "You can now connect to the Asterisk CLI with: sudo asterisk -r"
echo
