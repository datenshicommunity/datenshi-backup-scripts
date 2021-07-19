#!/bin/bash

#config path
source ~/db_backup/crot.config

#variable
dateNow=$(date +%Y-%m-%d-%H)
filename="datenshi_backup_${dateNow}.zip" # Databases
mcpdata="minecraft_playerdata_${dateNow}.zip" # Minecraft Player Data
mcudata="minecraft_userdata_${dateNow}.zip" # Minecraft Userdata

# Prosesssssssss
echo "File backup belum ada dan mencoba untuk membuat backup"
# Mount first
google-drive-ocamlfuse ~/GDRIVE-BACKUP
# Discord Message
curl -X POST --data '{"content": "`[SERVER]` Memulai proses backup..."}' --header "Content-Type:application/json" $webhookDC
sleep 3
# Edit as you needed
zip -u -r "$HOME/db_backup/$filename" /var/lib/mysql/{datenshi,minecraft,ibdata1,ib_logfile0,ib_logfile1}
echo "Proses Zip Database sudah selesai"
curl -X POST --data '{"content": "`[SERVER]` Backup **databases** osu dan minecraft selesai.."}' --header "Content-Type:application/json" $webhookDC
sleep 3
# Minecraft PlayerData
zip -u -r "$HOME/db_backup/$mcpdata" /opt/Datenshi-Minecraft/minecraft/world/playerdata
echo "Proses Zip Minecraft playerdata selesai"
sleep 3
# Minecraft Userdata
zip -u -r "$HOME/db_backup/$mcudata" /opt/Datenshi-Minecraft/minecraft/plugins/Essentials/userdata
echo "Proses Zip Minecraft userdata selesai"
curl -X POST --data '{"content": "`[SERVER]` Backup **playerdata & userdata** minecraft sudah selesai.."}' --header "Content-Type:application/json" $webhookDC
sleep 3
#  Your file being copied to your Google Drive
cp "$HOME/db_backup/$filename" ~/GDRIVE-BACKUP/backup/
cp "$HOME/db_backup/$mcpdata" ~/GDRIVE-BACKUP/backup/minecraft/
cp "$HOME/db_backup/$mcudata" ~/GDRIVE-BACKUP/backup/minecraft/
echo "Upload ke GoogleDrive Complete!"
curl -X POST --data '{"content": "`[SERVER]` Backup **osu!** dan **minecraft** sudah selesai!"}' --header "Content-Type:application/json" $webhookDC
# Unmount Drive
fusermount -u ~/GDRIVE-BACKUP
exit 0;
