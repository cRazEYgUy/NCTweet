ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest

include theos/makefiles/common.mk

TWEAK_NAME = NCTweet
NCTweet_FILES = Tweak.xm
NCTweet_FRAMEWORKS = UIKit Social

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += nctweet
include $(THEOS_MAKE_PATH)/aggregate.mk
