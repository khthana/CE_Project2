/***********************************************************************
 *
 * PROJECT:     PreWap	
 * FILE:        PreWap.h
 *
 * DESCRIPTION: PreWap.h contains the constants and prototypes for the 
 *              functions in PreWap.c, which are used to present text 
 *              fields for inputing a URL and any POST data for that URL,
 *              then retrieve and display the response.
 *
 **********************************************************************/
 
#ifndef PREWAP_H
#define PREWAP_H


/***********************************************************************
 *
 *   Internal Structures
 *
 ***********************************************************************/

typedef struct
{
    UInt16     inetRefNum;
    MemHandle  inetHan;
    MemHandle  inetSockH;
    UInt32     downloadSize;
    UInt32     requestSize;
    UInt32     inetLowConvAlgorithm;
    UInt16     cfgIndex;
} INetLowInfoType;

typedef INetLowInfoType* INetLowInfoPtr;

/***********************************************************************
 *
 *   Internal Constants
 *
 ***********************************************************************/
#define appFileCreator              'WPCE'
#define appVersionNum               0x01
#define appPrefID                   0x00
#define appPrefVersionNum           0x01


// Max size for the data sent from a server in response to the request:
#define MAX_RESPONSE_SIZE			8192


// I know that the main and response form titles have memory for 20
// characters.
#define MAX_FORM_TITLE_LENGTH       15


// Define the minimum OS version we support
#define ourMinVersion	sysMakeROMVersion(3,2,0,sysROMStageRelease,0)


// Define a message type for passing messages to the INetInfo function:
typedef enum {MESG_GET = 1, MESG_SET, MESG_INVALID} Mesg;



/***********************************************************************
 *
 *   Internal Function Prototypes
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
void CutUrl();

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
static void DeleteBm();

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
static void BuildListBm ( void );

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
static void SetText( FieldPtr field, Char* text );

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
static void SetFields( void );

/***********************************************************************
 *
 * FUNCTION:    DatabaseFormHandleEvent
 *
 ***********************************************************************/
static Boolean DatabaseFormHandleEvent(EventPtr eventP);

/***********************************************************************
 *
 * FUNCTION:    WriteRecord
 *
 ***********************************************************************/
static void WriteRecord(Char* n,Char* l, UInt16 nL, UInt16 lL);

/***********************************************************************
 *
 * FUNCTION:    NewRecord
 *
 ***********************************************************************/
static void NewRecord( void );

/***********************************************************************
 *
 * FUNCTION:    OpenCreateDatabase
 *
 ***********************************************************************/
static Err OpenCreateDatabase();

/***********************************************************************
 *
 * FUNCTION:    ResolveMessage
 *
 * DESCRIPTION: This routine resolves a character string message into
 *              one of the message constants.  Note: perhaps it is 
 *              unnecessary, but at the time I thought it nice to enter
 *              a character string instead of a constant as an argument
 *              to INetInfo().
 * PARAMETERS:  message - a character string message or command.
 * RETURNED:    message constant corresponding to the character string
 *              message.
 ***********************************************************************/
static Mesg ResolveMessage(Char* message);

/***********************************************************************
 *
 * FUNCTION:    INetStart
 *
 * DESCRIPTION: This routine starts and initializes the INetLib, after 
 *              first checking for the presence of INetLib.
 * PARAMETERS:  none
 * RETURNED:    An error or 0 if all went well.
 *
 ***********************************************************************/
static Err INetStart(void);


/***********************************************************************
 *
 * FUNCTION:    INetInit
 *
 * DESCRIPTION: This routine is used to initialize the INetLib opened by 
 *              INetLibOpen.
 * PARAMETERS:  libRefNum            - The INetLib reference number.
 *              inetHP               - Pointer to the INetLib handle.
 *              cfgIndex             - Index of current configuration
 *                                     in the configuration list.
 * RETURNED:    A value of 0 if all went well.
 *
 ***********************************************************************/
static Err INetInit(UInt16     libRefNum,
                    MemHandle* inetHP,
                    UInt16     cfgIndex);

/***********************************************************************
 *
 * FUNCTION:    INetInfo
 *
 * DESCRIPTION: This routine is used to retain the INetLib handle and
 *              reference number provided by INetLibOpen, the socket
 *              handle provided by INetLibSockOpen, and various other
 *              info related to use of the INetLib.
 * PARAMETERS:  Note: A zero (0) or NULL argument means not to perform the
 *                    requested action on that datum.
 *
 *              inetInfoP  - Pointer to a structure holding the INetLow
 *                           information, such as the INetLib reference
 *                           number, INetLib handle, INetLib socket
 *                           handle, etc.
 *              message    - The message by which the action to take is
 *                           determined.  Accepted messages:
 *                              get
 *                              set
 * RETURNED:    An error or 0 if all went well.
 *
 ***********************************************************************/
static Err INetInfo(INetLowInfoPtr  inetInfoP,
                    Char*           message);

/***********************************************************************
 *
 * FUNCTION:    INetGo
 *
 * DESCRIPTION: This routine performs the primary connection function for
 *              sending a request.
 * PARAMETERS:  Note: A zero (0) or NULL argument means not to perform the
 *                    requested action on that datum.
 *
 *              urlP     - Pointer to the URL string to use for sending
 *                         a request.
 *              dataP    - Pointer to any data to be included as part of 
 *                         the POST body.
 *              timeout  - The time in seconds to wait for a response
 *                         before giving up.
 * RETURNED:    An error, or 0 if all went well.
 *
 ***********************************************************************/
static Err INetGo(Char* urlP,
                  Int32 timeout);

/***********************************************************************
 *
 * FUNCTION:    INetEndTransaction
 *
 * DESCRIPTION: Perform any necessary clean-up and close the socket.
 *              (not much done here except calling INetLibSockClose, but
 *               I thought it might be nice to separate it further in
 *               case something more is desired)
 * PARAMETERS:  nothing
 * RETURNED:    0 for no error, otherwise ...
 *
 ***********************************************************************/
static Err INetEndTransaction(void);

/***********************************************************************
 *
 * FUNCTION:    INetEnd
 *
 * DESCRIPTION: Perform any necessary clean-up and close the INetLib.
 *              (not much done here except calling INetClose, but I
 *               thought it might be nice to separate it further in
 *               case something more related to INetLib is desired)
 * PARAMETERS:  none
 * RETURNED:    none
 *
 ***********************************************************************/
static Err INetEnd(void);

/***********************************************************************
 *
 * FUNCTION:    GetDataFromSocket
 *
 * DESCRIPTION: This routine extracts data from a socket
 * PARAMETERS:  responseBufH  - the handle of the buffer to store the  
 *                              retreived data in.
 *              bytesRead     - the variable to be set with the total 
 *                              number of bytes read during this socket
 *                              read.
 *              reqestedBytes - total bytes to retrieve.
 *              timeout       - the timeout in clock ticks before giving
 *                              up waiting for data from the socket.
 * RETURNED:    Err or 0 if all went well.
 *
 ***********************************************************************/
static Err GetDataFromSocket(MemHandle responseBufH,
                             UInt32*   bytesRead,
                             UInt32    reqestedBytes,
                             Int32     timeout);

/***********************************************************************
 *
 * FUNCTION:    DisplayData
 *
 * DESCRIPTION: This routine displays data from a buffer
 * PARAMETERS:  fieldID      - the ID value of the field to display the
 *                             data in.
 *              responseBufH - handle of the buffer containing the data
 *                             to display.
 *              reset        - true if you want the text field cleared
 *                             before you display the passed data.
 * RETURNED:    Err
 *
 ***********************************************************************/
static Err DisplayData(UInt16    fieldID,
                       MemHandle responseBufH,
                       Boolean   reset);

/***********************************************************************
 *
 * FUNCTION:    ResponseFormInit
 *
 * DESCRIPTION: This routine initializes the ResponseForm form.
 * PARAMETERS:  none
 * RETURNED:    none
 *
 ***********************************************************************/
static void ResponseFormInit(void);

/***********************************************************************
 *
 * FUNCTION:    ResponseFormHandleEvent
 * DESCRIPTION: This routine is the event handler for the 
 *              "ResponseForm" of this application.
 * PARAMETERS:  eventP  - a pointer to an EventType structure
 * RETURNED:    true if the event has handle and should not be passed
 *              to a higher level handler.
 *
 ***********************************************************************/
static Boolean ResponseFormHandleEvent(EventPtr eventP);

/***********************************************************************
 *
 * FUNCTION:    ResponseFormDoCommand
 * DESCRIPTION: This routine performs the command specified.
 * PARAMETERS:  command  - command id
 * RETURNED:    true if the event has handle and should not be passed
 *              to a higher level handler.
 *
 ***********************************************************************/
static Boolean ResponseFormDoCommand(UInt16  command);

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
static Err RomVersionCompatible(UInt32 requiredVersion, UInt16 launchFlags);

/***********************************************************************
 *
 * FUNCTION:    URLStart
 *
 ***********************************************************************/
void URLStart(Char* urlP);

/***********************************************************************
 *
 * FUNCTION:    OpenURLOpenOrcancel
 *
 ***********************************************************************/
static Boolean OpenURLOpenOrcancel();

/***********************************************************************
 *
 * FUNCTION:    AddURLSaveOrcancel
 *
 ***********************************************************************/
static void AddURLSaveOrcancel();

/***********************************************************************
 *
 * FUNCTION:    MainFormInit
 * DESCRIPTION: This routine initializes the MainForm form.
 * PARAMETERS:  nothing
 * RETURNED:    nothing
 *
 ***********************************************************************/
static void MainFormInit(FormPtr /*frmP*/);

/***********************************************************************
 *
 * FUNCTION:    MainFormHandleEvent
 * DESCRIPTION: This routine is the event handler for the 
 *              "MainForm" of this application.
 * PARAMETERS:  eventP  - a pointer to an EventType structure
 * RETURNED:    true if the event has handle and should not be passed
 *              to a higher level handler.
 *
 ***********************************************************************/
Boolean MainFormHandleEvent(EventPtr eventP);

/***********************************************************************
 *
 * FUNCTION:    MainFormDoCommand
 * DESCRIPTION: This routine performs the command specified.
 * PARAMETERS:  command  - command id
 * RETURNED:    true if the event has handle and should not be passed
 *              to a higher level handler.
 *
 ***********************************************************************/
static Boolean MainFormDoCommand(UInt16  command);

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
static Boolean BookmarksFormHandleEvent(EventPtr eventP);

/***********************************************************************
 *
 * FUNCTION:    AppHandleEvent
 * DESCRIPTION: This routine loads form resources and set the event
 *              handler for the form loaded.
 * PARAMETERS:  event  - a pointer to an EventType structure
 * RETURNED:    true if the event has handle and should not be passed
 *              to a higher level handler.
 *
 ***********************************************************************/
static Boolean AppHandleEvent( EventPtr eventP );

/***********************************************************************
 *
 * FUNCTION:    AppEventLoop
 * DESCRIPTION: This routine is the event loop for the application.  
 * PARAMETERS:  nothing
 * RETURNED:    nothing
 *
 ***********************************************************************/
static void AppEventLoop(void);

/***********************************************************************
 *
 * FUNCTION:     AppStart
 * DESCRIPTION:  Get the current application's preferences.
 * PARAMETERS:   nothing
 * RETURNED:     Err value 0 if nothing went wrong
 *
 ***********************************************************************/
static Err AppStart(void);

/***********************************************************************
 *
 * FUNCTION:    AppStop
 * DESCRIPTION: Save the current state of the application and general
 *              clean-up, like ensuring all forms are closed.
 * PARAMETERS:  nothing
 * RETURNED:    0 if all went well, otherwise ...
 *
 ***********************************************************************/
static Err AppStop(void);

/***********************************************************************
 *
 * FUNCTION:    PilotMain
 * DESCRIPTION: This is the main entry point for the application.
 * PARAMETERS:  cmd         - word value specifying the launch code. 
 *              cmdPB       - pointer to a structure that is associated
 *                            with the launch code. 
 *              launchFlags - word value providing extra information about
 *                            the launch.
 * RETURNED:    Result of launch
 *
 ***********************************************************************/
UInt32 PilotMain(UInt16 cmd,
                 MemPtr cmdPBP,
                 UInt16 launchFlags);


#endif

/***********************************************************************
 *
 *   END INetLow.h
 *
 ***********************************************************************/