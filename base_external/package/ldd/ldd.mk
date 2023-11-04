
##############################################################
#
# LDD
#
##############################################################

LDD_VERSION=origin/main
LDD_SITE =git@github.com:SamueleColmi/ldd-assignments.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = ./misc-modules ./scull

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(TARGET_DIR)/etc/ldd/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/etc/ldd/module_load
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/etc/ldd/module_unload
	$(INSTALL) -m 0755 $(@D)/scull/scull.init $(TARGET_DIR)/etc/ldd/scull.init
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/etc/ldd/scull_load
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/etc/ldd/scull_unload
endef

$(eval $(kernel-module))
$(eval $(generic-package))
