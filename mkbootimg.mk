# Custom boot image script for the Samsung Galaxy Player 4.2 (EU/US)
# Jonathan Grundmann, androthan@gmail.com, 2013
#
# Script gets executed by make.

###HUGO_PROJECT###

LOCAL_PATH := $(call my-dir) 

COMBINED_RAMDISK := $(PRODUCT_OUT)/combined-ramdisk.cpio.gz
$(COMBINED_RAMDISK): $(INSTALLED_RAMDISK_TARGET) $(recovery_ramdisk) $(HOST_OUT)/bin/mkbootfs $(PRODUCT_OUT)/utilities/busybox
	$(call pretty,"Combined ramdisk: $@")
	cp -r device/samsung/hugo/bootstrap $(PRODUCT_OUT)
	cp -r device/samsung/hugo/mkramdisk.sh $(PRODUCT_OUT)
	./$(PRODUCT_OUT)/mkramdisk.sh

INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img
$(INSTALLED_BOOTIMAGE_TARGET): $(TARGET_PREBUILT_KERNEL) $(COMBINED_RAMDISK)
	$(call pretty,"Boot image: $@")
	./$(HOST_OUT)/bin/mkbootimg --kernel $(TARGET_PREBUILT_KERNEL) --ramdisk $(COMBINED_RAMDISK) --base $(BOARD_KERNEL_BASE) --pagesize $(BOARD_KERNEL_PAGESIZE) --ramdiskaddr 0x82800000 --output $@


$(INSTALLED_RECOVERYIMAGE_TARGET): $(INSTALLED_BOOTIMAGE_TARGET)
	$(ACP) $(INSTALLED_BOOTIMAGE_TARGET) $@

##END###
