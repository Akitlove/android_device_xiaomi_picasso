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

# Lunch banner maintainer variable
RISING_MAINTAINER="Akitlove"

# Chipset/Maintainer properties (ro.rising.chipset/ro.rising.maintainer)
# Set RISING_MAINTAINER for version control
# (Optional if builder is setting properties via init_<device>.cpp)
PRODUCT_BUILD_PROP_OVERRIDES += \
    RisingChipset="Redmi K30 5G" \
    RisingMaintainer="Akitlove"

RISING_MAINTAINER := Akitlove

# Disable/enable blur support, false by default
TARGET_ENABLE_BLUR := true

# Whether to ship aperture camera, false by default
PRODUCT_NO_CAMERA := false

# Whether to ship lawnchair launcher, false by default
TARGET_PREBUILT_LAWNCHAIR_LAUNCHER := true

# CORE build flags
WITH_GMS := true
TARGET_USES_PICO_GAPPS := true

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="picasso-user 12 SKQ1.211006.001 V13.0.5.0.SGICNXM release-keys" \
    BuildFingerprint=Redmi/picasso/picasso:12/SKQ1.211006.001/V13.0.5.0.SGICNXM:user/release-keys


# Inherit from dolby
$(call inherit-product-if-exists, vendor/sony/dolby/sony-dolby-vendor.mk)

# Inherit from Leica camera
$(call inherit-product-if-exists, vendor/xiaomi/picasso-leicacamera/leica-camera-vendor.mk)
