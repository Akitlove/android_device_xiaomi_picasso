#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from picasso device
$(call inherit-product, device/xiaomi/picasso/device.mk)

PRODUCT_NAME := lineage_picasso
PRODUCT_DEVICE := picasso
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi K30 5G

TARGET_DISABLE_EPPE := true
#Enable blur effects
TARGET_ENABLE_BLUR := true

# Camera information (multiple sensors supported)
AXION_CAMERA_REAR_INFO := 64/48,8,5,2
AXION_CAMERA_FRONT_INFO := 20

# Maintainer name (underscores become spaces in the UI)
AXION_MAINTAINER := Akitlove

# Processor name (underscores become spaces)
AXION_PROCESSOR := Snapdragon_765G_(7_nm)
PERF_GOV_SUPPORTED := false
PERF_DEFAULT_GOV := schedutil
PERF_ANIM_OVERRIDE := false

# GPU
GPU_FREQS_PATH := /sys/class/kgsl/kgsl-3d0/freq_table_mhz
GPU_MIN_FREQ_PATH := /sys/class/kgsl/kgsl-3d0/min_clock_mhz

# Charging
BYPASS_CHARGE_SUPPORTED := false

# High Brightness Mode (HBM)
HBM_SUPPORTED := false

# Flashlight strength
TORCH_STR_SUPPORTED := false

# doze fix
# for devices with doze/sensor related issues
TARGET_NEEDS_DOZE_FIX := false

# do not enable TARGET_IS_LOW_RAM if your device ram is greater than 4gb
# else OOM will most likely occur on operations where applications and camera can fill heap limit
# e.g uploading video/media on apps with camera preview
# this is a mitigation targets legacy devices 4gb below
# Using quicken is a trade-off: here we trade clean pages for dirty pages,
# extra cpu and battery. That's because the quicken files will be jit-ed in all
# the processes that load of shared apk and the code cache is not shared.
# Some notable apps that will be affected by this are gms and chrome.
TARGET_IS_LOW_RAM := false

# refresh rate list (optional) - defining this flags makes the controller skip the parsing of Display.Mode refresh rates
# for supported refresh rates. The refresh rate controller will also assume that all the defined refresh rates are "supported"
TARGET_SUPPORTED_REFRESH_RATES := 30,50,60,90,120
TARGET_TOUCH_BOOST_SUPPORTED := true

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="picasso-user 12 SKQ1.211006.001 V13.0.5.0.SGICNXM release-keys" \
    BuildFingerprint=Redmi/picasso/picasso:12/SKQ1.211006.001/V13.0.5.0.SGICNXM:user/release-keys


# Inherit from dolby
$(call inherit-product-if-exists, vendor/sony/dolby/sony-dolby-vendor.mk)

# Inherit from Leica camera
$(call inherit-product-if-exists, vendor/xiaomi/picasso-leicacamera/leica-camera-vendor.mk)
