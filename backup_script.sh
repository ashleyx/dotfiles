#!/bin/bash

#@weekly rm -rf /home/ashleyx/Downloads/*
#@daily sh /home/ashleyx/dotfiles/backup_script.sh

rsync -r /home/ashleyx/git /mnt/external/backups/
rsync -r /home/ashleyx/dotfiles /mnt/external/backups/
rsync -r /home/ashleyx/work /mnt/external/backups/
rsync -r /home/ashleyx/Pictures /mnt/external/backups/
rsync -r /home/ashleyx/Documents /mnt/external/backups/
rsync -r /home/ashleyx/Videos /mnt/external/backups/
