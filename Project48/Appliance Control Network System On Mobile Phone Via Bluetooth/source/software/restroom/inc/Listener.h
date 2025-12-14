/*
* ============================================================================
*  Name     : CListener from Listener.h
*  Part of  : BluetoothPMPExample
*  Created  : 14.01.2004 by Forum Nokia
*  Description:
*     Declares listener for application
*  Version  :
*  Copyright: Nokia Corporation
* ============================================================================
*/

#ifndef LISTENER_H
#define LISTENER_H

// INCLUDES
#include <e32base.h>

#include <es_sock.h>
#include <btdevice.h>
#include <bt_sock.h>
#include <btmanclient.h>

#include "Common.h"


class MListenerObserver
{

public:
/*!
 * HandleListenerDataReceivedL()
 *
 * discussion Observer interface for handling listener data reception event.
 */	
	virtual void HandleListenerDataReceivedL(TDesC& aData)=0;
/*!
 * HandleListenerConnectedL()
 *
 * discussion Observer interface for handling listener connection event.
 */	
	virtual void HandleListenerConnectedL()=0;
/*!
 * HandleListenerDisconnectedL()
 *
 * discussion Observer interface for handling disconnection event.
 */	
	virtual void HandleListenerDisconnectedL()=0;
};


class CListener : public CActive
{
public:
     
/*!
 * NewL()
 * 
 * discussion Create new CListener object
 * return a pointer to the created instance of CListener
 */
	static CListener* NewL(MListenerObserver* aObserver,
		RSocketServ *aSocketServ);
		
/*!
 * NewLC()
 * 
 */
	static CListener* NewLC(MListenerObserver* aObserver,
		RSocketServ *aSocketServ);

/*!
 * ~CConnector()
 *
 * discussion Destroy the object and release all memory objects
 */
	~CListener();

/*!
 * StartListenerL()
 *
 * discussion Starts the listener.  listener will open a listening socket and
 * listen on incoming connections.
 *
 * return the communication channel (port) the listener listens to.
 */
	TInt StartListenerL();

/*!
 * StopListenerL()
 *
 * discussion Stops the listener, closes the listening socket.
 */
	void StopListenerL();

/*!
 * SendDataL()
 *
 * discussion Sends data to master.  user will be prompted to enter the 
 * message to send.  
 *
 * param aData the message to be send.
 */
	void SendDataL(const TDesC8& aData);

/*!
 * IsConnected()
 *
 * discussion check if listener is connected to.
 *
 * return true if listener has a connection from master.
 */
	TBool IsConnected();

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
 * CListener()
 *
 * discussion Perform the first phase of two phase construction 
 *
 * param aObserver reference to observer handling the listener events
 * param aSocketServ reference to socket server
 */
	CListener(MListenerObserver* aObserver, RSocketServ *aSocketServ);

/*!
 * ConstructL()
 *
 */
	void ConstructL();

/*!
 * ReceiveData()
 *
 * discussion Receive data from listening socket.
 */
	void ReceiveData();

/*!
 * SetSecurityL()
 *
 * discussion Sets the security of the bluetooth comm channel.
 */
	void SetSecurityL(TInt /*aChannel*/);

/*!
 * HandleListenerDataReceivedL()
 *
 * discussion Handles the data received from a master.  the handling request
 * will be passed onto handling observer.
 *
 * param aData the data received.
 */
	void HandleListenerDataReceivedL(TDesC& aData);

/*!
 * HandleListenerConnectedL()
 *
 * discussion Handles the event of slave connection (slave was connected to
 * by master).  the handling request will be passed onto handling observer.
 */
	void HandleListenerConnectedL();

/*!
 * HandleListenerDisconnectedL()
 *
 * discussion Handles the event of slave disconnection, the master connection
 * to slave was terminated.  the handling request will be passed onto handling
 * observer.
 */
	void HandleListenerDisconnectedL();

	
public:	// data

	// listening socket
	RSocket iListenSock;
	// accepted socket
	RSocket iSock;
	// length of received data
    TSockXfrLength iLen;
	// buffer holding received data
	TBuf8<40> iBuffer;
	// observer reference
	MListenerObserver* iObserver;
	// socket server handle
    RSocketServ *iSocketServ;	
	// listener connection status
	TBool iIsConnected;
	// the state of the listener
	enum TState
        {
        ENone = 1,
        EConnecting,
        EWaiting,
		ESending
        };
    TState iState;

};

#endif
