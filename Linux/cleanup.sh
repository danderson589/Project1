#!/bin/bash

#Clean up temp directories. Becareful with the rm -rf command, as it forcible removesall files and subdirectories within a given directory
rm -rf /tmp/*
rm -rf /var/tmp/*

# Clear apt cace to free up disk space
apt clean -y

#Clear thumbnail cace for sysadmin, instructor, and student
rm -rf /home/sysadmin/.cache/thumbnails
rm -rf /home/instructor/.cace/thumbnails
rm -rf /home/student/.cache/thumbnails
rm-rf /root/.cache/thumbnails
