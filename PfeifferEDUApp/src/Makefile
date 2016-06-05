TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = PfeifferEDU
# PfeifferEDU.dbd will be created and installed
DBD += PfeifferEDU.dbd

# PfeifferEDU.dbd will be made up from these files:
PfeifferEDU_DBD += base.dbd

# Include dbd files from all support applications:
PfeifferEDU_DBD += calcSupport.dbd
PfeifferEDU_DBD += asSupport.dbd
PfeifferEDU_DBD += busySupport.dbd
PfeifferEDU_DBD += stream.dbd
PfeifferEDU_DBD += asyn.dbd
PfeifferEDU_DBD += drvAsynIPPort.dbd
PfeifferEDU_DBD += system.dbd
PfeifferEDU_DBD += devIocStats.dbd
#PfeifferEDU_DBD += caPutLog.dbd

# Add all the support libraries needed by this IOC
PfeifferEDU_LIBS += autosave
PfeifferEDU_LIBS += calc
PfeifferEDU_LIBS += busy
PfeifferEDU_LIBS += stream
PfeifferEDU_LIBS += asyn
PfeifferEDU_LIBS += devIocStats
#PfeifferEDU_LIBS += caPutLog

# PfeifferEDU_registerRecordDeviceDriver.cpp derives from PfeifferEDU.dbd
PfeifferEDU_SRCS += PfeifferEDU_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
PfeifferEDU_SRCS_DEFAULT += PfeifferEDUMain.cpp
PfeifferEDU_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#PfeifferEDU_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
PfeifferEDU_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

