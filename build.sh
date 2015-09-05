#!/bin/bash
IMAGE_GENERATOR="OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64"
IMAGE_GENERATOR_FILENAME="${IMAGE_GENERATOR}.tar.bz2"
IMAGE_GENERATOR_URL="https://downloads.openwrt.org/barrier_breaker/14.07/ar71xx/generic/${IMAGE_GENERATOR_FILENAME}"

PROFILES=('TLMR3040' 'TLMR3020' 'TLWR703')

[ -e "${IMAGE_GENERATOR_FILENAME}" ] || wget "${IMAGE_GENERATOR_URL}"
tar -xvjf "${IMAGE_GENERATOR_FILENAME}"
cd "${IMAGE_GENERATOR}"

# Add missing routing repo which contains nodogsplash
sed -i '4isrc/gz barrier_breaker_routing http://downloads.openwrt.org/barrier_breaker/14.07/ar71xx/generic/packages/routing' repositories.conf

# Replace filename IMG_PREFIX
sed -i 's/IMG_PREFIX:=openwrt-$(BOARD)/IMG_PREFIX:=occupywifi-$(BOARD)/' include/image.mk

for profile in "${PROFILES[@]}"
do
	make image PROFILE="$profile" PACKAGES="block-mount kmod-usb-storage kmod-fs-vfat kmod-nls-base kmod-nls-cp437 kmod-nls-iso8859-1 kmod-nls-utf8 nodogsplash uhttpd-mod-lua" FILES=../files/
done
