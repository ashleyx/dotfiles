#!/bin/bash

#@weekly rm -rf /home/ashleyx/Downloads/*
#@daily sh /home/ashleyx/dotfiles/backup_script.sh
if findmnt --target /mnt/externaldrive --source /dev/mapper/externaldrive >/dev/null
then
	rsync -rv /home/ashleyx/git /mnt/externaldrive/backups/
	rsync -rv /home/ashleyx/dotfiles /mnt/externaldrive/backups/
	rsync -rv /home/ashleyx/work /mnt/externaldrive/backups/
	rsync -rv /home/ashleyx/Pictures /mnt/externaldrive/backups/
	rsync -rv /home/ashleyx/Documents /mnt/externaldrive/backups/
	rsync -rv /home/ashleyx/Videos /mnt/externaldrive/backups/
fi
