/***********************************************************************
 *
 * PROJECT:     INetLow
 * FILE:        utils.c
 *
 * DESCRIPTION: utils contains general use functions.
 *	  
 *
 **********************************************************************/
#include <PalmOS.h>
#include "PreWapRsc.h"
#include "utils.h"





/***********************************************************************
 *
 * FUNCTION:    UpdateScrollBar
 *
 * DESCRIPTION: This routine updates the scrollbar object.
 *
 * PARAMETERS:  fldID    - object id of the field associated with the
 *                         scrollbar.
 *              scrollID - object id of the scrollbar
 *
 * RETURNED:    nothing
 *
 ***********************************************************************/
void UpdateScrollBar(UInt16 fldID,
                     UInt16 scrollID)
{
    FormPtr      frmP        = FrmGetActiveForm();
    ScrollBarPtr scrollP     = 0;
    FieldPtr     fldP        = 0;
    UInt16       currentPos  = 0;
    UInt16       txtHeight   = 0;
    UInt16       fldHeight   = 0;
    UInt16       maxValue    = 0;
    
    
    fldP = FrmGetObjectPtr(frmP,
                           FrmGetObjectIndex(frmP, fldID));
    
	//-------------------------------------------------------------------
	// Retrieve the current values needed for scrolling:
	// Note: Nothing is returned.
	//-------------------------------------------------------------------
    FldGetScrollValues(fldP,
                       &currentPos,
                       &txtHeight,
                       &fldHeight);
                       
    if (txtHeight > fldHeight)
        maxValue = txtHeight - fldHeight;
    else if (currentPos)
        maxValue = currentPos;
    else
        maxValue = 0;
        
    scrollP = FrmGetObjectPtr(frmP,
                              FrmGetObjectIndex(frmP, scrollID));

	//-------------------------------------------------------------------
	// Set the scroll bar's position, range, and page size:
	// Note: Nothing is returned, though the documentation indicates it
	//       might display a fatal error if min > max value.
	//-------------------------------------------------------------------
    SclSetScrollBar(scrollP,
                    currentPos,     // Where to place the scroll car
                    0,              // Minimum value
                    maxValue,
                    fldHeight - 1); // # of lines of text that can be displayed
        
    return;
}   // End UpdateScrollBar(UInt16, UInt16)



/***********************************************************************
 *
 * FUNCTION:    ScrollLines
 *
 * DESCRIPTION: This routine causes a given text field to be scrolled.
 *
 * PARAMETERS:  fldID            - object id of the field associated
 *                                 with the scrollbar.
 *              scrollID         - object id of the scrollbar
 *              numLinesToScroll - self explanatory.
 *              redraw           - if true, redraw the scroll bar.
 *
 * RETURNED:    nothing
 *
 ***********************************************************************/
void ScrollLines(UInt16  fldID,
                 UInt16  scrollID,
                 int     numLinesToScroll,
                 Boolean redraw)
{
    FormPtr  frmP = FrmGetActiveForm();
    FieldPtr fldP = 0;
    
    fldP = FrmGetObjectPtr(frmP,
                           FrmGetObjectIndex(frmP, fldID));
    
    //-------------------------------------------------------------------
    // Scroll up:
    // Note: Nothing is returned.
    //-------------------------------------------------------------------
    if (numLinesToScroll < 0)
        FldScrollField(fldP,
                       -numLinesToScroll,
                       winUp);
    //-------------------------------------------------------------------
    // Scroll down:
    // Note: Nothing is returned.
    //-------------------------------------------------------------------
    else
        FldScrollField(fldP,
                       numLinesToScroll,
                       winDown);
    
    
    //-------------------------------------------------------------------
    // Handle empty lines at the end of a field:
    // Note: UpdateScrollBar returns nothing, but it uses SclSetScrollBar(),
    //       which can display a fatal error.
    //-------------------------------------------------------------------
    if ((FldGetNumberOfBlankLines(fldP) && (numLinesToScroll < 0)) ||
        redraw)
        UpdateScrollBar(fldID,
                        scrollID);
    
    return;
}   // End ScrollLines(UInt16,UInt16,int,Boolean)


/***********************************************************************
 *
 * FUNCTION:    PageScroll
 *
 * DESCRIPTION: This routine causes a given text field to be scrolled
 *              one page in the given direction.
 *
 * PARAMETERS:  fldID       - object id of the field associated with
 *                            the scrollbar.
 *              scrollID    - object id of the scrollbar
 *              direction   - direction to scroll (up or down).
 *
 * RETURNED:    nothing
 *
 ***********************************************************************/
void PageScroll(UInt16           fldID,
                UInt16           scrollID,
                WinDirectionType direction)
{
    FormPtr  frmP = FrmGetActiveForm();
    FieldPtr fldP = 0;
    
    fldP = FrmGetObjectPtr(frmP,
                           FrmGetObjectIndex(frmP, fldID));
    
    //-------------------------------------------------------------------
    // If you have room to scroll in the given direction, do so:
    //-------------------------------------------------------------------
    if (FldScrollable(fldP, direction))
    {
        int linesToScroll = FldGetVisibleLines(fldP) - 1;
        
        if (direction == winUp)
            linesToScroll = -linesToScroll;
            
        //---------------------------------------------------------------
        // Scroll up or down as required:
        // Note: Nothing is returned.
        //---------------------------------------------------------------
        ScrollLines(fldID,
                    scrollID,
                    linesToScroll,
                    true /* redraw the scrollbar */);
    }
    
    return;
}   // End PageScroll(UInt16,UInt16,WinDirectionType)


/************************************************************************
 *
 * END OF utils.c
 *
 ************************************************************************/
