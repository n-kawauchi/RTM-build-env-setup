#!/bin/sh

sudo chown vagrant:vagrant ubuntu-22.04-server-cloudimg-arm64.img AAVMF_CODE.fd \
  flash1.img cloud.img user-data
qemu-system-aarch64 -m 4096 -smp 4 -cpu cortex-a57 -M virt -nographic \
  -pflash AAVMF_CODE.fd \
  -pflash flash1.img \
  -drive if=none,file=ubuntu-22.04-server-cloudimg-arm64.img,id=hd0 \
  -device virtio-blk-device,drive=hd0 \
  -drive if=none,id=cloud,file=cloud.img \
  -device virtio-net-device,netdev=user0 \
  -netdev user,id=user0,hostfwd=tcp::2226-:22

