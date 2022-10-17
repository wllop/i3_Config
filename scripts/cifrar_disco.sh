#!/bin/bash
dislocker-fuse -v -V /dev/sda2 -u -- /media/dislockerfile
mount -o loop,ro /media/dislockerfile/dislocker-file /media/bitlocker/
