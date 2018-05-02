THEOS_DEVICE_IP=10.0.1.72

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = LotoSerialNumber
LotoSerialNumber_FILES = Tweak.xm
#LotoSerialNumber_FRAMEWORKS = IOKit
#LotoSerialNumber_LIBRARIES = MobileGestalt
LotoSerialNumber_LDFLAGS =   -lz -L. -v -force_load ./libcapstone.a
LotoSerialNumber_PRIVATE_FRAMEWORKS = IOKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard & killall -9 Preferences & killall -9 configd & killall -9 fairplayd.H1 & killall -9 absd & killall -9 gamed & killall -9 adid & killall -9 itunesstored & killall -9 storebookkeeperd & killall -9 AppStore & killall -9 accountsd"