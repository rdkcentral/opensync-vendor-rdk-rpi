#If not stated otherwise in this file or this component's LICENSE
#file the following copyright and licenses apply:
#
#Copyright [2020] [RDK Management]
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.
RDK_TARGETS = RDKB raspberrypi4-rdk-broadband raspberrypi4-rdk-extender raspberrypi-rdk-broadband raspberrypi4-64-rdk-broadband

ifneq ($(filter $(TARGET),$(RDK_TARGETS)),)

OS_TARGETS += $(RDK_TARGETS)
VENDOR = rpi

#BACKHAUL_SSID = "we.piranha"

CONTROLLER_PROTO = ssl
CONTROLLER_PORT = 443
CONTROLLER_HOST = "wildfire.plume.tech"

VERSION_NO_BUILDNUM = 1
VERSION_NO_SHA1 = 1
VERSION_NO_PROFILE = 1

#ifeq ($(RDK_MACHINE),$(filter $(RDK_MACHINE),raspberrypi4-rdk-broadband raspberrypi4-rdk-extender))

RDK_OEM = rpi
RDK_MODEL = rpi

SERVICE_PROVIDERS = ALL
export IMAGE_DEPLOYMENT_PROFILE = $(OPENSYNC_SERVICE_PROVIDER_SUFFIX)

ifeq ($(TARGET),$(filter $(TARGET),RDKB raspberrypi4-rdk-extender))
KCONFIG_TARGET ?= vendor/$(VENDOR)/kconfig/RDK_EXTENDER
RDK_CFLAGS  += -DTURRIS_POD
else
KCONFIG_TARGET ?= vendor/$(VENDOR)/kconfig/RDK
endif

RDK_CFLAGS  += -Wno-absolute-value

#else
#$(error Unsupported RDK_MACHINE ($(RDK_MACHINE)).)
#endif

endif
