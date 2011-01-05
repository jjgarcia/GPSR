#
# OMNeT++/OMNEST Makefile for CastaliaBin
#
# This file was generated with the command:
#  opp_makemake -f -r --deep -o CastaliaBin -u Cmdenv -P /home/jj/Castalia-3.0 -M debug -X Simulations -X out -X bin
#

# Name of target to be created (-o option)
TARGET = CastaliaBin$(EXE_SUFFIX)

# User interface (uncomment one) (-u option)
#USERIF_LIBS = $(ALL_ENV_LIBS) # that is, $(TKENV_LIBS) $(CMDENV_LIBS)
USERIF_LIBS = $(CMDENV_LIBS)
#USERIF_LIBS = $(TKENV_LIBS)

# C++ include paths (with -I)
INCLUDE_PATH = \
    -I. \
    -Isrc \
    -Isrc/helpStructures \
    -Isrc/node \
    -Isrc/node/application \
    -Isrc/node/application/bridgeTest \
    -Isrc/node/application/connectivityMap \
    -Isrc/node/application/simpleAggregation \
    -Isrc/node/application/throughputTest \
    -Isrc/node/application/valuePropagation \
    -Isrc/node/communication \
    -Isrc/node/communication/mac \
    -Isrc/node/communication/mac/baselineBanMac \
    -Isrc/node/communication/mac/bypassMac \
    -Isrc/node/communication/mac/mac802154 \
    -Isrc/node/communication/mac/tMac \
    -Isrc/node/communication/mac/tunableMac \
    -Isrc/node/communication/radio \
    -Isrc/node/communication/routing \
    -Isrc/node/communication/routing/bypassRouting \
    -Isrc/node/communication/routing/GpsrRouting \
    -Isrc/node/communication/routing/multipathRingsRouting \
    -Isrc/node/mobilityManager \
    -Isrc/node/mobilityManager/lineMobilityManager \
    -Isrc/node/mobilityManager/noMobilityManager \
    -Isrc/node/resourceManager \
    -Isrc/node/sensorManager \
    -Isrc/physicalProcess \
    -Isrc/physicalProcess/carsPhysicalProcess \
    -Isrc/physicalProcess/customizablePhysicalProcess \
    -Isrc/wirelessChannel

# Additional object and library files to link with
EXTRA_OBJS =

# Additional libraries (-L, -l options)
LIBS =

# Output directory
PROJECT_OUTPUT_DIR = out
PROJECTRELATIVE_PATH =
O = $(PROJECT_OUTPUT_DIR)/$(CONFIGNAME)/$(PROJECTRELATIVE_PATH)

# Object files for local .cc and .msg files
OBJS = \
    $O/src/helpStructures/CastaliaModule.o \
    $O/src/helpStructures/DebugInfoWriter.o \
    $O/src/helpStructures/TimerService.o \
    $O/src/node/application/VirtualApplication.o \
    $O/src/node/application/bridgeTest/BridgeTest.o \
    $O/src/node/application/connectivityMap/ConnectivityMap.o \
    $O/src/node/application/simpleAggregation/SimpleAggregation.o \
    $O/src/node/application/throughputTest/ThroughputTest.o \
    $O/src/node/application/valuePropagation/ValuePropagation.o \
    $O/src/node/communication/mac/VirtualMac.o \
    $O/src/node/communication/mac/baselineBanMac/BaselineBANMac.o \
    $O/src/node/communication/mac/bypassMac/BypassMAC.o \
    $O/src/node/communication/mac/mac802154/Mac802154.o \
    $O/src/node/communication/mac/tMac/TMAC.o \
    $O/src/node/communication/mac/tunableMac/TunableMAC.o \
    $O/src/node/communication/radio/Radio.o \
    $O/src/node/communication/radio/RadioSupportFunctions.o \
    $O/src/node/communication/routing/VirtualRouting.o \
    $O/src/node/communication/routing/bypassRouting/BypassRouting.o \
    $O/src/node/communication/routing/GpsrRouting/GpsrRouting.o \
    $O/src/node/communication/routing/multipathRingsRouting/MultipathRingsRouting.o \
    $O/src/node/mobilityManager/VirtualMobilityManager.o \
    $O/src/node/mobilityManager/lineMobilityManager/LineMobilityManager.o \
    $O/src/node/mobilityManager/noMobilityManager/NoMobilityManager.o \
    $O/src/node/resourceManager/ResourceManager.o \
    $O/src/node/sensorManager/SensorManager.o \
    $O/src/physicalProcess/carsPhysicalProcess/CarsPhysicalProcess.o \
    $O/src/physicalProcess/customizablePhysicalProcess/CustomizablePhysicalProcess.o \
    $O/src/wirelessChannel/WirelessChannel.o \
    $O/src/wirelessChannel/WirelessChannelTemporal.o \
    $O/src/helpStructures/TimerServiceMessage_m.o \
    $O/src/node/application/ApplicationPacket_m.o \
    $O/src/node/communication/mac/MacPacket_m.o \
    $O/src/node/communication/mac/baselineBanMac/BaselineMacPacket_m.o \
    $O/src/node/communication/mac/bypassMac/BypassMacPacket_m.o \
    $O/src/node/communication/mac/mac802154/Mac802154Packet_m.o \
    $O/src/node/communication/mac/tMac/TMacPacket_m.o \
    $O/src/node/communication/mac/tunableMac/TunableMacControl_m.o \
    $O/src/node/communication/mac/tunableMac/TunableMacPacket_m.o \
    $O/src/node/communication/radio/RadioControlMessage_m.o \
    $O/src/node/communication/routing/RoutingPacket_m.o \
    $O/src/node/communication/routing/bypassRouting/BypassRoutingPacket_m.o \
    $O/src/node/communication/routing/GpsrRouting/GpsrBeaconPacket_m.o \
    $O/src/node/communication/routing/GpsrRouting/GpsrRoutingPacket_m.o \
    $O/src/node/communication/routing/multipathRingsRouting/MultipathRingsRoutingControl_m.o \
    $O/src/node/communication/routing/multipathRingsRouting/MultipathRingsRoutingPacket_m.o \
    $O/src/node/mobilityManager/MobilityManagerMessage_m.o \
    $O/src/node/resourceManager/ResourceManagerMessage_m.o \
    $O/src/node/sensorManager/SensorManagerMessage_m.o \
    $O/src/physicalProcess/PhysicalProcessMessage_m.o \
    $O/src/wirelessChannel/WirelessChannelMessages_m.o

# Message files
MSGFILES = \
    src/helpStructures/TimerServiceMessage.msg \
    src/node/application/ApplicationPacket.msg \
    src/node/communication/mac/MacPacket.msg \
    src/node/communication/mac/baselineBanMac/BaselineMacPacket.msg \
    src/node/communication/mac/bypassMac/BypassMacPacket.msg \
    src/node/communication/mac/mac802154/Mac802154Packet.msg \
    src/node/communication/mac/tMac/TMacPacket.msg \
    src/node/communication/mac/tunableMac/TunableMacControl.msg \
    src/node/communication/mac/tunableMac/TunableMacPacket.msg \
    src/node/communication/radio/RadioControlMessage.msg \
    src/node/communication/routing/RoutingPacket.msg \
    src/node/communication/routing/bypassRouting/BypassRoutingPacket.msg \
    src/node/communication/routing/GpsrRouting/GpsrBeaconPacket.msg \
    src/node/communication/routing/GpsrRouting/GpsrRoutingPacket.msg \
    src/node/communication/routing/multipathRingsRouting/MultipathRingsRoutingControl.msg \
    src/node/communication/routing/multipathRingsRouting/MultipathRingsRoutingPacket.msg \
    src/node/mobilityManager/MobilityManagerMessage.msg \
    src/node/resourceManager/ResourceManagerMessage.msg \
    src/node/sensorManager/SensorManagerMessage.msg \
    src/physicalProcess/PhysicalProcessMessage.msg \
    src/wirelessChannel/WirelessChannelMessages.msg

# Default mode (-M option); can be overridden with make MODE=debug (or =release)
ifndef MODE
MODE = debug
endif

#------------------------------------------------------------------------------

# Pull in OMNeT++ configuration (Makefile.inc or configuser.vc)

ifneq ("$(OMNETPP_CONFIGFILE)","")
CONFIGFILE = $(OMNETPP_CONFIGFILE)
else
ifneq ("$(OMNETPP_ROOT)","")
CONFIGFILE = $(OMNETPP_ROOT)/Makefile.inc
else
CONFIGFILE = $(shell opp_configfilepath)
endif
endif

ifeq ("$(wildcard $(CONFIGFILE))","")
$(error Config file '$(CONFIGFILE)' does not exist -- add the OMNeT++ bin directory to the path so that opp_configfilepath can be found, or set the OMNETPP_CONFIGFILE variable to point to Makefile.inc)
endif

include $(CONFIGFILE)

# Simulation kernel and user interface libraries
OMNETPP_LIB_SUBDIR = $(OMNETPP_LIB_DIR)/$(TOOLCHAIN_NAME)
OMNETPP_LIBS = -L"$(OMNETPP_LIB_SUBDIR)" -L"$(OMNETPP_LIB_DIR)" $(USERIF_LIBS) $(KERNEL_LIBS) $(SYS_LIBS)

COPTS = $(CFLAGS)  $(INCLUDE_PATH) -I$(OMNETPP_INCL_DIR)
MSGCOPTS = $(INCLUDE_PATH)

#------------------------------------------------------------------------------
# User-supplied makefile fragment(s)
# >>>
# <<<
#------------------------------------------------------------------------------

# Main target
all: $(TARGET)

$(TARGET) : $O/$(TARGET)
	$(LN) $O/$(TARGET) .

$O/$(TARGET): $(OBJS)  $(wildcard $(EXTRA_OBJS)) Makefile
	@$(MKPATH) $O
	$(CXX) $(LDFLAGS) -o $O/$(TARGET)  $(OBJS) $(EXTRA_OBJS) $(WHOLE_ARCHIVE_ON) $(LIBS) $(WHOLE_ARCHIVE_OFF) $(OMNETPP_LIBS)

.PHONY:

.SUFFIXES: .cc

$O/%.o: %.cc
	@$(MKPATH) $(dir $@)
	$(CXX) -c $(COPTS) -o $@ $<

%_m.cc %_m.h: %.msg
	$(MSGC) -s _m.cc $(MSGCOPTS) $?

msgheaders: $(MSGFILES:.msg=_m.h)

clean:
	-rm -rf $O
	-rm -f CastaliaBin CastaliaBin.exe libCastaliaBin.so libCastaliaBin.a libCastaliaBin.dll libCastaliaBin.dylib
	-rm -f ./*_m.cc ./*_m.h
	-rm -f src/*_m.cc src/*_m.h
	-rm -f src/helpStructures/*_m.cc src/helpStructures/*_m.h
	-rm -f src/node/*_m.cc src/node/*_m.h
	-rm -f src/node/application/*_m.cc src/node/application/*_m.h
	-rm -f src/node/application/bridgeTest/*_m.cc src/node/application/bridgeTest/*_m.h
	-rm -f src/node/application/connectivityMap/*_m.cc src/node/application/connectivityMap/*_m.h
	-rm -f src/node/application/simpleAggregation/*_m.cc src/node/application/simpleAggregation/*_m.h
	-rm -f src/node/application/throughputTest/*_m.cc src/node/application/throughputTest/*_m.h
	-rm -f src/node/application/valuePropagation/*_m.cc src/node/application/valuePropagation/*_m.h
	-rm -f src/node/communication/*_m.cc src/node/communication/*_m.h
	-rm -f src/node/communication/mac/*_m.cc src/node/communication/mac/*_m.h
	-rm -f src/node/communication/mac/baselineBanMac/*_m.cc src/node/communication/mac/baselineBanMac/*_m.h
	-rm -f src/node/communication/mac/bypassMac/*_m.cc src/node/communication/mac/bypassMac/*_m.h
	-rm -f src/node/communication/mac/mac802154/*_m.cc src/node/communication/mac/mac802154/*_m.h
	-rm -f src/node/communication/mac/tMac/*_m.cc src/node/communication/mac/tMac/*_m.h
	-rm -f src/node/communication/mac/tunableMac/*_m.cc src/node/communication/mac/tunableMac/*_m.h
	-rm -f src/node/communication/radio/*_m.cc src/node/communication/radio/*_m.h
	-rm -f src/node/communication/routing/*_m.cc src/node/communication/routing/*_m.h
	-rm -f src/node/communication/routing/bypassRouting/*_m.cc src/node/communication/routing/bypassRouting/*_m.h
	-rm -f src/node/communication/routing/GpsrRouting/*_m.cc src/node/communication/routing/GpsrRouting/*_m.h
	-rm -f src/node/communication/routing/multipathRingsRouting/*_m.cc src/node/communication/routing/multipathRingsRouting/*_m.h
	-rm -f src/node/mobilityManager/*_m.cc src/node/mobilityManager/*_m.h
	-rm -f src/node/mobilityManager/lineMobilityManager/*_m.cc src/node/mobilityManager/lineMobilityManager/*_m.h
	-rm -f src/node/mobilityManager/noMobilityManager/*_m.cc src/node/mobilityManager/noMobilityManager/*_m.h
	-rm -f src/node/resourceManager/*_m.cc src/node/resourceManager/*_m.h
	-rm -f src/node/sensorManager/*_m.cc src/node/sensorManager/*_m.h
	-rm -f src/physicalProcess/*_m.cc src/physicalProcess/*_m.h
	-rm -f src/physicalProcess/carsPhysicalProcess/*_m.cc src/physicalProcess/carsPhysicalProcess/*_m.h
	-rm -f src/physicalProcess/customizablePhysicalProcess/*_m.cc src/physicalProcess/customizablePhysicalProcess/*_m.h
	-rm -f src/wirelessChannel/*_m.cc src/wirelessChannel/*_m.h

cleanall: clean
	-rm -rf $(PROJECT_OUTPUT_DIR)

depend:
	$(MAKEDEPEND) $(INCLUDE_PATH) -f Makefile -P\$$O/ -- $(MSG_CC_FILES)  ./*.cc src/*.cc src/helpStructures/*.cc src/node/*.cc src/node/application/*.cc src/node/application/bridgeTest/*.cc src/node/application/connectivityMap/*.cc src/node/application/simpleAggregation/*.cc src/node/application/throughputTest/*.cc src/node/application/valuePropagation/*.cc src/node/communication/*.cc src/node/communication/mac/*.cc src/node/communication/mac/baselineBanMac/*.cc src/node/communication/mac/bypassMac/*.cc src/node/communication/mac/mac802154/*.cc src/node/communication/mac/tMac/*.cc src/node/communication/mac/tunableMac/*.cc src/node/communication/radio/*.cc src/node/communication/routing/*.cc src/node/communication/routing/bypassRouting/*.cc src/node/communication/routing/GpsrRouting/*.cc src/node/communication/routing/multipathRingsRouting/*.cc src/node/mobilityManager/*.cc src/node/mobilityManager/lineMobilityManager/*.cc src/node/mobilityManager/noMobilityManager/*.cc src/node/resourceManager/*.cc src/node/sensorManager/*.cc src/physicalProcess/*.cc src/physicalProcess/carsPhysicalProcess/*.cc src/physicalProcess/customizablePhysicalProcess/*.cc src/wirelessChannel/*.cc

# DO NOT DELETE THIS LINE -- make depend depends on it.
$O/src/helpStructures/CastaliaModule.o: src/helpStructures/CastaliaModule.cc \
  src/helpStructures/CastaliaModule.h \
  src/node/resourceManager/ResourceManagerMessage_m.h \
  src/helpStructures/DebugInfoWriter.h \
  src/CastaliaMessages.h
$O/src/helpStructures/DebugInfoWriter.o: src/helpStructures/DebugInfoWriter.cc \
  src/helpStructures/DebugInfoWriter.h
$O/src/helpStructures/TimerService.o: src/helpStructures/TimerService.cc \
  src/helpStructures/TimerService.h \
  src/helpStructures/TimerServiceMessage_m.h \
  src/CastaliaMessages.h
$O/src/node/application/VirtualApplication.o: src/node/application/VirtualApplication.cc \
  src/node/resourceManager/ResourceManager.h \
  src/helpStructures/CastaliaModule.h \
  src/node/application/ApplicationPacket_m.h \
  src/node/sensorManager/SensorManagerMessage_m.h \
  src/node/application/VirtualApplication.h \
  src/helpStructures/TimerServiceMessage_m.h \
  src/node/communication/radio/Radio.h \
  src/CastaliaMessages.h \
  src/node/communication/mac/MacPacket_m.h \
  src/helpStructures/DebugInfoWriter.h \
  src/node/communication/radio/RadioSupportFunctions.h \
  src/node/communication/radio/RadioControlMessage_m.h \
  src/wirelessChannel/WirelessChannelMessages_m.h \
  src/helpStructures/TimerService.h \
  src/node/mobilityManager/VirtualMobilityManager.h \
  src/node/resourceManager/ResourceManagerMessage_m.h
$O/src/node/application/bridgeTest/BridgeTest.o: src/node/application/bridgeTest/BridgeTest.cc \
  src/node/resourceManager/ResourceManager.h \
  src/helpStructures/CastaliaModule.h \
  src/node/application/ApplicationPacket_m.h \
  src/node/application/VirtualApplication.h \
  src/node/sensorManager/SensorManagerMessage_m.h \
  src/node/application/bridgeTest/BridgeTest.h \
  src/helpStructures/TimerServiceMessage_m.h \
  src/CastaliaMessages.h \
  src/node/communication/radio/Radio.h \
  src/node/communication/mac/MacPacket_m.h \
  src/helpStructures/DebugInfoWriter.h \
  src/node/communication/radio/RadioSupportFunctions.h \
  src/helpStructures/TimerService.h \
  src/wirelessChannel/WirelessChannelMessages_m.h \
  src/node/communication/radio/RadioControlMessage_m.h \
  src/node/resourceManager/ResourceManagerMessage_m.h \
  src/node/mobilityManager/VirtualMobilityManager.h
$O/src/node/application/connectivityMap/ConnectivityMap.o: src/node/application/connectivityMap/ConnectivityMap.cc \
  src/node/resourceManager/ResourceManager.h \
  src/helpStructures/CastaliaModule.h \
  src/node/application/connectivityMap/ConnectivityMap.h \
  src/node/application/ApplicationPacket_m.h \
  src/node/application/VirtualApplication.h \
  src/node/sensorManager/SensorManagerMessage_m.h \
  src/helpStructures/TimerServiceMessage_m.h \
  src/CastaliaMessages.h \
  src/node/communication/radio/Radio.h \
  src/node/communication/mac/MacPacket_m.h \
  src/helpStructures/DebugInfoWriter.h \
  src/node/communication/radio/RadioSupportFunctions.h \
  src/node/communication/radio/RadioControlMessage_m.h \
  src/wirelessChannel/WirelessChannelMessages_m.h \
  src/helpStructures/TimerService.h \
  src/node/mobilityManager/VirtualMobilityManager.h \
  src/node/resourceManager/ResourceManagerMessage_m.h
$O/src/node/application/simpleAggregation/SimpleAggregation.o: src/node/application/simpleAggregation/SimpleAggregation.cc \
  src/node/resourceManager/ResourceManager.h \
  src/helpStructures/CastaliaModule.h \
  src/node/application/ApplicationPacket_m.h \
  src/node/application/VirtualApplication.h \
  src/node/sensorManager/SensorManagerMessage_m.h \
  src/helpStructures/TimerServiceMessage_m.h \
  src/CastaliaMessages.h \
  src/node/communication/radio/Radio.h \
  src/node/communication/mac/MacPacket_m.h \
  src/node/application/simpleAggregation/SimpleAggregation.h \
  src/helpStructures/DebugInfoWriter.h \
  src/node/communication/radio/RadioSupportFunctions.h \
  src/node/communication/radio/RadioControlMessage_m.h \
  src/wirelessChannel/WirelessChannelMessages_m.h \
  src/helpStructures/TimerService.h \
  src/node/mobilityManager/VirtualMobilityManager.h \
  src/node/resourceManager/ResourceManagerMessage_m.h
$O/src/node/application/throughputTest/ThroughputTest.o: src/node/application/throughputTest/ThroughputTest.cc \
  src/node/resourceManager/ResourceManager.h \
  src/helpStructures/CastaliaModule.h \
  src/node/application/ApplicationPacket_m.h \
  src/node/application/VirtualApplication.h \
  src/node/sensorManager/SensorManagerMessage_m.h \
  src/helpStructures/TimerServiceMessage_m.h \
  src/CastaliaMessages.h \
  src/node/communication/radio/Radio.h \
  src/node/communication/mac/MacPacket_m.h \
  src/helpStructures/DebugInfoWriter.h \
  src/node/communication/radio/RadioSupportFunctions.h \
  src/node/application/throughputTest/ThroughputTest.h \
  src/node/communication/radio/RadioControlMessage_m.h \
  src/wirelessChannel/WirelessChannelMessages_m.h \
  src/helpStructures/TimerService.h \
  src/node/mobilityManager/VirtualMobilityManager.h \
  src/node/resourceManager/ResourceManagerMessage_m.h
$O/src/node/application/valuePropagation/ValuePropagation.o: src/node/application/valuePropagation/ValuePropagation.cc \
  src/node/resourceManager/ResourceManager.h \
  src/helpStructures/CastaliaModule.h \
  src/node/application/ApplicationPacket_m.h \
  src/node/application/VirtualApplication.h \
  src/node/sensorManager/SensorManagerMessage_m.h \
  src/node/application/valuePropagation/ValuePropagation.h \
  src/helpStructures/TimerServiceMessage_m.h \
  src/CastaliaMessages.h \
  src/node/communication/radio/Radio.h \
  src/node/communication/mac/MacPacket_m.h \
  src/helpStructures/DebugInfoWriter.h \
  src/node/communication/radio/RadioSupportFunctions.h \
  src/node/communication/radio/RadioControlMessage_m.h \
  src/wirelessChannel/WirelessChannelMessages_m.h \
  src/helpStructures/TimerService.h \
  src/node/mobilityManager/VirtualMobilityManager.h \
  src/node/resourceManager/ResourceManagerMessage_m.h
$O/src/node/communication/mac/VirtualMac.o: src/node/communication/mac/VirtualMac.cc \
  src/node/resourceManager/ResourceManager.h \
  src/helpStructures/CastaliaModule.h \
  src/node/communication/mac/VirtualMac.h \
  src/node/communication/routing/RoutingPacket_m.h \
  src/helpStructures/TimerServiceMessage_m.h \
  src/node/communication/radio/Radio.h \
  src/CastaliaMessages.h \
  src/node/communication/mac/MacPacket_m.h \
  src/helpStructures/DebugInfoWriter.h \
  src/node/communication/radio/RadioSupportFunctions.h \
  src/node/communication/radio/RadioControlMessage_m.h \
  src/helpStructures/TimerService.h \
  src/wirelessChannel/WirelessChannelMessages_m.h \
  src/node/resourceManager/ResourceManagerMessage_m.h
$O/src/node/communication/mac/baselineBanMac/BaselineBANMac.o: src/node/communication/mac/baselineBanMac/BaselineBANMac.cc \
  src/node/resourceManager/ResourceManager.h \
  src/node/communication/mac/VirtualMac.h \
  src/helpStructures/CastaliaModule.h \
  src/node/communication/mac/baselineBanMac/BaselineBANMac.h \
  src/node/communication/routing/RoutingPacket_m.h \
  src/node/communication/mac/baselineBanMac/BaselineMacPacket_m.h \
  src/helpStructures/TimerServiceMessage_m.h \
  src/CastaliaMessages.h \
  src/node/communication/radio/Radio.h \
  src/node/communication/mac/MacPacket_m.h \
  src/helpStructures/DebugInfoWriter.h \
  src/node/communication/radio/RadioSupportFunctions.h \
  src/wirelessChannel/WirelessChannelMessages_m.h \
  src/helpStructures/TimerService.h \
  src/node/communication/radio/RadioControlMessage_m.h \
  src/node/resourceManager/ResourceManagerMessage_m.h
$O/src/node/communication/mac/bypassMac/BypassMAC.o: src/node/communication/mac/bypassMac/BypassMAC.cc \
  src/node/resourceManager/ResourceManager.h \
  src/node/communication/mac/VirtualMac.h \
  src/helpStructures/CastaliaModule.h \
  src/node/communication/routing/RoutingPacket_m.h \
  src/node/communication/mac/bypassMac/BypassMAC.h \
  src/helpStructures/TimerServiceMessage_m.h \
  src/CastaliaMessages.h \
  src/node/communication/radio/Radio.h \
  src/node/communication/mac/bypassMac/BypassMacPacket_m.h \
  src/node/communication/mac/MacPacket_m.h \
  src/helpStructures/DebugInfoWriter.h \
  src/node/communication/radio/RadioSupportFunctions.h \
  src/wirelessChannel/WirelessChannelMessages_m.h \
  src/helpStructures/TimerService.h \
  src/node/communication/radio/RadioControlMessage_m.h \
  src/node/resourceManager/ResourceManagerMessage_m.h
$O/src/node/communication/mac/mac802154/Mac802154.o: src/node/communication/mac/mac802154/Mac802154.cc \
  src/node/resourceManager/ResourceManager.h \
  src/node/communication/mac/mac802154/Mac802154.h \
  src/node/communication/mac/VirtualMac.h \
  src/helpStructures/CastaliaModule.h \
  src/node/communication/routing/RoutingPacket_m.h \
  src/helpStructures/TimerServiceMessage_m.h \
  src/CastaliaMessages.h \
  src/node/communication/radio/Radio.h \
  src/node/communication/mac/mac802154/Mac802154Packet_m.h \
  src/node/communication/mac/MacPacket_m.h \
  src/helpStructures/DebugInfoWriter.h \
  src/node/communication/radio/RadioSupportFunctions.h \
  src/wirelessChannel/WirelessChannelMessages_m.h \
  src/helpStructures/TimerService.h \
  src/node/communication/radio/RadioControlMessage_m.h \
  src/node/resourceManager/ResourceManagerMessage_m.h
$O/src/node/communication/mac/tMac/TMAC.o: src/node/communication/mac/tMac/TMAC.cc \
  src/node/resourceManager/ResourceManager.h \
  src/node/communication/mac/VirtualMac.h \
  src/helpStructures/CastaliaModule.h \
  src/node/communication/routing/RoutingPacket_m.h \
  src/helpStructures/TimerServiceMessage_m.h \
  src/CastaliaMessages.h \
  src/node/communication/radio/Radio.h \
  src/node/communication/mac/tMac/TMacPacket_m.h \
  src/node/communication/mac/MacPacket_m.h \
  src/helpStructures/DebugInfoWriter.h \
  src/node/communication/radio/RadioSupportFunctions.h \
  src/node/communication/mac/tMac/TMAC.h \
  src/wirelessChannel/WirelessChannelMessages_m.h \
  src/helpStructures/TimerService.h \
  src/node/communication/radio/RadioControlMessage_m.h \
  src/node/resourceManager/ResourceManagerMessage_m.h
$O/src/node/communication/mac/tunableMac/TunableMAC.o: src/node/communication/mac/tunableMac/TunableMAC.cc \
  src/node/resourceManager/ResourceManager.h \
  src/node/communication/mac/VirtualMac.h \
  src/helpStructures/CastaliaModule.h \
  src/node/communication/routing/RoutingPacket_m.h \
  src/helpStructures/TimerServiceMessage_m.h \
  src/CastaliaMessages.h \
  src/node/communication/radio/Radio.h \
  src/node/communication/mac/tunableMac/TunableMacPacket_m.h \
  src/node/communication/mac/MacPacket_m.h \
  src/node/communication/mac/tunableMac/TunableMAC.h \
  src/helpStructures/DebugInfoWriter.h \
  src/node/communication/radio/RadioSupportFunctions.h \
  src/wirelessChannel/WirelessChannelMessages_m.h \
  src/helpStructures/TimerService.h \
  src/node/communication/radio/RadioControlMessage_m.h \
  src/node/communication/mac/tunableMac/TunableMacControl_m.h \
  src/node/resourceManager/ResourceManagerMessage_m.h
$O/src/node/communication/radio/Radio.o: src/node/communication/radio/Radio.cc \
  src/node/resourceManager/ResourceManager.h \
  src/helpStructures/CastaliaModule.h \
  src/CastaliaMessages.h \
  src/node/communication/radio/Radio.h \
  src/node/communication/mac/MacPacket_m.h \
  src/helpStructures/DebugInfoWriter.h \
  src/node/communication/radio/RadioSupportFunctions.h \
  src/node/communication/radio/RadioControlMessage_m.h \
  src/wirelessChannel/WirelessChannelMessages_m.h \
  src/node/resourceManager/ResourceManagerMessage_m.h
$O/src/node/communication/radio/RadioSupportFunctions.o: src/node/communication/radio/RadioSupportFunctions.cc \
  src/CastaliaMessages.h \
  src/node/communication/radio/RadioSupportFunctions.h \
  src/node/communication/radio/RadioControlMessage_m.h
$O/src/node/communication/routing/VirtualRouting.o: src/node/communication/routing/VirtualRouting.cc \
  src/node/resourceManager/ResourceManager.h \
  src/helpStructures/CastaliaModule.h \
  src/node/application/ApplicationPacket_m.h \
  src/node/communication/routing/RoutingPacket_m.h \
  src/node/communication/routing/VirtualRouting.h \
  src/helpStructures/TimerServiceMessage_m.h \
  src/CastaliaMessages.h \
  src/node/communication/radio/Radio.h \
  src/node/communication/mac/MacPacket_m.h \
  src/helpStructures/DebugInfoWriter.h \
  src/node/communication/radio/RadioSupportFunctions.h \
  src/helpStructures/TimerService.h \
  src/wirelessChannel/WirelessChannelMessages_m.h \
  src/node/communication/radio/RadioControlMessage_m.h \
  src/node/resourceManager/ResourceManagerMessage_m.h
$O/src/node/communication/routing/bypassRouting/BypassRouting.o: src/node/communication/routing/bypassRouting/BypassRouting.cc \
  src/node/resourceManager/ResourceManager.h \
  src/helpStructures/CastaliaModule.h \
  src/node/communication/routing/bypassRouting/BypassRoutingPacket_m.h \
  src/node/application/ApplicationPacket_m.h \
  src/node/communication/routing/RoutingPacket_m.h \
  src/node/communication/routing/VirtualRouting.h \
  src/helpStructures/TimerServiceMessage_m.h \
  src/node/communication/radio/Radio.h \
  src/CastaliaMessages.h \
  src/node/communication/mac/MacPacket_m.h \
  src/node/communication/routing/bypassRouting/BypassRouting.h \
  src/helpStructures/DebugInfoWriter.h \
  src/node/communication/radio/RadioSupportFunctions.h \
  src/node/communication/radio/RadioControlMessage_m.h \
  src/wirelessChannel/WirelessChannelMessages_m.h \
  src/helpStructures/TimerService.h \
  src/node/resourceManager/ResourceManagerMessage_m.h
$O/src/node/communication/routing/GpsrRouting/GpsrRouting.o: src/node/communication/routing/GpsrRouting/GpsrRouting.cc \
  src/node/resourceManager/ResourceManager.h \
  src/helpStructures/CastaliaModule.h \
  src/node/application/ApplicationPacket_m.h \
  src/node/communication/routing/RoutingPacket_m.h \
  src/node/communication/routing/VirtualRouting.h \
  src/helpStructures/TimerServiceMessage_m.h \
  src/node/communication/radio/Radio.h \
  src/CastaliaMessages.h \
  src/node/communication/mac/MacPacket_m.h \
  src/node/communication/routing/GpsrRouting/GpsrRouting.h \
  src/node/communication/routing/GpsrRouting/GpsrRoutingPacket_m.h \
  src/helpStructures/DebugInfoWriter.h \
  src/node/communication/radio/RadioSupportFunctions.h \
  src/node/communication/routing/GpsrRouting/GpsrBeaconPacket_m.h \
  src/node/communication/radio/RadioControlMessage_m.h \
  src/wirelessChannel/WirelessChannelMessages_m.h \
  src/helpStructures/TimerService.h \
  src/node/mobilityManager/VirtualMobilityManager.h \
  src/node/resourceManager/ResourceManagerMessage_m.h
$O/src/node/communication/routing/multipathRingsRouting/MultipathRingsRouting.o: src/node/communication/routing/multipathRingsRouting/MultipathRingsRouting.cc \
  src/node/resourceManager/ResourceManager.h \
  src/helpStructures/CastaliaModule.h \
  src/node/application/ApplicationPacket_m.h \
  src/node/communication/routing/RoutingPacket_m.h \
  src/node/communication/routing/VirtualRouting.h \
  src/node/communication/routing/multipathRingsRouting/MultipathRingsRoutingPacket_m.h \
  src/helpStructures/TimerServiceMessage_m.h \
  src/node/communication/routing/multipathRingsRouting/MultipathRingsRouting.h \
  src/node/communication/radio/Radio.h \
  src/CastaliaMessages.h \
  src/node/communication/mac/MacPacket_m.h \
  src/node/communication/routing/multipathRingsRouting/MultipathRingsRoutingControl_m.h \
  src/helpStructures/DebugInfoWriter.h \
  src/node/communication/radio/RadioSupportFunctions.h \
  src/node/communication/radio/RadioControlMessage_m.h \
  src/wirelessChannel/WirelessChannelMessages_m.h \
  src/helpStructures/TimerService.h \
  src/node/resourceManager/ResourceManagerMessage_m.h
$O/src/node/mobilityManager/VirtualMobilityManager.o: src/node/mobilityManager/VirtualMobilityManager.cc \
  src/helpStructures/CastaliaModule.h \
  src/CastaliaMessages.h \
  src/helpStructures/DebugInfoWriter.h \
  src/wirelessChannel/WirelessChannelMessages_m.h \
  src/node/resourceManager/ResourceManagerMessage_m.h \
  src/node/mobilityManager/VirtualMobilityManager.h
$O/src/node/mobilityManager/lineMobilityManager/LineMobilityManager.o: src/node/mobilityManager/lineMobilityManager/LineMobilityManager.cc \
  src/helpStructures/CastaliaModule.h \
  src/node/mobilityManager/MobilityManagerMessage_m.h \
  src/CastaliaMessages.h \
  src/node/mobilityManager/lineMobilityManager/LineMobilityManager.h \
  src/helpStructures/DebugInfoWriter.h \
  src/wirelessChannel/WirelessChannelMessages_m.h \
  src/node/mobilityManager/VirtualMobilityManager.h \
  src/node/resourceManager/ResourceManagerMessage_m.h
$O/src/node/mobilityManager/noMobilityManager/NoMobilityManager.o: src/node/mobilityManager/noMobilityManager/NoMobilityManager.cc \
  src/helpStructures/CastaliaModule.h \
  src/CastaliaMessages.h \
  src/node/mobilityManager/noMobilityManager/NoMobilityManager.h \
  src/helpStructures/DebugInfoWriter.h \
  src/wirelessChannel/WirelessChannelMessages_m.h \
  src/node/mobilityManager/VirtualMobilityManager.h \
  src/node/resourceManager/ResourceManagerMessage_m.h
$O/src/node/resourceManager/ResourceManager.o: src/node/resourceManager/ResourceManager.cc \
  src/node/resourceManager/ResourceManager.h \
  src/helpStructures/CastaliaModule.h \
  src/CastaliaMessages.h \
  src/helpStructures/DebugInfoWriter.h \
  src/node/resourceManager/ResourceManagerMessage_m.h
$O/src/node/sensorManager/SensorManager.o: src/node/sensorManager/SensorManager.cc \
  src/helpStructures/CastaliaModule.h \
  src/node/sensorManager/SensorManagerMessage_m.h \
  src/physicalProcess/PhysicalProcessMessage_m.h \
  src/CastaliaMessages.h \
  src/node/sensorManager/SensorManager.h \
  src/helpStructures/DebugInfoWriter.h \
  src/wirelessChannel/WirelessChannelMessages_m.h \
  src/node/mobilityManager/VirtualMobilityManager.h \
  src/node/resourceManager/ResourceManagerMessage_m.h
$O/src/physicalProcess/carsPhysicalProcess/CarsPhysicalProcess.o: src/physicalProcess/carsPhysicalProcess/CarsPhysicalProcess.cc \
  src/helpStructures/CastaliaModule.h \
  src/physicalProcess/PhysicalProcessMessage_m.h \
  src/CastaliaMessages.h \
  src/helpStructures/DebugInfoWriter.h \
  src/node/resourceManager/ResourceManagerMessage_m.h \
  src/physicalProcess/carsPhysicalProcess/CarsPhysicalProcess.h
$O/src/physicalProcess/customizablePhysicalProcess/CustomizablePhysicalProcess.o: src/physicalProcess/customizablePhysicalProcess/CustomizablePhysicalProcess.cc \
  src/physicalProcess/customizablePhysicalProcess/CustomizablePhysicalProcess.h \
  src/helpStructures/CastaliaModule.h \
  src/physicalProcess/PhysicalProcessMessage_m.h \
  src/CastaliaMessages.h \
  src/helpStructures/DebugInfoWriter.h \
  src/node/resourceManager/ResourceManagerMessage_m.h
$O/src/wirelessChannel/WirelessChannel.o: src/wirelessChannel/WirelessChannel.cc \
  src/wirelessChannel/WirelessChannelTemporal.h \
  src/helpStructures/CastaliaModule.h \
  src/wirelessChannel/WirelessChannel.h \
  src/CastaliaMessages.h \
  src/helpStructures/DebugInfoWriter.h \
  src/wirelessChannel/WirelessChannelMessages_m.h \
  src/node/mobilityManager/VirtualMobilityManager.h \
  src/node/resourceManager/ResourceManagerMessage_m.h
$O/src/wirelessChannel/WirelessChannelTemporal.o: src/wirelessChannel/WirelessChannelTemporal.cc \
  src/wirelessChannel/WirelessChannelTemporal.h
