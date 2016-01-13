#!/bin/sh
echo "---- Connecting to Other WSUDOR Servers ------------------------------------------------"

#### GET ENVARS #################################################
SHARED_DIR=$1

if [ -f "$SHARED_DIR/config/envvars" ]; then
  . $SHARED_DIR/config/envvars
  printf "found your local envvars file. Using it."

else
  . $SHARED_DIR/config/envvars.default
  printf "found your default envvars file. Using its default values."

fi
#################################################################

# DEBUG
printf whoami

# build some initial directory structures
sudo mkdir /assets
sudo mkdir /assets/transfer
sudo mkdir /assets/sip_storage
sudo mkdir /assets/aip_storage
sudo chown -R vagrant /assets

# generate key
ssh-keygen -f ~/.ssh/id_rsa -N ''

# connect to sip_storage on fedora-stack-storage
sshpass -p "$ARCHIVEMATICA_USER_PASSWORD" ssh-copy-id -o StrictHostKeyChecking=no archivematica@$FEDORA_STACK_STORAGE_HOST
# sshfs archivematica@$FEDORA_STACK_STORAGE_HOST:/assets/sip_storage /assets/sip_storage

# connect to aip_storage on fedora-stack-workdev
sshpass -p "$ARCHIVEMATICA_USER_PASSWORD" ssh-copy-id -o StrictHostKeyChecking=no archivematica@$FEDORA_STACK_WORKDEV_HOST
# sshfs archivematica@$FEDORA_STACK_WORKDEV_HOST:/assets/aip_storage /assets/aip_storage