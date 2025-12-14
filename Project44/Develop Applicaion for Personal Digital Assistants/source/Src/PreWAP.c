/******************************************************************************
 *
 * Copyright (c) 1999 Palm Computing, Inc. or its subsidiaries.
 * All rights reserved.
 *
 * File: PreWap.c-
 *
 *****************************************************************************/

#include <PalmOS.h>			// All the system toolbox headers
#include <INetMgr.h>        // Internet manager library header
#include <CTP.h>
#include <Form.h>

#include "PreWapRsc.h"
#include "PreWap.h"
#include "utils.h"
#include "parser.h"
#include "Display.h"

static	DmOpenRef	BmDb;
static	UInt16		numRecords;
static  UInt16		cursor;
static  Boolean		isDirty;
static  MemHandle	recordH;
static	Boolean     choose = false;

#define DB_NAME_START			0
#define DB_NAME_SIZE			20
#define DB_LOCATION_START		DB_NAME_START + DB_NAME_SIZE
#define DB_LOCATION_SIZE		40
#define	DB_RECORD_SIZE			DB_LOCATION_START + DB_LOCATION_SIZE 

static MemHandle	choicesH;	// Handle to packed choices
static MemHandle	choicesHP;	// Handle to pointers

Char	urlRefresh[40];
Char    preUrl[40];

Boolean newPage;
static UInt16   backFormID;

//Variable from Display.c
extern UInt16	NumF;
//extern UInt16   NumF2;
extern FormPtr 	dynaFrm[30];
extern Int16 	EndNumF;
extern Boolean 	prev;
extern UInt16 	CoGlobal[30];
extern UInt16 	CcGlobal[30];
extern FormPtr  UpDownForm[30];
extern UInt16	YGlobal[30];
extern UInt16   CoStatic[30];
extern UInt16   CcStatic[30];
extern UInt16   YGlobal2[30];

//initial button's id and form's id
#define MainButton					1900
#define TemButton					1800
#define FrmFirst					2000
#define UpButton					8800
#define	DownButton					8900


// The error exit macro
#define errorExit(alert) { ErrThrow( alert ); }


/***********************************************************************
 *
 *   Internal Functions
 *
 ***********************************************************************/

 /***********************************************************************
 *
 * FUNCTION:    CutUrl
 *
 * DESCRIPTION: This routine cut urlRresh (start to last '/')
 *				and keep in preUrl
 *
 * PARAMETERS:	void  
 *
 * RETURNED:    void
 *
 ***********************************************************************/
void CutUrl()
{
	UInt16 	lenUrl = 0;
	UInt16  i; 

	lenUrl = StrLen(urlRefresh);
	if (lenUrl)
	{
		if (StrChr(urlRefresh,'/') == NULL)
		{
			for (i = 0; i < lenUrl ; i++ )
				preUrl[i] = urlRefresh[i];
			preUrl[i] = '/';
			preUrl[i+1] = '\0';
		}
		else
		{	
			for (i = 0; i < lenUrl ; i++ )
				preUrl[i] = urlRefresh[i];
			preUrl[i+1] = '\0';
			i = lenUrl;
			while ((urlRefresh[i] != '/') && (i >= 0))
			{
				--i;
			}
			preUrl[i+1] = '\0';
		}
		
	}
	
}
/***********************************************************************
 *
 * FUNCTION:    DeleteBm
 *
 * DESCRIPTION: This routine ask user to confirm and 
 *				delete the choosen list in Bookmarks
 *
 * PARAMETERS:	void  
 *
 * RETURNED:    void
 *
 ***********************************************************************/

static void DeleteBm()
{
	Char*			recordP;	// A record pointer
	
	recordH = DmQueryRecord( BmDb, cursor );
	recordP = MemHandleLock( recordH );
	
	if(ShowMessage(ConfirmAlert, "!Delete ", recordP + DB_LOCATION_START, "!") == 0)
	{
		DmRemoveRecord( BmDb, cursor);
		numRecords--;
	}
}

/***********************************************************************
 *
 * FUNCTION:    BuildListBm
 *
 * DESCRIPTION: This routine build the Bookmark list
 *
 * PARAMETERS:  void
 *
 * RETURNED:    void
 *
 ***********************************************************************/
static void BuildListBm ( void )
{
	FormPtr		form;							// A form structure pointer
	Int16		choice;							// The list choice we're doing
	Char*		recordP;						// Pointer to a record
	Char		listChoice[DB_NAME_SIZE];		// We build list choices here
												// The current list choice
	Char*		choicesP;						// Pointer to packed choices
	UInt16		offset;							// Offset into packed strings
	MemPtr		choicesPP;						// Pointer to pointers to choices

	// Get our form pointer
	form = FrmGetActiveForm();

	// Put the list choices in a packed string
	for( choice = 0; choice < numRecords; choice++ )
	{
		// Get the record
		recordH = DmQueryRecord( BmDb, choice );
		recordP = MemHandleLock( recordH );
				
		// Clear the list choice string
		*listChoice = '\0';

		// Append the first name
		StrCat( listChoice, recordP + DB_NAME_START );
				
		// Allocate memory for the list entry string
		// If this is the first choice
		if( choicesH == 0 )
		{
			// Allocate the storage for the choice
			if( ( choicesH = MemHandleNew(
					StrLen( listChoice ) + 1 )) == 0 )
				errorExit( MemoryErrorAlert );
			
			// Initial offset points to the start
			offset = 0;
		}
				
		else
		// If this is a subsequent choice
		{
			// Unlock
			MemHandleUnlock( choicesH );
			
			// Resize
			if( MemHandleResize( choicesH, offset +
					StrLen( listChoice ) + 1 ) )
				errorExit( MemoryErrorAlert );
		
		}
				
		// Lock
		choicesP = MemHandleLock( choicesH );

		// Copy the string into the memory
		StrCopy( choicesP + offset, listChoice );
		offset += StrLen( listChoice ) + 1;
				
		// Unlock the record
		MemHandleUnlock( recordH );
	}
			
	// Create a pointer array from the packed string list
	if( (choicesHP = SysFormPointerArrayToStrings( choicesP,
			numRecords )) == 0 )
		errorExit( MemoryErrorAlert );
		choicesPP = MemHandleLock( choicesHP );
			
	// Set the list choices
	LstSetListChoices( GetObjectPtr(BookmarksUrlListList),
			choicesPP, numRecords );

	// Draw the list
	LstDrawList( GetObjectPtr(BookmarksUrlListList ) );

	// We're done
	return;
}

/***********************************************************************
 *
 * FUNCTION:    SetText
 *
 * DESCRIPTION: This routine sets the text in a field
 *
 * PARAMETERS:  field
 *				text
 *
 * RETURNED:    void
 *
 ***********************************************************************/
static void SetText( FieldPtr field, Char* text )
{
	MemHandle	fieldH;	// Handle of field text
	Char*		fieldP;	// Pointer to field text
	
	// Get the current field handle
	fieldH = FldGetTextHandle( field );
	
	// If we have a handle
	if( fieldH != NULL )
	{
		// Resize it
		MemHandleResize( fieldH, StrLen( text ) + 1 );
	}
	
	else
	// Allocate a handle for the string
		fieldH = MemHandleNew( StrLen( text ) + 1 );
	
	// Lock it
	fieldP = MemHandleLock( fieldH );
	
	// Copy the string
	StrCopy( fieldP, text );
	
	// Unlock it
	MemHandleUnlock( fieldH );
	
	// Give it to the field
	FldSetTextHandle( field, fieldH );
	
	// Draw the field
	FldDrawField( field );
	
	// We're done
	return;
}	

/***********************************************************************
 *
 * FUNCTION:    SetField
 *
 * DESCRIPTION: This routine gets the current database record and displays it
 *				in the detail fields
 *
 * PARAMETERS:  void
 *
 * RETURNED:    void
 *
 ***********************************************************************/

static void SetFields( void )
{
	FormPtr		form;		// Database Form
	Char*		recordP;	// A record pointer
	UInt16		index;		// The object index
	
	// Get the contact detail form pointer
	form = FrmGetActiveForm();
		
	// Get the current record
	recordH = DmQueryRecord( BmDb, cursor );
	recordP = MemHandleLock( recordH );
		
	// Set the text for the First Name field
	SetText( GetObjectPtr ( DatabaseNameField ),
			recordP + DB_NAME_START );
		
	// Set the text for the Last Name field
	SetText( GetObjectPtr ( DatabaseLocationField ),
			recordP + DB_LOCATION_START );
		
	MemHandleUnlock( recordH );

	// If the record is already dirty, it's new, so set focus
	if( isDirty )
	{
  		// Get the index of our field
		index = FrmGetObjectIndex( form, DatabaseNameField );

		// Set the focus to the First Name field
		FrmSetFocus( form, index );
		
		// Set upper shift on
		GrfSetState( false, false, true );			
	}
	
	// We're done
	return;
}

/***********************************************************************
 *
 * FUNCTION:    DatabaseFormHandleEvent
 *
 ***********************************************************************/
/*
static Boolean DatabaseFormHandleEvent(EventPtr eventP)
{
   Boolean handled = false;
   FormPtr frmP;

	switch (eventP->eType) 
	{
		case frmOpenEvent:
			frmP = FrmGetActiveForm();
			FrmDrawForm ( frmP);
			if ( cursor > 0)
				cursor = 0;
			if (numRecords > 0)
			{
				SetFields();
			}
			handled = true;
			break;

		case ctlSelectEvent:
			switch(eventP->data.ctlSelect.controlID)
			{
				case DatabasePrevButton:
					if( cursor > 0 )
						cursor--;
					SetFields();
					handled = true;
					break;
				case DatabaseNextButton:
					if( cursor < (numRecords - 1))
						cursor++;
					SetFields();
					handled = true;
					break;
				case DatabaseExitButton:
					FrmGotoForm(BookmarksForm);
					handled = true;
					break;
			}
			
			handled = true;
			break;
		default:
			break;
	}
	return handled;
}
*/
/***********************************************************************
 *
 * FUNCTION:    WriteRecord
 *
 ***********************************************************************/
static void WriteRecord(Char* n,Char* l, UInt16 nL, UInt16 lL)
{
	if( isDirty )
	{
		Char*	recordP;	// Points to the DB record
	
		// Lock the record
		recordP = MemHandleLock( recordH );
		
		// Copy Name field to Record
		DmWrite (recordP, DB_NAME_START, n, nL );
		
		// Copy Location field to Record
		DmWrite (recordP, DB_LOCATION_START, l, lL );

		// Unlock the record
		MemHandleUnlock( recordH );
	}
	
	isDirty = false;
}

/***********************************************************************
 *
 * FUNCTION:    NewRecord
 *
 ***********************************************************************/
static void NewRecord( void )
{
	MemPtr		recordP;	// Pointer to the record
	
	// Create the database record and get a handle to it
	recordH = DmNewRecord( BmDb, &cursor, DB_RECORD_SIZE );
	
	// Lock down the record to modify it
	recordP = MemHandleLock( recordH );
	
	// Clear the record
	DmSet( recordP, 0, DB_RECORD_SIZE, 0 );
	
	// Unlock the record
	MemHandleUnlock( recordH );
	
	// Clear the busy bit and set the dirty bit
	DmReleaseRecord( BmDb, cursor, true );
	
	// Increment the total record i
	numRecords++;
	
	// Set the dirty bit
	isDirty = true;
	
	// We're done
	return;
}

/***********************************************************************
 *
 * FUNCTION:    OpenCreateDatabase
 *
 ***********************************************************************/
static Err OpenCreateDatabase()
{
	Err			error 	= 	0;
	UInt16		CardNo 	= 	0;
	UInt16		mode 	= 	dmModeReadWrite;
	
	BmDb = DmOpenDatabaseByTypeCreator('DATA', 'WPCE', mode);
	if(!BmDb)
	{
		error = DmCreateDatabase(CardNo, "BookmarksDb", 'WPCE', 'DATA', false);
		
		if(error)
			return error;
		
		BmDb = DmOpenDatabaseByTypeCreator('DATA', 'WPCE', mode);
		
		if(!BmDb)
			return(1);
	}
	numRecords = DmNumRecords(BmDb);
	cursor = 0;
	return(error);
}

/***********************************************************************
 *
 * FUNCTION:    ResolveMessage
 *
 * DESCRIPTION: This routine resolves a character string message into
 *              one of the message constants.  Note: perhaps it is 
 *              unnecessary, but at the time I thought it nice to enter
 *              a character string instead of a constant as an argument
 *              to INetInfo().
 *
 * PARAMETERS:  message - a character string message or command.
 *
 * RETURNED:    message constant corresponding to the character string
 *              message.
 *
 ***********************************************************************/
static Mesg ResolveMessage(Char* message)
{
    Mesg mesg = MESG_INVALID;
    
    if (StrCaselessCompare(message, "get") == 0)
        mesg = MESG_GET;
    else if (StrCaselessCompare(message, "set") == 0)
        mesg = MESG_SET;
    
    return( mesg );
}   // End ResolveMessage(Char*)


/***********************************************************************
 *
 * FUNCTION:    INetStart
 *
 * DESCRIPTION: This routine starts and initializes the INetLib, after 
 *              first checking for the presence of INetLib.
 *
 * PARAMETERS:  none
 *
 * RETURNED:    An error or 0 if all went well.
 *
 ***********************************************************************/
static Err INetStart(void)
{
    Err             error     = 0;
    UInt16          libRefNum = 0;      // Reference # of the loaded INet lib.
    MemHandle       inetH     = 0;      // Handle set from INetLibOpen.
    UInt32          value     = 0;      // Value of the feature requested.


	//-------------------------------------------------------------------
	// Check if INetLib is installed:
	//-------------------------------------------------------------------
    error = FtrGet(inetLibFtrCreator,
                   inetFtrNumVersion,
                   &value);

	//-------------------------------------------------------------------
	// Find the INet library reference number:
	//-------------------------------------------------------------------
    if (!error && value)
    	//---------------------------------------------------------------
    	// Note: A non-zero error means the INetLib isn't loaded.
    	//---------------------------------------------------------------
        error = SysLibFind("INet.lib",
                           &libRefNum);

	//-------------------------------------------------------------------
	// Open and initialize INetLib:
	//-------------------------------------------------------------------
    if (!error)
    {
    	//---------------------------------------------------------------
    	// Set the configuration values:
    	// Note: I should code this to allow the user to select wireline
    	//       or wireless simply as an example that it can be done 
    	//       on a Palm VII using wireline.
    	//---------------------------------------------------------------
        INetConfigNameType cfgName  = { inetCfgNameCTPDefault };  // Same as used by Clipper.
        UInt16             cfgIndex = 0;                          // Just an initialization.


    	//---------------------------------------------------------------
    	// Get the configuration index to pass to INetLibOpen():
    	//---------------------------------------------------------------
        error = INetLibConfigIndexFromName(libRefNum,
                                           &cfgName,
                                           &cfgIndex);

    	//---------------------------------------------------------------
    	// Open INetLib:
    	//---------------------------------------------------------------
        error = INetLibOpen(libRefNum,
                            cfgIndex,
                            0,         // Flags not used.
                            NULL,      // Not using a cache.
                            0,         // Max cache size of 0 (no cache).
                            &inetH);
            
    	//---------------------------------------------------------------
    	// Initialize the INetLib:
    	//---------------------------------------------------------------
        error = INetInit(libRefNum,
                         &inetH,
                         cfgIndex);
    }


    return error;
}   // End INetStart(void)


/***********************************************************************
 *
 * FUNCTION:    INetInit
 *
 * DESCRIPTION: This routine is used to initialize the INetLib opened by 
 *              INetLibOpen.
 *
 * PARAMETERS:  libRefNum            - The INetLib reference number.
 *              inetHP               - Pointer to the INetLib handle.
 *              cfgIndex             - Index of current configuration
 *                                     in the configuration list.
 *
 * RETURNED:    A value of 0 if all went well.
 *
 ***********************************************************************/
static Err INetInit(UInt16     libRefNum,
                    MemHandle* inetHP,
                    UInt16     cfgIndex)
{
    Err             error         = 0;
    UInt16          wIndicatorX   = 140;
    UInt16          wIndicatorY   = 1;
    INetLowInfoType inetInfoBlock;


    //---------------------------------------------------------------
    // Initialize the inet information block:
    // Note: MemSet always returns 0, but perhaps it will someday
    //       return an error value.
    //---------------------------------------------------------------	
	error = MemSet(&inetInfoBlock,
	               sizeof(inetInfoBlock),
	               0);

    if (inetHP != NULL)
    {
    	//---------------------------------------------------------------
    	// Initialize the inet information store:
    	//---------------------------------------------------------------
        inetInfoBlock.inetRefNum           = libRefNum;
        inetInfoBlock.inetHan              = *inetHP;
        inetInfoBlock.inetSockH            = 0;
        inetInfoBlock.downloadSize         = MAX_RESPONSE_SIZE; // Max response size accepted.
	    inetInfoBlock.inetLowConvAlgorithm = ctpConvNone;       // Default.
                                                                // No translation of data 
                                                                // coming from destination
                                                                // server as default.
        inetInfoBlock.cfgIndex             = cfgIndex;          // Currently active config.

    	//---------------------------------------------------------------
    	// Save the inet information store for later access to data:
    	// (to avoid global variable use in case we want to be palmcall 
    	//  friendly)
    	//---------------------------------------------------------------
        error = INetInfo(&inetInfoBlock,
                         "set");

    	//---------------------------------------------------------------
    	// Set the max download size
    	//---------------------------------------------------------------
        if (!error)
    	    error = INetLibSettingSet(inetInfoBlock.inetRefNum,
    	                              inetInfoBlock.inetHan,
                                      inetSettingMaxRspSize,
                                      (UInt8*)&inetInfoBlock.downloadSize,
                                      sizeof(inetInfoBlock.downloadSize));

        if (!error)
        	//-----------------------------------------------------------
        	// Set the default conversion algorithm:
        	//-----------------------------------------------------------
        	error = INetLibSettingSet(inetInfoBlock.inetRefNum,
                                      inetInfoBlock.inetHan,
                                      inetSettingConvAlgorithm,
                                      (UInt8*)&inetInfoBlock.inetLowConvAlgorithm,
                                      sizeof(inetInfoBlock.inetLowConvAlgorithm));
    }
    else
    	//---------------------------------------------------------------
    	// Set to an informative error code or manage the error in some
    	// way:
    	//---------------------------------------------------------------
        error = 1;
                   

    return (error);
}   // End INetInit(UInt16,MemHandle*,UInt16)


/***********************************************************************
 *
 * FUNCTION:    INetInfo
 *
 * DESCRIPTION: This routine is used to retain the INetLib handle and
 *              reference number provided by INetLibOpen, the socket
 *              handle provided by INetLibSockOpen, and various other
 *              info related to use of the INetLib.
 *
 * PARAMETERS:  Note: A zero (0) or NULL argument means not to perform
 *                    the requested action on that datum.
 *
 *              inetInfoP  - Pointer to a structure holding the INetLow
 *                           information, such as the INetLib reference
 *                           number, INetLib handle, INetLib socket
 *                           handle, etc.
 *              message    - The message by which the action to take is
 *                           determined.  Accepted messages:
 *                              get
 *                              set
 *
 * RETURNED:    An error or 0 if all went well.
 *
 ***********************************************************************/
static Err INetInfo(INetLowInfoPtr  inetInfoP,
                    Char*           message)
{
    Err    	               error         = 0;
    static Boolean         firstRun      = true; // For initializing struct only once.
    static INetLowInfoType inetInfoStore;

    //-------------------------------------------------------------------
    // Initialize the store with zeros (0) only on first call of function:
    //-------------------------------------------------------------------  
    if (firstRun && inetInfoP != NULL)
	{
        //---------------------------------------------------------------
        // Note: MemSet always returns 0, but perhaps it will someday
        //       return an error value.
        //---------------------------------------------------------------	
    	error = MemSet(&inetInfoStore,
    	               sizeof(inetInfoStore),
    	               0);
    	firstRun = false;
    }

    //-------------------------------------------------------------------
    // Perform required action - (get or set some data):
    //-------------------------------------------------------------------
    switch (ResolveMessage(message))
    {
        case MESG_GET:
            if (inetInfoP)
            {
                inetInfoP->inetRefNum           = inetInfoStore.inetRefNum;
                inetInfoP->inetHan              = inetInfoStore.inetHan;
                inetInfoP->inetSockH            = inetInfoStore.inetSockH;
                inetInfoP->downloadSize         = inetInfoStore.downloadSize;
                inetInfoP->requestSize          = inetInfoStore.requestSize;
                inetInfoP->inetLowConvAlgorithm = inetInfoStore.inetLowConvAlgorithm;
                inetInfoP->cfgIndex             = inetInfoStore.cfgIndex;
            }
            break;
            
        case MESG_SET:
            if (inetInfoP)
            {
                inetInfoStore.inetRefNum           = inetInfoP->inetRefNum;
                inetInfoStore.inetHan              = inetInfoP->inetHan;
            	inetInfoStore.inetSockH            = inetInfoP->inetSockH;
            	inetInfoStore.downloadSize         = inetInfoP->downloadSize;
            	inetInfoStore.requestSize          = inetInfoP->requestSize;
            	inetInfoStore.inetLowConvAlgorithm = inetInfoP->inetLowConvAlgorithm;
            	inetInfoStore.cfgIndex             = inetInfoP->cfgIndex;
            }
            break;

        case MESG_INVALID:                    
        default:
            error = MESG_INVALID;
    }
        
    return error;
}   // End INetInfo(INetLowInfoPtr,Char*)


/***********************************************************************
 *
 * FUNCTION:    INetGo
 *
 * DESCRIPTION: This routine performs the primary connection function for
 *              sending a request.
 *
 * PARAMETERS:  Note: A zero (0) or NULL argument means not to perform the
 *                    requested action on that datum.
 *
 *              urlP     - Pointer to the URL string to use for sending
 *                         a request.
 *              dataP    - Pointer to any data to be included as part of 
 *                         the POST body.
 *              timeout  - The time in seconds to wait for a response
 *                         before giving up.
 *
 * RETURNED:    An error, or 0 if all went well.
 *
 ***********************************************************************/
static Err INetGo(Char* urlP,
                  Int32 timeout)
{
	INetURLType		url;
	INetLowInfoType inetInfoBlock;
    UInt16          inetFlags      = 0; // Won't use this, but you could set to use the cache, etc.
    Char*           methodP        = NULL;
    UInt32          dwSize         = sizeof(UInt32);
    UInt16          attrIndex      = 0;
    UInt16          flags          = 0;
    UInt32          sockScheme     = 0;
    UInt16          sockFlags      = 0;
    UInt16          sockSchemeL    = sizeof(sockScheme);
    UInt16          sockFlagsL     = sizeof(sockFlags);    
    Err             error          = 0;

    
    //---------------------------------------------------------------
    // Initialize the inet information block:
    // Note: MemSet always returns 0, but perhaps it will someday
    //       return an error value.
    //---------------------------------------------------------------	
	error = MemSet(&inetInfoBlock, sizeof(inetInfoBlock), 0);

	//-------------------------------------------------------------------
	// Initialze the URL variable:
    // Note: MemSet always returns 0, but perhaps it will someday
    //       return an error value.
	//-------------------------------------------------------------------
    error = MemSet(&url, sizeof(url), 0);

    //-------------------------------------------------------------------
    // Get the library ref number, inet handle, socket handle from storage:
    //-------------------------------------------------------------------
    error = INetInfo(&inetInfoBlock, "get");
    
	if (!error && inetInfoBlock.inetRefNum && inetInfoBlock.inetHan && urlP)
	{
    	//---------------------------------------------------------------
    	// Clean-up from any previous request:
    	//---------------------------------------------------------------
    	if (inetInfoBlock.inetSockH)
    	{
    		error                   = INetEndTransaction();
    		inetInfoBlock.inetSockH = 0;
    	}


       if (!error)
        {
        	//-----------------------------------------------------------
        	// Set the conversion algorithm
        	//-----------------------------------------------------------
        	error = INetLibSettingSet(inetInfoBlock.inetRefNum,
                                      inetInfoBlock.inetHan,
                                      inetSettingConvAlgorithm,
                                      (UInt8*)&inetInfoBlock.inetLowConvAlgorithm,
                                      sizeof(inetInfoBlock.inetLowConvAlgorithm));
        }

    	//---------------------------------------------------------------
    	// Set the HTTP(S) method:
    	//---------------------------------------------------------------
   		methodP = "GET";

    	//---------------------------------------------------------------
    	// Break the given URL into components:
    	//---------------------------------------------------------------
    	if (!error)
    	    error = INetLibURLCrack(inetInfoBlock.inetRefNum, (UInt8*)urlP, &url);

		if (!error)
			error = (url.hostnameP == NULL);
		
    	//---------------------------------------------------------------
    	// Open a socket (remember a max of 4 is allowed open at any time):
    	//---------------------------------------------------------------
    	if (!error)
            error = INetLibSockOpen(inetInfoBlock.inetRefNum,
                                    inetInfoBlock.inetHan,
                                    url.schemeEnum,
                                    &inetInfoBlock.inetSockH);


    	//---------------------------------------------------------------
        // Save the socket handle for later use:
    	//---------------------------------------------------------------
    	if (!error)
        	error = INetInfo(&inetInfoBlock, "set");


    	//---------------------------------------------------------------
        // Set the socket flags:
    	//---------------------------------------------------------------
    	if (!error)
            error = INetLibSockSettingSet(inetInfoBlock.inetRefNum,
                                          inetInfoBlock.inetSockH, 
                                          inetSockSettingFlags,
                                          (MemPtr)&inetFlags,
                                          sizeof(inetFlags));


    	//---------------------------------------------------------------
    	// Create an HTTP request:
    	//---------------------------------------------------------------
    	if (!error)
            error = INetLibSockHTTPReqCreate(inetInfoBlock.inetRefNum,
                                             inetInfoBlock.inetSockH,
                                             (UInt8*)methodP,
                                             (UInt8*)urlP,  // url.hostnameP
                                             0);             // cacheIndexURLP);


    	//---------------------------------------------------------------
    	// Initiate the sending of the HTTP request message:
    	// Note:  It is not necessary to have called INetLibSockConnect()
    	//        prior to calling INetLibSockHTTPReqSend(), as the latter
    	//        makes the call to the former for you.
    	// Note:  Instead of a timeout as the secs_to_wait * SysTicksPerSecond(),
    	//        you could also pass a wait forever ( -1 ).
    	//---------------------------------------------------------------
     	if (!error)
            error = INetLibSockConnect(inetInfoBlock.inetRefNum,
                                       inetInfoBlock.inetSockH,
                                       (UInt8*)urlP,  // url.hostnameP
                                       0,
                                       timeout);     

    	if (!error)
            error = INetLibSockHTTPReqSend(inetInfoBlock.inetRefNum,
                                           inetInfoBlock.inetSockH, 
                                           NULL,
                                           0,
                                           timeout);


    	//---------------------------------------------------------------
    	// Get the size of the request message as number of bytes:
    	//---------------------------------------------------------------
    	if (!error)
            error = INetLibSockHTTPAttrGet(inetInfoBlock.inetRefNum,
                                           inetInfoBlock.inetSockH, 
                                           inetHTTPAttrReqSize,
                                           0,
                                           (MemPtr)&inetInfoBlock.requestSize,
                                           &dwSize);


    	//---------------------------------------------------------------
        // Save the number of bytes sent for later use:
    	//---------------------------------------------------------------
    	if (!error)
        	error = INetInfo(&inetInfoBlock,
        	                 "set");


    	//---------------------------------------------------------------
    	// I retrieved the following just for checking/debugging:
    	//---------------------------------------------------------------
    	if (!error)
            error = INetLibSockSettingGet(inetInfoBlock.inetRefNum,
                                          inetInfoBlock.inetSockH, 
                                          inetSockSettingScheme,
                                          (MemPtr)&sockScheme,
                                          &sockSchemeL);


    	if (!error)
            error = INetLibSockSettingGet(inetInfoBlock.inetRefNum,
                                          inetInfoBlock.inetSockH, 
                                          inetSockSettingFlags,
                                          (MemPtr)&sockFlags,
                                          &sockFlagsL);
        }


    if (error)
    {
    	//---------------------------------------------------------------
    	// Close the socket:
    	//---------------------------------------------------------------
    	INetEndTransaction();
    	
    	// What the heck:
        inetInfoBlock.inetSockH = 0;    	      
    }
    
    
    return (error);
}   // End INetGo(Char*,Char*,Int32)


/***********************************************************************
 *
 * FUNCTION:    INetEndTransaction
 *
 * DESCRIPTION: Perform any necessary clean-up and close the socket.
 *              (not much done here except calling INetLibSockClose and
 *               updating the INet information store, but I thought 
 *               it might be nice to separate it further in case 
 *               something more is desired)
 *
 * PARAMETERS:  nothing
 *
 * RETURNED:    0 for no error.  Otherwise ...
 *
 ***********************************************************************/
static Err INetEndTransaction(void)
{
    Err             error         = 0;
    INetLowInfoType inetInfoBlock;
    
    
    //---------------------------------------------------------------
    // Initialize the inet information block:
    // Note: MemSet always returns 0, but perhaps it will someday
    //       return an error value.
    //---------------------------------------------------------------	
	error = MemSet(&inetInfoBlock, sizeof(inetInfoBlock), 0);

    //-------------------------------------------------------------------
    // Get the library ref number, inet handle, socket handle from storage:
    //-------------------------------------------------------------------
    error = INetInfo(&inetInfoBlock, "get");

	//-------------------------------------------------------------------
	// Close the socket from any previous request:
	//-------------------------------------------------------------------
	if (!error && inetInfoBlock.inetSockH)
	{
        //---------------------------------------------------------------
        // Non zero values can be returned to indicate errors, but these
        // are not documented:
        //---------------------------------------------------------------
		error = INetLibSockClose(inetInfoBlock.inetRefNum, inetInfoBlock.inetSockH);

        //---------------------------------------------------------------
        // Set the socket handle in storage to 0, as the socket was
        // closed:
        //---------------------------------------------------------------
 		inetInfoBlock.inetSockH = 0;
 		
        error = INetInfo(&inetInfoBlock, "set");
	}

    return error;
}   // INetEndTransaction(void)


/***********************************************************************
 *
 * FUNCTION:    INetEnd
 *
 * DESCRIPTION: Perform any necessary clean-up and close the INetLib.
 *              (not much done here except calling INetClose, but I
 *               thought it might be nice to separate it further in
 *               case something more related to INetLib is desired)
 *
 * PARAMETERS:  none
 *
 * RETURNED:    none
 *
 ***********************************************************************/
static Err INetEnd(void)
{
    Err             error         = 0;
    INetLowInfoType inetInfoBlock;


    //---------------------------------------------------------------
    // Initialize the inet information block:
    // Note: MemSet always returns 0, but perhaps it will someday
    //       return an error value.
    //---------------------------------------------------------------	
	error = MemSet(&inetInfoBlock,
	               sizeof(inetInfoBlock),
	               0);

	//-------------------------------------------------------------------
	// Retrieve the stored INet info:
	//-------------------------------------------------------------------
    error = INetInfo(&inetInfoBlock,
                     "get");
   
	if (!error &&
	    inetInfoBlock.inetRefNum &&
	    inetInfoBlock.inetHan)
	{
    	//---------------------------------------------------------------
    	// Close the INetLib (will actually remain open just long enough
        //                    for another app to use):
        // Note:  INetLibClose() also closes any open sockets.
    	//---------------------------------------------------------------
        if (inetInfoBlock.inetHan)
            INetLibClose(inetInfoBlock.inetRefNum,
                         inetInfoBlock.inetHan);
    }
     
    return error;
   
}   // End INetEnd(void)


/***********************************************************************
 *
 * FUNCTION:    GetDataFromSocket
 *
 * DESCRIPTION: This routine extracts data from a socket
 *
 * PARAMETERS:  responseBufH  - the handle of the buffer to store the  
 *                              retreived data in.
 *              bytesRead     - the variable to be set with the total 
 *                              number of bytes read during this socket
 *                              read.
 *              reqestedBytes - total bytes to retrieve.
 *              timeout       - the timeout in clock ticks before giving
 *                              up waiting for data from the socket.
 *
 * RETURNED:    Err or 0 if all went well.
 *
 ***********************************************************************/
static Err GetDataFromSocket(MemHandle  responseBufH,
                             UInt32*    bytesReadP,
                             UInt32     reqestedBytes,
                             Int32      timeout)
{
    INetLowInfoType inetInfoBlock;    
    Char*           responseBufP   = 0;
    Err             error          = 0;
    

    //---------------------------------------------------------------
    // Initialize the inet information block:
    // Note: MemSet always returns 0, but perhaps it will someday
    //       return an error value.
    //---------------------------------------------------------------	
	error = MemSet(&inetInfoBlock,
	               sizeof(inetInfoBlock),
	               0);

	//-------------------------------------------------------------------
	// Get the inet library ref number and the inet socket handle from
	// storage:
	//-------------------------------------------------------------------
    error = INetInfo(&inetInfoBlock,
                     "get");

    if (!error &&
        inetInfoBlock.inetRefNum &&
        inetInfoBlock.inetSockH)
    {
    	//---------------------------------------------------------------
    	// Obtain a locked pointer to the buffer for storing the  
    	// retrieved socket data:
    	//---------------------------------------------------------------
    	responseBufP = MemHandleLock(responseBufH);
        if (!responseBufP)
        {
    	    //-----------------------------------------------------------
            // Couldn't get a valid pointer to the chunk, so ...:
        	//-----------------------------------------------------------
            ;
        }
        else
        {
        	//-----------------------------------------------------------
        	// Advance the pointer to the response buffer by the total
        	// number of bytes already read (this ensures previously
        	// retrieved data is not overwritten):
        	//-----------------------------------------------------------
        	responseBufP += *bytesReadP;
    
        		
        	error = INetLibSockRead(inetInfoBlock.inetRefNum,
        							inetInfoBlock.inetSockH,
        							responseBufP,
        							reqestedBytes,
        							bytesReadP,
        							timeout);
        	
        	//-----------------------------------------------------------
        	// Clean-up:
        	//-----------------------------------------------------------
        	error = MemHandleUnlock(responseBufH);
        }
    }

	return error;
}   // End GetDataFromSocket(MemHandle,UInt32*,UInt32,Int32)

/***********************************************************************
 *
 * FUNCTION:    RomVersionCompatible
 *
 * DESCRIPTION: This routine checks that a ROM version is meet your
 *              minimum requirement.
 *
 * PARAMETERS:  requiredVersion - minimum rom version required
 *                                (see sysFtrNumROMVersion in SystemMgr.h 
 *                                for format)
 *              launchFlags     - flags that indicate if the application 
 *                                UI is initialized.
 *
 * RETURNED:    error code or zero if rom is compatible
 *
 ***********************************************************************/
static Err RomVersionCompatible(UInt32 requiredVersion, UInt16 launchFlags)
{
	UInt32 romVersion;

    //-------------------------------------------------------------------
	// See if we're on in minimum required version of the ROM or later.
    //-------------------------------------------------------------------
	FtrGet(sysFtrCreator, sysFtrNumROMVersion, &romVersion);
	if (romVersion < requiredVersion)
	{
		if ((launchFlags & (sysAppLaunchFlagNewGlobals | sysAppLaunchFlagUIApp)) ==
			(sysAppLaunchFlagNewGlobals | sysAppLaunchFlagUIApp))
		{
			FrmAlert (RomIncompatibleAlert);
		
            //-----------------------------------------------------------
			// Pilot 1.0 will continuously relaunch this app unless we
			// switch to another safe one.
            //-----------------------------------------------------------
			if (romVersion < sysMakeROMVersion(2,0,0,sysROMStageRelease,0))
				AppLaunchWithCommand(sysFileCDefaultApp, sysAppLaunchCmdNormalLaunch, NULL);
		}
		
		return (sysErrRomIncompatible);
	}

	return (0);
}

/***********************************************************************
 *
 * FUNCTION:    URLStart
 *
 ***********************************************************************/
void URLStart(Char* urlP)
{
	INetLowInfoType	inetInfoBlock;
	Char*           tempHttp;
	Err				error = 0;	
	
	Int32           waitSecs  = 20;
    Int32           timeout   = waitSecs * SysTicksPerSecond();
	
	
	#define			UrlDefaultPrefix	     "http://"
	static	char*	UrlDefaultPrefixP      = UrlDefaultPrefix;
	#define			UrlDefaultPrefixCheckL	 7
	#define			UrlDefaultPrefixL	     sizeof(UrlDefaultPrefix) - 1	// -1 for zero ending

    //---------------------------------------------------------------
    // Initialize the inet information block:
    // Note: MemSet always returns 0, but perhaps it will someday
    //       return an error value.
    //---------------------------------------------------------------	
	error = MemSet(&inetInfoBlock, sizeof(inetInfoBlock), 0);								   

    //---------------------------------------------------------------
    // Get the library ref number from storage:
    //---------------------------------------------------------------
    error = INetInfo(&inetInfoBlock, "get");
    
        //-----------------------------------------------------------
        // Need to check for the case where the user didn't type in
        // the protocol:
        //-----------------------------------------------------------
		if (urlP && (StrNCompare( urlP, UrlDefaultPrefixP, UrlDefaultPrefixCheckL ) != 0))
		{
            //-------------------------------------------------------
			// Add "http://" at the start of the string:
            //-------------------------------------------------------
			tempHttp = MemPtrNew(sizeof(Char)*(StrLen(urlP)+8));
			StrNCopy(tempHttp, "http://",(StrLen(urlP)+7));
			StrCat(tempHttp, urlP);
			urlP = (Char*) tempHttp;
			MemPtrFree(tempHttp);
		}

        //-----------------------------------------------------------
        // Set the appropriate conversion algorithm:
        //-----------------------------------------------------------
		inetInfoBlock.inetLowConvAlgorithm = ctpConvNone;

        //-----------------------------------------------------------
        // Save the updated inetInfoBlock data:
        //-----------------------------------------------------------
        error = INetInfo(&inetInfoBlock, "set");            

        if (urlP)
        {
			//-----------------------------------------------------------
            // Initiate the request:
            //-----------------------------------------------------------
    		error = INetGo(urlP, timeout);
    			if (error)
    			{
                    //-------------------------------------------------------
    			    // Do something, like display a modal box:
                    //-------------------------------------------------------
    			    ;	
                }

		}
}

/***********************************************************************
 *
 * FUNCTION:    OpenURLOpenOrcancel
 *
 ***********************************************************************/
static Boolean OpenURLOpenOrcancel()
{
	FormPtr	PreviousForm = FrmGetActiveForm(); 	    // Return the currently active form.
	FormPtr	nextForm = FrmInitForm(OpenURLForm);	// Load and initialize a form resource. 
													// Returns a pointer to the form data structure.
													// Displays an error message if the form has already been initialized.
	UInt16  hitButton;
	UInt16  i;
	
	FieldPtr 		urlFldP = 0;
	Char*	 		urlP = "";
	
	Boolean			ok = false;


	FrmSetActiveForm(nextForm);
	
	//---------------------------------------------------------------
	// Put the cursor in the first text field:
	// Note: Nothing is returned - no errors, etc.
	//---------------------------------------------------------------
	FrmSetFocus(nextForm, FrmGetObjectIndex(nextForm, OpenURLNameOpenURLField));
	
	hitButton = FrmDoDialog(nextForm); // Display a modal dialog until the user taps a button in the dialog.
									   // Returns the resource ID of the button the user tapped.	

	if ( hitButton == OpenURLOpenButton )
	{
        //-----------------------------------------------------------
        // Get the input strings:
        // Note:  NULL is returned if the text fields are empty.
        //-----------------------------------------------------------
        ok = true;
        urlFldP = GetObjectPtr(OpenURLNameOpenURLField);
        urlP    = (Char*) FldGetTextPtr(urlFldP);
        
        //Keep present URL in URLRefresh for Reload
		for (i = 0; i < StrLen(urlP) ; i++ )
				urlRefresh[i] = urlP[i];
			urlRefresh[i] = '\0';
        
        CutUrl();

		//Move function(Thai:set value tang tang a) to URLStart
		URLStart(urlP);
	}
	if (PreviousForm)
		FrmSetActiveForm(PreviousForm);
	FrmEraseForm(nextForm);
    return ok;
}

/***********************************************************************
 *
 * FUNCTION:    AddURLSaveOrcancel
 *
 ***********************************************************************/
static void AddURLSaveOrcancel()
{
	FormPtr	PreviousForm = FrmGetActiveForm();
	FormPtr	nextForm = FrmInitForm(AddURLForm);
	
	UInt16		hitButton;
	UInt16		i;
	FieldPtr	fpName;
	Char*		locationTxt="";
	FieldPtr	fpLocation;
	Char*		nameTxt="";
	Char		name[20]="";
	Char		location[40]="";
	MemHandle	hdName;
	MemHandle   hdLocation;
	Boolean		emptyN	=	true;
	Boolean		emptyL	=	true;
	static UInt16	nameL;
	static UInt16   locationL;
	
	FrmSetActiveForm(nextForm);
	
	FrmSetFocus(nextForm, FrmGetObjectIndex(nextForm, AddURLNameField));
	
	hitButton = FrmDoDialog(nextForm);
	
	FrmSetFocus(nextForm, -1 );		//Turn off focus

	
	if ( hitButton == AddURLSaveButton )
	{
		fpName		=  GetObjectPtr(AddURLNameField);
		if(FldGetTextLength(fpName) > 0)
		{
			hdName	=	FldGetTextHandle(fpName);
			nameTxt =	MemHandleLock(hdName);
			MemHandleUnlock(hdName);
			for (i = 0; i < FldGetTextLength(fpName) ; i++ )
				name[i] = nameTxt[i];
			name[i] = '\0';
			nameL = FldGetTextLength(fpName);
			emptyN = false;
		}

		fpLocation	=  	GetObjectPtr(AddURLLocationField);
		if(FldGetTextLength(fpLocation) > 0)
		{
			hdLocation		=	FldGetTextHandle(fpLocation);
			locationTxt 	=	MemHandleLock(hdLocation);
			MemHandleUnlock(hdLocation);
			for (i = 0; i < FldGetTextLength(fpLocation) ; i++ )
				location[i] = locationTxt[i];
			location[i] = '\0';
			locationL = FldGetTextLength(fpLocation);
			emptyL = false;
		}
		
		if ((emptyN & emptyL) == true)
		{
			ShowMessage(DisplayAlert, "Error! ", "Both Fields ", "are Empty!");
		}
		else if (emptyN == true)
		{
			ShowMessage(DisplayAlert, "Error! ", "Name Field ", "is Empty!");
		}
		else if (emptyL == true)
		{
			ShowMessage(DisplayAlert, "Error! ", "Location Field ", "is Empty!");
		}
		else if((emptyN || emptyL) == false)
		{
			ShowMessage(DisplayAlert,name, " : ",location);
						
			NewRecord();
			WriteRecord(name,location, nameL, locationL);
		}
	}
		
	if (PreviousForm)
		FrmSetActiveForm(PreviousForm);
	FrmEraseForm(nextForm);
	return;

}

/***********************************************************************
 *
 * FUNCTION:    MainFormInit
 *
 * DESCRIPTION: This routine initializes the MainForm form.
 *
 * PARAMETERS:  nothing
 *
 * RETURNED:    nothing
 *
 ***********************************************************************/
 static void MainFormInit(FormPtr /*frmP*/)
 {
 }

/***********************************************************************
 *
 * FUNCTION:    MainFormDoCommand
 *
 * DESCRIPTION: This routine performs the menu command specified.
 *
 * PARAMETERS:  command  - menu item id
 *
 * RETURNED:    nothing
 *
 * REVISION HISTORY:
 *
 *
 ***********************************************************************/
static Boolean MainFormDoCommand(UInt16 command)
{
	Boolean handled = false;
	FormPtr frmP;	
	FormPtr delFrm;
   	UInt16  pFrm;

	switch (command)
		{
		case MainOptionsAboutPreWap:
			MenuEraseStatus(0);					// Clear the menu status from the display.
			frmP = FrmInitForm (AboutForm);
			FrmDoDialog (frmP);					// Display the About Box.
			FrmEraseForm (frmP);
			handled = true;
			break;

		case GoOpenURL:
			MenuEraseStatus(0);					// Clear the menu status from the display.
			if (OpenURLOpenOrcancel())			
			{
			}
			handled = true;
			break;

		case GoBack:
			if(NumF>1)
			{    
		        newPage = true;
		        CoGlobal[NumF]=CoStatic[NumF];
		        CcGlobal[NumF]=CcStatic[NumF];
				pFrm = FrmGetActiveFormID();
				delFrm = FrmGetFormPtr(pFrm	);
				FrmEraseForm(delFrm);
				--NumF;
				FrmSetActiveForm(dynaFrm[NumF]);
				FrmDrawForm(dynaFrm[NumF]);
				FrmSetEventHandler(dynaFrm[NumF], MainFormHandleEvent);
			}
			handled = true;
			break;

		case GoForward:
			if(NumF<EndNumF)
			{
				newPage = true;
		        CoGlobal[NumF]=CoStatic[NumF];
		        CcGlobal[NumF]=CcStatic[NumF];
   				pFrm = FrmGetActiveFormID();
				delFrm = FrmGetFormPtr(pFrm	);
				FrmEraseForm(delFrm);
				NumF++;				
				FrmSetActiveForm(dynaFrm[NumF]);
				FrmDrawForm(dynaFrm[NumF]);
 				FrmSetEventHandler(dynaFrm[NumF], MainFormHandleEvent);
			}
			handled = true;
			break;

		case GoStop:
			MenuEraseStatus(0);					// Clear the menu status from the display.
			// Work Stop
			handled = true;
			break;

		case GoReload:
			MenuEraseStatus(0);					// Clear the menu status from the display.
			// Work Reload
			ShowMessage(DisplayAlert,"Goto ", "URL : ", urlRefresh);
			if (StrLen(urlRefresh) > 0)
					URLStart(urlRefresh);
			handled = true;
			break;

		case GoDisconnect:
			MenuEraseStatus(0);					// Clear the menu status from the display.
			// Work Disconnect
			handled = true;
			break;

		case GoBookmarks:
			MenuEraseStatus(0);					// Clear the menu status from the display.
			backFormID = FrmGetActiveFormID();
			FrmGotoForm(BookmarksForm);
			handled = true;
			break;
		}
	return handled;
}

/***********************************************************************
 *
 * FUNCTION:    MainFormHandleEvent
 *
 * DESCRIPTION: This routine is the event handler for the 
 *              "MainForm" of this application.
 *
 * PARAMETERS:  eventP  - a pointer to an EventType structure
 *
 * RETURNED:    true if the event has handle and should not be passed
 *              to a higher level handler.
 *
 * REVISION HISTORY:
 *
 *
 ***********************************************************************/
Boolean MainFormHandleEvent(EventPtr eventP)
{
	FormPtr delFrm;
   	UInt16  pFrm;
   	UInt16  id;

   	Boolean handled = false;
   	FormPtr frmP	   = FrmGetActiveForm();

   	INetEventType*  	inetEventP	= (INetEventType *) eventP;
   	Char*		   		newTitleP	= MemPtrNew (sizeof(Char) * (MAX_FORM_TITLE_LENGTH + 1));
   	INetLowInfoType 	inetInfoBlock;
   	Err			   		error 		= 0;   
   
    static MemHandle   	responseBufH   = 0;
    Char*              	responseBufP   = 0;
	UInt32             	bytesRead      = 0;
    static UInt32      	totalBytesRead = 0;
    Int32              	waitSecs       = 20;
    Int32              	timeout        = waitSecs * SysTicksPerSecond();
    Boolean            	reset          = true;

   
    //---------------------------------------------------------------
    // Initialize the inet information block:
    // Note: MemSet always returns 0, but perhaps it will someday
    //       return an error value.
    //---------------------------------------------------------------	
	error = MemSet(&inetInfoBlock,
	               sizeof(inetInfoBlock),
	               0);

    //---------------------------------------------------------------
    // Initialize the new form title space:
    //---------------------------------------------------------------
    error = MemSet (newTitleP,
                    MAX_FORM_TITLE_LENGTH,
                    '\0');
    
    //---------------------------------------------------------------
    // Get the library ref number, inet handle, socket handle, and
    // LZ77 flags from storage:
    //---------------------------------------------------------------
    error = INetInfo(&inetInfoBlock,
                     "get");

	
	switch (eventP->eType) 
	{
		case menuEvent:
			return MainFormDoCommand(eventP->data.menu.itemID);

		case frmOpenEvent:
			MainFormInit( frmP);
			FrmDrawForm ( frmP);
			handled = true;
			break;

		case ctlSelectEvent:
			id = eventP->data.ctlSelect.controlID;
			switch(eventP->data.ctlSelect.controlID)
			{
				//UInt16	dynaFrmID;
				case MainBackGraphicButton:
					// Work Back
					if(NumF>1)
					{
						//UInt16	dynaFrmID;
				        newPage = true;
				        CoGlobal[NumF]=CoStatic[NumF];
				        CcGlobal[NumF]=CcStatic[NumF];
				        YGlobal2[NumF]=YGlobal[NumF];				        
						pFrm = FrmGetActiveFormID();
						delFrm = FrmGetFormPtr(pFrm	);
						FrmEraseForm(delFrm);
						--NumF;
						//dynaFrmID = FrmGetFormId(dynaFrm[NumF]);
						//FrmReturnToForm(dynaFrmID);
						FrmSetActiveForm(dynaFrm[NumF]);
						FrmDrawForm(dynaFrm[NumF]);
						//FrmPopupForm(dynaFrmID);
						FrmSetEventHandler(dynaFrm[NumF], MainFormHandleEvent);
					}
					handled = true;
					break;
				case MainForwardGraphicButton:
					// Work Forwards
					if(NumF<EndNumF)
					{ 
	   					newPage = true;
				        CoGlobal[NumF]=CoStatic[NumF];
				        CcGlobal[NumF]=CcStatic[NumF];
   				        YGlobal2[NumF]=YGlobal[NumF];				        
   						pFrm = FrmGetActiveFormID();
						delFrm = FrmGetFormPtr(pFrm	);
						FrmEraseForm(delFrm);
						NumF++;				
						FrmSetActiveForm(dynaFrm[NumF]);
						FrmDrawForm(dynaFrm[NumF]);
 						FrmSetEventHandler(dynaFrm[NumF], MainFormHandleEvent);
					}
					handled = true;
					break;
				case MainStopGraphicButton:
					// Work Stop
					handled = true;
					break;
				case MainBookmarksGraphicButton:
					MenuEraseStatus(0);					// Clear the menu status from the display.
					backFormID = FrmGetActiveFormID();
					FrmPopupForm(BookmarksForm);
					handled = true;
					break;
				case MainReloadGraphicButton:
					// Work Reload
					ShowMessage(DisplayAlert,"Goto ", "URL : ", urlRefresh);
					if (StrLen(urlRefresh) > 0)
						URLStart(urlRefresh);
					handled = true;
					break;
				case MainOpenURLGraphicButton:
					MenuEraseStatus(0);					// Clear the menu status from the display.
					if (OpenURLOpenOrcancel())
					{
					}
					handled = true;
					break;
				case MainButton:
					MainButtonFunc();
					handled = true;
					break;
				case TemButton:
					if(prev)
					{
						if(NumF>1)
						{
				        	newPage = true;
				        	CoGlobal[NumF]=CoStatic[NumF];
				        	CcGlobal[NumF]=CcStatic[NumF];
   					        YGlobal2[NumF]=YGlobal[NumF];				        
							pFrm = FrmGetActiveFormID();
							delFrm = FrmGetFormPtr(pFrm	);
							FrmEraseForm(delFrm);
							--NumF;
							FrmSetActiveForm(dynaFrm[NumF]);
							FrmDrawForm(dynaFrm[NumF]);
							FrmSetEventHandler(dynaFrm[NumF], MainFormHandleEvent);
						}	
					}						
					else
			 			MainButtonFunc();
			 		handled = true;
			 		break;		
				case UpButton:
				    if (YGlobal[NumF] > 160)
				    {
				    	if (CoGlobal[NumF] > CoStatic[NumF])
				    	{
						    CoGlobal[NumF] = CoGlobal[NumF] -3; 
							DrawPage2(CoGlobal[NumF], CcGlobal[NumF]);
						}
					}
					handled = true;
					break;
				case DownButton:
					if (YGlobal[NumF] > 160)
					{
						if ( YGlobal2[NumF] > 160)
						{
							CoGlobal[NumF] = CoGlobal[NumF] + 3;
							DrawPage2(CoGlobal[NumF], CcGlobal[NumF]);
							newPage = false;
						}
					}
					handled = true;
					break;
	 		
				default:
				{
					FindWAP(id);
					handled = true;
			 		break;
				}
			}
        case inetSockStatusChangeEvent:
            if(inetEventP->data.inetSockStatusChange.sockErr)
            {
                INetEndTransaction();
                ErrAlert(inetEventP->data.inetSockStatusChange.sockErr);
                handled = true;
                break;
            }
            else
            {
                switch (inetEventP->data.inetSockStatusChange.status)
                {
                    case inetStatusNew:
                        break;
    
                    case inetStatusResolvingName:
                    case inetStatusNameResolved:
                    case inetStatusConnecting:
                    case inetStatusConnected:
                    case inetStatusAcquiringNetwork:
						if (newTitleP)
                     	{
                            StrNCopy (newTitleP,
                                      "Connecting...",
                                      MAX_FORM_TITLE_LENGTH);
                            
                            //-------------------------------------------
                    	    // Pad any remaining space with spaces:
                            //-------------------------------------------
                            StrNCat (newTitleP, "                    ", MAX_FORM_TITLE_LENGTH + 1);
                            
                            //-------------------------------------------
                            // Copy the new title into the existing form title memory space:
                            //-------------------------------------------
                     	    FrmCopyTitle (frmP, newTitleP);
                   	    }
                   	    
                        break;
    
                    case inetStatusSendingRequest:
                        //-------------------------------------------
                        // It's OK if the title doesn't include the
                        // number of bytes sent, so if for some reason
                        // newTitle string isn't available we can skip
                        // the following:
                	    //-------------------------------------------
                    	if (newTitleP)
                    	{
                            //---------------------------------------
                            // newTitleP has space for 20 characters,
                            // so make sure you don't go out of bounds!
                            // The requestSize can max at 10 chars as
                            // it is an UInt32, and that leaves 10
                            // chars for others and NULL terminator.
                            //---------------------------------------
                            StrPrintF (newTitleP, "%s%lu%s", "Sending ", inetInfoBlock.requestSize, "B");
                            
                            //-------------------------------------------
                    	    // Pad any remaining space with spaces:
                            //-------------------------------------------
                            StrNCat (newTitleP, "                    ", MAX_FORM_TITLE_LENGTH + 1);
                            
                            //-------------------------------------------
                            // Copy the new title into the existing form title memory space:
                            //-------------------------------------------
                       	    FrmCopyTitle (frmP, newTitleP);
                        }
                   	    
                        break;
    
                    case inetStatusWaitingForResponse:
                      	if (newTitleP)
                     	{
                            StrNCopy (newTitleP, "Waiting...", MAX_FORM_TITLE_LENGTH);
                            
                            //-------------------------------------------
                    	    // Pad any remaining space with spaces:
                            //-------------------------------------------
                            StrNCat (newTitleP, "                    ", MAX_FORM_TITLE_LENGTH + 1);
                            
                            //-------------------------------------------
                            // Copy the new title into the existing form
                            // title memory space:
                            //-------------------------------------------
                     	    FrmCopyTitle (frmP, newTitleP);
                   	    }
                   	    
                        break;
   
                    case inetStatusReceivingResponse:
                        if (newTitleP)
                     	{
                            StrNCopy (newTitleP, "Receiving...", MAX_FORM_TITLE_LENGTH);
                            
                            //-------------------------------------------
                    	    // Pad any remaining space with spaces:
                            //-------------------------------------------
                            StrNCat (newTitleP, "                    ", MAX_FORM_TITLE_LENGTH + 1);
                            
                            //-------------------------------------------
                            // Copy the new title into the existing form title memory space:
                            //-------------------------------------------
                     	    FrmCopyTitle (frmP, newTitleP);
                   	    }
                   	    
                        break;
    
                	//-----------------------------------------------
                    // Because an inetSockReady event triggers the
                    // switch to the Response form, it is unlikely
                    // that the next 3 states will be reached while
                    // still in the Main form:
                	//-----------------------------------------------
                    case inetStatusResponseReceived:
                     	if (newTitleP)
                     	{
                            StrNCopy (newTitleP, "Received data", MAX_FORM_TITLE_LENGTH);
                            
                            //-------------------------------------------
                    	    // Pad any remaining space with spaces:
                            //-------------------------------------------
                            StrNCat (newTitleP, "                    ", MAX_FORM_TITLE_LENGTH + 1);
                            
                            //-------------------------------------------
                            // Copy the new title into the existing form title memory space:
                            //-------------------------------------------
                     	    FrmCopyTitle (frmP, newTitleP);
                   	    }

                        break;

                    case inetStatusClosingConnection:
                        break;
    
                    case inetStatusClosed:
                        INetEndTransaction();
                        break;
                                            
                    case inetStatusPrvInvalid:
                        break;

                    default:
                        break;
                }
            }

            handled = true;
            break;
       
        //---------------------------------------------------------------
    	// Get and display socket data:
    	//---------------------------------------------------------------
        case inetSockReadyEvent:
        	//-----------------------------------------------------------
        	// Get the inet socket handle from storage:
        	//-----------------------------------------------------------
            error = INetInfo(&inetInfoBlock, "get");

            if (!error && inetInfoBlock.inetSockH &&
                inetEventP->data.inetSockReady.sockH == inetInfoBlock.inetSockH &&
                inetEventP->data.inetSockReady.inputReady)
			{
            	//-------------------------------------------------------
                // Assign memory for the response buffer if it has not
                // already been assigned:
                // Note: I chose to use a static variable for the buffer
                //       in order to avoid system global variables.
            	//-------------------------------------------------------
                if (!responseBufH)
                    responseBufH = MemHandleNew(MAX_RESPONSE_SIZE);
            
                //-------------------------------------------------------
			    // Set bytesRead to total bytes read in this transaction,
			    // so that GetDataFromSocket() can use the info as an
			    // offset value to avoid overwriting previously retrieved
			    // data:
                //-------------------------------------------------------
			    bytesRead = totalBytesRead;
			    
                //-------------------------------------------------------
                // Retrieve the response data from the socket:
                //-------------------------------------------------------
        		error = GetDataFromSocket(responseBufH,
        		                          &bytesRead,
        		                          MAX_RESPONSE_SIZE - totalBytesRead,
        		                          timeout);
                    
                if ((totalBytesRead += bytesRead) >= MAX_RESPONSE_SIZE)
                {
                    //---------------------------------------------------
                    // Resize the handle? Store the retrieved data and
                    // retrieve the next data? ...  I'll just error out
                    // for now.
                    //---------------------------------------------------
                    error = inetErrBufTooSmall;
                }
        		else if (!error && bytesRead == 0)
        		{
                    //---------------------------------------------------
                    // Check to see if anything was read:
                    //---------------------------------------------------
					if (totalBytesRead == 0)
					{
						error = inetErrNilBuffer;
					}

                    //---------------------------------------------------
                    // Now we should be ready to display the response
                    // data on the screen:
                    //---------------------------------------------------
					if (!error)
					{
            		    //-----------------------------------------------
            		    // Ensure data buffer is null terminated:
            		    //-----------------------------------------------
            		    responseBufP  = MemHandleLock(responseBufH);
            		    responseBufP += totalBytesRead;
            		    *responseBufP = NULL;
            		    MemHandleUnlock(responseBufH);


                	    //-----------------------------------------------
                        // We can use this oportunity to show the total
                        // number of bytes received in the title:
                    	//-----------------------------------------------
                        if (newTitleP)
                        {
                            //-------------------------------------------
                            // newTitleP has space for 20 characters
                            // (given max of 10 chars "possible" for
                            //  RSSIValue - UInt32 val -, that
                            //  leaves 10 for others and a NULL
                            //  terminator). Make sure you don't
                            // go out of bounds! :-)
                            //-------------------------------------------
                            StrPrintF(newTitleP, "%li%s", totalBytesRead, "B recv'd");
                    	    
                            //-------------------------------------------
                    	    // Pad any remaining space with spaces:
                            //-------------------------------------------
                            StrNCat (newTitleP, "                    ", MAX_FORM_TITLE_LENGTH + 1);
                            
                            //-------------------------------------------
                            // Copy the new title into the existing form title memory space:
                            //-------------------------------------------
                            FrmCopyTitle (frmP, newTitleP);
                        }
                        
                        if (newTitleP)
                     	{
                            StrNCopy (newTitleP, "Olala  Wap   ", MAX_FORM_TITLE_LENGTH);
                            
                            //-------------------------------------------
                    	    // Pad any remaining space with spaces:
                            //-------------------------------------------
                            StrNCat (newTitleP, "                    ", MAX_FORM_TITLE_LENGTH + 1);
                            
                            //-------------------------------------------
                            // Copy the new title into the existing form title memory space:
                            //-------------------------------------------
                     	    FrmCopyTitle (frmP, newTitleP);
                   	    }

						FrmEraseForm(dynaFrm[NumF]);
                        MainOKButtonFunc(responseBufH);
                        
                        //-----------------------------------------------
                        // Since the totalBytesRead is a static variable,
                        // we should re-initialize it for later use:
                        //-----------------------------------------------
                        totalBytesRead = 0;
    
                        //-----------------------------------------------
                        // Note: I need to allow the closing of the Response
                        //       form that is displaying this data to free
                        //       the handle, but since responseBufH is
                        //       static, I need to set it to zero to ensure
                        //       that a Free Handle error doesn't occur
                        //       should more inetSockReady events occur
                        //       after the form is closed. More
                        //       inetSockStatusReady events should only
                        //       occur if the Respose form was closed and the
                        //       Get It button was tapped again from the Main
                        //       form; if not, a new handle will be allocated
                        //       and the DisplayData function will free the 
                        //       previous handle anyway.  There could be a
                        //       memory crunch because of this, so a better
                        //       method might be worth looking for.
                        //-----------------------------------------------
                        responseBufH = 0;
    
                    	//-----------------------------------------------
                        // Ensure the socket isn't left open as only 4
                        // max are available:
                        // Note: The end of data is indicated by a return
                        //       of zero bytes read from the socket.
                    	//-----------------------------------------------                  
                        INetEndTransaction();                        
                    }
                }
                
        		handled = true;
    		}
    		break;
        
		default:
			break;
		
    }

    //-------------------------------------------------------------------
    // Free the allocated newTitle memory as we don't need it anymore:
    // Note: newTitleP is used only as a temporary string and contents 
    //       are copied to existing form title memory using FrmCopyTitle.
    //-------------------------------------------------------------------
    if (newTitleP)
        MemPtrFree(newTitleP);

	return handled;
}  // End MainFormHandleEvent(EventPtr)

/***********************************************************************
 *
 * FUNCTION:    BookmarksFormHandleEvent
 *
 * DESCRIPTION: This routine is the event handler for the 
 *              "MainForm" of this application.
 *
 * PARAMETERS:  eventP  - a pointer to an EventType structure
 *
 * RETURNED:    true if the event has handle and should not be passed
 *              to a higher level handler.
 *
 * REVISION HISTORY:
 *
 *
 ***********************************************************************/
static Boolean BookmarksFormHandleEvent(EventPtr eventP)
{
   Boolean handled = false;
   FormPtr frmP;

	switch (eventP->eType) 
	{
		case frmOpenEvent:
			frmP = FrmGetActiveForm();
			FrmDrawForm ( frmP);
			if (numRecords > 0)
			{
				BuildListBm();
			}
			handled = true;
			break;

		case ctlSelectEvent:
			switch(eventP->data.ctlSelect.controlID)
			{
				case BookmarksGotoButton:
					if (choose)
					{
						Char*			recordP;	// A record pointer
						UInt16			i;
						
						recordH = DmQueryRecord( BmDb, cursor );
						recordP = MemHandleLock( recordH );
						frmP = FrmInitForm(BookmarksForm);
						if (numRecords > 0)
						{
						MemHandleUnlock( choicesHP );
						MemHandleFree( choicesHP );
						MemHandleUnlock( choicesH );
						MemHandleFree( choicesH );
						choicesH = 0;
						}

				        //Keep present URL in URLRefresh for Reload
						for (i = 0; i < StrLen(recordP + DB_LOCATION_START) ; i++ )
							urlRefresh[i] = (recordP + DB_LOCATION_START)[i];
						urlRefresh[i] = '\0';

						CutUrl();
						
						//FrmEraseForm(dynaFrm[NumF]);
						URLStart(recordP + DB_LOCATION_START);
						
						choose = false;
						FrmReturnToForm (backFormID);
					}
					else
					{
						ShowMessage(DisplayAlert, "Please", " Choose ", "Bookmarks' list");
					}
					handled = true;
					break;
				case BookmarksNewButton:
					AddURLSaveOrcancel();
					if (numRecords > 0)
					{
						BuildListBm();
					}
					handled = true;
					break;
				case BookmarksDelButton:
					if (choose)
					{
						if (numRecords > 0)
						{
							DeleteBm();
						}
						if (numRecords > 0)
						{
							BuildListBm();
						}
						else if (numRecords == 0)
						{	
							ListPtr		listP;
						
							listP = (ListPtr) GetObjectPtr (BookmarksUrlListList);
							// Set the list choices
							LstSetListChoices( listP, NULL, numRecords );
							// Draw the list
							LstDrawList( listP);
						}
					}
					else if (numRecords != 0)
					{
						ShowMessage(DisplayAlert, "Please", " Choose ", "Bookmarks' list");
					}
					choose = false;
					handled = true;
					break;
				case BookmarksExitButton:
					if (numRecords > 0)
					{
						MemHandleUnlock( choicesHP );
						MemHandleFree( choicesHP );
						MemHandleUnlock( choicesH );
						MemHandleFree( choicesH );
						choicesH = 0;
					}
					FrmReturnToForm(backFormID);
					handled = true;
					break;
/*				case BookmarksDbButton:
					FrmGotoForm(DatabaseForm);
					handled = true;
					break;*/

			}
			
			handled = true;
			break;
		case lstSelectEvent:
			{
				Char*			recordP;	// A record pointer

				cursor = eventP->data.lstSelect.selection;
				choose = true;
				recordH = DmQueryRecord( BmDb, cursor );
				recordP = MemHandleLock( recordH );
				// set label SelectTrigger Control
				CtlSetLabel(GetObjectPtr(BookmarksShowSelTrigger), recordP + DB_LOCATION_START);
			}
			handled = true;
			break;
		
		default:
			break;
		
	}
	
	return handled;
}

/***********************************************************************
 *
 * FUNCTION:    AppHandleEvent
 *
 * DESCRIPTION: This routine loads form resources and set the event
 *              handler for the form loaded.
 *
 * PARAMETERS:  event  - a pointer to an EventType structure
 *
 * RETURNED:    true if the event has handle and should not be passed
 *              to a higher level handler.
 *
 * REVISION HISTORY:
 *
 *
 ***********************************************************************/
static Boolean AppHandleEvent(EventPtr eventP)
{
	UInt16 formId;
	FormPtr frmP;

	if (eventP->eType == frmLoadEvent)
		{
		// Load the form resource.
		formId = eventP->data.frmLoad.formID;
		frmP = FrmInitForm(formId);
		FrmSetActiveForm(frmP);

		// Set the event handler for the form.  The handler of the currently
		// active form is called by FrmHandleEvent each time is receives an
		// event.
		switch (formId)
			{
			case MainForm:
				FrmSetEventHandler(frmP, MainFormHandleEvent);
				break;

			case BookmarksForm:
				FrmSetEventHandler(frmP, BookmarksFormHandleEvent);
				break;
				
/*			case DatabaseForm:
				FrmSetEventHandler(frmP, DatabaseFormHandleEvent);
				break;*/
 
			default:
				ErrFatalDisplay("Invalid Form Load Event");
				break;

			}
		return true;
		}
	
	return false;
}



/***********************************************************************
 *
 * FUNCTION:    AppEventLoop
 *
 * DESCRIPTION: This routine is the event loop for the application.  
 *
 * PARAMETERS:  nothing
 *
 * RETURNED:    nothing
 *
 ***********************************************************************/
static void AppEventLoop(void)
{
	UInt16          error         = 0;
	EventType       event;
    INetLowInfoType inetInfoBlock;


    //---------------------------------------------------------------
    // Initialize the inet information block:
    // Note: MemSet always returns 0, but perhaps it will someday
    //       return an error value.
    //---------------------------------------------------------------	
	error = MemSet(&inetInfoBlock,
	               sizeof(inetInfoBlock),
	               0);

	//-------------------------------------------------------------------
	// Retrieve the stored INet info:
	//-------------------------------------------------------------------
    error = INetInfo(&inetInfoBlock,
                     "get");
 
    if (!error &&
        inetInfoBlock.inetRefNum &&
        inetInfoBlock.inetHan)
    {
    	//---------------------------------------------------------------
    	// Loop until the application is exited:
    	//---------------------------------------------------------------
    	do {
        	//-----------------------------------------------------------
        	// Same as EvtGetEvent, but with extra INet events included.
        	//   Two additional events handled by INetLibGetEvent are:
        	//     inetSockReadyEvent
        	//     inetSockStatusChangeEvent
        	//
        	// Note: If the inetH value is NULL, INetLibGetEvent functions
        	//       as EvtGetEvent.
        	//-----------------------------------------------------------
    		INetLibGetEvent(inetInfoBlock.inetRefNum,
    		                inetInfoBlock.inetHan,
    		                (INetEventType*)&event,
    		                evtWaitForever);
    		
    		if (! SysHandleEvent(&event))
    			if (! MenuHandleEvent(0, &event, &error))
    				if (! AppHandleEvent(&event))
    					FrmDispatchEvent(&event);
                        
    	} while (event.eType != appStopEvent);
    }
	
	return;
}   // End of AppEventLoop(void)


/***********************************************************************
 *
 * FUNCTION:     AppStart
 *
 * DESCRIPTION:  Get the current application's preferences.
 *
 * PARAMETERS:   nothing
 *
 * RETURNED:     Err value 0 if nothing went wrong
 *
 ***********************************************************************/
static Err AppStart(void)
{
    Err error = 0;

	//-------------------------------------------------------------------
	// Open and initialize INetLib library if loaded:
	//-------------------------------------------------------------------
	if (!error)
        error = INetStart();

	OpenCreateDatabase();

   return error;
}   // End AppStart(void)


/***********************************************************************
 *
 * FUNCTION:    AppStop
 *
 * DESCRIPTION: Save the current state of the application and general
 *              clean-up, like ensuring all forms are closed.
 *
 * PARAMETERS:  nothing
 *
 * RETURNED:    0 if all went well, otherwise ...
 *
 ***********************************************************************/
static Err AppStop(void)
{
    Err	error = 0;

	//-------------------------------------------------------------------
	// Clean-up and close INetLib:
	//-------------------------------------------------------------------
    error = INetEnd();

	//-------------------------------------------------------------------
	// Ensure there are no forms left open:
	// Note:  Nothing is returned - no errors, etc.
	//-------------------------------------------------------------------
    FrmCloseAllForms();
    
 	DmCloseDatabase(BmDb);
 	
    return error;
}   // End AppStop(void)

/***********************************************************************
 *
 * FUNCTION:    PilotMain
 *
 * DESCRIPTION: This is the main entry point for the application.
 *
 * PARAMETERS:  cmd - word value specifying the launch code. 
 *              cmdPB - pointer to a structure that is associated with the launch code. 
 *              launchFlags -  word value providing extra information about the launch.
 * RETURNED:    Result of launch
 *
 * REVISION HISTORY:
 *
 *
 ***********************************************************************/
UInt32 PilotMain( UInt16 cmd, MemPtr cmdPBP, UInt16 launchFlags)
{
 	Err error = 0;

    
	error = RomVersionCompatible(ourMinVersion, launchFlags);
	if (error)
	    return error;

	switch (cmd)
		{
		case sysAppLaunchCmdNormalLaunch:
			error = AppStart();
			if (error) 
				return error;
			
			FrmGotoForm(MainForm);
			
			AppEventLoop();
			AppStop();
			break;

		default:
			break;

		}
	
	return 0;

}	 // End of PilotMain(UInt16,MemPtr,UInt16)



