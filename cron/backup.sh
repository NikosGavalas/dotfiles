#!/bin/bash

# dump the db
mysqldump -u root -p"yourpasswordhere" --all-databases > /path/of/your/choice

backup_files="/path/of/your/choice /etc/letsencrypt /etc/nginx /var/www/mysites"

dest="/media/your_disk/backup"

day=$(date +"%m-%d-%y")
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"

echo "Backing up $backup_files to $dest/$archive_file"
date
echo

sudo tar czf $dest/$archive_file $backup_files
sudo chmod 600 $dest/$archive_file

echo
echo "Done."
date

ls -lh $dest

