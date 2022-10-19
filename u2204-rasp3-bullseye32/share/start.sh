#!/bin/bash

qemu-system-aarch64 \
-m 1024 \
-M raspi3b \
-kernel kernel8.img \
-dtb bcm2710-rpi-3-b.dtb \
-sd rasbian.qcow2 \
-append "console=ttyAMA0 root=/dev/mmcblk0p2 rw rootwait rootfstype=ext4 dwc_otg.fiq_fsm_enable=0 bcm2708_fb.fbwidth=1280 bcm2708_fb.fbheight=720" \
-no-reboot \
-nographic \
-device usb-kbd \
-device usb-mouse \
-device usb-net,netdev=net0 \
-netdev user,id=net0,hostfwd=tcp::2225-:22

