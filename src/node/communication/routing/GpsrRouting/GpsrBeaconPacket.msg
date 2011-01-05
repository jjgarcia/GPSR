//****************************************************************************
//*  Copyright: National ICT Australia,  2007 - 2010                         *
//*  Developed at the ATP lab, Networked Systems research theme              *
//*  Author(s): Yuriy Tselishchev                                            *
//*  This file is distributed under the terms in the attached LICENSE file.  *
//*  If you do not find this file, copies can be found by writing to:        *
//*                                                                          *
//*      NICTA, Locked Bag 9013, Alexandria, NSW 1435, Australia             *
//*      Attention:  License Inquiry.                                        *
//*                                                                          *  
//****************************************************************************/

cplusplus {{
#include "RoutingPacket_m.h"
}}

enum gpsrBeaconPacketType{
	BEACON_PACKET   = 1;
	GREEDY_SOLICIT  = 2;
};

class RoutingPacket;

packet GpsrBeaconPacket extends RoutingPacket {
	
	int gpsrRoutingControlMessageKind enum (gpsrBeaconPacketType);
	int TTL;

	string	source;
	string  destination;

	double  source_X_Coordinate;
	double  source_Y_Coordinate;

}

