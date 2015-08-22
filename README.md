# Occupy WiFi Firmware

Occupy WiFi firmware for TP-Link TL-WR3040

TP-MR3040 devices serve as captive portal hotspots serving content off of USB storage. OpenWRT images baked from this repository based on the [OpenWRT Image Generator](http://wiki.openwrt.org/doc/howto/obtain.firmware.generate).

[![Travis CI Build Status](https://travis-ci.org/occupywifi/firmware.svg)](https://travis-ci.org/occupywifi/firmware)

## Build

Build supported only on `x86_64` Linux machines. Trigger with:

```bash
$ ./build.sh
```

Artifacts can be found in `OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64/bin/ar71xx`.

## Flash

### Original Factory Firmware (Web GUI)

 - Access the default firmware via [http://192.168.0.1](http://192.168.0.1) (default user/pass is `admin/admin`)
 - Go to the `Firmware Upgrade` menu
 - Upload `openwrt-ar71xx-generic-tl-mr3040-v2-squashfs-factory.bin` (make sure you're using the **factory** image)

### Existing OpenWrt Firmware

Copy the **sysupgrade** image to `/tmp`:

```bash
$ scp openwrt-ar71xx-generic-tl-mr3040-v2-squashfs-sysupgrade.bin 192.168.1.1:/tmp
```

Then, SSH into the device and run:

```bash
$ sysupgrade -n /tmp/openwrt-ar71xx-generic-tl-mr3040-v2-squashfs-sysupgrade.bin
```

Note the `-n` flag that will ensure no old configuration is saved.
