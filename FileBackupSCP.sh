#!/bin/bash

SOURCE_DIR="/home/$USER/Documents"
BACKUP_DIR="/home/$USER/backups"
DATE= $ (date +%F_%T)

mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/backup_$DATE.tar.gz" "$SOURCE_DIR"
#c-createsNewArchive, z-CompressesUsingGzip, f-SpecifiesFileName
echo " Backup of $SOURCE_DIR created at $BACKUP_DIR/backup_$DATE.tar.gz"

