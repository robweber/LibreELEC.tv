#!/bin/bash
# Update the RetroPlayer build name and build the LibreELEC image
# Rob Weber

RETROPLAYER_VERSION="retroplayer-19.4-20220302"
KODI_PACKAGE_FILE="packages/mediacenter/kodi/package.mk"

# install min deps needed to kick start build system
#sudo apt-get update
#sudo apt-get install -y gcc make git unzip wget xz-utils bc gperf zip unzip g++ xsltproc

# Modify the Kodi Package file
sed -e "s/@RETROPLAYER_VERSION@/${RETROPLAYER_VERSION}/" -i ${KODI_PACKAGE_FILE}

# create the image
PROJECT=RPi ARCH=arm DEVICE=RPi2 BUILDER_NAME=robweber BUILDER_VERSION=${RETROPLAYER_VERSION} make image

# Revert the kodi file
git checkout ${KODI_PACKAGE_FILE}
