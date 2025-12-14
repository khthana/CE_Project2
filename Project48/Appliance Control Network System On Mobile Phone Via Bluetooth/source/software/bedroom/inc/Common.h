/*
* ============================================================================
*  Name     : Common.h
*  Part of  : BluetoothPMPExample
*  Created  : 14.01.2004 by Forum Nokia
*  Description:
*     Common definitions
*  Version  :
*  Copyright: Nokia Corporation
* ============================================================================
*/

#ifndef COMMON_H
#define COMMON_H

#include <e32base.h>
#include <es_sock.h>
#include <bttypes.h>

// structure that will hold the info about the remote device
struct TDeviceData
	{
	THostName iDeviceName;
	TBTDevAddr iDeviceAddr;
	TUint iDeviceServicePort;
	};

// for ease of use and clarity, the type definition for device data list
typedef RPointerArray<TDeviceData> TDeviceDataList;

// the service id that identifies our service.  this id will be 
// used when advertising the service and discovering the service.
#define KBT_serviceID 0x10ff

#endif

