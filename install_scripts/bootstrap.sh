#!/bin/sh
echo "---- Bootstrapping ------------------------------------------------"

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

# Update
# apt-get -y update && apt-get -y upgrade

# SSH
apt-get -y install openssh-server

# Git vim
apt-get -y install git vim

# Wget and curl
apt-get -y install wget curl

# visualization tools
apt-get -y install htop tree ncdu

# install sshfs and sshpass
apt-get -y install sshfs sshpass