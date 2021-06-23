#!/bin/bash

#config path
source ~/db_backup/crot.config

#variable
dateNow=$(date +%Y-%m-%d-%H)
filename="datenshi_backup_${dateNow}.zip" #edit this

# Prosesssssssss
echo "File backup belum ada dan mencoba untuk membuat backup"
# Mount first
google-drive-ocamlfuse ~/GDRIVE-BACKUP
# Discord Message
curl -X POST --data '{"content": "`[SERVER]` Memulai proses backup..."}' --header "Content-Type:application/json" $webhookDC
sleep 3
# Edit as you needed
zip -u -r "$HOME/db_backup/$filename" /var/lib/mysql/{datenshi,minecraft,ibdata1,ib_logfile0,ib_logfile1}
echo "Proses Zip sudah selesai"
sleep 3
#  Your file being copied to your Google Drive
cp "$HOME/db_backup/$filename" ~/GDRIVE-BACKUP/backup/
echo "Upload ke GoogleDrive Complete!"
curl -X POST --data '{"content": "`[SERVER]` Backup **osu!** dan **minecraft** sudah selesai!"}' --header "Content-Type:application/json" $webhookDC
# Unmount Drive
fusermount -u ~/GDRIVE-BACKUP
exit 0;
