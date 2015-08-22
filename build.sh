#!/bin/bash
IMAGE_GENERATOR="OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64"
IMAGE_GENERATOR_FILENAME="${IMAGE_GENERATOR}.tar.bz2"
IMAGE_GENERATOR_URL="https://downloads.openwrt.org/barrier_breaker/14.07/ar71xx/generic/${IMAGE_GENERATOR_FILENAME}"

[ -e "${IMAGE_GENERATOR_FILENAME}" ] || wget "${IMAGE_GENERATOR_URL}"
tar -xvjf "${IMAGE_GENERATOR_FILENAME}"
cd "${IMAGE_GENERATOR}"

make image PROFILE=TLMR3040 PACKAGES="" FILES=../files/
