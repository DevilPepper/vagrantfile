#!/bin/bash

sed -i.bak -e 's/GRUB_TIMEOUT=[0-9]*/GRUB_TIMEOUT=0/' /etc/default/grub
update-grub
