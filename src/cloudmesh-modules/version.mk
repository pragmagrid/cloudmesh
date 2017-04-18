
PACKAGE     = cloudmesh
CATEGORY    = applications
NAME        = $(PACKAGE)-module
VERSION     = 1.0
RELEASE     = 0
PKGROOT     = /opt/modulefiles/$(CATEGORY)

ENVDIR = /opt/ENV
MODDIR = /usr/share/Modules/modulefiles

RPM.REQUIRES    = environment-modules
RPM.EXTRAS  = AutoReq:No

