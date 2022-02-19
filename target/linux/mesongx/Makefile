#
# Copyright (C) 2017-2019 Stijn Tintel <stijn@linux-ipv6.be>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk


BOARD:=mesongx
BOARDNAME:=Amlogic
# CPU_TYPE:=cortex-a53
DEVICE_TYPE:=other
FEATURES:=boot-part ext4
SUBTARGETS=m8b
MAINTAINER:=onecloud

KERNEL_PATCHVER:=5.10

define Target/Description
	Build firmware image for Amlogic S805 SoC devices.
endef

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += 
#	e2fsprogs \
#	mkf2fs \
#	partx-utils

KERNELNAME:=zImage dtbs

$(eval $(call BuildTarget))
