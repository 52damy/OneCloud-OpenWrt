#
# Copyright (C) 2009 OpenWrt.org
#

ARCH:=arm
# BOARD:=meson
# BOARDNAME:=Meson
FEATURES+=fpu usb rtc
SUBTARGET:=m8b
BOARDNAME:=Meson8b based boards
# HOST_CFLAGS +=-pthread
# ARCH_PACKAGES:=HOST_CFLAGS
CPU_TYPE:=cortex-a5
CPU_SUBTYPE:=neon-vfpv4

KERNELNAME:=zImage dtbs

define Target/Description
	Build firmware images for Meson8b based boards.
endef
