/*
* ============================================================================
*  Name     : CBluetoothPMPExampleContainer from BluetoothPMPExampleContainer.h
*  Part of  : BluetoothPMPExample
*  Created  : 14.01.2004 by Forum Nokia
*  Description:
*     Declares container control for application.
*  Version  :
*  Copyright: Nokia Corporation
* ============================================================================
*/

#ifndef BLUETOOTHPMPEXAMPLECONTAINER_H
#define BLUETOOTHPMPEXAMPLECONTAINER_H

// INCLUDES
#include <coecntrl.h>
#include <eiklabel.h>		// for example label control
#include "BluetoothPMPExampleEngine.h"

// FORWARD DECLARATIONS
//class CEikLabel;        // for example labels
class CBluetoothPMPExampleEngine;


// CLASS DECLARATION

/**
*  CBluetoothPMPExampleContainer  container control class.
*  
*/
class CBluetoothPMPExampleContainer : public CCoeControl, MCoeControlObserver
{
public:
     
/*!
 * NewL()
 * 
 * discussion Create new CBluetoothPMPExampleContainer object, being able to 
 *	  draw itself into aRect
 *
 * param aRect the rectangle this view will be drawn to
 * param aEngine the engine which core logic is used by this simple view
 * return a pointer to the created instance of CBluetoothPMPExampleContainer
 */
	static CBluetoothPMPExampleContainer* NewL(const TRect& aRect);
		
/*!
 * NewLC()
 * 
 * discussion Create new CBluetoothPMPExampleContainer object, being able to 
 *    draw itself into aRect
 *
 * param aRect the rectangle this view will be drawn to
 * return a pointer to the created instance of CBluetoothPMPExampleContainer
 *    which has also been pushed to cleanup stack
 */
    static CBluetoothPMPExampleContainer* NewLC(const TRect& aRect);

/*!
 * ~CBluetoothPMPExampleContainer()
 *
 * discussion Destroy the object and release all memory objects
 */
	~CBluetoothPMPExampleContainer();

public: // New functions

/*!
 * ShowMessageL()
 *
 * discussion Displays application messages for user
 *
 * param aMsg text to be displayed
 */
	void ShowMessageL(const TDesC& /* aMsg */);

public: // Functions from base classes

private: // Basic two-phase EPOC constructors

/*!
 * ConstructL()
 *
 * discussion Perform the second phase construction of a 
 * CBluetoothPMPExampleContainer object
 *
 * param aRect Frame rectangle for container.
 */
    void ConstructL(const TRect& aRect);

/*!
 * CBluetoothPMPExampleContainer()
 *
 * discussion Perform the first phase of two phase construction 
 */
    CBluetoothPMPExampleContainer();

private: // Functions from base classes

   /**
    * From CoeControl,SizeChanged.
    */
    void SizeChanged();

   /**
    * From CoeControl,CountComponentControls.
    */
    TInt CountComponentControls() const;

   /**
    * From CCoeControl,ComponentControl.
    */
    CCoeControl* ComponentControl(TInt aIndex) const;

   /**
    * From CCoeControl,Draw.
    */
    void Draw(const TRect& aRect) const;

    
	/**
	* From MCoeControlObserver
	* Acts upon changes in the hosted control's state. 
	*
	* param	aControl the control changing its state
	* param	aEventType the type of control event 
	*/
    void HandleControlEventL(CCoeControl* aControl,TCoeEvent aEventType);

private: // data members
        
	// Reference for engine object
	CBluetoothPMPExampleEngine* iEngine;		
	// Label displaying the application messages to user
	CEikLabel* iLabel;

};

#endif

// End of File
