#!/bin/bash

wget https://downloads.openwrt.org/barrier_breaker/14.07/ar71xx/generic/OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64.tar.bz2
tar -xvjf OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64.tar.bz2
cd OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64

ln -s ../files .

make image PROFILE=TLMR3040 FILES=files/
