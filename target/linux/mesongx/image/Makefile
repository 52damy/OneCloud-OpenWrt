#
# Copyright (C) 2017-2019 Stijn Tintel <stijn@linux-ipv6.be>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

define Build/sdcard-img
	$(INSTALL_DIR) $(KDIR)/boot.ext4
	$(CP) $(KDIR)/boot.$1.scr $(KDIR)/boot.ext4/boot.scr
	$(CP) $(KDIR_KERNEL_IMAGE) $(KDIR)/boot.ext4/uImage
	$(foreach dts,$(DEVICE_DTS),$(CP) $(DTS_DIR)/$(dts).dtb $(KDIR)/boot.ext4/)
	PADDING="$(CONFIG_TARGET_IMAGES_PAD)" \
	PATH="$(TARGET_PATH)" \
	$(SCRIPT_DIR)/gen_image_generic.sh $@ \
		$(CONFIG_TARGET_KERNEL_PARTSIZE) $(KDIR)/boot.ext4/ \
		$(CONFIG_TARGET_ROOTFS_PARTSIZE) $(IMAGE_ROOTFS) 4096
#	$(RM) -rf $(KDIR)/boot.ext4
endef

define Build/uImage-meson
	$(call Build/uImage,none)
	mkimage -A arm -T script -C none -n "boot.scr uImage" -d boot.$1.txt $(KDIR)/boot.$1.scr
endef

### Devices ###
define Device/Default
  FILESYSTEMS := ext4 squashfs
  IMAGES := sdcard.img
  IMAGE/sdcard.img := sdcard-img $$(DEVICE_NAME)
  KERNEL_DEPENDS = $$(wildcard $(DTS_DIR)/$$(DEVICE_DTS).dts)
#  KERNEL_LOADADDR := 0x01080000
  KERNEL_LOADADDR := 0x00208000
  KERNEL_NAME := zImage
  PROFILES = Default $$(DEVICE_NAME)
endef

ifeq ($(SUBTARGET),m8b)

define Device/onecloud
  DEVICE_DTS := onecloud
### DEVICE_PACKAGES += odroid-firmware-c2 u-boot-odroid-c2
  DEVICE_TITLE := OneCloud
  KERNEL := kernel-bin | uImage-meson $$(DEVICE_NAME)
endef
TARGET_DEVICES += onecloud
endif

$(eval $(call BuildImage))
