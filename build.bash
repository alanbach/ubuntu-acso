#!/bin/bash
sudo apt update || exit 1
sudo apt build-dep -y linux linux-image-$(uname -r) || exit 2
sudo apt install -y libncurses-dev flex bison openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf git fakeroot || exit 3
sudo apt clean 
mkdir acso
cp acso-for-focal-5.4-kernel.patch acso
cd acso
apt source -y linux-image-unsigned-$(uname -r)
cd linux-*
chmod a+x debian/rules
chmod a+x debian/scripts/*
chmod a+x debian/scripts/misc/*
LANG=C fakeroot debian/rules clean
LANG=C fakeroot debian/rules editconfigs
git apply ../acso-for-focal-5.4-kernel.patch
LANG=C fakeroot debian/rules clean
LANG=C fakeroot debian/rules DEB_BUILD_OPTIONS=parallel="$(nproc)" binary-headers binary-generic
