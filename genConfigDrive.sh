#!/bin/bash

ret_val=0

#cleanup
rm -f new.key* meta-data user-data configdrive.iso

ssh-keygen -t rsa -b 2048 -N "" -f new.key
if [ $? -ne 0 ]; then
  echo 'Generating ssh key failed'
  ret_val=1
fi

sshkey=$(cat new.key.pub | cut -f 2-3 -d \ )
cat tpl_meta-data > meta-data
cat tpl_user-data | sed "s|KEY|${sshkey}|" > user-data

# generate the iso 
genisoimage -output configdrive.iso -volid cidata -joliet -rock user-data meta-data
if [ $? -ne 0 ]; then
  echo 'Generating iso file failed'
  ret_val=1
fi

# make sure we really got a valid iso
file configdrive.iso | grep 'ISO 9660' > /dev/null
if [ $? -ne 0 ]; then
  echo 'Resulting config drive isnt an ISO' 
  ret_val=1
fi
