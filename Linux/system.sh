#!/bin/bash

# create script that will execute various Linux tools to parse info about system.

# Free memory out put to a free_mem.txt file
free -h > ~/backups/freemem/free_mem.txt

# Disk usage output to a disk_usage.txt file
du -h > ~/backups/diskuse/disk_usage.txt

# list open files to a open_list.txt file
ls of > ~/backups/openlist/open_list.txt

# free disk space to a free_disk.txt file
df -h > ~/backups/freedisk/free_disk.txt
