
#include <windows.h>
#include <tapi3.h>
#include <strmif.h>
#include <mmsystem.h>
#include <uuids.h>

#include "callnot.h"
#include "resource.h"
#include "resrc1.h"

//winsock
#define MY_MSG_LENGTH       80  /* msg buffer sent back and forth   */
#define NO_FLAGS_SET         0  /* Used with recv()/send()          */
#define MAX_PENDING_CONNECTS 4  /* The backlog allowed for listen() */

//call list timeout interval
#define CALLTIMEOUT			10

//call timeup
#define CALLTIMEUP			25

//call retry
#define CALLRETRY			3

//time
#include <time.h>

//db
#include <stdio.h>
#include <iostream.h>
#import "c:\Program Files\Common Files\System\ADO\msado15.dll" \
no_namespace rename("EOF", "EndOfFile")

//TTS
#include <sapi.h>           // SAPI includes
#include <sphelper.h>

//////////////////////////////////////////////////////////
// constants
//////////////////////////////////////////////////////////

const DWORD MAXTERMINALS    = 5;

//outgoing
const DWORD ADDRESSLENGTH   = 128;

//////////////////////////////////////////////////////////
// GLOBALS
//////////////////////////////////////////////////////////

bool g_fPlay;
bool g_fRecord;

HINSTANCE               ghInst;
ITTAPI *                gpTapi;
ITBasicCallControl *    gpCall = NULL;
HWND                    ghDlg = NULL;
ITStream                *g_pRecordStream = NULL;
ITTerminal              *g_pPlayMedStrmTerm = NULL, *g_pRecordMedStrmTerm = NULL;

TCHAR gszTapi30[] = TEXT("TAPI 3.0 Answering Machine Sample");

CTAPIEventNotification      * gpTAPIEventNotification;
ULONG                         gulAdvise;

//winsock
SOCKET sock;

//Outgoing
ITAddress *             gpAddress = NULL;

//time
char timenow[19];
int s_day,s_mon,s_yr,s_hr,s_min,s_sec;
int timeup; //second before hang up the phone

//collect money
int counter;
double callrate,money;
bool timemeter = false;

//DTMF
bool pdigit = false;

//operation
long credit=0;
long maxfilename=0;
long maxtimestamped=0;
bool callnow = false, callingnow = false;
WCHAR g_wszReadFileName[11];
int step = 0;

//DB
int p_yr,p_mon,p_day,p_hr,p_min,p_id,p_retry,p_ts,p_credit,p_uid;
PWCHAR p_tel,p_file; //just temporary variable
WCHAR pp_tel[10],pp_file[10]; //use these globally
char p_user[10]; 

//TTS
CComPtr<ISpVoice>   m_cpVoice;
CComPtr<ISpAudio>   m_cpOutAudio;
char tts[200];

//////////////////////////////////////////////////////////
// PROTOTYPES
//////////////////////////////////////////////////////////
BOOL
CALLBACK
MainDialogProc(
               HWND hDlg,
               UINT uMsg,
               WPARAM wParam,
               LPARAM lParam
              );

HRESULT
GetTerminal(
            ITAddress *,
            BSTR bstrMedia,
            ITTerminal ** ppTerminal
           );
HRESULT
RegisterTapiEventInterface();

HRESULT
ListenOnAddresses();

HRESULT
ListenOnThisAddress(
                    ITAddress * pAddress
                   );

HRESULT
AnswerTheCall();

HRESULT
DisconnectTheCall();

void
ReleaseTheCall();

void
DoMessage(
          LPTSTR pszMessage
         );

void
SetStatusMessage(
                 LPTSTR pszMessage
                );

HRESULT
InitializeTapi();

void
ShutdownTapi();

//
// Telephone quality audio.
//
WAVEFORMATEX gwfx = {WAVE_FORMAT_PCM, 1, 8000, 16000, 2, 16, 0};

//winsock
BOOL FillAddr(
        HWND hWnd,
        PSOCKADDR_IN psin,
        BOOL bClient);

//outgoing
void
InitAddressTypeComboBox(
    HWND hComboBox
    );

HRESULT
MakeTheCall(
            DWORD dwAddressType,
            PWCHAR szAddressToCall
           );

HRESULT
FindAnAddress(
              DWORD dwAddressType,
              BSTR  * ppName
             );

BOOL
AddressSupportsMediaType(
                         ITAddress * pAddress,
                         long        lMediaType
                        );

HRESULT
SelectTerminalsOnCall(
                     ITBasicCallControl * pCall
                     );

HRESULT
GetTerminal(
            ITStream * pStream,
            ITTerminal ** ppTerminal
           );
//play
HRESULT
SelectMediaTerminal();

//DB
bool
GetLogin(char username[11],char password[11]);

void
GetMaxFilename();

void
GetMaxTimeStamped();

bool
PutListDB(char username[11],char tel[8],char day[3],char mon[3],char yr[5],char hr[3],char min[3]);

long
GetUserID(char username[]);

bool
CheckUser(char username[]);

bool
CheckCard(char cardno[]);

bool
UpdateCard(char cardno[]);

long
CreditCard(char cardno[]);

bool
UpdateUser(char username[],char password[],long cardvalue,char email[]);

bool
ActivateCard(char username[],char cardno[]);

bool
AddCredit(char username[],long cardvalue);

void 
UpdateTimeout(int id);

void 
UpdateSuccess(int id);

void
GetNextCall();

void
UpdateNextCall(int id);

double
GetCallRate();

void
GetCredit();

void
GetList(char username[11]);

void
GetUsername(int p_uid);

//TTS
void 
SpeakToFile();

void 
HandleSpeak();

//////////////////////////////////////////////////////////
//
//              FUNCTIONS
//
//////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////
// WinMain
//////////////////////////////////////////////////////////
int
WINAPI
WinMain(
        HINSTANCE hInst,
        HINSTANCE hPrevInst,
        LPSTR lpCmdLine,
        int nCmdShow
       )
{
    g_fPlay   = true;
    g_fRecord = false;

    ghInst = hInst;
    
    // need to coinit
    if (!SUCCEEDED(CoInitializeEx(NULL, COINIT_MULTITHREADED)))
    {
        return 0;
    }
    
    // do all tapi initialization
    if (S_OK != InitializeTapi())
    {
        return 0;
    }

	//get server time
	time_t tnow;
	struct tm *tmnow;
	time(&tnow);
	tmnow = localtime(&tnow);
	
	s_sec = tmnow->tm_sec;  /* seconds after the min - [0.59] */
	s_min = tmnow->tm_min; /* minutes after the hour - [0,59] */
	s_hr = tmnow->tm_hour; /* hours since midnight - [0,23] */
	s_day = tmnow->tm_mday; /* day of the month - [1,31] */
	s_mon = tmnow->tm_mon; /* months since January - [0,11] */
	s_yr = tmnow->tm_year; /* years since 1900 */
	s_mon ++;
	s_yr = s_yr + 1900;

    // everything is initialized, so
    // start the main dialog box
    DialogBox(
              ghInst,
              MAKEINTRESOURCE(IDD_MAINDLG),
              NULL,
              MainDialogProc
             );

    //
    // When EndDialog is called, we get here; clean up and exit.
    //

    ShutdownTapi();

    CoUninitialize();

    return 1;
}


//////////////////////////////////////////////////////////////
// InitializeTapi
//
// Various initializations
///////////////////////////////////////////////////////////////
HRESULT
InitializeTapi()
{
    HRESULT         hr;
    
    // cocreate the TAPI object
    hr = CoCreateInstance(
                          CLSID_TAPI,
                          NULL,
                          CLSCTX_INPROC_SERVER,
                          IID_ITTAPI,
                          (LPVOID *)&gpTapi
                         );

    if (hr != S_OK)
    {
        DoMessage(TEXT("CoCreateInstance on TAPI failed"));
        return hr;
    }

    // call initialize.  this must be called before
    // any other tapi functions are called.
    hr = gpTapi->Initialize();

    if (S_OK != hr)
    {
        DoMessage(TEXT("TAPI failed to initialize"));

        gpTapi->Release();
        gpTapi = NULL;
        
        return hr;
    }

    gpTAPIEventNotification = new CTAPIEventNotification;

    hr = RegisterTapiEventInterface();
    
    // Set the Event filter to only give us only the events we process
    gpTapi->put_EventFilter(TE_CALLNOTIFICATION | TE_CALLSTATE | TE_CALLMEDIA | TE_DIGITEVENT);

    // find all address objects that
    // we will use to listen for calls on
    hr = ListenOnAddresses();

    if (S_OK != hr)
    {
        DoMessage(TEXT("Could not find any addresses to listen on"));

        gpTapi->Release();
        gpTapi = NULL;

        return hr;
    }

    return S_OK;

}


///////////////////////////////////////////////////////////////
// ShutdownTapi
///////////////////////////////////////////////////////////////
void
ShutdownTapi()
{
    //
    // if there is still a call, disconnect and release it
    //

    DisconnectTheCall();

    ReleaseTheCall();

    //
    // Sleep for a little while to give tapi a chance to finish
    // disconnecting the call. Note that our dialog box has
    // disappeared by now so the user has no idea that our process
    // is still around. This step would not be necessary if the
    // call were disconnected interactively as a separate operation
    // from shutting down TAPI. The argument to Sleep is in
    // milliseconds.
    //

    Sleep(5000);

    //
    // release main object.
    //

    if (NULL != gpTapi)
    {
        gpTapi->Shutdown();
        gpTapi->Release();
    }
}


///////////////////////////////////////////////////////////////////////////
// MainDlgProc
///////////////////////////////////////////////////////////////////////////
BOOL
CALLBACK
MainDialogProc(
               HWND hDlg,
               UINT uMsg,
               WPARAM wParam,
               LPARAM lParam
              )
{
	//winsock
	int status; 
	SOCKADDR_IN local_sin;  /* Local socket - internet style */
	SOCKADDR_IN acc_sin;    /* Accept socket address - internet style */
    int acc_sin_len;        /* Accept socket address length */

    switch (uMsg)
    {
		//timer
		case WM_TIMER:
        {
			time_t tnow;
			struct tm *tmnow;
			time(&tnow);
			tmnow = localtime(&tnow);
			
			s_sec = tmnow->tm_sec;  /* seconds after the min - [0.59] */
			s_min = tmnow->tm_min; /* minutes after the hour - [0,59] */
			s_hr = tmnow->tm_hour; /* hours since midnight - [0,23] */
			s_day = tmnow->tm_mday; /* day of the month - [1,31] */
			s_mon = tmnow->tm_mon; /* months since January - [0,11] */
			s_yr = tmnow->tm_year; /* years since 1900 */
			s_mon ++;
			s_yr = s_yr + 1900;

			char temp[5];
			itoa(s_day,temp,10);
			strcpy(timenow,temp);
			strcat(timenow,"/");
			itoa(s_mon,temp,10);
			strcat(timenow,temp);
			strcat(timenow,"/");
			itoa(s_yr,temp,10);
			strcat(timenow,temp);
			strcat(timenow," ");
			itoa(s_hr,temp,10);
			strcat(timenow,temp);
			strcat(timenow,":");
			itoa(s_min,temp,10);
			strcat(timenow,temp);
			strcat(timenow,":");
			itoa(s_sec,temp,10);
			strcat(timenow,temp);

			SetDlgItemText(ghDlg,IDC_TIME,timenow);

			// check for make a call whether there is any calling right now
			if (!callingnow)
			{
				//reach time to call 
				if ((p_day == s_day) && (p_mon == s_mon) && (p_yr == s_yr) && (p_hr == s_hr) && (p_min == s_min))
					callnow = true;
				//time is beyond at most 5 min
				if (callnow)
				{
					//collect money
					counter = 0;
					
					callrate = GetCallRate();
					//callrate = 1000;
					//timemeter = true;

					//initial before make a phone call
					callingnow = true;
					timeup = CALLTIMEUP;
					pdigit = false;
					money = 0;

					//not enough credit to call
					if (p_credit <= 0)
					{
						p_retry = 1;
						UpdateNextCall(p_id);
						callingnow = false;
						callnow = false;
						GetNextCall();
						return 0;
					}

					//init and remove old welcome file
					_unlink("welcome.avi");
					for (int i=0; i < 10; i++)
						g_wszReadFileName[i] = '\0';
					char tempfile[] = "welcome.avi";
					mbstowcs(g_wszReadFileName,tempfile,11);

					//make a welcome file
					for (i=0; i < 200; i++)
						tts[i] = '\0';
					strcpy(tts,"Welcome to Automatic Voice Sending System, you have a message from ");
					strcat(tts,p_user);
					strcat(tts,", please press any buttons to listen to your message.");
					SpeakToFile();

					//rename from rec.wav to welcome.avi
					int rren = 0;
					rren = rename("record/rec.wav","welcome.avi");
					if (rren != 0)
						SetStatusMessage(TEXT("ERROR: Welcome file renamed failed."));

					step = 1;
					//make a outgoing call to telephone.
					if (S_OK != MakeTheCall(LINEADDRESSTYPE_PHONENUMBER,pp_tel))
					{
						SetStatusMessage(TEXT("ERROR: The call failed to connect"));
						callingnow = false;
						callnow = false;
						UpdateNextCall(p_id);
						GetNextCall();
					}
					return 0;
				}
			}
			else
			{
				//it's calling and button not be pushed yet
				if (!pdigit)
				{
					char countdown[3];
					ltoa(timeup,countdown,10);
					//SetDlgItemText(ghDlg,IDC_TIMEUP,countdown);
					timeup = timeup - 1;
					if (timeup == 0)
					{
						//hang up the phone call
						//SetDlgItemText(ghDlg,IDC_TIMEUP,countdown);
						SetStatusMessage(TEXT("Time Out"));
						PostMessage(ghDlg, WM_COMMAND, IDC_TPDISCONNECT, 0);
						return 0;
					}
				}
				else
				{
					if (timemeter)
					{
						money =	((CALLTIMEUP-timeup+counter)*1.0/60) * callrate;
						counter = counter + 1;
					}
					else
						money = callrate;
					SetDlgItemInt(ghDlg,IDC_COUNTER,money,true);
					if (p_credit <= money)
					{
						PostMessage(ghDlg, WM_COMMAND, IDC_TPDISCONNECT, 0);
						SetStatusMessage(TEXT("Run out of credit!"));
						return 0;
					}
				}
			}

            return 0;
        }

        case WM_PRIVATETAPIEVENT:
        {
            OnTapiEvent(
                        (TAPI_EVENT) wParam,
                        (IDispatch *) lParam
                       );

            return 0;
        }

        case WM_INITDIALOG:
        {
            // set up dialog
            ghDlg = hDlg;
            
			//time 
			SetTimer(hDlg, ID_CLOCK_TIMER, 1000, NULL);

			//init winsock
			WSACleanup();
			PostMessage(ghDlg, WM_COMMAND, IDC_WSLISTEN, 0);

			//DB
			GetMaxFilename();
			GetNextCall();

			// init sapi 
			m_cpVoice.CoCreateInstance( CLSID_SpVoice );
			SpCreateDefaultObjectFromCategoryId( SPCAT_AUDIOOUT, &m_cpOutAudio );

            return 0;
        }

		//winsock
		case WSA_READ:
		{
			char szTemp[ MY_MSG_LENGTH ];
			int result;

			if (WSAGETSELECTEVENT(lParam) == FD_READ)
			{
				status = recv((SOCKET)wParam, szTemp, MY_MSG_LENGTH, NO_FLAGS_SET );

				if (status)
				{
					szTemp[ status ] = '\0';
					SetStatusMessage(szTemp);
					
					//### Login process ### Lgin username password
					result = _strnicmp(szTemp,"Lgin",4);
					if (result == 0)
					{
						char username[11];
						char password[11];
						int j = 0, k = 0;
						for (int i=5;i<=status;i++)
						{
							if (szTemp[i] != ' ')
							{
								if (k == 0)
									username[j] = szTemp[i];
								if (k == 1)
									password[j] = szTemp[i];
								j++;
							}
							else
							{
								if (k == 0)
									username[j] = '\0';
								if (k == 1)
									password[j] = '\0';
								k++;
								j = 0;
							}
						}

						//check db
						bool logins = false;
						logins = GetLogin(username,password);

						if (logins) // can login
						{
							char msgsend[8],temp[5];
							strcpy(msgsend,"cred ");
							itoa(credit,temp,10);
							strcat(msgsend,temp);
							send(sock, msgsend, 13, 0);
							Sleep(500);
							char msgsend2[21];
							strcpy(msgsend2,"pass ");
							strcat(msgsend2,timenow);
							send(sock, msgsend2, 25, 0);
						}
						else
						{
							char msgsend[6];
							strcpy(msgsend,"errr ");
							strcat(msgsend,"30");
							send(sock, msgsend, 20, 0 );
						}
						return 1;
					}

					//### New user process ### Newu username password card# email
					result = _strnicmp(szTemp,"Newu",4);
					if (result == 0)
					{
						char username[11],password[11],cardno[13],email[30];
						int j = 0, k = 0;
						for (int i=5;i<=status;i++)
						{
							if (szTemp[i] != ' ')
							{
								if (k == 0)
									username[j] = szTemp[i];
								if (k == 1)
									password[j] = szTemp[i];
								if (k == 2)
									cardno[j] = szTemp[i];
								if (k == 3)
									email[j] = szTemp[i];
								j++;
							}
							else
							{
								if (k == 0)
									username[j] = '\0';
								if (k == 1)
									password[j] = '\0';
								if (k == 2)
									cardno[j] = '\0';
								if (k == 3)
									email[j] = '\0';
								k++;
								j = 0;
							}
						}

						//check db
						bool regnewuser = false;
						regnewuser = CheckUser(username);
						if (!regnewuser)
						{
							send(sock, "errr Username already registered.", 35, 0 );
							return 1;
						}

						regnewuser = CheckCard(cardno);
						if (!regnewuser)
						{
							send(sock, "errr Wrong card number!", 23, 0 );
							return 1;
						}

						regnewuser = UpdateCard(cardno);
						if (!regnewuser)
						{
							send(sock, "errr Can't update database!", 29, 0 );
							return 1;
						}

						long cardvalue=0;
						cardvalue = CreditCard(cardno);

						regnewuser = UpdateUser(username,password,cardvalue,email);
						if (!regnewuser)
						{
							send(sock, "errr Can't put in database!", 28, 0 );
							return 1;
						}

						char cred[20];
						strcpy(cred,"cred ");
						char ctemp[10];
						ltoa(cardvalue,ctemp,10);
						strcat(cred,ctemp);
						send(sock,cred,20,0);
						Sleep(500);
						char msgsend2[21];
						strcpy(msgsend2,"pass ");
						strcat(msgsend2,timenow);
						send(sock, msgsend2, 25, 0);
						
						return 1;
					}

					//### View existing list ###
					result = _strnicmp(szTemp,"View",4);
					if (result == 0)
					{
						//get username
						char username[11];
						int j = 0;
						for (int i=5; i<=status; i++)
						{
							username[j] = szTemp[i];
							j++;
						}
						username[j] = '\0';
						//get existinglist from db + send + delay
						GetList(username);
						return 1;
					}

					//### Text To Speech ###
					result = _strnicmp(szTemp,"Text",4);
					if (result == 0)
					{
						//clear old files
						_unlink("record/rec.avi");
						_unlink("record/rec.wav");

						int j = 0;
						//get text for TTS
						for (int i = 5; i <= status; i++)
						{
							tts[j] = szTemp[i];
							j++;
						}
						tts[j] = '\0';

						//speak to file
						SpeakToFile();

						//rename from rec.wav to rec.avi
						int rren = 0;
						rren = rename("record/rec.wav","record/rec.avi");
						if (rren == 0)
						{
							send(sock, "getl", 4, 0 );
						}
						else
						{
							send(sock, "errr Text-To-Speech failed!", 27, 0 );
							SetStatusMessage(TEXT("ERROR: File renamed failed."));
						}

						return 1;
					}

					//### Add credit process ### Addc username cardno
					result = _strnicmp(szTemp,"Addc",4);
					if (result == 0)
					{
						char username[11],cardno[13];
						int j = 0, k = 0;
						for (int i=5;i<=status;i++)
						{
							if (szTemp[i] != ' ')
							{
								if (k == 0)
									username[j] = szTemp[i];
								if (k == 1)
									cardno[j] = szTemp[i];
								j++;
							}
							else
							{
								if (k == 0)
									username[j] = '\0';
								if (k == 1)
									cardno[j] = '\0';
								k++;
								j = 0;
							}
						}

						//check db
						bool addcr = false;
						addcr = CheckCard(cardno);
						if (!addcr)
						{
							send(sock, "errr Wrong card number!", 23, 0 );
							return 1;
						}

						addcr = ActivateCard(username,cardno);
						if (!addcr)
						{
							send(sock, "errr Wrong card number!", 23, 0 );
							return 1;
						}

						long cardvalue=0;
						cardvalue = CreditCard(cardno);

						addcr = AddCredit(username,cardvalue);
						if (!addcr)
						{
							send(sock, "errr Can't add credit!", 22, 0 );
							return 1;
						}

						char cred[20];
						strcpy(cred,"cred ");
						char ctemp[10];
						ltoa(credit,ctemp,10);
						strcat(cred,ctemp);
						send(sock,cred,20,0);
						Sleep(500);
						char msgsend2[21];
						strcpy(msgsend2,"pass ");
						strcat(msgsend2,timenow);
						send(sock, msgsend2, 25, 0);

						return 1;
					}

					//### Send list process ### Call username 5355335 10/10/2001 23:32
					result = _strnicmp(szTemp,"Call",4);
					if (result == 0)
					{
						char username[11],tel[8],day[3],mon[3],yr[5],hr[3],min[3];
						int j = 0, k = 0, l = 0, m = 0, n = 0, o = 0;
						for (int i=5;i<=status;i++)
						{
							if (szTemp[i] != ' ')
							{
								if (k == 0)
									username[j] = szTemp[i];
								if (k == 1)
									tel[j] = szTemp[i];
								if (k == 2)
								{
									if (szTemp[i] != '/')
									{
										if (m == 0)
											day[l] = szTemp[i];
										if (m == 1)
											mon[l] = szTemp[i];
										if (m == 2)
											yr[l] = szTemp[i];
										if (szTemp[i+1] == ' ')
											yr[l+1] = '\0';
										l++;
									}
									else
									{
										if (m == 0)
											day[l] = '\0';
										if (m == 1)
											mon[l] = '\0';
										m++;
										l = 0;
									}

								}
								if (k == 3)
								{
									if (szTemp[i] != ':')
									{
										if (o == 0)
											hr[n] = szTemp[i];
										if (o == 1)
											min[n] = szTemp[i];
										n++;
									}
									else
									{
										if (o == 0)
											hr[n] = '\0';
										if (o == 1)
											min[n] = '\0';
										o++;
										n = 0;
									}
								}
								j++;
							}
							else
							{
								if (k == 0)
									username[j] = '\0';
								if (k == 1)
									tel[j] = '\0';
								k++;
								j = 0;
							}
						}

						//check db
						bool sendlist = false;
						sendlist = PutListDB(username,tel,day,mon,yr,hr,min);
						//wait for upload
						Sleep (1000);
						if (sendlist)
						{
							send(sock, "getl", 4, 0 );
						}
						else
						{
							send(sock, "errr Can't send list!", 22, 0 );
							SetStatusMessage(TEXT("ERROR: Put list failed."));
						}

						return 1;
					}

					//### Done process ### Done
					result = _strnicmp(szTemp,"Done",4);
					if (result == 0)
					{
						// Attempt to rename file:
						int rren = 0;
						char newfile[10];
						char temp[6];
						_itoa(maxfilename,temp,10);
						strcpy(newfile,"data/");
						strcat(newfile,temp);
						strcat(newfile,".avi");
						rren = rename("record/rec.avi",newfile);
						if (rren == 0)
						{
							char msgsend2[21];
							strcpy(msgsend2,"pass ");
							strcat(msgsend2,timenow);
							send(sock, msgsend2, 25, 0);
						}
						else
						{
							send(sock, "errr Can't get recorded file!", 29, 0 );
							SetStatusMessage(TEXT("ERROR: File renamed failed."));
							//if( _unlink("record/rec.avi") == -1 )
							//	SetStatusMessage(TEXT("ERROR: Could not delete old file!"));
						}
						GetNextCall();
						GetMaxFilename();

						return 1;
					}

				}
				else
					SetStatusMessage(TEXT("ERROR: Winsock Connection broken."));
			}
			else
			{   // FD_CLOSE -- connection dropped 
				WSACleanup();
				PostMessage(ghDlg, WM_COMMAND, IDC_WSLISTEN, 0);
			}

			return 1;
		}

		case WSA_ACCEPT: /* Notification if a socket connection is pending. */
		{
			if (WSAGETSELECTERROR( lParam ) == 0) 
			{   /* Success */

				/*
				*   Accept the incoming connection.
				*/
				acc_sin_len = sizeof( acc_sin );
				sock = accept( sock,(struct sockaddr FAR *) &acc_sin,
				(int FAR *) &acc_sin_len );

				if (sock < 0)
				{
					DoMessage(TEXT("Winsock accept() failed."));
				    return 1;
				}

				SetStatusMessage(TEXT("Winsock accepted()."));

				/*
				*   Send main window a WSA_READ when either data is pending on
				*   the socket (FD_READ) or the connection is closed (FD_CLOSE)
				*/
				if ((status = WSAAsyncSelect( sock, ghDlg, WSA_READ, FD_READ | FD_CLOSE )) > 0) {
					DoMessage(TEXT("Winsock WSAAsyncSelect() failed."));
					closesocket( sock );
				}
			}
			else
			{
				DoMessage(TEXT("Winsock Error failed."));

				//Cancel any further notifications.
				WSAAsyncSelect( sock, ghDlg, 0, 0);
			}
		}

        case WM_COMMAND:
        {
			if ( LOWORD(wParam) == IDC_WSLISTEN )
			{
				//winsock
				WSADATA WSAData;
				if ((status = WSAStartup(MAKEWORD(1,1), &WSAData)) == 0) {

				}
				else {
					DoMessage(TEXT("Winsock Error"));
					return 1;
				}

				sock = socket( AF_INET, SOCK_STREAM, 0);
				if (sock == INVALID_SOCKET) {
					DoMessage(TEXT("Winsock socket() failed."));
				    return 1;
				}
				/*
				*   Retrieve the IP address and TCP Port number
				*/

				if (!FillAddr( ghDlg, &local_sin, FALSE)) {
		            closesocket( sock );
				    return 1;
				}

				/*
				*   Associate an address with a socket. (bind)
				*/
				if (bind( sock, (struct sockaddr FAR *) &local_sin, sizeof(local_sin)) == SOCKET_ERROR) {
					DoMessage(TEXT("Winsock Bind() failed."));
					closesocket( sock );
					return 1;
				}

				if (listen( sock, MAX_PENDING_CONNECTS ) < 0) {
					DoMessage(TEXT("Winsock Listen() failed."));
					return 1;
				}

				/*
				*   Send window a WSA_ACCEPT when something is trying to connect.
				*/
				if ((status = WSAAsyncSelect( sock, ghDlg, WSA_ACCEPT, FD_ACCEPT)) > 0) {
					DoMessage(TEXT("Winsock WSAAsyncSelect() failed."));
					closesocket( sock );
				}

				SetStatusMessage( TEXT("Winsock Listen Completed..."));
				return 1;
			}

			if ( LOWORD(wParam) == IDC_WSCLEANUP )
			{
				WSACleanup();
				SetStatusMessage( TEXT("Winsock cleaned up..."));
				return 1;
			}

			if ( LOWORD(wParam) == IDC_WSSENDHI )
			{
				send (sock, "HI", 3, 0 );
				return 1;
			}

			if ( LOWORD(wParam) == IDC_TPINIT )
			{				
				// do all tapi initialization
				if (S_OK != InitializeTapi())
				{
					SetStatusMessage( TEXT("Init TAPI falied..."));
					return 0;
				}

				//Outgoing
				HWND hComboBox;
				hComboBox = GetDlgItem( hDlg, IDC_TPADDRESSTYPE );
				InitAddressTypeComboBox(hComboBox);

				SetStatusMessage( TEXT("Init TAPI Completed..."));
				return 1;
			}

            if ( LOWORD(wParam) == IDCANCEL )
            {
                // quit
                EndDialog( hDlg, 0 );

                return 1;
            }

			//TTS
			if ( LOWORD(wParam) == IDC_SAVETOWAV )
            {
				SpeakToFile();

                return 1;
            }

            switch ( LOWORD(wParam) ) 
            {
				//Outgoing dial request
				case IDC_TPDIAL:
				{
					//digit
					pdigit = false;
					
					HWND hComboBox;
	                DWORD dwIndex;
					DWORD dwAddressType;
	                WCHAR szAddressToCall[ADDRESSLENGTH];

					// get the address type the user selected.
	                hComboBox = GetDlgItem( hDlg, IDC_TPADDRESSTYPE );
					dwIndex = SendMessage( hComboBox, CB_GETCURSEL, 0, 0 );

					dwAddressType = SendMessage( 
												hComboBox,
												CB_GETITEMDATA,
												dwIndex,
												0
	                                           );
					
					char temp[128];
	                // get the address the user wants to call
					GetDlgItemText(
									hDlg,
									IDC_TPADDRESS,
									temp,//szAddressToCall,
									ADDRESSLENGTH
	                              );
					mbstowcs(szAddressToCall,temp,128);

					SetStatusMessage(temp);

					// make the call
					if ( S_OK != MakeTheCall(dwAddressType, szAddressToCall) )
	                {
						SetStatusMessage(TEXT("ERROR: The call failed to connect"));
					}
	                return 1;
				}

				case IDC_TPDISCONNECT:
				{
					PostMessage(ghDlg, WM_COMMAND, IDC_DISCONNECT, 0);
					return 1;
				}

                // dial request
                case IDC_ANSWER: 
                {
                    SetStatusMessage(TEXT("Answering..."));
                    // answer the call
                    if ( S_OK == AnswerTheCall() ) 
                    {
                        SetStatusMessage(TEXT("Connected"));
                    }
                    else 
                    {
                        DoMessage(TEXT("Answer failed"));
                        SetStatusMessage(TEXT("Waiting for a call..."));
                    }

                    return 1;
                }

                // disconnect request
                case IDC_DISCONNECT: 
                {
                    // If the remote party disconnected first, then the call was
                    // already disconnected and released, so do not disconnect
                    // it again.

                    if ( gpCall != NULL )
                    {
                        SetStatusMessage(TEXT("Disconnecting..."));

                        // disconnect the call
                        if (S_OK != DisconnectTheCall())
                        {
                            DoMessage(TEXT("Disconnect failed"));
                        }
                    }

                    return 1;
                }

                // connect notification
                case IDC_CONNECTED:
                {
                    SetStatusMessage(TEXT("Connected; waiting for media streams to run..."));
                    
                    return 1;
                }

                // disconnected notification
                case IDC_DISCONNECTED:
                {
                    // release
                    ReleaseTheCall();

                    SetStatusMessage(TEXT("Waiting for a call..."));
                    
                    return 1;
                }
                default:

                    return 0;
            }
        }
        default:

            return 0;
    }
}


HRESULT
RegisterTapiEventInterface()
{
    HRESULT                       hr = S_OK;
    IConnectionPointContainer   * pCPC;
    IConnectionPoint            * pCP;
    

    hr = gpTapi->QueryInterface(
                                IID_IConnectionPointContainer,
                                (void **)&pCPC
                               );

    if (!SUCCEEDED(hr))
    {
        return hr;
    }

    hr = pCPC->FindConnectionPoint(
                                   IID_ITTAPIEventNotification,
                                   &pCP
                                  );
    pCPC->Release();
        
    if (!SUCCEEDED(hr))
    {
        return hr;
    }

    hr = pCP->Advise(
                      gpTAPIEventNotification,
                      &gulAdvise
                     );

    pCP->Release();

    
    return hr;

}


////////////////////////////////////////////////////////////////////////
// ListenOnAddresses
//
// This procedure will find all addresses that support audioin and audioout
// and will call ListenOnThisAddress to start listening on it.
////////////////////////////////////////////////////////////////////////

HRESULT
ListenOnAddresses()
{
    HRESULT             hr = S_OK;
    IEnumAddress *      pEnumAddress;
    ITAddress *         pAddress;
    ITMediaSupport *    pMediaSupport;
    VARIANT_BOOL        bSupport;

    // enumerate the addresses
    hr = gpTapi->EnumerateAddresses( &pEnumAddress );

    if (S_OK != hr)
    {
        return hr;
    }

    while ( TRUE )
    {
        // get the next address
        hr = pEnumAddress->Next( 1, &pAddress, NULL );

        if (S_OK != hr)
        {
            break;
        }

        pAddress->QueryInterface( IID_ITMediaSupport, (void **)&pMediaSupport );

        // does it support Audio
        pMediaSupport->QueryMediaType(
                                      TAPIMEDIATYPE_AUDIO,
                                      &bSupport
                                     );

        if (bSupport)
        {
            // If it does then we'll listen.
            //only listen on H.323
			HRESULT                       hr = S_OK;
			ITAddressCapabilities   * pCap;
			hr = pAddress->QueryInterface(
                                IID_ITAddressCapabilities,
                                (void **)&pCap
                               );
			long pAddType;
			pCap->get_AddressCapability(AC_ADDRESSTYPES,&pAddType);
			
			if ( (pAddType == 29) || (pAddType == 1) )//LINEADDRESSTYPE_IPADDRESS OR LINEADDRESSTYPE_PHONENUMBER
			{
				hr = ListenOnThisAddress( pAddress );

				if ( FAILED(hr) )
				{
					DoMessage(TEXT("Listen failed on an address"));
				}
			}
			pCap = NULL;
        }

        pMediaSupport->Release();
        pAddress->Release();
    }

    pEnumAddress->Release();
    
    return S_OK;
}


///////////////////////////////////////////////////////////////////
// ListenOnThisAddress
//
// We call RegisterCallNotifications to inform TAPI that we want
// notifications of calls on this address. We already resistered
// our notification interface with TAPI, so now we are just telling
// TAPI that we want calls from this address to trigger events on
// our existing notification interface.
//    
///////////////////////////////////////////////////////////////////

HRESULT
ListenOnThisAddress(
                    ITAddress * pAddress
                   )
{
    
    //
    // RegisterCallNotifications takes a media type bitmap indicating
    // the set of media types we are interested in. We know the
    // address supports audio.
    //

    long lMediaTypes = TAPIMEDIATYPE_AUDIO;

    HRESULT  hr;
    long     lRegister;

    hr = gpTapi->RegisterCallNotifications(
                                           pAddress,
                                           VARIANT_TRUE,
                                           VARIANT_TRUE,
                                           lMediaTypes,
                                           gulAdvise,
                                           &lRegister
                                          );

    return hr;
}
                    
                    
/////////////////////////////////////////////////////////
// GetMediaStreamTerminal
//
// Create a media streaming terminal for the given
// direction.
//
/////////////////////////////////////////////////////////

HRESULT
GetMediaStreamTerminal(
                 ITAddress * pAddress,
                 TERMINAL_DIRECTION dir,
                 ITTerminal ** ppTerminal
                )
{
    HRESULT             hr = S_OK;
    ITTerminalSupport * pTerminalSupport;
    BSTR                bstrTerminalClass;
    LPOLESTR            lpTerminalClass;
    AM_MEDIA_TYPE       mt;

    // get the terminal support interface
    pAddress->QueryInterface( IID_ITTerminalSupport, (void **)&pTerminalSupport );
    
    StringFromIID(
                  CLSID_MediaStreamTerminal,
                  &lpTerminalClass
                 );
    bstrTerminalClass = SysAllocString ( lpTerminalClass );
    CoTaskMemFree( lpTerminalClass );

    hr = pTerminalSupport->CreateTerminal(
                                          bstrTerminalClass,
                                          TAPIMEDIATYPE_AUDIO,
                                          dir,
                                          ppTerminal
                                         );

    SysFreeString( bstrTerminalClass );
    pTerminalSupport->Release();

    if (FAILED(hr)) { return hr; }

    if (TD_CAPTURE == dir)
    {
        //
        // Now set the media format for the terminal.
        //
        // On addresses where a variety of formats are supported (such as
        // Wave MSP addresses, which are used on most modems and voice boards),
        // this call is mandatory or the terminal will not be able to connect.
        //
        // For other addresses, such as those implemented over IP, the format
        // may be fixed / predetermined. In that case, this call will fail
        // if the format is not the same as the predetermined format. To
        // retrieve such a predetermined format, an application can use
        // ITAMMediaFormat::get_MediaFormat.
        //
        // For the purposes of this example, we just set our preferred format
        // and ignore any failure code. This is fine for both Wave MSP
        // addresses and for addresses implemented over IP (which happens to
        // use the same format the one we are setting here).
        //

        ITAMMediaFormat *pITFormat;
        hr = (*ppTerminal)->QueryInterface(IID_ITAMMediaFormat, (void **)&pITFormat);
        if (FAILED(hr)) { (*ppTerminal)->Release(); *ppTerminal = NULL; return hr; }

        mt.majortype            = MEDIATYPE_Audio;
        mt.subtype              = MEDIASUBTYPE_PCM;
        mt.bFixedSizeSamples    = TRUE;
        mt.bTemporalCompression = FALSE;
        mt.lSampleSize          = 0;
        mt.formattype           = FORMAT_WaveFormatEx;
        mt.pUnk                 = NULL;
        mt.cbFormat             = sizeof(WAVEFORMATEX);
        mt.pbFormat             = (BYTE*)&gwfx;

        pITFormat->put_MediaFormat(&mt);
        pITFormat->Release();


        //
        // optional - set the buffer size of fragments negotiated with rest of the graph
        // this is only needed for applications that are not happy with the default fragment size
        // (which depends on the MSP -- for the Wave MSP (used on most modems and voice boards)
        // the default is 20 ms.
        //

        ITAllocatorProperties *pITAllocatorProperties;
        hr = (*ppTerminal)->QueryInterface(IID_ITAllocatorProperties, (void **)&pITAllocatorProperties);
        if (FAILED(hr)) { (*ppTerminal)->Release(); *ppTerminal = NULL; return hr; }

        // Call to SetAllocatorProperties below illustrates how
        // an app can control the number and size of buffers.
        // A 30 ms sample size is most appropriate for IP (especailly G.723.1)
        // (that's 480 bytes at 16-bit 8 KHz PCM); in fact you may get very
        // poor audio quality with other settings.
        // However, 30ms can cause poor audio quality on some voice boards --
        // voice boards generally work best with large buffers.
        // If this method is not called, the allocator properties
        // suggested by the connecting filter may be used.

        ALLOCATOR_PROPERTIES AllocProps;
        AllocProps.cbBuffer   = 480;
        AllocProps.cBuffers   = 5;
        AllocProps.cbAlign    = 1;
        AllocProps.cbPrefix   = 0;

        hr = pITAllocatorProperties->SetAllocatorProperties(&AllocProps);
        hr = pITAllocatorProperties->SetAllocateBuffers(TRUE);

        BOOL bAllocateBuffer;
        hr = pITAllocatorProperties->GetAllocateBuffers(&bAllocateBuffer);

        pITAllocatorProperties->Release();
    }

    return hr;

}



/////////////////////////////////////////////////////////////////
// ReleaseTerminals
//
/////////////////////////////////////////////////////////////////

void
ReleaseTerminals(
                      ITTerminal ** ppTerminals,
                      LONG nNumTerminals
                     )
{
    for (long i = 0; i < nNumTerminals; i ++)
    {
        if (ppTerminals[i])
        {
            ppTerminals[i]->Release();
        }
    }
}

/////////////////////////////////////////////////////////////////////
// Answer the call
/////////////////////////////////////////////////////////////////////

HRESULT
AnswerTheCall()
{
/*
    HRESULT                 hr;
    ITCallInfo *            pCallInfo;
    ITAddress *             pAddress;


    g_pRecordStream = NULL;
    g_pPlayMedStrmTerm = NULL;
    g_pRecordMedStrmTerm = NULL;

    if (NULL == gpCall) 
    {    
        return E_UNEXPECTED;
    }

    // get the address object of this call
    gpCall->QueryInterface( IID_ITCallInfo, (void**)&pCallInfo );
    pCallInfo->get_Address( &pAddress );
    pCallInfo->Release();

    ITStreamControl * pStreamControl;

    // get the ITStreamControl interface for this call
    hr = gpCall->QueryInterface(IID_ITStreamControl,
                                (void **) &pStreamControl);

    // enumerate the streams

    IEnumStream * pEnumStreams;
    hr = pStreamControl->EnumerateStreams(&pEnumStreams);
    pStreamControl->Release();

    if (FAILED(hr))
    {
        pAddress->Release();
        gpCall->Release();
        gpCall = NULL;
        return hr;
    }

    // for each stream
    ITStream * pStream;


    // Since we are interested in the audio capture and render streams only, 
    // the while loop terminates when either all the streams are done or 
    // when terminals for both the streams i.e. render and capture are created
    // We will also make sure that even though terminals are created on the 
    // streams only one terminal will be selected to support half duplex lines
    while ( ( S_OK == pEnumStreams->Next(1, &pStream, NULL) )  &&
        ( (g_pPlayMedStrmTerm == NULL) || (g_pRecordMedStrmTerm==NULL) ) ) 
    {
        TERMINAL_DIRECTION td;
        hr = pStream->get_Direction(&td);
    
        if ( SUCCEEDED(hr) )    
        {
            //
            // create the media terminals for this call
            //

            //  Only one capture terminal will be created even if they are multiple capture streams
            //  
            if ( (td == TD_CAPTURE) && g_fPlay && (g_pPlayMedStrmTerm == NULL)) 
            {
                GetMediaStreamTerminal( 
                    pAddress, 
                    TD_CAPTURE,
                    &g_pPlayMedStrmTerm
                    );

                // the created terminal is selected on the stream if the user 
                // wishes to play or play and record. The play terminal has to be 
                // selected in any case before the record since the message will always
                // be played before the record

                hr = pStream->SelectTerminal(g_pPlayMedStrmTerm);

                if ( FAILED (hr) )
                {
                    ::MessageBox(NULL,"Select Terminal for Play Failed", "Answer the call", MB_OK);
                    return hr;
                }
            }

            // Create terminal for Render stream
            // Note that we only create the terminal.. we do not select it on the stream
            if ( (td == TD_RENDER) && g_fRecord && (g_pRecordMedStrmTerm == NULL))
            {
                GetMediaStreamTerminal(
                    pAddress,
                    TD_RENDER,
                    &g_pRecordMedStrmTerm
                    );
                g_pRecordStream = pStream;
                g_pRecordStream->AddRef();  
            }
        }
        pStream->Release();
    }
    

    // the record terminal is selected on the stream only if the play terminal is not already
    // selected. This will happen only in the case when the user selects only record and no play
    // Only one terminal is selected at a time inorder to support half-duplex lines
    if (!g_fPlay) 
    {
        hr = g_pRecordStream->SelectTerminal(g_pRecordMedStrmTerm);
       
        if ( FAILED (hr) )
        {
            ::MessageBox(NULL,"Select Terminal for Record Failed", "Answer the call", MB_OK);
            return hr;
        }

        g_pRecordMedStrmTerm->Release();
        g_pRecordStream->Release();
    }

    
    pEnumStreams->Release();

    // release the address
    pAddress->Release();
    
    // answer the call
    hr = gpCall->Answer();

    if (S_OK != hr)
    {
        gpCall->Release();
        gpCall = NULL;
        return hr;
    }
	return hr;
*/
    return S_OK;
}

//////////////////////////////////////////////////////////////////////
// DisconnectTheCall
//
// Disconnects the call
//////////////////////////////////////////////////////////////////////

HRESULT
DisconnectTheCall()
{
    HRESULT         hr = S_OK;

    if (NULL != gpCall)
    {
        hr = gpCall->Disconnect( DC_NORMAL );

        // Do not release the call yet, as that would prevent
        // us from receiving the disconnected notification.
    
        return hr;
    }

    return S_FALSE;
}

//////////////////////////////////////////////////////////////////////
// ReleaseTheCall
//
// Releases the call
//////////////////////////////////////////////////////////////////////

void
ReleaseTheCall()
{
    if (gpCall != NULL)
	{
		gpCall->Release();
		gpCall = NULL;
	}
}


///////////////////////////////////////////////////////////////////
//
// HELPER FUNCTIONS
//
///////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////
// DoMessage
///////////////////////////////////////////////////////////////////

void
DoMessage(
          LPTSTR pszMessage
         )
{
    MessageBox(
               ghDlg,
               pszMessage,
               gszTapi30,
               MB_OK
              );
}

//////////////////////////////////////////////////////////////////
// SetStatusMessage
//////////////////////////////////////////////////////////////////

void
SetStatusMessage(
                 LPTSTR pszMessage
                )
{
    /*SetDlgItemText(
                   ghDlg,
                   IDC_STATUS,
                   pszMessage
                  );
	/* multiline edit box*/
    static TCHAR            szDebugText[102400]=_T("");
    static int              line = 0;
    
    // Clear out the buffer after 100 lines of text have been written
    // to the debug window since it can only hold 4096 characters.
    if( line == 100 )
    {
        _tcscpy( szDebugText, _T("") );
        line = 0;
    }
    // Attach the new message to the ongoing list of messages
    _tcscat( szDebugText, pszMessage );
	_tcscat( szDebugText, "\r\n");
    SetDlgItemText( ghDlg, IDC_STATUS, szDebugText );

    SendDlgItemMessage( ghDlg, IDC_STATUS, EM_LINESCROLL, 0, line );

    line++;

}

//winsock
/****************************************************************************\
*
*    FUNCTION:  FillAddr(HWND, PSOCKADDR_IN, BOOL)
*
*    PURPOSE:  Retrieves the IP address and port number.
*
*    COMMENTS:
*        This function is called in two conditions.
*            1.) When a client is preparing to call connect(), or
*            2.) When a server host is going to call bind(), listen() and
*                accept().
*        In both situations, a SOCKADDR_IN structure is filled.
*        However, different fields are filled depending on the condition.
*
*   ASSUMPTION:
*      szBuff is a global variable that contains the remote host name or NULL
*      if local.
*      bClient determines if this is being called by a client ( will be
*         performing a connect ) or a server ( will be listening )
*
*
*\***************************************************************************/

BOOL FillAddr(
        HWND hWnd,
        PSOCKADDR_IN psin,
        BOOL bClient)
{
   PHOSTENT phe;
   psin->sin_family = AF_INET;

   /*
   *   If we are setting up for a listen() call (bConnect = FALSE),
   *   fill servent with our address.
   */
   if (bClient)
   {
      phe = gethostbyname("smartpoint");
      if (phe == NULL)
	  {
         DoMessage(TEXT("Socket gethostbyname failed"));
         return FALSE;
      }
      memcpy((char FAR *)&(psin->sin_addr), phe->h_addr, phe->h_length);
   }
   else
   {
		psin->sin_family = AF_INET;
		psin->sin_addr.s_addr = INADDR_ANY;
		psin->sin_port = htons(5555);	// Convert to network ordering
		return TRUE;
   }
   psin->sin_port = htons(5555);	//Convert to network ordering
   return TRUE;
}

//Outgoing
///////////////////////////////////////////////////////////////////////////
// InitAddressTypeComboBox
//
// Put address type string in the combo box
// and save the addresstype with the string
//
///////////////////////////////////////////////////////////////////////////
void
InitAddressTypeComboBox(
    HWND hComboBox
    )
{
    int i;
    
    i = SendMessage( hComboBox, CB_ADDSTRING, 0, (long)"Phone");//gszPhoneNumber );
    
    SendMessage(
                hComboBox,
                CB_SETITEMDATA , 
                i,
                (long)LINEADDRESSTYPE_PHONENUMBER
               );

    i = SendMessage( hComboBox, CB_ADDSTRING, 0, (long)"IP Address");//gszIPAddress );
    
    SendMessage(
                hComboBox,
                CB_SETITEMDATA , 
                i,
                (long)LINEADDRESSTYPE_IPADDRESS
               );
	    
    SendMessage( hComboBox, CB_SETCURSEL, i, 0 );
}

/////////////////////////////////////////////////////////////////
// MakeTheCall
//
// Sets up and makes a call
/////////////////////////////////////////////////////////////////

HRESULT
MakeTheCall(
            DWORD dwAddressType,
            PWCHAR szAddressToCall
           )
{
    HRESULT                 hr = S_OK;
    BSTR                    bstrAddressToCall;
    BSTR                    pAddressName;
    
    // find an address object that
    // we will use to make calls on
    hr = FindAnAddress(dwAddressType, &pAddressName);
    if ( FAILED(hr) )
    {
        SetStatusMessage(TEXT("Could not find a TAPI address for making calls."));
        return hr;
    }
	
    SysFreeString(pAddressName);

    // find out which media types this address supports
    long lMediaTypes = 0;
    if ( AddressSupportsMediaType(gpAddress, TAPIMEDIATYPE_AUDIO) )
    {
        lMediaTypes |= TAPIMEDIATYPE_AUDIO; // we will use audio
    }

    // Create the call.
    bstrAddressToCall = SysAllocString( szAddressToCall );

    hr = gpAddress->CreateCall( bstrAddressToCall,
                                dwAddressType,
                                lMediaTypes,
                                &gpCall);

    SysFreeString ( bstrAddressToCall );
    
    if ( FAILED(hr) )
    {
        SetStatusMessage(TEXT("Could not create a call."));
        return hr;
    }

    // Select our terminals on the call; if any of the selections fail we
    // proceed without that terminal.
    //hr = SelectTerminalsOnCall( gpCall );
	hr = SelectMediaTerminal();

    if ( FAILED(hr) )
    {
        SetStatusMessage(TEXT("Could not select terminals on call."));
        return hr;
    }
    // We're now ready to call connect.
    //
    // the VARIANT_TRUE parameter indicates that this
    // call is sychronous - that is, it won't
    // return until the call is in the connected
    // state (or fails to connect)
    // Since this is called in the UI thread,
    // this means that the app will appear
    // to hang until this function returns.
    // Some TAPI service providers may take a long
    // time for a call to reach the connected state.
    //
    hr = gpCall->Connect( VARIANT_FALSE);

    if ( FAILED(hr) )
    {
        gpCall->Release();
        gpCall = NULL;
        SetStatusMessage(TEXT("Could not connect the call."));
        return hr;
    }
    
    return S_OK;
}

////////////////////////////////////////////////////////////////////////
// FindAnAddress
//
// Finds an address object that this application will use to make calls on.
//
// This function finds an address that supports the addresstype passed
// in, as well as the audioin and audioout media types.
//
// Return Value
//          S_OK if it finds an address
//          E_FAIL if it does not find an address
////////////////////////////////////////////////////////////////////////
HRESULT
FindAnAddress(
              DWORD dwAddressType,
              BSTR  * ppName
             )
{
    HRESULT                 hr = S_OK;
    BOOL                    bFoundAddress = FALSE;
    IEnumAddress          * pEnumAddress;
    ITAddress             * pAddress;
    ITAddressCapabilities * pAddressCaps;
    long                    lType = 0;

    // if we have an address object
    // release it
    if (NULL != gpAddress)
    {
        gpAddress->Release();
        gpAddress = NULL;
    }

    // enumerate the addresses
    hr = gpTapi->EnumerateAddresses( &pEnumAddress );

    if ( FAILED(hr) )
    {
        return hr;
    }

    while ( !bFoundAddress )
    {
        // get the next address
        hr = pEnumAddress->Next( 1, &pAddress, NULL );

        if (S_OK != hr)
        {
            break;
        }


        hr = pAddress->QueryInterface(IID_ITAddressCapabilities, (void**)&pAddressCaps);
        
        if ( SUCCEEDED(hr) )
        {

            hr = pAddressCaps->get_AddressCapability( AC_ADDRESSTYPES, &lType );
 
            pAddressCaps->Release();
 
            if ( SUCCEEDED(hr) )
            {
                // is the type we are looking for?
                if ( dwAddressType & lType )
                {
                    // does it support audio?
                    if ( AddressSupportsMediaType(pAddress, TAPIMEDIATYPE_AUDIO) )
                    {
                        // does it have a name?
                        if ( SUCCEEDED( pAddress->get_AddressName(ppName) ) )
                        {
                            // save it in the global variable
                            // since we break out of the loop, this one won't
                            // get released
                            gpAddress = pAddress;
                            bFoundAddress = TRUE;
                            break;
                        }
                    }
                }
            }
        }
       
        pAddress->Release();

    } // end while loop

    pEnumAddress->Release();
    
    if (!bFoundAddress)
    {
        return E_FAIL;
    }

    return S_OK;
}

//////////////////////////////////////////////////////////////
// AddressSupportsMediaType
//
// Finds out if the given address supports the given media
// type, and returns TRUE if it does.
//////////////////////////////////////////////////////////////

BOOL
AddressSupportsMediaType(
                         ITAddress * pAddress,
                         long        lMediaType
                        )
{
    VARIANT_BOOL     bSupport = VARIANT_FALSE;
    ITMediaSupport * pMediaSupport;
    
    if ( SUCCEEDED( pAddress->QueryInterface( IID_ITMediaSupport,
                                              (void **)&pMediaSupport ) ) )
    {
        // does it support this media type?
        pMediaSupport->QueryMediaType(
                                      lMediaType,
                                      &bSupport
                                     );
        pMediaSupport->Release();
    }

    return (bSupport == VARIANT_TRUE);
}

/////////////////////////////////////////////////////////////////
// SelectTerminalsOnCall
//
// Creates and selects terminals for all streams on the given
// call.
/////////////////////////////////////////////////////////////////
HRESULT
SelectTerminalsOnCall(
                     ITBasicCallControl * pCall
                     )
{
    HRESULT hr;

    // get the ITStreamControl interface for this call

    ITStreamControl * pStreamControl;
    hr = pCall->QueryInterface(IID_ITStreamControl,
                               (void **) &pStreamControl);

    if ( SUCCEEDED(hr) )
    {
        // enumerate the streams
        IEnumStream * pEnumStreams;    
        hr = pStreamControl->EnumerateStreams(&pEnumStreams);
        pStreamControl->Release();

        if ( SUCCEEDED(hr) )
        {
            // for each stream

            ITStream * pStream;

            while ( S_OK == pEnumStreams->Next(1, &pStream, NULL) )
            {
                ITTerminal * pTerminal;

                // Find out the media type and direction of this stream,
                // and create the default terminal for this media type and
                // direction.

                hr = GetTerminal(pStream,
                                 &pTerminal);
                if ( SUCCEEDED(hr) )
                {
                    // Select the terminal on the stream.
                    hr = pStream->SelectTerminal(pTerminal);

                    pTerminal->Release();
                }
            
                pStream->Release();

            }

            pEnumStreams->Release();
        }
    }

    return hr;
}

/////////////////////////////////////////////////////////
// GetTerminal
//
// Creates the default terminal for the passed-in stream.
//
/////////////////////////////////////////////////////////
HRESULT
GetTerminal(
            ITStream * pStream,
            ITTerminal ** ppTerminal
           )
{
    // Determine the media type and direction of this stream.
    
    HRESULT            hr;
    long               lMediaType;
    TERMINAL_DIRECTION dir;

    hr = pStream->get_MediaType( &lMediaType );
    if ( FAILED(hr) ) return hr;

    hr = pStream->get_Direction( &dir );
    if ( FAILED(hr) ) return hr;

    // For all other terminals we use GetDefaultStaticTerminal.
    // First, get the terminal support interface.

    ITTerminalSupport * pTerminalSupport;
    hr = gpAddress->QueryInterface( IID_ITTerminalSupport, 
                                    (void **)&pTerminalSupport);
    if ( SUCCEEDED(hr) )
    {
        // get the default terminal for this MediaType and direction
        
        hr = pTerminalSupport->GetDefaultStaticTerminal(lMediaType,
                                                        dir,
                                                        ppTerminal);
        pTerminalSupport->Release();
    }

    return hr;
}

//play file
HRESULT
SelectMediaTerminal()
{
    HRESULT                 hr;
    ITCallInfo *            pCallInfo;
    ITAddress *             pAddress;

    g_pRecordStream = NULL; //play stream 2
    g_pPlayMedStrmTerm = NULL;
    g_pRecordMedStrmTerm = NULL;

    if (NULL == gpCall) 
    {    
        return E_UNEXPECTED;
    }

    // get the address object of this call
    gpCall->QueryInterface( IID_ITCallInfo, (void**)&pCallInfo );
    pCallInfo->get_Address( &pAddress );
    pCallInfo->Release();

    ITStreamControl * pStreamControl;

    // get the ITStreamControl interface for this call
    hr = gpCall->QueryInterface(IID_ITStreamControl,
                                (void **) &pStreamControl);

    // enumerate the streams
    IEnumStream * pEnumStreams;
    hr = pStreamControl->EnumerateStreams(&pEnumStreams);
    pStreamControl->Release();

    if (FAILED(hr))
    {
        pAddress->Release();
        gpCall->Release();
        gpCall = NULL;
        return hr;
    }

    // for each stream
    ITStream * pStream;

    // Since we are interested in the audio capture and render streams only, 
    // the while loop terminates when either all the streams are done or 
    // when terminals for both the streams i.e. render and capture are created
    // We will also make sure that even though terminals are created on the 
    // streams only one terminal will be selected to support half duplex lines
    while ( ( S_OK == pEnumStreams->Next(1, &pStream, NULL) )  &&
        ( (g_pPlayMedStrmTerm == NULL) || (g_pRecordMedStrmTerm==NULL) ) ) 
    {
        TERMINAL_DIRECTION td;
        hr = pStream->get_Direction(&td);

        if ( SUCCEEDED(hr) )    
        {
            // create the media terminals for this call
            //  Only one capture terminal will be created even if they are multiple capture streams
            if ( (td == TD_CAPTURE) && g_fPlay && (g_pPlayMedStrmTerm == NULL)) 
            {
                GetMediaStreamTerminal( 
                    pAddress, 
                    TD_CAPTURE,
                    &g_pPlayMedStrmTerm
                    );

                // the created terminal is selected on the stream if the user 
                // wishes to play or play and record. The play terminal has to be 
                // selected in any case before the record since the message will always
                // be played before the record

                hr = pStream->SelectTerminal(g_pPlayMedStrmTerm);

                if ( FAILED (hr) )
                {
                    //::MessageBox(NULL,"Select Terminal for Play Failed", "Answer the call", MB_OK);
                    SetStatusMessage(TEXT("Select Terminal for Play Failed"));
					return hr;
                }

                GetMediaStreamTerminal(
                    pAddress,
                    TD_CAPTURE,
                    &g_pRecordMedStrmTerm
                    );
                g_pRecordStream = pStream;
                g_pRecordStream->AddRef();  
            }
        }
        pStream->Release();
    }
    

    // the record terminal is selected on the stream only if the play terminal is not already
    // selected. This will happen only in the case when the user selects only record and no play
    // Only one terminal is selected at a time inorder to support half-duplex lines
    
	if (!g_fPlay)
    {
        hr = g_pRecordStream->SelectTerminal(g_pRecordMedStrmTerm);
       
        if ( FAILED (hr) )
        {
            //::MessageBox(NULL,"Select Terminal for Record Failed", "Answer the call", MB_OK);
            SetStatusMessage(TEXT("Select Terminal for Record Failed"));
			return hr;
        }

        g_pRecordMedStrmTerm->Release();
        g_pRecordStream->Release();
    }
    
    pEnumStreams->Release();

    // release the address
    pAddress->Release();

    return hr;
}
/*
HRESULT
SelectMediaTerminal()
{
    HRESULT                 hr;
    ITCallInfo *            pCallInfo;
    ITAddress *             pAddress;

    g_pRecordStream = NULL;
    g_pPlayMedStrmTerm = NULL;
    g_pRecordMedStrmTerm = NULL;

    if (NULL == gpCall) 
    {    
        return E_UNEXPECTED;
    }

    // get the address object of this call
    gpCall->QueryInterface( IID_ITCallInfo, (void**)&pCallInfo );
    pCallInfo->get_Address( &pAddress );
    pCallInfo->Release();

    ITStreamControl * pStreamControl;

    // get the ITStreamControl interface for this call
    hr = gpCall->QueryInterface(IID_ITStreamControl,
                                (void **) &pStreamControl);

    // enumerate the streams
    IEnumStream * pEnumStreams;
    hr = pStreamControl->EnumerateStreams(&pEnumStreams);
    pStreamControl->Release();

    if (FAILED(hr))
    {
        pAddress->Release();
        gpCall->Release();
        gpCall = NULL;
        return hr;
    }

    // for each stream
    ITStream * pStream;

    // Since we are interested in the audio capture and render streams only, 
    // the while loop terminates when either all the streams are done or 
    // when terminals for both the streams i.e. render and capture are created
    // We will also make sure that even though terminals are created on the 
    // streams only one terminal will be selected to support half duplex lines
    while ( ( S_OK == pEnumStreams->Next(1, &pStream, NULL) )  &&
        ( (g_pPlayMedStrmTerm == NULL) || (g_pRecordMedStrmTerm==NULL) ) ) 
    {
        TERMINAL_DIRECTION td;
        hr = pStream->get_Direction(&td);
    
        if ( SUCCEEDED(hr) )    
        {
            //
            // create the media terminals for this call
            //

            //  Only one capture terminal will be created even if they are multiple capture streams
            //  
            if ( (td == TD_CAPTURE) && g_fPlay && (g_pPlayMedStrmTerm == NULL)) 
            {
                GetMediaStreamTerminal( 
                    pAddress, 
                    TD_CAPTURE,
                    &g_pPlayMedStrmTerm
                    );

                // the created terminal is selected on the stream if the user 
                // wishes to play or play and record. The play terminal has to be 
                // selected in any case before the record since the message will always
                // be played before the record

                hr = pStream->SelectTerminal(g_pPlayMedStrmTerm);

                if ( FAILED (hr) )
                {
                    //::MessageBox(NULL,"Select Terminal for Play Failed", "Answer the call", MB_OK);
                    SetStatusMessage(TEXT("Select Terminal for Play Failed"));
					return hr;
                }
            }

            // Create terminal for Render stream
            // Note that we only create the terminal.. we do not select it on the stream
            if ( (td == TD_RENDER) && g_fRecord && (g_pRecordMedStrmTerm == NULL))
            {
                GetMediaStreamTerminal(
                    pAddress,
                    TD_RENDER,
                    &g_pRecordMedStrmTerm
                    );
                g_pRecordStream = pStream;
                g_pRecordStream->AddRef();  
            }
        }
        pStream->Release();
    }
    

    // the record terminal is selected on the stream only if the play terminal is not already
    // selected. This will happen only in the case when the user selects only record and no play
    // Only one terminal is selected at a time inorder to support half-duplex lines
    
	if (!g_fPlay)
    {
        hr = g_pRecordStream->SelectTerminal(g_pRecordMedStrmTerm);
       
        if ( FAILED (hr) )
        {
            //::MessageBox(NULL,"Select Terminal for Record Failed", "Answer the call", MB_OK);
            SetStatusMessage(TEXT("Select Terminal for Record Failed"));
			return hr;
        }

        g_pRecordMedStrmTerm->Release();
        g_pRecordStream->Release();
    }
    
    pEnumStreams->Release();

    // release the address
    pAddress->Release();

    return hr;
}*/

//DB
bool GetLogin(char username[11], char password[11])
{
	_variant_t temp;
	CoInitialize(NULL);
	try
	{
		_RecordsetPtr pRst("ADODB.Recordset");
		// Connection String
		_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   		// Open table
		char sql[100];
		strcpy(sql,"SELECT * FROM UserT WHERE USER = '");
		strcat(sql,username);
		strcat(sql,"' AND PASSWORD = '");
		strcat(sql,password);
		strcat(sql,"';");
   		pRst->Open(sql, strCnn, adOpenStatic, adLockReadOnly, adCmdText);
		long RecordNum;
		pRst->get_RecordCount(&RecordNum);
		if (RecordNum > 0)
		{
			while (!pRst->EndOfFile)
			{
				temp = (char*)((_bstr_t) pRst->GetFields()->GetItem("CREDIT")->GetValue());
				credit = _wtoi((const unsigned short *)temp.pintVal);
				pRst->MoveNext();
       		}
			pRst->Close();
			return true;
		}
		pRst->Close();
	}
	catch (_com_error)
    {
		DoMessage(TEXT("DB ERROR GetLogin()"));
	}
	return false;
}

bool
PutListDB(char username[11],char tel[8],char day[3],char mon[3],char yr[5],char hr[3],char min[3])
{
	char uid[5];
	ltoa(GetUserID(username),uid,10);
	_variant_t temp;
	CoInitialize(NULL);
	try
	{
		_RecordsetPtr pRst("ADODB.Recordset");
		// Connection String
		_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   		// Open table
		char sql[200];
		strcpy(sql,"INSERT INTO RecordT (DAY,MONTH,YEAR,HOUR,MINUTE,TEL,FILENAME,RETRIES,STATUS,TIMESTAMPED,UID,LASTCALL) VALUES (");
		strcat(sql,day);
		strcat(sql,",");
		strcat(sql,mon);
		strcat(sql,",");
		strcat(sql,yr);
		strcat(sql,",");
		strcat(sql,hr);
		strcat(sql,",");
		strcat(sql,min);
		strcat(sql,",");
		strcat(sql,tel);
		strcat(sql,",");
		char mfn[6];
		itoa(maxfilename,mfn,10);
		strcat(sql,mfn);
		strcat(sql,",");
		char callretryx[2];
		itoa(CALLRETRY,callretryx,10);
		strcat(sql,callretryx);
		strcat(sql,",'NC',0,");
		strcat(sql,uid);
		strcat(sql,",'-');");
   		pRst->Open(sql, strCnn, adOpenDynamic, adLockOptimistic, adCmdText);
		pRst->Close();
	}
	catch (_com_error)
    {
		//DoMessage(TEXT("DB ERROR"));
	}
	
	return true;
}

long
GetUserID(char username[11])
{
	_variant_t temp;
	CoInitialize(NULL);
	try
	{
		_RecordsetPtr pRst("ADODB.Recordset");
		// Connection String
		_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   		// Open table
   		char sql[100];
		strcpy(sql,"SELECT * FROM UserT WHERE USER = '");
		strcat(sql,username);
		strcat(sql,"';");
   		pRst->Open(sql, strCnn, adOpenStatic, adLockReadOnly, adCmdText);
   		pRst->MoveFirst();
       	while (!pRst->EndOfFile) {
			temp = (char*)((_bstr_t) pRst->GetFields()->GetItem("UID")->GetValue());
			pRst->MoveNext();
       	}
       	pRst->Close();
		return _wtoi((const unsigned short *)temp.pintVal);
	}
	catch (_com_error)
    {
		DoMessage(TEXT("DB ERROR GetUserID()"));
	}
	return 0;
}

void GetMaxFilename()
{
	_variant_t temp;
	CoInitialize(NULL);
	try
	{
		_RecordsetPtr pRst("ADODB.Recordset");
		// Connection String
		_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   		// Open table
   		pRst->Open("SELECT * FROM RecordT WHERE FILENAME = (SELECT MAX(FILENAME) FROM RecordT);", strCnn, adOpenStatic, adLockReadOnly, adCmdText);
   		long RecordNum;
		pRst->get_RecordCount(&RecordNum);
		if (RecordNum > 0)
		{
			pRst->MoveFirst();
       		temp = (char*)((_bstr_t) pRst->GetFields()->GetItem("FILENAME")->GetValue());
			maxfilename = _wtoi((const unsigned short *)temp.pintVal);
			maxfilename++;
		}
		else
		{
			DoMessage(TEXT("No Call List Found!"));
		}
       	pRst->Close();
	}
	catch (_com_error)
    {
		DoMessage(TEXT("DB ERROR GetMaxFilename()"));
	}
}

void GetMaxTimeStamped()
{
	_variant_t temp;
	CoInitialize(NULL);
	try
	{
		_RecordsetPtr pRst("ADODB.Recordset");
		// Connection String
		_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   		// Open table
   		pRst->Open("SELECT * FROM RecordT WHERE TIMESTAMPED = (SELECT MAX(TIMESTAMPED) FROM RecordT);", strCnn, adOpenStatic, adLockReadOnly, adCmdText);
   		long RecordNum;
		pRst->get_RecordCount(&RecordNum);
		if (RecordNum > 0)
		{
			pRst->MoveFirst();
       		temp = (char*)((_bstr_t) pRst->GetFields()->GetItem("TIMESTAMPED")->GetValue());
			maxtimestamped = _wtoi((const unsigned short *)temp.pintVal);
			maxtimestamped++;
		}
		else
		{
			DoMessage(TEXT("No Call List Found!"));
		}
       	pRst->Close();
	}
	catch (_com_error)
    {
		DoMessage(TEXT("DB ERROR GetMaxTimeStamped()"));
	}
}

bool CheckUser(char username[11])
{
	_variant_t temp;
	CoInitialize(NULL);
	try
	{
		_RecordsetPtr pRst("ADODB.Recordset");
		// Connection String
		_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   		// Open table
		char sql[100];
		strcpy(sql,"SELECT * FROM UserT WHERE USER = '");
		strcat(sql,username);
		strcat(sql,"';");
   		pRst->Open(sql, strCnn, adOpenStatic, adLockReadOnly, adCmdText);
		long RecordNum;
		pRst->get_RecordCount(&RecordNum);
		pRst->Close();
		if (RecordNum > 0)	
			return false;
	}
	catch (_com_error)
    {
		DoMessage(TEXT("DB ERROR CheckUser()"));
	}
	return true;
}

bool CheckCard(char cardno[13])
{
	_variant_t temp;
	CoInitialize(NULL);
	try
	{
		_RecordsetPtr pRst("ADODB.Recordset");
		// Connection String
		_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   		// Open table
		char sql[100];
		strcpy(sql,"SELECT * FROM CardT WHERE CARD_NO = '");
		strcat(sql,cardno);
		strcat(sql,"' AND UID = 0;");
   		pRst->Open(sql, strCnn, adOpenStatic, adLockReadOnly, adCmdText);
		long RecordNum;
		pRst->get_RecordCount(&RecordNum);
		pRst->Close();
		if (RecordNum > 0)
			return true;
	}
	catch (_com_error)
    {
		DoMessage(TEXT("DB ERROR CheckCard()"));
	}
	return false;
}

bool UpdateCard(char cardno[13])
{
	long uid=0;
	_variant_t temp;
	CoInitialize(NULL);

	//get max UID
	try
	{
		_RecordsetPtr pRst("ADODB.Recordset");
		// Connection String
		_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   		// Open table
   		pRst->Open("SELECT * FROM UserT WHERE UID = (SELECT MAX(UID) FROM UserT);", strCnn, adOpenDynamic, adLockOptimistic, adCmdText);
   		pRst->MoveFirst();
		temp = (char*)((_bstr_t) pRst->GetFields()->GetItem("UID")->GetValue());
       	pRst->Close();
	}
	catch (_com_error)
    {
		DoMessage(TEXT("DB ERROR UpdateCard()"));
		return false;
	}
	uid = _wtoi((const unsigned short *)temp.pintVal);
	uid++;

	//update UID to card table
	try
	{
		_RecordsetPtr pRst("ADODB.Recordset");
		// Connection String
		_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   		// Open table
		// construct sql command
		char sql[80];
		// STATUS S is SUCCESS
		strcpy(sql,"UPDATE CardT SET UID = ");
		char idtemp[5];
		itoa(uid,idtemp,10);
		strcat(sql,idtemp);
		strcat(sql," , ACTIVATE = '");
		strcat(sql,timenow);
		strcat(sql,"' WHERE CARD_NO = '");
		strcat(sql,cardno);
		strcat(sql,"';");
   		pRst->Open(sql, strCnn, adOpenDynamic, adLockOptimistic, adCmdText);
       	pRst->Close();
	}
	catch (_com_error)
    {
		//DoMessage(L"DB ERROR");
	}
	return true;
}

long CreditCard(char cardno[13])
{
	_variant_t temp;
	CoInitialize(NULL);
	try
	{
		_RecordsetPtr pRst("ADODB.Recordset");
		// Connection String
		_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   		// Open table
		char sql[100];
		strcpy(sql,"SELECT * FROM CardT T1, CardTypeT T2 WHERE T1.C_TYPE = T2.C_TYPE AND CARD_NO = '");
		strcat(sql,cardno);
		strcat(sql,"';");
   		pRst->Open(sql, strCnn, adOpenStatic, adLockReadOnly, adCmdText);
		long RecordNum;
		pRst->get_RecordCount(&RecordNum);
		if (RecordNum = 0)
			return 0;
		pRst->MoveFirst();
		temp = (char*)((_bstr_t) pRst->GetFields()->GetItem("VALUE")->GetValue());
		pRst->Close();
	}
	catch (_com_error)
    {
		DoMessage(TEXT("DB ERROR CreditCard()"));
	}
	return _wtoi((const unsigned short *)temp.pintVal);
}

bool UpdateUser(char username[],char password[],long cardvalue,char email[])
{
	_variant_t temp;
	CoInitialize(NULL);
	try
	{
		_RecordsetPtr pRst("ADODB.Recordset");
		// Connection String
		_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   		// Open table
		// construct sql command
		char sql[200];
		// STATUS S is SUCCESS
		strcpy(sql,"INSERT INTO UserT (USER,PASSWORD,CREDIT,EMAIL) VALUES ('");
		strcat(sql,username);
		strcat(sql,"','");
		strcat(sql,password);
		strcat(sql,"',");
		char temp[5];
		ltoa(cardvalue,temp,10);
		strcat(sql,temp);
		strcat(sql,",'");
		strcat(sql,email);
		strcat(sql,"');");
   		pRst->Open(sql, strCnn, adOpenDynamic, adLockOptimistic, adCmdText);
       	pRst->Close();
	}
	catch (_com_error)
    {
		//DoMessage(L"DB ERROR");
	}
	return true;
}

bool ActivateCard(char username[11],char cardno[13])
{
	long uid=0;
	_variant_t temp;
	CoInitialize(NULL);

	//get UID
	try
	{
		_RecordsetPtr pRst("ADODB.Recordset");
		// Connection String
		_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   		// Open table
		char sql[80];
		strcpy(sql,"SELECT * FROM UserT WHERE USER = '");
		strcat(sql,username);
		strcat(sql,"';");
   		pRst->Open(sql, strCnn, adOpenStatic, adLockReadOnly, adCmdText);
   		pRst->MoveFirst();
		temp = (char*)((_bstr_t) pRst->GetFields()->GetItem("UID")->GetValue());
       	pRst->Close();
	}
	catch (_com_error)
    {
		DoMessage(TEXT("DB ERROR ActivateCard()"));
		return false;
	}
	uid = _wtoi((const unsigned short *)temp.pintVal);

	//update UID to card table
	try
	{
		_RecordsetPtr pRst("ADODB.Recordset");
		// Connection String
		_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   		// Open table
		// construct sql command
		char sql[80];
		strcpy(sql,"UPDATE CardT SET UID = ");
		char idtemp[5];
		itoa(uid,idtemp,10);
		strcat(sql,idtemp);
		strcat(sql," , ACTIVATE = '");
		strcat(sql,timenow);
		strcat(sql,"' WHERE CARD_NO = '");
		strcat(sql,cardno);
		strcat(sql,"';");
   		pRst->Open(sql, strCnn, adOpenDynamic, adLockOptimistic, adCmdText);
       	pRst->Close();
	}
	catch (_com_error)
    {
		//DoMessage(L"DB ERROR");
	}
	return true;
}

bool AddCredit(char username[11],long cardvalue)
{
	long oldcredit=0;
	_variant_t temp;
	CoInitialize(NULL);
	try
	{
		_RecordsetPtr pRst("ADODB.Recordset");
		// Connection String
		_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   		// Open table
   		char sql[100];
		strcpy(sql,"SELECT * FROM UserT WHERE USER = '");
		strcat(sql,username);
		strcat(sql,"';");
   		pRst->Open(sql, strCnn, adOpenStatic, adLockReadOnly, adCmdText);
		pRst->MoveFirst();
		temp = (char*)((_bstr_t) pRst->GetFields()->GetItem("CREDIT")->GetValue());
       	pRst->Close();
	}
	catch (_com_error)
    {
		DoMessage(TEXT("DB ERROR AddCredit()"));
		return false;
	}
	oldcredit = _wtoi((const unsigned short *)temp.pintVal);
	credit = cardvalue + oldcredit;

	try
	{
		_RecordsetPtr pRst("ADODB.Recordset");
		// Connection String
		_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   		// Open table
		// construct sql command
		char sql[80];
		// STATUS S is SUCCESS
		strcpy(sql,"UPDATE UserT SET CREDIT = ");
		char ctemp[5];
		itoa(credit,ctemp,10);
		strcat(sql,ctemp);
		strcat(sql," WHERE USER = '");
		strcat(sql,username);
		strcat(sql,"';");
   		pRst->Open(sql, strCnn, adOpenDynamic, adLockOptimistic, adCmdText);
       	pRst->Close();
	}
	catch (_com_error)
    {
		//DoMessage(L"DB ERROR");
	}
	return true;
}

//db
void GetNextCall()
{
	_variant_t temp;
	bool done = false;
	CoInitialize(NULL);
	try
	{
		while (!done)
		{
			_RecordsetPtr pRst("ADODB.Recordset");
			// Connection String
			_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   			// Open table
			// STATUS C is CALLED and NC is NOTCALL
   			pRst->Open("select * from RecordT t1 where t1.status in ('C','NC') order by year,month,day,hour,minute,timestamped;", strCnn, adOpenStatic, adLockReadOnly, adCmdText);
			long RecordNum;
			pRst->get_RecordCount(&RecordNum);
			if (RecordNum > 0)
			{
				pRst->MoveFirst();
				temp = (char*)((_bstr_t) pRst->GetFields()->GetItem("YEAR")->GetValue());
				p_yr = _wtoi((const unsigned short *)temp.pintVal);
				temp = (char*)((_bstr_t) pRst->GetFields()->GetItem("MONTH")->GetValue());
				p_mon = _wtoi((const unsigned short *)temp.pintVal);
				temp = (char*)((_bstr_t) pRst->GetFields()->GetItem("DAY")->GetValue());
				p_day = _wtoi((const unsigned short *)temp.pintVal);
				temp = (char*)((_bstr_t) pRst->GetFields()->GetItem("HOUR")->GetValue());
				p_hr = _wtoi((const unsigned short *)temp.pintVal);
				temp = (char*)((_bstr_t) pRst->GetFields()->GetItem("MINUTE")->GetValue());
				p_min = _wtoi((const unsigned short *)temp.pintVal);
				temp = (char*)((_bstr_t) pRst->GetFields()->GetItem("ID")->GetValue());
				p_id = _wtoi((const unsigned short *)temp.pintVal);
				temp = (char*)((_bstr_t) pRst->GetFields()->GetItem("RETRIES")->GetValue());
				p_retry = _wtoi((const unsigned short *)temp.pintVal);
				temp = (char*)((_bstr_t) pRst->GetFields()->GetItem("TIMESTAMPED")->GetValue());
				p_ts = _wtoi((const unsigned short *)temp.pintVal);
				temp = (char*)((_bstr_t) pRst->GetFields()->GetItem("UID")->GetValue());
				p_uid = _wtoi((const unsigned short *)temp.pintVal);
				temp = (char*)((_bstr_t) pRst->GetFields()->GetItem("TEL")->GetValue());
				p_tel = (unsigned short *)temp.plVal;
				temp = (char*)((_bstr_t) pRst->GetFields()->GetItem("FILENAME")->GetValue());
				p_file = (unsigned short *)temp.plVal;
			}
       		pRst->Close();
			// check if time and date are reasonable
			if (RecordNum > 0)
			{
				if (p_yr > s_yr)
					done = true; 
				if (p_yr == s_yr)
				{
					if (p_mon > s_mon)
						done = true;
					if (p_mon == s_mon)
					{
						if (p_day > s_day)
							done = true;
						if (p_day == s_day)
						{
							if (p_hr > s_hr)
								done = true;
							if (p_hr == s_hr)
							{
								if (p_min >= s_min-CALLTIMEOUT)
								{
									if (p_min <= s_min)
										callnow = true;
									done = true;
								}
								else UpdateTimeout(p_id);
							}
							if (p_hr < s_hr)
							{
								if ((p_hr+1 == s_hr) && (p_min-s_min >= 60-CALLTIMEOUT))
								{
									done = true;
									callnow = true;
								}
								else UpdateTimeout(p_id);
							}
						}
						if (p_day < s_day)
						{
							if ((p_day+1 == s_day) && (p_hr == 23) && (s_hr == 0) && (p_min-s_min >= 60-CALLTIMEOUT))
							{
								done = true;
								callnow = true;
							}
							else UpdateTimeout(p_id);
						}
					}
					if (p_mon < s_mon) //no error checking for over months... 
						UpdateTimeout(p_id);
				}
				if (p_yr < s_yr)
				{
					if ((p_yr+1 == s_yr) && (p_mon == 12) && (s_mon == 1) && (p_day == 31) && (s_day == 1) && (p_hr == 23) && (s_hr == 0) && (p_min-s_min >= 60-CALLTIMEOUT))
					{
						callnow = true;
						done = true;
					}
					else UpdateTimeout(p_id);
				}
			}	
			else 
			{
				p_day = 0; p_mon = 0; p_yr = 0; p_hr = 0; p_min = 0; p_tel = (unsigned short *)"0", p_file = L"0";
				done = true; //nothing to call
			}
		}
	}
	catch (_com_error)
    {
		//DoMessage(L"DB ERROR");
		//cout<<(char*) e.Description();
	}
	
	//show next call
	char temp2[5],nextcall[50], temptel[11];
	itoa(p_day,temp2,10);
	strcpy(nextcall,temp2);
	strcat(nextcall,"/");
	itoa(p_mon,temp2,10);
	strcat(nextcall,temp2);
	strcat(nextcall,"/");
	itoa(p_yr,temp2,10);
	strcat(nextcall,temp2);
	strcat(nextcall," at ");
	itoa(p_hr,temp2,10);
	strcat(nextcall,temp2);
	strcat(nextcall,":");
	itoa(p_min,temp2,10);
	strcat(nextcall,temp2);
	strcat(nextcall," Tel# ");
	wcstombs(temptel,p_tel,wcslen(p_tel));
	temptel[wcslen(p_tel)] = '\0';
	strcat(nextcall,temptel);
	strcat(nextcall," - file ");
	for (int i=0; i < 10; i++)
				pp_tel[i] = '\0';
	mbstowcs(pp_tel,temptel,wcslen(p_tel));

	wcstombs(temptel,p_file,wcslen(p_file));
	temptel[wcslen(p_file)] = '\0';

	strcat(nextcall,temptel);
	strcat(nextcall,".avi");
	mbstowcs(pp_file,temptel,wcslen(p_file));

	SetDlgItemText(ghDlg,IDC_NEXTCALL,nextcall);

	GetCredit();
	GetUsername(p_uid);
}

void GetUsername(int p_uid)
{
	_variant_t temp;
	CoInitialize(NULL);
	try
	{
		_RecordsetPtr pRst("ADODB.Recordset");
		// Connection String
		_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   		// Open table
		//construct sql command
		char sql[80];
		// STATUS T is TIMEOUT
		strcpy(sql,"SELECT * FROM UserT WHERE UID = ");
		char idtemp[5];
		itoa(p_uid,idtemp,10);
		strcat(sql,idtemp);
		strcat(sql,";");
   		pRst->Open(sql, strCnn, adOpenStatic, adLockReadOnly, adCmdText);
   		long RecordNum;
		pRst->get_RecordCount(&RecordNum);
		if (RecordNum > 0)
		{
			pRst->MoveFirst();
       		temp = (char*)((_bstr_t) pRst->GetFields()->GetItem("USER")->GetValue());
			PWCHAR pp_user;
			pp_user = (unsigned short *)temp.plVal;
			int j = 0;
			j = wcslen(pp_user);
			for (int i=0; i < 10; i++)
				p_user[i] = '\0';
			wcstombs(p_user,pp_user,wcslen(pp_user));
			SetDlgItemText(ghDlg,IDC_USER,p_user);
		}
		else
		{
			DoMessage(TEXT("No Call List Found!"));
		}
       	pRst->Close();
	}
	catch (_com_error)
    {
		DoMessage(TEXT("DB ERROR GetMaxFilename()"));
	}
}

void GetCredit()
{
	CoInitialize(NULL);
	_variant_t tempx;
	try
	{
		_RecordsetPtr pRst("ADODB.Recordset");
		// Connection String
		_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   		// Open table
		//construct sql command
		char sql[80];
		// STATUS T is TIMEOUT
		strcpy(sql,"SELECT * FROM UserT WHERE UID = ");
		char idtemp[5];
		itoa(p_uid,idtemp,10);
		strcat(sql,idtemp);
		strcat(sql,";");
   		pRst->Open(sql, strCnn, adOpenStatic, adLockReadOnly, adCmdText);
   		long RecordNum;
		pRst->get_RecordCount(&RecordNum);
		if (RecordNum > 0)
		{
			pRst->MoveFirst();
       		tempx = (char*)((_bstr_t) pRst->GetFields()->GetItem("CREDIT")->GetValue());
			p_credit = _wtoi((const unsigned short *)tempx.pintVal);
			char tempc[5];
			itoa(p_credit,tempc,10);
			SetDlgItemText(ghDlg,IDC_CREDIT,tempc);
		}
		else
		{
			DoMessage(TEXT("GetNextCall() Credit not found!"));
		}
       	pRst->Close();
	}
	catch (_com_error)
    {
		DoMessage(TEXT("DB ERROR GetNextCall()"));
	}
}

void UpdateTimeout(int id)
{
	_variant_t temp;
	CoInitialize(NULL);
	try
	{
		_RecordsetPtr pRst("ADODB.Recordset");
		// Connection String
		_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   		// Open table
		//construct sql command
		char sql[80];
		// STATUS T is TIMEOUT
		strcpy(sql,"UPDATE RecordT SET STATUS = 'T' WHERE ID = ");
		char idtemp[5];
		itoa(id,idtemp,10);
		strcat(sql,idtemp);
		strcat(sql,";");
   		pRst->Open(sql, strCnn, adOpenDynamic, adLockOptimistic, adCmdText);
       	pRst->Close();
	}
	catch (_com_error)
    {
		//DoMessage(L"DB ERROR");
	}
}

void UpdateSuccess(int id)
{
	_variant_t temp;
	CoInitialize(NULL);
	try
	{
		_RecordsetPtr pRst("ADODB.Recordset");
		// Connection String
		_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   		// Open table
		// construct sql command
		char sql[80];
		// STATUS S is SUCCESS
		strcpy(sql,"UPDATE RecordT SET STATUS = 'S' , LASTCALL = '");
		strcat(sql,timenow);
		strcat(sql,"' WHERE ID = ");
		char idtemp[5];
		itoa(id,idtemp,10);
		strcat(sql,idtemp);
		strcat(sql,";");
   		pRst->Open(sql, strCnn, adOpenDynamic, adLockOptimistic, adCmdText);
       	pRst->Close();
	}
	catch (_com_error)
    {
		//DoMessage(L"DB ERROR");
	}

	int creditleft;
	creditleft = p_credit - money;
	if (creditleft < 0 ) creditleft = 0;

	try
	{
		_RecordsetPtr pRst("ADODB.Recordset");
		// Connection String
		_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   		// Open table
		// construct sql command
		char sql2[80];
		// STATUS S is SUCCESS
		strcpy(sql2,"UPDATE UserT SET CREDIT = ");
		char tempc[10];
		itoa(creditleft,tempc,10);
		strcat(sql2,tempc);
		strcat(sql2," WHERE UID = ");
		char idtemp2[5];
		itoa(p_uid,idtemp2,10);
		strcat(sql2,idtemp2);
		strcat(sql2,";");
   		pRst->Open(sql2, strCnn, adOpenDynamic, adLockOptimistic, adCmdText);
       	pRst->Close();
	}
	catch (_com_error)
    {
		//DoMessage(L"DB ERROR");
	}

}

void UpdateNextCall(int id)
{
	GetMaxTimeStamped();
	p_retry = p_retry - 1;
	if (p_retry > 0)
	{
		//update to C
		_variant_t temp;
		CoInitialize(NULL);
		try
		{
			_RecordsetPtr pRst("ADODB.Recordset");
			// Connection String
			_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   			// Open table
			// construct sql command
			char sql[200];
			// STATUS S is SUCCESS
			strcpy(sql,"UPDATE RecordT SET STATUS = 'C', RETRIES = ");
			char tempr[2];
			itoa(p_retry,tempr,10);
			strcat(sql,tempr);
			strcat(sql,", TIMESTAMPED = ");
			p_ts++;
			char tempt[5];
			itoa(maxtimestamped,tempt,10);
			strcat(sql,tempt);
			strcat(sql,", LASTCALL = '");
			strcat(sql,timenow);
			strcat(sql,"' WHERE ID = ");
			char idtemp[5];
			itoa(id,idtemp,10);
			strcat(sql,idtemp);
			strcat(sql,";");
   			pRst->Open(sql, strCnn, adOpenDynamic, adLockOptimistic, adCmdText);
       		pRst->Close();
		}
		catch (_com_error)
		{
			//DoMessage(L"DB ERROR");
		}
	}
	if (p_retry == 0)
	{
		//update to NS
		_variant_t temp;
		CoInitialize(NULL);
		try
		{
			_RecordsetPtr pRst("ADODB.Recordset");
			// Connection String
			_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   			// Open table
			// construct sql command
			char sql[200];
			// STATUS S is SUCCESS
			strcpy(sql,"UPDATE RecordT SET STATUS = 'NS', RETRIES = ");
			char tempr[2];
			itoa(p_retry,tempr,10);
			strcat(sql,tempr);
			strcat(sql,", TIMESTAMPED = ");
			p_ts++;
			char tempt[5];
			itoa(p_ts,tempt,10);
			strcat(sql,tempt);
			strcat(sql,", LASTCALL = '");
			strcat(sql,timenow);
			strcat(sql,"' WHERE ID = ");
			char idtemp[5];
			itoa(id,idtemp,10);
			strcat(sql,idtemp);
			strcat(sql,";");
   			pRst->Open(sql, strCnn, adOpenDynamic, adLockOptimistic, adCmdText);
       		pRst->Close();
		}
		catch (_com_error)
		{
			//DoMessage(L"DB ERROR");
		}
	}
}

double GetCallRate()
{
	char tempt[10],area[5];
	int j=0,result=0;
	wcstombs(tempt,pp_tel,wcslen(pp_tel));

	//get area code
	if (tempt[0] == '0')
	{
		if (tempt[1] == '1')
		{
			strcpy(area,"01");
			area[2] = '\0';
		}
		else
		{
			for (int i=0;i<3;i++)
			{
				area[j] = tempt[i];
				j++;
			}
			area[3] = '\0';
		}
	}
	else
	{
		strcpy(area,"02");
		area[2] = '\0';
	}

	_variant_t temp;
	CoInitialize(NULL);

	//get call rate of area code
	try
	{
		_RecordsetPtr pRst("ADODB.Recordset");
		// Connection String
		_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   		// Open table
		char sql[80];
		strcpy(sql,"SELECT * FROM CallRateT WHERE AREACODE = '");
		strcat(sql,area);
		strcat(sql,"';");
   		pRst->Open(sql, strCnn, adOpenStatic, adLockReadOnly, adCmdText);
   		pRst->MoveFirst();
		temp = (char*)((_bstr_t) pRst->GetFields()->GetItem("RATE")->GetValue());
       	pRst->Close();
	}
	catch (_com_error)
    {
		DoMessage(TEXT("DB ERROR GetCallRate()"));
		return -1;
	}

	result = _strnicmp(area,"02",2);
	if (result == 0)
		//fix rate
		timemeter = false;
	else
		//time metering
		timemeter = true;

	PWCHAR temp1;
	return wcstod((const unsigned short *)temp.pintVal,&temp1);
}

void GetList(char username[11])
{
	//get UID
	int v_uid = 0;
	CoInitialize(NULL);
	_variant_t tempx;
	try
	{
		_RecordsetPtr pRst("ADODB.Recordset");
		// Connection String
		_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   		// Open table
		//construct sql command
		char sql[80];
		strcpy(sql,"SELECT * FROM UserT WHERE USER = '");
		strcat(sql,username);
		strcat(sql,"';");
   		pRst->Open(sql, strCnn, adOpenStatic, adLockReadOnly, adCmdText);
   		long RecordNum;
		pRst->get_RecordCount(&RecordNum);
		if (RecordNum > 0)
		{
			pRst->MoveFirst();
       		tempx = (char*)((_bstr_t) pRst->GetFields()->GetItem("UID")->GetValue());
			//v_uid = _wtoi((const unsigned short *)tempx.pintVal);
			PWCHAR tempid;
			tempid = (unsigned short *)tempx.plVal;
			v_uid = _wtoi(tempid);
		}
		else
		{
			DoMessage(TEXT("GetList() Credit not found!"));
		}
       	pRst->Close();
	}
	catch (_com_error)
    {
		DoMessage(TEXT("DB ERROR GetList()"));
	}

	//get List
	int v_day = 0;
	char v_status[20];
	try
	{
		_RecordsetPtr pRst("ADODB.Recordset");
		// Connection String
		_bstr_t strCnn("DRIVER={Microsoft Access Driver (*.mdb)};UID=admin;DBQ=data/record.mdb");
   		// Open table
		// construct sql command
		char sql[80];
		strcpy(sql,"SELECT * FROM RecordT WHERE UID = ");
		char tempv[10];
		itoa(v_uid,tempv,10);
		strcat(sql,tempv);
		strcat(sql,";");
   		pRst->Open(sql, strCnn, adOpenStatic, adLockReadOnly, adCmdText);
   		long RecordNum;
		pRst->get_RecordCount(&RecordNum);
		if (RecordNum > 0)
		{
			char msgsend[80];
			pRst->MoveFirst();
			while (!pRst->EndOfFile)
			{
				for (int i=0;i<80;i++)
					msgsend[i] = '\0';
				strcpy(msgsend,"list ");

       			tempx = (char*)((_bstr_t) pRst->GetFields()->GetItem("DAY")->GetValue());
				v_day = _wtoi((const unsigned short *)tempx.pintVal);
				itoa(v_day,tempv,10);
				strcat(msgsend,tempv);
				strcat(msgsend,"/");
       			tempx = (char*)((_bstr_t) pRst->GetFields()->GetItem("MONTH")->GetValue());
				v_day = _wtoi((const unsigned short *)tempx.pintVal);
				itoa(v_day,tempv,10);
				strcat(msgsend,tempv);
				strcat(msgsend,"/");
       			tempx = (char*)((_bstr_t) pRst->GetFields()->GetItem("YEAR")->GetValue());
				v_day = _wtoi((const unsigned short *)tempx.pintVal);
				itoa(v_day,tempv,10);
				strcat(msgsend,tempv);
				strcat(msgsend," ");
				tempx = (char*)((_bstr_t) pRst->GetFields()->GetItem("HOUR")->GetValue());
				v_day = _wtoi((const unsigned short *)tempx.pintVal);
				itoa(v_day,tempv,10);
				strcat(msgsend,tempv);
				strcat(msgsend,":");
				tempx = (char*)((_bstr_t) pRst->GetFields()->GetItem("MINUTE")->GetValue());
				v_day = _wtoi((const unsigned short *)tempx.pintVal);
				itoa(v_day,tempv,10);
				strcat(msgsend,tempv);
				strcat(msgsend," ");
				tempx = (char*)((_bstr_t) pRst->GetFields()->GetItem("TEL")->GetValue());
				v_day = _wtoi((const unsigned short *)tempx.pintVal);
				itoa(v_day,tempv,10);
				strcat(msgsend,tempv);
				strcat(msgsend," ");
				tempx = (char*)((_bstr_t) pRst->GetFields()->GetItem("STATUS")->GetValue());
				PWCHAR v_temp;
				v_temp = (unsigned short *)tempx.plVal;
				wcstombs(v_status,v_temp,12);
				strcat(msgsend,v_status);
				strcat(msgsend," ");
				tempx = (char*)((_bstr_t) pRst->GetFields()->GetItem("LASTCALL")->GetValue());
				v_temp = (unsigned short *)tempx.plVal;
				wcstombs(v_status,v_temp,20);
				strcat(msgsend,v_status);
				send(sock, msgsend, 80, 0);
				Sleep(50);
				pRst->MoveNext();
       		}
			Sleep(50);
			strcpy(msgsend,"pass");
			send(sock, msgsend, 80, 0);
		}
		else
		{
			SetStatusMessage(TEXT("GetList2() List not found!"));
			send(sock, "errr No Existing List!", 80, 0);
		}
       	pRst->Close();
	}
	catch (_com_error)
    {
		//DoMessage(TEXT("DB ERROR GetList2()"));
	}
}

////////////////////////////////
// TTS
void SpeakToFile()
{
	HRESULT hr;

	//set format to SPSF_8kHz16BitMono
    CSpStreamFormat Fmt;
    Fmt.AssignFormat(SPSF_8kHz16BitMono);
	if ( m_cpOutAudio )
	{
		hr = m_cpOutAudio->SetFormat( Fmt.FormatId(), Fmt.WaveFormatExPtr() );
	}
	else
	{
		hr = E_FAIL;
	}

    if( SUCCEEDED( hr ) )
    {
        hr = m_cpVoice->SetOutput( m_cpOutAudio, FALSE );
    }

    if( FAILED( hr ) )
    {
        DoMessage( TEXT("Format rejected!") );
    }

	//set Microsoft SAM 's voice
	const WCHAR * pszCatName, * pszRequiredAttrib = NULL, * pszOptionalAttrib = NULL;
	pszCatName = SPCAT_VOICES;
	ISpObjectToken * pToken;        // NOTE:  Not a CComPtr!  Be Careful.
	CComPtr<IEnumSpObjectTokens> cpEnum;
	hr = SpEnumTokens(pszCatName, pszRequiredAttrib, pszOptionalAttrib, &cpEnum);
	if (hr == S_OK)
	{
		bool fSetDefault = false;
		while (cpEnum->Next(1, &pToken, NULL) == S_OK)
		{
			CSpDynamicString dstrDesc;
			hr = SpGetDescription(pToken, &dstrDesc);
			if (SUCCEEDED(hr))
			{
				USES_CONVERSION;
				WCHAR sam[] = L"Microsoft Sam";
				if (wcscmp(dstrDesc,sam) == 0)
					hr = m_cpVoice->SetVoice( pToken );
			}
			if (FAILED(hr))
			{
				pToken->Release();
			}
		}
	}
	else
	{
		hr = SPERR_NO_MORE_ITEMS;
	}

	//
	USES_CONVERSION;

	CComPtr<ISpStreamFormat>    cpOldStream;
	CComPtr<ISpStream>  cpWavStream;

	WCHAR m_szWFileName[] = L"record/rec.wav";

	CSpStreamFormat OriginalFmt;
	hr = m_cpVoice->GetOutputStream( &cpOldStream );
	
	if (hr == S_OK)
	{
		hr = OriginalFmt.AssignFormat(cpOldStream);
	}
	else
	{
		hr = E_FAIL;
	}
	// User SAPI helper function in sphelper.h to create a wav file
	if (SUCCEEDED(hr))
	{
		hr = SPBindToFile( m_szWFileName, SPFM_CREATE_ALWAYS, &cpWavStream, &OriginalFmt.FormatId(), OriginalFmt.WaveFormatExPtr() ); 
	}
	if( SUCCEEDED( hr ) )
	{
		// Set the voice's output to the wav file instead of the speakers
		hr = m_cpVoice->SetOutput(cpWavStream, TRUE);
	}

	if ( SUCCEEDED( hr ) )
	{
		// Do the Speak
		HandleSpeak();
	}

	// Set output back to original stream
	// Wait until the speak is finished if saving to a wav file so that
	// the smart pointer cpWavStream doesn't get released before its
	// finished writing to the wav.
	m_cpVoice->WaitUntilDone( INFINITE );
	cpWavStream.Release();
	
	// Reset output
	m_cpVoice->SetOutput( cpOldStream, FALSE );
}

void HandleSpeak()
{
	HRESULT             hr = S_OK;
    //WCHAR               szWTextString[] = L"Hello 1 Hello 2";
	WCHAR               szWTextString[200];
	mbstowcs(szWTextString,tts,strlen(tts));

	// do we speak or interpret the XML
	hr = m_cpVoice->Speak( szWTextString, SPF_ASYNC | SPF_IS_NOT_XML, 0 );

	if( FAILED( hr ) )
	{
		DoMessage(TEXT("Speak error") );
	}

	// Set state to run
	hr = m_cpVoice->Resume();            

	if( FAILED( hr ) )
	{
		DoMessage(TEXT("Speak error2") );
	}
}