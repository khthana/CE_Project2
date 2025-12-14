/*
* ============================================================================
*  Name     : CDeviceDiscoverer from DeviceDiscoverer.h
*  Part of  : BluetoothPMPExample
*  Created  : 14.01.2004 by Forum Nokia
*  Description:
*     Declares device discoverer for application
*  Version  :
*  Copyright: Nokia Corporation
* ============================================================================
*/

#ifndef DEVICEDISCOVERER_H
#define DEVICEDISCOVERER_H

// INCLUDES
#include <e32base.h>
#include <aknviewappui.h> 

#include <coecntrl.h>
#include <es_sock.h>
#include <btdevice.h>
#include <bt_sock.h>
#include <btsdp.h>

#include "Common.h"


class MDeviceDiscoObserver
{

public:
/*!
 * HandleDeviceDiscoveryCompleteL()
 *
 * discussion Observer interface for handling device discovery complete event.
 */	
	virtual void HandleDeviceDiscoveryCompleteL()=0;
};


class CDeviceDiscoverer : public CActive
{
public:
     
/*!
 * NewL()
 * 
 * discussion Create new CDeviceDiscoverer object
 * return a pointer to the created instance of CDeviceDiscoverer
 */
	static CDeviceDiscoverer* NewL(RSocketServ *aSocketServ,
		MDeviceDiscoObserver *aObserver);
		
/*!
 * NewLC()
 * 
 */
	static CDeviceDiscoverer* NewLC(RSocketServ *aSocketServ,
		MDeviceDiscoObserver *aObserver);

/*!
 * ~CDeviceDiscoverer()
 *
 * discussion Destroy the object and release all memory objects
 */
	~CDeviceDiscoverer();

/*!
 * DiscoverDevicesL()
 *
 * discussion Discovers remote bluetooth devices within range.
 *
 * param aDevDataList device data list where the found devices will be placed.
 */
	void DiscoverDevicesL(TDeviceDataList *aDevDataList);

/*!
 * HasDevices()
 *
 * discussion any devices discovered?
 *
 * return true if any devices were discovered.
 */
	TBool HasDevices();

/*!
 * HandleDeviceDiscoveryCompleteL()
 *
 * discussion Handles the device discovery completed event.  the handling 
 * request will be passed onto handling observer.
 */
	void HandleDeviceDiscoveryCompleteL();


protected:

/*!
 * RunL()
 *
 * discussion Handle the active objects request completion.
 */
	void RunL();

/*!
 * DoCancel()
 *
 * discussion Cancels the outstanding request on active object.
 */
	void DoCancel();


private:

/*!
 * CDeviceDiscoverer()
 *
 * discussion Perform the first phase of two phase construction 
 *
 * param aSocketServ reference to socket server
 */
	CDeviceDiscoverer(RSocketServ *aSocketServ,
		MDeviceDiscoObserver *aObserver);

/*!
 * ConstructL()
 *
 */
	void ConstructL();

public:	// data

	// socket server handle
    RSocketServ *iSocketServ;	
	// number of devices discovered
	TInt iDiscoveredDeviceCount;

private:

	// observer reference
	MDeviceDiscoObserver *iObserver;
	// device data list, to be filled by resolver results
	TDeviceDataList *iDevDataList;
	// host resolver
	RHostResolver iResolver;
	TInquirySockAddr iAddr;
	TNameEntry iEntry;

};

#endif