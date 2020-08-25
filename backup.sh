#!/bin/bash
HOME=/home/ben
BACKUP=/mnt/externalusb/backup/
SUFFIX=".tgz"
OUTPUT=$BACKUP$EPOCHSECONDS$SUFFIX


echo "backing up $HOME to $FILE"
tar --exclude=".*" -vzcf $OUTPUT $HOME
