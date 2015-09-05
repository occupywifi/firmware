# Occupy WiFi Firmware

[![Travis CI Build Status](https://travis-ci.org/occupywifi/firmware.svg)](https://travis-ci.org/occupywifi/firmware)

[Occupy WiFi](http://occupywifi.org/en) is a concept project built around a portable router that functions as a web server that distributes propaganda, enabling activists, protestors and other freedom of speech advocates to virtually demonstrate in public without being identified as such.

Firmware is provided for TP-Link TL-MR3040 devices which are used for their low price, excellent portability (batteries included!) and flawless support for OpenWrt-based firmware. The devices serve as LAN-only captive portal hotspots that capture and route all traffic to a local web server that serves propaganda of choice. Custom content can be loaded onto USB drives and seamlessly plugged in.

TL-MR3020 and TL-WR703 are both supported as secondary devices for stationary deployments, or with external portable 5V power.

Firmware images baked from this repository are based on the [OpenWrt Image Generator](http://wiki.openwrt.org/doc/howto/obtain.firmware.generate) framework.

## Build

Build supported only on `x86_64` Linux machines. Trigger with:

```bash
$ ./build.sh
```

Artifacts can be found in `OpenWrt-ImageBuilder-ar71xx_generic-for-linux-x86_64/bin/ar71xx`.

### Precompiled Images

If you can't build an image yourself, you can grab a stable image from the Travis CI build artifacts. Latest stable images:

    | Device | Factory | Sysupgrade
--- | ------ | ------- | ----------
<img src="http://i.imgur.com/JxfpPkZ.png" height="48"> | TL-MR3040 | [tl-mr3040-v2-factory.bin](https://s3.amazonaws.com/occupywifi-firmware/occupywifi/firmware/32/32.1/occupywifi-ar71xx-generic-tl-mr3040-v2-squashfs-factory.bin) | [tl-mr3040-v2-sysupgrade.bin](https://s3.amazonaws.com/occupywifi-firmware/occupywifi/firmware/32/32.1/occupywifi-ar71xx-generic-tl-mr3040-v2-squashfs-sysupgrade.bin)
<img src="http://i.imgur.com/jVqic8Z.png" height="48"> | TL-MR3020 | [tl-mr3020-v1-factory.bin](https://s3.amazonaws.com/occupywifi-firmware/occupywifi/firmware/32/32.1/occupywifi-ar71xx-generic-tl-mr3020-v1-squashfs-factory.bin) | [tl-mr3020-v1-sysupgrade.bin](https://s3.amazonaws.com/occupywifi-firmware/occupywifi/firmware/32/32.1/occupywifi-ar71xx-generic-tl-mr3020-v1-squashfs-sysupgrade.bin)
<img src="http://i.imgur.com/Na1zhKp.png" height="48"> | TL-WR703 | [tl-wr703n-v1-factory.bin](https://s3.amazonaws.com/occupywifi-firmware/occupywifi/firmware/32/32.1/occupywifi-ar71xx-generic-tl-wr703n-v1-squashfs-factory.bin) | [tl-wr703n-v1-sysupgrade.bin](https://s3.amazonaws.com/occupywifi-firmware/occupywifi/firmware/32/32.1/occupywifi-ar71xx-generic-tl-wr703n-v1-squashfs-sysupgrade.bin)


## Flash

### Original Factory Firmware (Web GUI)

 - Access the default firmware via [http://192.168.0.1](http://192.168.0.1) (default user/pass is `admin/admin`)
 - Go to the `Firmware Upgrade` menu
 - Upload `occupywifi-ar71xx-generic-tl-mr3040-v2-squashfs-factory.bin` (make sure you're using the **factory** image)

### Existing OpenWrt Firmware

Copy the **sysupgrade** image to `/tmp`:

```bash
$ scp occupywifi-ar71xx-generic-tl-mr3040-v2-squashfs-sysupgrade.bin 192.168.1.1:/tmp
```

Then, SSH into the device and run:

```bash
$ sysupgrade -n /tmp/occupywifi-ar71xx-generic-tl-mr3040-v2-squashfs-sysupgrade.bin
```

Note the `-n` flag that will ensure no old configuration is saved.

## Customize

Now that your device is flashed, there are several customization steps you'll want to do.

### SSH

SSH won't be enabled until you set a password, so telnet into the device and set a root user password:

```bash
$ telnet 192.168.1.1
$ passwd
```

You can now SSH and SCP into your device with `root` user and the new password.

```bash
$ ssh root@192.168.1.1
```

### Wireless SSID

The default wireless SSID is `OccupyWiFi`, and is defined in `/etc/config/wireless`.

### Captive Portal Content

The OccupyWifi image provides a simple default captive portal webpage. New content can be easily deployed by sticking a USB drive into the device. The are a few requirements for loading content from the USB:

 - USB drive must contain a single partition which is formatted as a FAT filesystem
 - Entry point must be a single `splash.html` page on the USB drive root directory
 - Any other pages or static assets must be hosted under the `static/` directory
 - Other content that does not match these specifications **will not** be served by the captive portal
