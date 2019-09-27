#!/usr/bin/env bash

#set -x
CurrenPath=$(cd "$(dirname "$0")"; pwd)
ConfFolder=$CurrenPath"/conf/"
ConfFile=$ConfFolder"app.conf"
if [ ! -d $ConfFolder ]; then
    echo "Your base conf folder is lost!"
    exit 1
fi
if [ ! -f $ConfFile ]; then
    echo "Your Conf file is lost!"
    echo 1
fi
echo -e "Starting to change the conf based on your env!"
read -p "Enter your favorite access port for client browser: " httpport
read -p "Enter your local host machine name: " hostname
read -p "Enter your local host machine Ip: " hostip
read -p "Enter your local host machine root user name: " sshuser
read -p "Enter your local host machine root user password: " sshpassword
read -p "Enter your local host machine ssh port, default is 22: " sshport
read -p "choose your favorite Authentication type from password/keyfile " authype
echo "appname = webconsole_sma
runmode = dev
httpport = $httpport


sshHost = \"$hostname\"
sshHostIP = \"$hostip\"
sshUser = \"$sshuser\"
sshPassword = \"$sshpassword\"
sshPort = \"$sshport\"
sshType = "password"">$ConfFile
echo -e "Done!"
echo -e "After this init configuration, you do not need to run this script again!"
echo -e "Starting to run this server and enter http://$hostip:$httpport/machine"
chmod 766 webconsole_sma
./webconsole_sma

#set +x