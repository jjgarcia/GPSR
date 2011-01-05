/*******************************************************************************
 *  Copyright: National ICT Australia,  2007 - 2010                            *
 *  Developed at the ATP lab, Networked Systems research theme                 *
 *  Author(s): Athanassios Boulis, Dimosthenis Pediaditakis, Yuriy Tselishchev *
 *  This file is distributed under the terms in the attached LICENSE file.     *
 *  If you do not find this file, copies can be found by writing to:           *
 *                                                                             *
 *      NICTA, Locked Bag 9013, Alexandria, NSW 1435, Australia                *
 *      Attention:  License Inquiry.                                           *
 *                                                                             *  
 *******************************************************************************/

#include "GpsrRouting.h"


Define_Module(GpsrRouting);


void GpsrRouting::startup()
{
	trace()<<"GPSR ---> startup function";

	interBeaconTimerInterval = ((double)par("INTER_BEACON_T")) / 1000.0;	// convert msecs to secs   par("INTER_BEACON_T");
	setTimer(INTER_BEACON_SEND, interBeaconTimerInterval);

	//Get current node's location directly calling public methods of the MObility manager module!
	cModule *parentModuleTest = getParentModule();
	VirtualMobilityManager *mobilityModule;

	if (parentModuleTest->getParentModule()->findSubmodule("MobilityManager") != -1) {
		mobilityModule = check_and_cast <VirtualMobilityManager*>(parentModuleTest->getParentModule()->getSubmodule("MobilityManager"));
		NodeLocation_type testNodeLocation;
		testNodeLocation = mobilityModule->getLocation();	
		trace() << "GPSR ---> Node Location[x,y]:"<<"["<< testNodeLocation.x << ";"<< testNodeLocation.y<<"]" ;
	}
	else
	{
		trace() << "GPSR ---> Unable to obtain node's location";
	}	
}



void GpsrRouting::timerFiredCallback(int timer)
{
	switch (timer) {

		case INTER_BEACON_SEND:{			
			sendBeacon();
			double randomVar= dblrand();
			setTimer(INTER_BEACON_SEND, randomVar*interBeaconTimerInterval+interBeaconTimerInterval);
			trace() << "GPSR: ---> INTER_BEACON_T timer, Node [" << SELF_NETWORK_ADDRESS << "], rand=" <<randomVar;
			break;
		}

		default:{
			trace() << "WARNING: unknown timer callback " << timer;
		}
	}
}

void GpsrRouting::sendBeacon()
{
	GpsrBeaconPacket *setupPkt = new GpsrBeaconPacket("GPSR Beacon routing packet", NETWORK_LAYER_PACKET);
	setupPkt->setGpsrRoutingControlMessageKind(BEACON_PACKET);
	setupPkt->setTTL(1);
	setupPkt->setSource(SELF_NETWORK_ADDRESS);
	setupPkt->setDestination(BROADCAST_NETWORK_ADDRESS);

	node_position_t nodeLocationObject = getNodeLocation ();
	setupPkt->setSource_X_Coordinate(nodeLocationObject.x);
	setupPkt->setSource_Y_Coordinate(nodeLocationObject.y);

	toMacLayer(setupPkt, BROADCAST_MAC_ADDRESS);
}

node_position_t GpsrRouting::getNodeLocation()
{
	cModule *parentModuleTest = getParentModule();
	VirtualMobilityManager *mobilityModule;
	node_position_t np;

	if (parentModuleTest->getParentModule()->findSubmodule("MobilityManager") != -1) {
		mobilityModule = check_and_cast <VirtualMobilityManager*>(parentModuleTest->getParentModule()->getSubmodule("MobilityManager"));
		NodeLocation_type testNodeLocation;
		testNodeLocation = mobilityModule->getLocation();
		np.x = testNodeLocation.x;
		np.y = testNodeLocation.y;
	
		return (np);
	}
	else
	{
		np.x = NULL;
		np.y = NULL;
		return (np);
	}//*/

}

bool GpsrRouting::LOC (double dstX, double dstY){
	node_position_t myLocation = getNodeLocation();

	if ((myLocation.x==dstX)&&(myLocation.y==dstY)){
		return true;
	}else{
		return false;
	}
}


//Application layer sends a packet together with a network layer address 'destination'
//Network layer is responsible to route that packet by selecting an appropriate MAC address
//to forward that packet to. We will encapsulate the received packet into a network packet
//and use BROADCAST_MAC_ADDRESS for all transmissions since this module does no routing
//NOTE: function toMacLayer requires second argument (a MAC address) if first argument is a packet
void GpsrRouting::fromApplicationLayer(cPacket * pkt, const char *destination)
{
	node_position_t destPosition;//getNodePosition(string nodeAddr)

	trace()<<"GPSR---> Packet from app layer:Node dest address" << destination;
	GpsrRoutingPacket *netPacket = new GpsrRoutingPacket("GpsrRouting packet", NETWORK_LAYER_PACKET);
	//NETWORK_LAYER_PACKET is a generic Castalia message kind to identify network layer packets

	netPacket->setSource(SELF_NETWORK_ADDRESS);
	netPacket->setDestination(destination);

	// Set source node location
	node_position_t nodeLocationObject = getNodeLocation ();
	netPacket->setSource_X_Coordinate(nodeLocationObject.x);
	netPacket->setSource_Y_Coordinate(nodeLocationObject.y);
	netPacket->setMode(GREEDY_MODE);
	netPacket->setTTL(par("GPSR_DATA_PACKET_TTL"));    //Set arbitrarly - Network depth definition	

	
        // One of the assumptions for this mechanism is that a source node by any mechanism knows the location destination, so this info is put directly in the packet.
	// Actually, we are initially enabling sending data only to Coord, which will be only at [0.0]

	netPacket->setDestination_X_Coordinate(0);
	netPacket->setDestination_Y_Coordinate(0);
	encapsulatePacket(netPacket, pkt);
	toMacLayer(netPacket, resolveNetworkAddress(destination));


        /*destPosition = getNeighPosition(destination);
	if (destPosition.find){		
		netPacket->setDestination_X_Coordinate(destPosition.x);
		netPacket->setDestination_Y_Coordinate(destPosition.y);
		trace()<<"GPSR--->fromApplicationLayer DestinationPos " <<destination<<": "<<"["<<destPosition.x<<";"<<destPosition.y<<"]";

		encapsulatePacket(netPacket, pkt);
		toMacLayer(netPacket, resolveNetworkAddress(destination));
	}else{
		trace()<<"GPSR--->fromApplicationLayer NO Destination Pos found";

		encapsulatePacket(netPacket, pkt);
		toMacLayer(netPacket, BROADCAST_MAC_ADDRESS);
	}//*/

}

//MAC layer sends a packet up to network also providing source MAC address 
//which will allow network module to create a routing table.
//Here we dont check what source MAC address is, just filter incoming packets 
//by network addresses
//NOTE: use of dynamic_cast is similar to that in BypassMacModule
void GpsrRouting::fromMacLayer(cPacket * pkt, int srcMacAddress, double rssi, double lqi)
{	
	//Network data packet	
	Node nextHopAddr;
	GpsrRoutingPacket *netPacket = dynamic_cast <GpsrRoutingPacket*>(pkt);
	int gotTTL;

	if (netPacket) {
		string destination = netPacket->getDestination();
		string sourcePacketID(netPacket->getSource());
		
		if (destination.compare(SELF_NETWORK_ADDRESS) == 0)	
		{
			// We are not filtering packets that are sent to this node directly or to 
			// broadcast network address, making application layer responsible for them
			std::ostringstream ss;
			ss<<lqi;			
			trace()<<"GPSR----> GpsrRouting::fromMacLayer - Packet received from:"<<destination<<"source: "<<sourcePacketID<<" "<<";RSSI:"<<ss.str();
			toApplicationLayer(decapsulatePacket(pkt));
		}
	     	else if ((destination.compare(SELF_NETWORK_ADDRESS) != 0)&&(netPacket->getTTL()>0))
		{		

			string destAddr = netPacket->getDestination();
			nextHopAddr = routeMsg(netPacket);

			if (nextHopAddr.find){
				GpsrRoutingPacket *dupPacket = netPacket->dup();

				dupPacket->setDestination_X_Coordinate(nextHopAddr.x);
				dupPacket->setDestination_Y_Coordinate(nextHopAddr.y);
				dupPacket->setMode(GREEDY_MODE);
				gotTTL= (netPacket->getTTL())-1;

				trace()<<"GPSR----> fromMacLayer: Packet received with destination address: "<< dupPacket->getDestination()<<"Dest Pos got: ["<<nextHopAddr.x<<";"<<nextHopAddr.y <<"] - Updated TTL:"<<gotTTL;

				dupPacket->setTTL(gotTTL);
				toMacLayer(dupPacket, resolveNetworkAddress(dupPacket->getDestination()));
			}else{
				trace()<<"GPSR----> discard packet!!!!";	
			}

		}
	}

	//Beacon packet
	GpsrBeaconPacket *beaPacket = dynamic_cast <GpsrBeaconPacket*>(pkt);
	if (beaPacket) {
		string sourceBeaPacketID(beaPacket->getSource());
		trace()<<"GPSR----> BeaconPacket received from:"<<sourceBeaPacketID;	

		updateRouteTable(beaPacket);
	}

}//fromMacLayer

void GpsrRouting::updateRouteTable(GpsrBeaconPacket *beaPacket)
{
	double neighX,neighY;
	string neighSourceAddress;
	bool find=false;

	neighSourceAddress = beaPacket->getSource();
	neighX=beaPacket->getSource_X_Coordinate();
	neighY=beaPacket->getSource_Y_Coordinate();

	list<Node>::iterator it;
	

	trace()<<"GPSR ---> Updating route Table";

	for(it = routeTable.begin(); it != routeTable.end(); it++){

		if((it->addr == neighSourceAddress)&&(it->find==true)){
		      it->x = neighX;
		      it->y = neighY;
		      it->watchDog = maxWatchDog;
		      find = true;
	              trace()<<"GPSR ---> RouteTable entry updated- Node ["<<SELF_NETWORK_ADDRESS<<"]: ["<<neighSourceAddress<<";"<<neighX<<";"<<neighY<<"]";
		      break;
		}
	}

 	if(!find){		
		Node node;
		node.addr = neighSourceAddress;
		node.x = neighX;
		node.y = neighY;
		node.watchDog = maxWatchDog;
		node.find=true;
		routeTable.push_back(node);

		// insert the node to planarizedTable
		planarizedTable.push_back(node);
		planarizedGraph();
		trace()<<"GPSR ---> Node added to route table - Node ["<<SELF_NETWORK_ADDRESS<<"]: ["<<neighSourceAddress<<";"<<neighX<<";"<<neighY<<"]";
	}
}//updateRouteTable



void GpsrRouting::planarizedGraph()
{
	list<Node>::iterator v;
	list<Node>::iterator w;
	list<Node>::iterator i;

	Node self;			// the node of myself

	node_position_t nodeLocationObject = getNodeLocation();
	self.x = nodeLocationObject.x;
	self.y = nodeLocationObject.y;

	// make the graph RNG
	for(v = planarizedTable.begin(); v != planarizedTable.end(); ){
		list<Node>::iterator tmp = v;
		tmp ++;
		for(w = planarizedTable.begin(); w != planarizedTable.end(); w++){
			if( v == w ) continue;
			else{
			      if(NODE_DISTANCE(&self,v) > max( NODE_DISTANCE(w,&self), NODE_DISTANCE(w,v)) ){
				//	   delete the self,v edge
				planarizedTable.erase(v);
				break;
			      }
			}
		}
	v = tmp;
	}

	trace()<<"GPSR ---> Graph planarizeed.";
	// make the graph GG

}//planarizedGraph


///--------------------------------------------------------   Routing Functions --------------------------------------------------------------------

//Get node's position from node's network address.
node_position_t  GpsrRouting::getNeighPosition(string nodeAddr){	
	double neighX,neighY;
	bool find=false;
	node_position_t np;
	list<Node>::iterator it;

	Node destNodeObject;

	//trace()<<"GPSR ---> getNeighPosition:"<< nodeAddr;

	for(it = routeTable.begin(); it != routeTable.end(); it++){

		if(it->addr == nodeAddr){
		      neighX=it->x;
		      neighY=it->y;
		      find = true;
		      break;
		}
	}

 	if(find){		
		np.x= neighX;
		np.y= neighY;
		np.find=true;
		return np;
	}
	else{
		//Greedy forward that packet !!
	

		np.x = NULL;
		np.y = NULL;
		np.find=false;
		return (np);		
	}
}//getNodePosition


// route the msg to the next hop
// return the next hop's address
Node GpsrRouting::routeMsg(GpsrRoutingPacket *pkt)
{

	string destAddr = pkt->getDestination();trace()<<"GPSR ---> routeMsg: DestAdd -"<<destAddr; 
	
	double dstX = pkt->getDestination_X_Coordinate();trace()<<"GPSR ---> routeMsg: X -"<<dstX; 
	double dstY = pkt->getDestination_Y_Coordinate();trace()<<"GPSR ---> routeMsg: Y -"<<dstY; 
	
	int mode = pkt->getMode();

	GpsrRoutingPacket * netPacketForward = pkt;
	
	//int macAddr;
	list<Node>::iterator it;
	//bool find=false;
	Node destNodeObject;


	if(mode == GREEDY_MODE){
		trace()<<"GPSR ---> routeMsg: GreedyMode";

		Node nHopAddr;
		nHopAddr = greedyForwarding(destAddr,dstX,dstY);//NOOOOOOOOOOO 

		//Look up in my neigh table, if the dest addr is my neigh get its location and then greedy forward


			if(nHopAddr.nextHopAddr != SELF_NETWORK_ADDRESS){ // can greedy forwarding
				//sendtoNextHop(netPacketForward,nHopAddr);
				destNodeObject.find = true;
				destNodeObject.nextHopAddr=nHopAddr.nextHopAddr;
				destNodeObject.x=nHopAddr.x;
				destNodeObject.y=nHopAddr.y;

				trace()<<"GPSR ---> routeMsg:GreedyMode X -"<< destNodeObject.x; 
				trace()<<"GPSR ---> routeMsg:GreedyMode Y -"<< destNodeObject.y; 
				return destNodeObject;
		        } else {
				string nHopAddr = enterPerimeterMode(netPacketForward);
				//sendtoNextHop(netPacketForward,nHopAddr);
				destNodeObject.find = true;
				destNodeObject.nextHopAddr=nHopAddr;
				return destNodeObject;
			}
	}
	else if ((mode= PERIMETER_MODE)){
	
	}
	else {
		trace()<<"GPSR ---> WRONG ROUTING MODE 2";	
		//discard packet
		destNodeObject.find = false;
		return (destNodeObject);	
	}//*/

}

Node GpsrRouting::greedyForwarding(string destAddr, double destx,double desty)
{
	string nextHopAddr;
	list<Node>::iterator it,who;
	int meToDest;
	int minDistance;
	double varDestX, varDestY;
	Node destNodeObject;

	node_position_t myLocation = getNodeLocation();

	for(it = routeTable.begin(); it != routeTable.end(); it++){
		if((it->addr == destAddr)){
		      varDestX = it->x;trace()<<"varDestX "<<varDestX;
		      varDestY = it->y;	trace()<<"GPSR - varDesty"<< varDestY;	     
		      break;
		}
	}

	destNodeObject.x=varDestX;
	destNodeObject.y=varDestY;
	destNodeObject.nextHopAddr=destAddr;


	meToDest = DISTANCE(myLocation.x,myLocation.y,destx,desty);
	if(meToDest == 0){
		destNodeObject.nextHopAddr=SELF_NETWORK_ADDRESS;
		return destNodeObject;
	}
	minDistance = meToDest;
	trace()<<"minDistance obtained: "<<minDistance;
	for(it = routeTable.begin(); it != routeTable.end(); it ++){
		int tmpDistance;
		tmpDistance= DISTANCE(it->x,it->y,destx,desty);
		if(tmpDistance <= minDistance){
		minDistance = tmpDistance;
		
		destNodeObject.nextHopAddr = it->addr;
		destNodeObject.x=it->x;
		destNodeObject.y=it->y;
		}
	}
	return destNodeObject;
}


void GpsrRouting::sendtoNextHop(GpsrRoutingPacket *pkt, string nextHopAddr)
{
  char   dstAddr;

  char * cstr, *p;
  string str = nextHopAddr; 

  cstr = new char [str.size()+1];
  strcpy (cstr, str.c_str());

  GpsrRoutingPacket *netPacket = pkt;

  netPacket->setDestination(cstr);//this is important, is dest address not reset, the next router will drop the packet, that is why packet only route twice at first
  trace()<< "GpsrRouting::sendtoNextHop: "<< netPacket->getDestination();
  //toMacLayer(netPacket, resolveNetworkAddress(netPacket->getDestination())); //THIS IS CAUSING PROBLEMS DUE TO THE NETPACKET ARGUMENT PASS ??? CHECK
}




string GpsrRouting::enterPerimeterMode(GpsrRoutingPacket *pkt)
{/*
  pkt->setLpAddr(myNetwAddr);
  pkt->setLfAddr(myNetwAddr);
  pkt->setMode(PERIMETER_MODE);
  int destx = GETX(pkt->getDestAddr());
  int desty = GETY(pkt->getDestAddr());
  int nextHop = perimeterForwarding(destx,desty);
  pkt->setE0vectex1(myNetwAddr);
  pkt->setE0vectex2(nextHop);
  return nextHop;//*/
return NULL;
}



int GpsrRouting::perimeterForwarding(int destx,int desty)
{/*
  list<Node>::iterator it;
  int nextHop = -1000000;
  int maxMul = -1000000;

  int sdx = destx - x;
  int sdy = desty - y;		// ŒÆËã×ÔÒÑµœÄ¿µÄµÄÏòÁ¿

  int snx,sny;			// ÁÚœÚµãµœ×ÔŒºµÄÏòÁ¿
  for(it = planarizedTable.begin(); it != planarizedTable.end(); it ++){
    snx = it->x - x;
    sny = it->y - y;
    // ŒÆËãÏòÁ¿µÄ²æ»ý,È¡²æ»ý×îŽóµÄ
    // ÒªžúÏòÁ¿µÄµã»ýÇø·Ö¿ªÀŽ
    int tmp = snx * sdy - sny * sdx;
    if(tmp > maxMul){
      maxMul = tmp;
      nextHop = it->addr;
    }
  }
  return nextHop;//*/
return 0;
}






