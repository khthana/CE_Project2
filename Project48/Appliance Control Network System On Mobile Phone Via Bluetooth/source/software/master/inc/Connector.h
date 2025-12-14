/*
* ============================================================================
*  Name     : CConnector from Connector.h
*  Part of  : BluetoothPMPExample
*  Created  : 14.01.2004 by Forum Nokia
*  Description:
*     Declares connector for application
*  Version  :
*  Copyright: Nokia Corporation
* ============================================================================
*/

#ifndef CONNECTOR_H
#define CONNECTOR_H

// INCLUDES
#include <e32base.h>

#include <es_sock.h>
#include <btdevice.h>
#include <bt_sock.h>


class MConnectorObserver
{

public:
/*!
 * HandleConnectorDataReceivedL()
 *
 * discussion Observer interface for handling connector data reception event.
 */	
	virtual void HandleConnectorDataReceivedL(THostName aName, TDesC& aData)=0;
};


class CConnector : public CActive
{
public:
     
/*!
 * NewL()
 * 
 * discussion Create new CConnector object
 * return a pointer to the created instance of CConnector
 */
	static CConnector* NewL(MConnectorObserver *aObserver, 
						    RSocketServ *aSocketServ);
		
/*!
 * NewLC()
 * 
 */
	static CConnector* NewLC(MConnectorObserver *aObserver, 
						     RSocketServ *aSocketServ);

/*!
 * ~CConnector()
 *
 * discussion Destroy the object and release all memory objects
 */
	~CConnector();

/*!
 * ConnectL()
 *
 * discussion Creates a connection to given remote address on given port.
 *
 * param aName the name of the slave to connect to.
 * param aAddr the address of the slave to connect to.
 * param aPort the port on slave to connect to.
 *
 * return the status of connection attempt
 */
	TRequestStatus ConnectL(THostName aName, TBTDevAddr aAddr, TInt aPort);

/*!
 * DisconnectL()
 *
 * discussion Disconnects connector from slave.
 */
	void DisconnectL();

/*!
 * SendDataL()
 *
 * discussion Sends given data to slave.
 *
 * param aData the message to send to slave.
 */
	void SendDataL(const TDesC8& /*aData*/);

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
 * CConnector()
 *
 * discussion Perform the first phase of two phase construction 
 *
 * param aObserver reference to observer handling the connector events
 * param aSocketServ reference to socket server
 */
	CConnector(MConnectorObserver *aObserver, RSocketServ *aSocketServ);

/*!
 * ConstructL()
 *
 */
	void ConstructL();

/*!
 * HandleConnectedDataReceivedL()
 *
 * discussion Handles the data received from a slave.  the handling request
 * will be passed onto handling observer.
 *
 * param aName the name of the slave that sent the data.
 * param aData the data received.
 */
	void HandleConnectorDataReceivedL(THostName aName, TDesC& aData);

/*!
 * WaitAndReceiveL()
 *
 * discussion Wait for and receive data from slave.
 */
	void WaitAndReceiveL();
	
public:	// data

	// name of the device connector connects
	THostName iName;
	// address of the device connector connects
	TBTDevAddr iAddr;
	// port of the device connector connects
	TInt iPort;
	// connecting socket
	RSocket iSock;
	// buffer holding received data
	TBuf8<40> iBuffer;
	// length of received data
    TSockXfrLength iLen;
	// reference to observer
	MConnectorObserver* iObserver;
	// socket server handle
    RSocketServ *iSocketServ;	
	// the state of the connector
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
