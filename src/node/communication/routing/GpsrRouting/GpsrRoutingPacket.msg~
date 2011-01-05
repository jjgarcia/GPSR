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


enum DATA_MSG_MODE{
	GREEDY_MODE = 1;		// greedy forwarding
	PERIMETER_MODE= 2;		// perimeter forwarding
};

class RoutingPacket;

packet GpsrRoutingPacket extends RoutingPacket {

	int TTL;

	string	source; //sourde and destination addresses
	string  destination;

	double  source_X_Coordinate;
	double  source_Y_Coordinate;

	double  destination_X_Coordinate;
	double  destination_Y_Coordinate;

	 double lpAddr;	// the location where greedy forwarding failed 
	 double lfAddr;

	unsigned long seqNum =  0; // sequence number
	int mode;

}

