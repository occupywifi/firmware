# Occupy WiFi Firmware

Occupy WiFi firmware for TP-Link TL-WR3040

TP-MR3040 devices serve as captive portal hotspots serving content off of USB storage. OpenWRT images baked from this repository based on the [OpenWRT Image Generator](http://wiki.openwrt.org/doc/howto/obtain.firmware.generate).

## Generate an Image (Linux only)

```bash
$ cd firmware 
$ wget https://downloads.openwrt.org/barrier_breaker/14.07/ar71xx/generic/OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64.tar.bz2
$ tar -xvjf OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64.tar.bz2
$ cd OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64
$ ../build.sh 
```
