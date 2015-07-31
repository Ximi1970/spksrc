GCC_VER = 52
SPK_NAME = toolchain-gcc$(GCC_VER)
SPK_VERS = 5.2.0
SPK_REV = 1
SPK_ICON = src/toolchain.png

DEPENDS = cross/$(SPK_NAME)

MAINTAINER = SynoCommunity \(Ximi1970\)
DESCRIPTION = Gcc 5.2 toolchain.
RELOAD_UI = no
DISPLAY_NAME = Gcc 5.2 toolchain. 
STARTABLE = no

HOMEPAGE   = https://github.com/SynoCommunity/spksrc
LICENSE    = GNU GPL

INSTALLER_SCRIPT = src/installer.sh
SSS_SCRIPT       = src/dsm-control.sh
ADDITIONAL_SCRIPTS = 

INSTALL_PREFIX = /usr/local/$(SPK_NAME)

ARCHITECTURES = $(x64_ARCHES) $(x86_ARCHES) 88f6281


PRE_DEPEND_TARGET = myPreDepend
PRE_STRIP_TARGET = myPreStrip


%-gcc51:
	@echo "Recursive build. Exiting."
	@exit 1


include ../../mk/spksrc.spk.mk


define \n


endef

ALL_ARCHES = $(ARM_ARCHES) $(PPC_ARCHES) $(x86_ARCHES) $(x64_ARCHES)
ifneq ($(findstring $(ARCH),$(x64_ARCHES)),)
$(info Found $(ARCH))
MAIN_MAKE_TOOLCHAIN_TARGET = x86_64-pc-linux-gnu
MAKE_TOOLCHAIN_TARGET = x86_64-pc-linux-gnu
else
ifneq ($(findstring $(ARCH),$(x86_ARCHES)),)
$(info Found $(ARCH))
MAIN_MAKE_TOOLCHAIN_TARGET = i686-pc-linux-gnu
MAKE_TOOLCHAIN_TARGET = i686-pc-linux-gnu
else
ifneq ($(findstring $(ARCH), 88f6281),)
$(info Found $(ARCH))
MAIN_MAKE_TOOLCHAIN_TARGET = arm-marvell-linux-gnueabi
else
ifneq ($(findstring $(ARCH),$(ALL_ARCHES)),)
$(error ${\n}${\n}Architecture $(ARCH) not supported.${\n}${\n})
endif
endif
endif
endif

MAIN_MAKE_TOOLCHAIN_GCC_VER = $(GCC_VER)

MAKE = make MAKE_TOOLCHAIN_TARGET=$(MAIN_MAKE_TOOLCHAIN_TARGET) MAKE_TOOLCHAIN_GCC_VER=$(MAIN_MAKE_TOOLCHAIN_GCC_VER) 


DELETE_COOKIES = $(shell rm -f work-*-$(DEFAULT_TC)/.depend_done)
ifeq ($(DELETE_COOKIES),)
endif

clean-%:
	@ARCHES="$(ALL_ARCHES)" ; \
	if [ -z "$${ARCHES##*$**}" ] ; then \
		echo "Cleaning" $*-$(DEFAULT_TC) ; \
		rm -rf work-$*-$(DEFAULT_TC) ; \
		rm -rf ../../native/binutils/work-native/work-$*_gcc$(GCC_VER)-$(DEFAULT_TC) ; \
		rm -f ../../native/binutils/work-native/.*$*_gcc$(GCC_VER)-$(DEFAULT_TC)*_done ; \
		rm -rf ../../native/gcc$(GCC_VER)-bootstrap/work-native/work-$*-$(DEFAULT_TC) ; \
		rm -f ../../native/gcc$(GCC_VER)-bootstrap/work-native/.*$**_done ; \
		rm -rf ../../native/gcc$(GCC_VER)/work-native/work-$*-$(DEFAULT_TC) ; \
		rm -f ../../native/gcc$(GCC_VER)/work-native/.*$**_done ; \
		rm -rf ../../native/eglibc/work-native/work-$*_gcc$(GCC_VER)-$(DEFAULT_TC) ; \
		rm -rf ../../native/eglibc/work-native/install-$*_gcc$(GCC_VER)-$(DEFAULT_TC) ; \
		rm -f ../../native/eglibc/work-native/.*$*_gcc$(GCC_VER)-$(DEFAULT_TC)*_done ; \
		rm -rf ../../native/glibc/work-native/work-$*_gcc$(GCC_VER)-$(DEFAULT_TC) ; \
		rm -rf ../../native/glibc/work-native/install-$*_gcc$(GCC_VER)-$(DEFAULT_TC) ; \
		rm -f ../../native/glibc/work-native/.*$*_gcc$(GCC_VER)-$(DEFAULT_TC)*_done ; \
		rm -rf ../../native/toolchain-gcc$(GCC_VER)/work-native/work-$*-$(DEFAULT_TC) ; \
		rm -f ../../native/toolchain-gcc$(GCC_VER)/work-native/.*$**_done ; \
		rm -rf ../../toolchains/syno-$*_gcc$(GCC_VER)-$(DEFAULT_TC) ; \
	else \
		echo "Unknown architecture" ; \
	fi

clean-all-arch:
	@echo "Cleaning all toolchains" ; \
	rm -rf work-*-$(DEFAULT_TC) ; \
	rm -rf ../../native/$(SPK_NAME)/work-native ; \
	rm -rf ../../native/binutils/work-native ; \
	rm -rf ../../native/gcc$(GCC_VER)-bootstrap/work-native ; \
	rm -rf ../../native/gcc$(GCC_VER)/work-native ; \
	rm -rf ../../native/eglibc/work-native ; \
	rm -rf ../../native/glibc/work-native ; \
	rm -rf ../../native/toolchain-gcc$(GCC_VER)/work-native ; \
	rm -rf ../../toolchains/syno-*_gcc$(GCC_VER)-$(DEFAULT_TC)

.PHONY: myPreDepend
myPreDepend:
	@if [ "$(ARCH)" == "" ] ; then \
		echo "Architecture not set. Please run: make arch-<arch>." ; \
		exit 1 ; \
	fi ; \
	if [ "$(MAIN_MAKE_TOOLCHAIN_TARGET)" == "" ] ; then \
		echo ; \
		echo "Architecture not supported. Supported architectures: $(ARCHITECTURES)" ; \
		echo ; \
		exit 1 ; \
	fi ; \
	echo "Building toolchain for:" ; \
	echo "Architecture:" $(ARCH) ; \
	echo "Target:" $(MAIN_MAKE_TOOLCHAIN_TARGET) ; \
	echo "Gcc:" $(MAIN_MAKE_TOOLCHAIN_GCC_VER) ; \
	if [ ! -d  ../../toolchains/syno-$(ARCH)_gcc$(GCC_VER)-$(DEFAULT_TC) ] ; then \
		mkdir -p ../../toolchains/syno-$(ARCH)_gcc$(GCC_VER)-$(DEFAULT_TC) ; \
		pushd ../../toolchains/syno-$(ARCH)_gcc$(GCC_VER)-$(DEFAULT_TC) ; \
		rm -f Makefile ; \
		echo "TC_NAME = syno-$(ARCH)_gcc$(GCC_VER)-$(DEFAULT_TC)" > Makefile ; \
		echo >> Makefile ; \
		echo "TC_ARCH = $(TC_ARCH)" >> Makefile ; \
		echo "TC_VERS = $(DEFAULT_TC)" >> Makefile ; \
		echo "TC_FIRMWARE = $(TC_FIRMWARE)" >> Makefile ; \
		echo >> Makefile ; \
		echo "TC_DIST_NAME = toolchain-gcc$(GCC_VER)-1.0.0.zip" >> Makefile ; \
		echo >> Makefile ; \
		echo "TC_EXT = zip" >> Makefile ; \
		echo "TC_DIST_SITE = https://github.com/Ximi1970/spksrc-toolchain/archive" >> Makefile ; \
		echo >> Makefile ; \
		echo "TC_BASE_DIR = $(MAIN_MAKE_TOOLCHAIN_TARGET)" >> Makefile ; \
		echo "TC_PREFIX = $(MAIN_MAKE_TOOLCHAIN_TARGET)" >> Makefile ; \
		echo "TC_TARGET = $(MAIN_MAKE_TOOLCHAIN_TARGET)" >> Makefile ; \
		echo >> Makefile ; \
		echo "TC_CFLAGS =" >> Makefile ; \
		echo "TC_CPPFLAGS =" >> Makefile ; \
		echo "TC_CXXFLAGS =" >> Makefile ; \
		echo "TC_LDFLAGS =" >> Makefile ; \
		echo >> Makefile ; \
		echo "include ../../mk/spksrc.tc.mk" >> Makefile ; \
		popd ; \
	fi

.PHONY: myPreStrip
myPreStrip:
	$(eval STRIP := ../../toolchains/syno-$(ARCH)_gcc$(GCC_VER)-$(DEFAULT_TC)/work/$(MAIN_MAKE_TOOLCHAIN_TARGET)/bin/$(MAIN_MAKE_TOOLCHAIN_TARGET)-strip)
