/*
* ============================================================================
*  Name     : CBluetoothPMPExampleEngine from BluetoothPMPExampleEngine.h
*  Part of  : BluetoothPMPExample
*  Created  : 14.01.2004 by Forum Nokia
*  Description:
*     Declares container control for application.
*  Version  :
*  Copyright: Nokia Corporation
* ============================================================================
*/

#ifndef BLUETOOTHPMPEXAMPLEENGINE_H
#define BLUETOOTHPMPEXAMPLEENGINE_H

// INCLUDES
#include <e32base.h>
#include <aknviewappui.h> 

#include <coecntrl.h>
#include <es_sock.h>
#include <btdevice.h>
#include <bt_sock.h>
#include <btsdp.h>
#include <btmanclient.h> 


#include "BluetoothPMPExample.hrh"
#include "BluetoothPMPExampleContainer.h"	
#include "BluetoothPMPExampleAppUi.h"

#include "Common.h"
#include "DeviceDiscoverer.h"
#include "ServiceDiscoverer.h"
#include "Listener.h"
#include "Connector.h"

// maximum number of bluetooth device connections
const TInt KMaxConnectedDevices=7;

// length of label message buffer
const TInt KMsgLength = 384;

   
// FORWARD DECLARATIONS
class CBluetoothPMPExampleContainer;
class CDeviceDiscoverer;
class CServiceAdvertiser;
class CServiceDiscoverer;
class CListener;
class CConnector;


// CLASS DECLARATION

/**
*  CBluetoothPMPExampleEngine application engine class.
*  
*/
class CBluetoothPMPExampleEngine : public CBase, 
								   public MListenerObserver,
								   public MConnectorObserver,
								   public MDeviceDiscoObserver,
								   public MServiceDiscoObserver
{
public:
     
/*!
 * NewL()
 * 
 * discussion Create new CBluetoothPMPExampleEngine object
 * return a pointer to the created instance of CBluetoothPMPExampleEngine
 */
	static CBluetoothPMPExampleEngine* NewL(CBluetoothPMPExampleAppUi* 
		/* aAppUi */);
		
/*!
 * NewLC()
 * 
 */
	static CBluetoothPMPExampleEngine* NewLC(CBluetoothPMPExampleAppUi* 
		/* aAppUi */);

/*!
 * ~CBluetoothPMPExampleContainer()
 *
 * discussion Destroy the object and release all memory objects
 */
	~CBluetoothPMPExampleEngine();

public: // New functions

/*!
 * DiscoverDevicesL()
 *
 * discussion Discovers bluetooth devices within range.  the discovered 
 * devices will be displayed to user.
 */
	void DiscoverDevicesL();

/*!
 * StartServiceDiscovery()
 *
 * discussion Starts service discovery for services on remote devices.
 */
	void DiscoverServicesL();

/*!
 * StartSlaveL()
 *
 * discussion Starts the application in slave more.  the application will open
 * listening socket to listen to incoming connection request, and advertise
 * its services.
 */
	void StartSlaveL();

/*!
 * SendMessage()
 *
 * discussion Send a message to all connected slaves.  the user will be
 * prompted to enter the message text he/she wishes to send.
 */
	void SendMessage();

/*!
 * ConnectDevicesL()
 *
 * discussion Connects to the remote devices that were discovered to offer
 * the service we require.  
 */
	void ConnectDevicesL();

/*!
 * DisconnectDevicesL()
 *
 * discussion Disconnects from connected remote devices.
 */
	void DisconnectDevicesL();

/*!
 * ShowConnectedDevicesL()
 *
 * discussion Displays the connected remote devices.
 */
	void ShowConnectedDevicesL();

/*!
 * HandleListenerDataReceivedL()
 *
 * discussion Handles the data slave received from a master.
 *
 * param aData the data received.
 */
	void HandleListenerDataReceivedL(TDesC& aData);

/*!
 * HandleConnectedDataReceivedL()
 *
 * discussion Handles the data a master received from a slave.
 *
 * param aName the name of the slave that sent the data.
 * param aData the data received.
 */
	void HandleConnectorDataReceivedL(THostName aName, TDesC& aData);

/*!
 * HandleListenerConnectedL()
 *
 * discussion Handles the event of slave connection (slave was connected to
 * by master).  user will be notified of connection.
 */
	void HandleListenerConnectedL();

/*!
 * HandleListenerDisconnectedL()
 *
 * discussion Handles the event of slave disconnection, the master connection
 * to slave was terminated.  user will be notitied of disconnection.
 */
	void HandleListenerDisconnectedL();

/*!
 * HandleDeviceDiscoveryCompleteL()
 *
 * discussion Handles the event of device discovery completion.  the 
 * discovered devices will be displayed to user.
 */
	void HandleDeviceDiscoveryCompleteL();

/*!
 * HandleServiceDiscoveryCompleteL()
 *
 * discussion Handles the event of service discovery completion.  the 
 * discovered services will be displayed to user.
 */
	void HandleServiceDiscoveryCompleteL();

/*!
 * HasConnection()
 *
 * discussion Returns true if master has any slave connections.
 */
	TBool HasConnections();

	
private: // in-class methods

/*!
 * ShowMessageL()
 *
 * discussion Displays application messages for user on a label
 *
 * param aMsg text to be displayed
 * param aReset if true, the label will be cleared before displaying aMsg,
 *    if false, aMsg text will be appended to existing message on label
 */
	void ShowMessageL(const TDesC& /* aMsg */, TBool /* aReset=false */);


private: // Basic two-phase EPOC constructors

/*!
 * ConstructL()
 *
 */
    void ConstructL();

/*!
 * CBluetoothPMPExampleContainer()
 *
 * discussion Perform the first phase of two phase construction 
 */
    CBluetoothPMPExampleEngine(CBluetoothPMPExampleAppUi* /* aAppUi */);


public:		// data members
	// listener
	CListener* iListener;
	// device discoverer
	CDeviceDiscoverer* iDeviceDiscoverer;
	// service advertiser
	CServiceAdvertiser* iServiceAdvertiser;
	// service discoverer
	CServiceDiscoverer* iServiceDiscoverer;
	// true if the application is acting as a slave
	TBool iIsSlave;
	
private:	// data members        
	// application UI object reference
	CBluetoothPMPExampleAppUi* iAppUi;
	// socket server
	RSocketServ iSocketServ;
	// contains the messages shown on label
	TBuf<KMsgLength> iMsg;
	// number of lines in above
	TInt iMsgLines;
	// array holding the connectors
	CConnector *iConnectedDevices[KMaxConnectedDevices];
	// device data list reference
	TDeviceDataList iDevDataList;
	// number of slave connections master has
	TInt iConnectedDeviceCount;
	
};

#endif

// End of File
