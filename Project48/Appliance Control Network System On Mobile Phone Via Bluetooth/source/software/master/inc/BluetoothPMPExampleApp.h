/*
* ============================================================================
*  Name     : CBluetoothPMPExampleApp from BluetoothPMPExampleApp.h
*  Part of  : BluetoothPMPExample
*  Created  : 14.01.2004 by Forum Nokia
*  Description:
*     Declares main application class.
*  Version  :
*  Copyright: Nokia Corporation
* ============================================================================
*/

#ifndef BLUETOOTHPMPEXAMPLEAPP_H
#define BLUETOOTHPMPEXAMPLEAPP_H

// INCLUDES
#include <aknapp.h>

// CONSTANTS
// UID of the application
const TUid KUidBluetoothPMPExample = { 0x101FF1C5 };

// CLASS DECLARATION

/**
* CBluetoothPMPExampleApp application class.
* Provides factory to create concrete document object.
* 
*/
class CBluetoothPMPExampleApp : public CAknApplication
    {
    
    public: // Functions from base classes
    private:

        /**
        * From CApaApplication, creates CBluetoothPMPExampleDocument document object.
        * @return A pointer to the created document object.
        */
        CApaDocument* CreateDocumentL();
        
        /**
        * From CApaApplication, returns application's UID (KUidBluetoothPMPExample).
        * @return The value of KUidBluetoothPMPExample.
        */
        TUid AppDllUid() const;
    };

#endif

// End of File

