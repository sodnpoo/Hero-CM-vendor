#!/bin/sh

mkdir -p vendor/htc/hero/proprietary
mkdir -p vendor/htc/hero/prebuilt

if [ -z "$1" ]; then
	ZIP="update-hero.zip"
else
    ZIP=$1
fi

#first get proprietary files
unzip -j -d vendor/htc/hero/proprietary -o $ZIP \
  system/bin/akmd \
  system/etc/AudioPara4.csv \
  system/etc/AudioFilter.csv \
  system/etc/AudioPreProcess.csv \
  system/etc/firmware/tiinit_5.3.53.bts \
  system/etc/firmware/avpr.bts \
  system/etc/firmware/brf6300.bin \
  system/etc/firmware/brf6350.bin \
  system/etc/firmware/fmc_init_1273.2.bts \
  system/etc/firmware/fm_rx_init_1273.2.bts \
  system/etc/firmware/vac_config.ini \
  system/etc/gps.conf \
  system/etc/wifi/Fw1251r1c.bin \
  system/lib/libcamera.so \
  system/lib/libhtc_acoustic.so \
  system/lib/libhtc_ril.so \
  system/lib/hw/sensors.hero.so \
  system/usr/keychars/hero-keypad.kcm.bin \
  system/lib/egl/egl.cfg \
  system/lib/egl/libGLES_qcom.so \
  system/lib/libGLESv1_CM.so \
  system/lib/libGLESv2.so
  
#make sure we've got both brf6300.bin and brf6350.bin by copying whichever exists
if [ -f vendor/htc/hero/proprietary/brf6300.bin ]
then
  cp vendor/htc/hero/proprietary/brf6300.bin vendor/htc/hero/proprietary/brf6350.bin
else #we assume we have the 6350 copy
  cp vendor/htc/hero/proprietary/brf6350.bin vendor/htc/hero/proprietary/brf6300.bin
fi

#now prebuilt
unzip -j -d vendor/htc/hero/prebuilt -o $ZIP \
  system/lib/libspeech.so \
  system/etc/agps_rm \
  system/etc/vold.conf \
  system/usr/keylayout/h2w_headset.kl \
  system/usr/keylayout/hero-keypad.kl


