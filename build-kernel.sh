#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=arm-eabi-

echo
echo building kernel ...
echo
pushd kernel-msm
export KERNEL_DIR=`pwd`
make -j2
pwd
cp -u arch/arm/boot/zImage ../vendor/htc/hero/prebuilt/kernel
popd

echo
echo building wlan.ko ...
echo
pushd system/wlan/ti/sta_dk_4_0_4_32
make -j2
cp -u wlan.ko ../../../../vendor/htc/hero/prebuilt/wlan.ko
popd

