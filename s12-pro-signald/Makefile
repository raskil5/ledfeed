include $(TOPDIR)/rules.mk

PKG_NAME:=s12-pro-signald
PKG_VERSION:=1.3
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
	# Install init script
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/s12-pro-signald.init $(1)/etc/init.d/s12-pro-signald

	# Install executables
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) ./files/s12-pro-signald $(1)/sbin/s12-pro-signald
	$(INSTALL_BIN) ./files/update_s12_leds $(1)/sbin/update_s12_leds

	# Install config file
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/s12-pro-signald.config $(1)/etc/config/s12-pro-signald

	# Install uci-defaults script
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/uci-defaults-s12-pro-signald $(1)/etc/uci-defaults/99-s12-pro-signald

	# Final safety chmod - must be LAST
	find $(1) -type f \( -name s12-pro-signald -o -name update_s12_leds -o -name 99-s12-pro-signald \) -exec chmod 0755 {} \;
	find $(1)/etc/init.d -type f -name s12-pro-signald -exec chmod 0755 {} \;
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
