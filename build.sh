#!/bin/bash
IMAGE_GENERATOR="OpenWrt-ImageBuilder-15.05-ar71xx-generic.Linux-x86_64"
IMAGE_GENERATOR_FILENAME="${IMAGE_GENERATOR}.tar.bz2"
IMAGE_GENERATOR_URL="https://downloads.openwrt.org/chaos_calmer/15.05/ar71xx/generic/${IMAGE_GENERATOR_FILENAME}"

PROFILES=('TLMR3040' 'TLMR3020' 'TLWR703')

[ -e "${IMAGE_GENERATOR_FILENAME}" ] || wget "${IMAGE_GENERATOR_URL}"
tar -xvjf "${IMAGE_GENERATOR_FILENAME}"
cd "${IMAGE_GENERATOR}"

# Replace filename IMG_PREFIX
sed -i 's/IMG_PREFIX:=openwrt-$(BOARD)/IMG_PREFIX:=occupywifi-$(BOARD)/' include/image.mk

for profile in "${PROFILES[@]}"
do
	make image PROFILE="$profile" PACKAGES="block-mount kmod-usb-storage kmod-fs-vfat kmod-nls-base kmod-nls-cp437 kmod-nls-iso8859-1 kmod-nls-utf8 nodogsplash uhttpd-mod-lua" FILES=../files/
done
