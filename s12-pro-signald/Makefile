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
  PKGARCH:=all
endef

define Package/s12-pro-signald/description
  A service to monitor modem signal strength (CSQ) and display it via 5 LEDs.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/s12-pro-signald/prepare
	@echo "Preparing files..."
	$(CP) ./files/* $(PKG_BUILD_DIR)/
endef

define Package/s12-pro-signald/install
	# Create directories
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/uci-defaults

	# Install init script
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/s12-pro-signald.init $(1)/etc/init.d/s12-pro-signald

	# Install main executables with explicit permissions
	$(INSTALL_BIN) --mode=0755 $(PKG_BUILD_DIR)/s12-pro-signald $(1)/sbin/
	$(INSTALL_BIN) --mode=0755 $(PKG_BUILD_DIR)/update_s12_leds $(1)/sbin/

	# Install config file
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/s12-pro-signald.config $(1)/etc/config/s12-pro-signald

	# Handle uci-defaults file (both naming conventions)
	if [ -f "$(PKG_BUILD_DIR)/uci-defaults-s12-pro-signald" ]; then \
		$(INSTALL_BIN) --mode=0755 $(PKG_BUILD_DIR)/uci-defaults-s12-pro-signald $(1)/etc/uci-defaults/99-s12-pro-signald; \
	elif [ -f "$(PKG_BUILD_DIR)/99-s12-pro-signald" ]; then \
		$(INSTALL_BIN) --mode=0755 $(PKG_BUILD_DIR)/99-s12-pro-signald $(1)/etc/uci-defaults/; \
	fi
endef

define Package/s12-pro-signald/postinst
#!/bin/sh
if [ -z "$$IPKG_INSTROOT" ]; then
	# Ensure permissions are correct
	chmod 755 /sbin/s12-pro-signald /sbin/update_s12_leds >/dev/null 2>&1 || true
	chmod 755 /etc/uci-defaults/99-s12-pro-signald >/dev/null 2>&1 || true
	
	# Run uci-defaults first
	[ -x "/etc/uci-defaults/99-s12-pro-signald" ] && /etc/uci-defaults/99-s12-pro-signald
	
	# Enable and start service
	/etc/init.d/s12-pro-signald enable
	/etc/init.d/s12-pro-signald restart
fi
exit 0
endef

$(eval $(call BuildPackage,s12-pro-signald))
