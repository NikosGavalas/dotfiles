#!/bin/bash

mysqldump -u root -p"yourpasswordhere" --all-databases > /path/of/your/choice
backup_files="path/to/gitea/ /path/of/your/choice /etc/letsencrypt /etc/apache2 /path/to/pihole /var/www/nextcloud /var/www/othersites"

dest="/media/your_disk/backup"

day=$(date +%a)
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"

echo "Backing up $backup_files to $dest/$archive_file"
date
echo

tar czf $dest/$archive_file $backup_files

echo
echo "Done."
date

ls -lh $dest

