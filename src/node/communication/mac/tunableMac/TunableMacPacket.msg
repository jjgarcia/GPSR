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
#include "MacPacket_m.h"
}}

class MacPacket;

enum TunableMacFrameTypeDef {
	DATA_FRAME = 1;
	BEACON_FRAME = 2;
}

packet TunableMacPacket extends MacPacket {
	int frameType enum (TunableMacFrameTypeDef);	//1 byte
	int source;		//4 bytes
	int destination;	//4 bytes
}

