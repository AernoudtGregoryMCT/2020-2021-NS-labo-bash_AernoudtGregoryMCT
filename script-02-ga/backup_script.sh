#!/bin/bash

#Variables
hostname=$(hostname)
src_dir="/home/student/Documents/my_work/"
dest_dir="/home/student/Backups/"
file_name=bak01-$(date +%-Y%-m%-d)-$(date +%-T).tgz 

mysql_src_dir="/var/lib/mysql"
mysql_file_name==bak01-mysql-$(date +%-Y%-m%-d)-$(date +%-T).tgz

echo "Hello a backup on: $hostname is in progress please be patient thank you"

tar --create --gzip --file=$dest_dir$file_name $src_dir
 
tar --create --gzip --file=$dest_dir/$mysql_file_name $mysql_src_dir

echo "The backup has been successfully created in the folder $destdir"

exit 0

#0 17 * * sun  /scripts/backup_script.sh
##(config with crontab) 
###https://tecadmin.net/install-crontab-in-linux/
#
#
##Via Windows Task Scheduler kan je dit script laten uitvoeren iedere zondag
#
#
#
###Weekly backup script of a specific folder 
###Executed every Sunday at 17u.



