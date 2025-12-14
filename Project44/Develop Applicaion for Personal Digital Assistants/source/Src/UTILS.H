/***********************************************************************
 *
 * PROJECT:     PreWap
 * FILE:        utils.h
 *
 * DESCRIPTION: utils.h contains the prototypes for general use functions.
 *
 **********************************************************************/
#ifndef UTILS_H
#define UTILS_H




/***********************************************************************
 *
 * FUNCTION:    UpdateScrollBar
 *
 * DESCRIPTION: This routine updates the scrollbar object.
 * PARAMETERS:  fldID    - object id of the field associated with the
 *                         scrollbar.
 *              scrollID - object id of the scrollbar
 * RETURNED:    nothing
 *
 ***********************************************************************/
void UpdateScrollBar(UInt16 fldID,
                     UInt16 scrollID);
                     

/***********************************************************************
 *
 * FUNCTION:    ScrollLines
 * DESCRIPTION: This routine causes a given text field to be scrolled.
 * PARAMETERS:  fldID            - object id of the field associated
 *                                 with the scrollbar.
 *              scrollID         - object id of the scrollbar
 *              numLinesToScroll - self explanatory.
 *              redraw           - if true, redraw the scroll bar.
 * RETURNED:    nothing
 *
 ***********************************************************************/
void ScrollLines(UInt16  fldID,
                 UInt16  scrollID,
                 int     numLinesToScroll,
                 Boolean redraw);


/***********************************************************************
 *
 * FUNCTION:    PageScroll
 *
 * DESCRIPTION: This routine causes a given text field to be scrolled
 *              one page in the given direction.
 * PARAMETERS:  fldID       - object id of the field associated with
 *                            the scrollbar.
 *              scrollID    - object id of the scrollbar
 *              direction   - direction to scroll (up or down).
 * RETURNED:    nothing
 *
 ***********************************************************************/
void PageScroll(UInt16           fldID,
                UInt16           scrollID,
                WinDirectionType direction);

#endif

/***********************************************************************
 *
 * END OF utils.h
 *
 ***********************************************************************/
