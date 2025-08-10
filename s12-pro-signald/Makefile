include $(TOPDIR)/rules.mk

PKG_NAME:=s12-pro-signald
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_MAINTAINER:=YourName <your@email.com>
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

define Package/s12-pro-signald/conffiles
/etc/config/s12-pro-signald
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/s12-pro-signald/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/s12-pro-signald.init $(1)/etc/init.d/s12-pro-signald

	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) ./files/s12-pro-signald $(1)/sbin/
	$(INSTALL_BIN) ./files/update_s12_leds $(1)/sbin/

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/s12-pro-signald.config $(1)/etc/config/s12-pro-signald
endef

$(eval $(call BuildPackage,s12-pro-signald))
