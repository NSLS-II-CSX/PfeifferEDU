#!../../bin/linux-x86_64/PfeifferEDU

< envPaths

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST", "NO")
epicsEnvSet("EPICS_CA_ADDR_LIST", "10.23.0.255")
epicsEnvSet("STREAM_PROTOCOL_PATH", "proto")

cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/PfeifferEDU.dbd",0,0)
PfeifferEDU_registerRecordDeviceDriver(pdbbase) 

drvAsynIPPortConfigure("PUMP1","10.23.2.63:4016",0,0,0)
#asynSetTraceMask("PUMP1", 0, 0x9)
#asynSetTraceIOMask("PUMP1", 0, 0x2)
drvAsynIPPortConfigure("PUMP2","10.23.2.63:4015",0,0,0)
#asynSetTraceMask("PUMP2", 0, 0x9)
#asynSetTraceIOMask("PUMP2", 0, 0x2)
drvAsynIPPortConfigure("PUMP3","10.23.2.65:4016",0,0,0)
#asynSetTraceMask("PUMP3", 0, 0x9)
#asynSetTraceIOMask("PUMP3", 0, 0x2)
drvAsynIPPortConfigure("PUMP4","10.23.2.65:4015",0,0,0)
#asynSetTraceMask("PUMP4", 0, 0x9)
#asynSetTraceIOMask("PUMP4", 0, 0x2)
drvAsynIPPortConfigure("PUMP5","10.23.2.63:4014",0,0,0)
#asynSetTraceMask("PUMP5", 0, 0x9)
#asynSetTraceIOMask("PUMP5", 0, 0x2)
drvAsynIPPortConfigure("PUMP6","10.23.2.63:4013",0,0,0)
#asynSetTraceMask("PUMP6", 0, 0x9)
#asynSetTraceIOMask("PUMP6", 0, 0x2)
drvAsynIPPortConfigure("PUMP7","10.23.2.65:4014",0,0,0)
#asynSetTraceMask("PUMP7", 0, 0x9)
#asynSetTraceIOMask("PUMP7", 0, 0x2)
drvAsynIPPortConfigure("PUMP8","10.23.2.65:4013",0,0,0)
#asynSetTraceMask("PUMP8", 0, 0x9)
#asynSetTraceIOMask("PUMP8", 0, 0x2)
drvAsynIPPortConfigure("PUMP9","10.23.2.65:4012",0,0,0)
#asynSetTraceMask("PUMP9", 0, 0x9)
#asynSetTraceIOMask("PUMP9", 0, 0x2)
drvAsynIPPortConfigure("PUMP10","10.23.2.65:4011",0,0,0)
#asynSetTraceMask("PUMP10", 0, 0x9)
#asynSetTraceIOMask("PUMP10", 0, 0x2)
drvAsynIPPortConfigure("PUMP11","10.23.2.65:4010",0,0,0)
#asynSetTraceMask("PUMP11", 0, 0x9)
#asynSetTraceIOMask("PUMP11", 0, 0x2)
drvAsynIPPortConfigure("PUMP12","10.23.2.65:4009",0,0,0)
#asynSetTraceMask("PUMP12", 0, 0x9)
#asynSetTraceIOMask("PUMP12", 0, 0x2)

## Load record instances
dbLoadRecords("db/PfeifferEDU_TC110.db","Sys=XF:23ID1-VA,Dev={Dif:LoadLck-TMP:1},ID=001,PORT=PUMP1,SCAN=1 second")
dbLoadRecords("db/PfeifferEDU_TC400.db","Sys=XF:23ID1-VA,Dev={Dif-TMP:2},ID=001,PORT=PUMP2,SCAN=1 second")
dbLoadRecords("db/PfeifferEDU_TC110.db","Sys=XF:23ID2-VA,Dev={IOXAS:LoadLck-TMP:1},ID=001,PORT=PUMP3,SCAN=1 second")
dbLoadRecords("db/PfeifferEDU_TC110.db","Sys=XF:23ID2-VA,Dev={APPES:LoadLck-TMP:1},ID=001,PORT=PUMP4,SCAN=1 second")
dbLoadRecords("db/PfeifferEDU_TC110.db","Sys=XF:23ID1-VA,Dev={Dif:Seal-TMP:1},ID=001,PORT=PUMP5,SCAN=1 second")
dbLoadRecords("db/PfeifferEDU_TC110.db","Sys=XF:23ID1-VA,Dev={Dif:Wdw-TMP:1},ID=001,PORT=PUMP6,SCAN=1 second")
dbLoadRecords("db/PfeifferEDU_TC400.db","Sys=XF:23ID2-VA,Dev={APPES-TMP:4},ID=001,PORT=PUMP7,SCAN=1 second")
dbLoadRecords("db/PfeifferEDU_TC400.db","Sys=XF:23ID2-VA,Dev={APPES-TMP:1},ID=001,PORT=PUMP8,SCAN=1 second")
dbLoadRecords("db/PfeifferEDU_TC400.db","Sys=XF:23ID2-VA,Dev={APPES-TMP:2},ID=001,PORT=PUMP9,SCAN=1 second")
dbLoadRecords("db/PfeifferEDU_TC400.db","Sys=XF:23ID2-VA,Dev={APPES-TMP:3},ID=001,PORT=PUMP10,SCAN=1 second")
dbLoadRecords("db/PfeifferEDU_TC110.db","Sys=XF:23ID2-VA,Dev={APPES-TMP:5},ID=001,PORT=PUMP11,SCAN=1 second")
dbLoadRecords("db/PfeifferEDU_TC110.db","Sys=XF:23ID2-VA,Dev={APPES-TMP:6},ID=001,PORT=PUMP12,SCAN=1 second")

asSetSubstitutions("WS=csxws1")
asSetFilename("/epics/xf/23id/xf23id.acf")

iocInit()

caPutLogInit("xf23id-ca.cs.nsls2.local:7004", 0)

dbl > $(TOP)/records.dbl
system("cp $(TOP)/records.dbl /cf-update/xf23id1-ioc3.es-pfeiffer.dbl")
