/*******************************************************************************
 *  Copyright: National ICT Australia,  2007 - 2010                            *
 *  Developed at the ATP lab, Networked Systems research theme                 *
 *  Author(s): Athanassios Boulis, Dimosthenis PedisendBeaconaditakis, Yuriy Tselishchev *
 *  This file is distributed under the terms in the attached LICENSE file.     *
 *  If you do not find this file, copies can be found by writing to:           *
 *                                                                             *
 *      NICTA, Locked Bag 9013, Alexandria, NSW 1435, Australia                *
 *      Attention:  License Inquiry.                                           *
 *                                                                             *  
 *******************************************************************************/

#ifndef _GPSRROUTING_H_
#define _GPSRROUTING_H_

#include <sstream>
#include <string>
#include <omnetpp.h>
#include <iostream>


#include "VirtualRouting.h"
#include "VirtualMobilityManager.h"

#include "GpsrRoutingPacket_m.h"
#include "GpsrBeaconPacket_m.h"



using namespace std;

struct Node
{
  string addr;
  double x;  // x coordinate
  double y;  // y coordinate
  int watchDog;
  string nextHopAddr;
  bool find;
};

enum gpsrStates {
	INTER_BEACON_SEND = 1,
};

typedef struct {
	double x;
	double y;
	bool find;
} node_position_t;


class GpsrRouting: public VirtualRouting {

private:
	double interBeaconTimerInterval;

protected:
	std::list<Node> routeTable;
	std::list<Node> planarizedTable;
	int maxWatchDog;	

	void fromApplicationLayer(cPacket *, const char *);
	void fromMacLayer(cPacket *, int, double, double);



	//  --------------   GPSR functions declaration  -----------------------------------
	#define DISTANCE(x1,y1,x2,y2) (((x1)-(x2))*((x1)-(x2))+ ((y1)-(y2))*((y1)-(y2)))
	#define NODE_DISTANCE(sta,end) DISTANCE((sta)->x,(sta)->y,(end)->x,(end)->y)

	void startup();
	void sendBeacon();		//send beacon packet
	void timerFiredCallback(int);
	node_position_t getNodeLocation();
	void updateRouteTable(GpsrBeaconPacket *);
	void planarizedGraph();
	bool LOC (double, double);

	node_position_t getNeighPosition(string);

	Node routeMsg(GpsrRoutingPacket *);//string, double, double, double, double, int);
	void sendtoNextHop(GpsrRoutingPacket *, string);
	string enterPerimeterMode(GpsrRoutingPacket *);
	int perimeterForwarding(int, int);
	Node greedyForwarding(string,double,double);

};

#endif				//BYPASSROUTINGMODULE
