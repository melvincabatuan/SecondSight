LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

OPENCV_LIB_TYPE:=STATIC
OPENCV_INSTALL_MODULES:=on

include /home/cobalt/Android/OpenCV-android-sdk/sdk/native/jni/OpenCV.mk

LOCAL_MODULE := SecondSight
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_LDLIBS := -lstdc++
LOCAL_LDLIBS += -llog
LOCAL_LDLIBS += -lz

ifneq ($(TARGET_ARCH_ABI), arm64-v8a)
    ifneq ($(TARGET_ARCH_ABI), armeabi)
        LOCAL_STATIC_LIBRARIES += tbb
    endif
endif
LOCAL_SRC_FILES := SecondSightJNI.cpp
LOCAL_SRC_FILES += RecolorCMVFilter.cpp
LOCAL_SRC_FILES += RecolorRCFilter.cpp
LOCAL_SRC_FILES += RecolorRGVFilter.cpp
LOCAL_SRC_FILES += StrokeEdgesFilter.cpp
LOCAL_SRC_FILES += ImageDetectionFilter.cpp
include $(BUILD_SHARED_LIBRARY)
