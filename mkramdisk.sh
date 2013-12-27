#!/bin/bash
#
# Custom ramdisk script for the Samsung Galaxy Player 4.2 (EU/US)
# Jonathan Grundmann, androthan@gmail.com, 2013
#
# Script gets executed by mkbootimg.mk.

###HUGO_PROJECT###

pushd out/target/product/hugo/root/
find . | cpio -o -H newc | gzip > ../bootstrap/ramdisk-cyanogenmod.cpio.gz
popd

pushd out/target/product/hugo/recovery/root/
find . | cpio -o -H newc | gzip > ../../bootstrap/ramdisk-recovery.cpio.gz
popd

pushd out/target/product/hugo/bootstrap/
find . | cpio -o -H newc | gzip > ../combined-ramdisk.cpio.gz
popd

exit 0

###END###
