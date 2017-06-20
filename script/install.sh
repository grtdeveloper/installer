
#!/bin/sh

LOG="log.txt"

touch $LOG

echo "==============================================================================" > $LOG

echo "Installing Mongodb on your system and necessary packages" >> $LOG

echo "Importing the Public Key" >> $LOG

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

echo "Updating the repository" >> $LOG

sudo apt-get update

echo "Installing MongoDB" >> $LOG

sudo apt-get install -y mongodb

echo "Creating Mongo service file" >> $LOG

sudo cp ../config/mongod.service /lib/systemd/system

echo "Updating System service" >> $LOG

systemctl daemon-reload

echo "Starting Mongodb service" >> $LOG

sudo systemctl start mongod
sudo systemctl enable mongod

echo "Verifying if Mongodb has been started or not" >> $LOG

sudo netstat -plntu | grep mongod

echo "Testing some basic commands" >> $LOG

mongo <<EOF
use admin
show dbs
quit()


