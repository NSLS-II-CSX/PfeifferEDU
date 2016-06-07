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

## Load record instances
dbLoadRecords("db/PfeifferEDU_TC110.db","Sys=XF:23ID1-VA,Dev={Dif:LoadLck-TMP:1},ID=001,PORT=PUMP1,SCAN=2 second")
dbLoadRecords("db/PfeifferEDU_TC110.db","Sys=XF:23ID1-VA,Dev={Dif-TMP:2},ID=001,PORT=PUMP2,SCAN=2 second")

iocInit()

dbl > records.dbl
