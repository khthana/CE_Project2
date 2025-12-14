/*
* ============================================================================
*  Name     : CBluetoothPMPExampleAppUi from BluetoothPMPExampleAppUi.h
*  Part of  : BluetoothPMPExample
*  Created  : 14.01.2004 by Forum Nokia
*  Description:
*     Declares UI class for application.
*  Version  :
*  Copyright: Nokia Corporation
* ============================================================================
*/

#ifndef BLUETOOTHPMPEXAMPLEAPPUI_H
#define BLUETOOTHPMPEXAMPLEAPPUI_H

// INCLUDES
#include <eikapp.h>
#include <eikdoc.h>
#include <e32std.h>
#include <coeccntx.h>
#include <aknappui.h>

// FORWARD DECLARATIONS
class CBluetoothPMPExampleEngine;
class CBluetoothPMPExampleContainer;


// CLASS DECLARATION

/**
* Application UI class.
* Provides support for the following features:
* - EIKON control architecture
* 
*/
class CBluetoothPMPExampleAppUi : public CAknAppUi
    {
    public: // // Constructors and destructor

        /**
        * EPOC default constructor.
        */      
        void ConstructL();

        /**
        * Destructor.
        */      
        ~CBluetoothPMPExampleAppUi();
        
    public: // New functions

    public: // Functions from base classes

    private:
        // From MEikMenuObserver
        void DynInitMenuPaneL(TInt aResourceId,CEikMenuPane* aMenuPane);

    private:
        /**
        * From CEikAppUi, takes care of command handling.
        * @param aCommand command to be handled
        */
        void HandleCommandL(TInt aCommand);

        /**
        * From CEikAppUi, handles key events.
        * @param aKeyEvent Event to handled.
        * @param aType Type of the key event. 
        * @return Response code (EKeyWasConsumed, EKeyWasNotConsumed). 
        */
        virtual TKeyResponse HandleKeyEventL(
            const TKeyEvent& aKeyEvent,TEventCode aType);


	public:		// data
        CBluetoothPMPExampleContainer* iAppContainer; 

    private:	// data
		CBluetoothPMPExampleEngine* iEngine;

    };

#endif

// End of File
