include $(TOPDIR)/rules.mk

PKG_NAME:=s12-pro-signald
PKG_VERSION:=1.8
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
endef

define Build/Compile
endef

define Package/s12-pro-signald/install
	# Install init script
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/s12-pro-signald.init $(1)/etc/init.d/s12-pro-signald

	# Install executables
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) --mode=755 ./files/s12-pro-signald $(1)/sbin/
	$(INSTALL_BIN) --mode=755 ./files/update_s12_leds $(1)/sbin/

	# Install config file
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/s12-pro-signald.config $(1)/etc/config/s12-pro-signald

	# Install uci-defaults script (with filename conversion)
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) --mode=755 ./files/uci-defaults-s12-pro-signald $(1)/etc/uci-defaults/99-s12-pro-signald
endef

define Package/s12-pro-signald/postinst
#!/bin/sh
if [ -z "$$IPKG_INSTROOT" ]; then
	# Ensure permissions are correct
	chmod 755 /sbin/s12-pro-signald /sbin/update_s12_leds >/dev/null 2>&1 || true
	chmod 755 /etc/uci-defaults/99-s12-pro-signald >/dev/null 2>&1 || true
	
	# Enable and start service
	/etc/init.d/s12-pro-signald enable
	/etc/init.d/s12-pro-signald start
	
	# Run uci-defaults script
	/etc/uci-defaults/99-s12-pro-signald || true
fi
exit 0
endef

$(eval $(call BuildPackage,s12-pro-signald))
