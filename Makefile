ARCHS = arm64 arm64e
TARGET = iphone:clang:13.3:13.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FuckDonalds
FINALPACKAGE = 1
FuckDonalds_FILES = Tweak.xm
FuckDonalds_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 com.mcdonalds.mobileapp; open com.mcdonalds.mobileapp"