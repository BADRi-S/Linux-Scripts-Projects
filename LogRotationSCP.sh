#!/bin/bash

LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="/var/log/myapp/archive"
mkdir -p "$ARCHIVE_DIR" #p-avoidsErrorForFolderAlreadyExists 

for file in "$LOG_DIR"/*.log; do
	  mv "$file" "$ARCHIVE_DIR/$ (basename $file).$ (date +%F)"
done

echo " Log files moved to archive with date suffix."

