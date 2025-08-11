include $(TOPDIR)/rules.mk

PKG_NAME:=s12-pro-signald
PKG_VERSION:=1.5
PKG_RELEASE:=1

PKG_MAINTAINER:=Raskan <raskan23@gmail.com>
PKG_LICENSE:=GPL-3.0

include $(INCLUDE_DIR)/package.mk

define Package/s12-pro-signald
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=S12 Pro Signal Strength LED Service
  DEPENDS:=+sms-tool
endef

define Package/s12-pro-signald/description
  A service to monitor modem signal strength (CSQ) and display it via 5 LEDs.
endef

define Build/Configure
  # no configure step needed
endef

define Build/Compile
  # no compile step needed
endef

define Package/s12-pro-signald/install
	# Init script
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/s12-pro-signald.init $(1)/etc/init.d/s12-pro-signald

	# Executable scripts
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) ./files/s12-pro-signald $(1)/sbin/s12-pro-signald
	$(INSTALL_BIN) ./files/update_s12_leds $(1)/sbin/update_s12_leds

	# Config file (not executable)
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/s12-pro-signald.config $(1)/etc/config/s12-pro-signald

	# UCI defaults script (needs execute)
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/uci-defaults-s12-pro-signald $(1)/etc/uci-defaults/99-s12-pro-signald

	# Safety: force all non-config files to 0755
	find $(1) -type f ! -path '*/etc/config/*' -exec chmod 0755 {} \;
	# Safety: force all config files to 0644
	if [ -d "$(1)/etc/config" ]; then find $(1)/etc/config -type f -exec chmod 0644 {} \;; fi
endef

define Package/s12-pro-signald/postinst
#!/bin/sh
set -e
if [ "$$1" = "configure" ]; then
	/etc/init.d/s12-pro-signald enable
	/etc/init.d/s12-pro-signald start
fi
exit 0
endef

$(eval $(call BuildPackage,s12-pro-signald))
