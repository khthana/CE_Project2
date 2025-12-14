/*
* ============================================================================
*  Name     : CBluetoothPMPExampleDocument from BluetoothPMPExampleDocument.h
*  Part of  : BluetoothPMPExample
*  Created  : 14.01.2004 by Forum Nokia
*  Description:
*     Declares document for application.
*  Version  :
*  Copyright: Nokia Corporation
* ============================================================================
*/

#ifndef BLUETOOTHPMPEXAMPLEDOCUMENT_H
#define BLUETOOTHPMPEXAMPLEDOCUMENT_H

// INCLUDES
#include <akndoc.h>
   
// CONSTANTS

// FORWARD DECLARATIONS
class  CEikAppUi;

// CLASS DECLARATION

/**
*  CBluetoothPMPExampleDocument application class.
*/
class CBluetoothPMPExampleDocument : public CAknDocument
    {
    public: // Constructors and destructor
        /**
        * Two-phased constructor.
        */
        static CBluetoothPMPExampleDocument* NewL(CEikApplication& aApp);

        /**
        * Destructor.
        */
        virtual ~CBluetoothPMPExampleDocument();

    public: // New functions

    protected:  // New functions

    protected:  // Functions from base classes

    private:

        /**
        * EPOC default constructor.
        */
        CBluetoothPMPExampleDocument(CEikApplication& aApp);
        void ConstructL();

    private:

        /**
        * From CEikDocument, create CBluetoothPMPExampleAppUi "App UI" object.
        */
        CEikAppUi* CreateAppUiL();
    };

#endif

// End of File

