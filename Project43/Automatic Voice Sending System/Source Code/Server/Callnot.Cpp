
#include <windows.h>
#include <tapi3.h>
#include <control.h>
#include <strmif.h>

#include "callnot.h"
#include "resource.h"
#include "term.h"

extern ITBasicCallControl * gpCall;
extern HWND ghDlg;
extern BSTR gbstrAudio;

extern bool g_fPlay;
extern bool g_fRecord;

extern ITTerminal *g_pPlayMedStrmTerm, *g_pRecordMedStrmTerm;
extern ITStream *g_pRecordStream;

//dtmf
extern bool pdigit;
extern void GetNextCall();

//db
extern void UpdateNextCall(int id);
extern void UpdateSuccess(int id);
extern int p_id;
extern WCHAR pp_file[10];

//operation
extern bool callingnow, callnow;
extern WCHAR g_wszReadFileName[11];
extern int step;

CWorkerThread gWorkerThread;

void
DoMessage(
          LPTSTR pszMessage
         );

void
SetStatusMessage(
                 LPTSTR pszMessage
                );

HRESULT
SelectMediaTerminal();

HRESULT GetTerminalFromStreamEvent( ITCallMediaEvent * pCallMediaEvent,
                                    ITTerminal ** ppTerminal )
{
    HRESULT hr;

    //
    // Get the stream for this event.
    //

    ITStream * pStream;
    hr = pCallMediaEvent->get_Stream( &pStream );
    if ( FAILED(hr) || (pStream == NULL) ) return E_FAIL;

    //
    // Enumerate the terminals on this stream.
    //

    IEnumTerminal * pEnumTerminal;
    hr = pStream->EnumerateTerminals( &pEnumTerminal );
    pStream->Release();
    if ( FAILED(hr) ) return hr;

    //
    // Get the first terminal -- if there aren't any, return E_FAIL so that
    // we skip this event (this happens when the terminal is on the other
    // stream).
    //

    hr = pEnumTerminal->Next(1, ppTerminal, NULL);
    if ( hr != S_OK )
    {
        pEnumTerminal->Release();
        return E_FAIL;
    }

    //
    // Sanity check: see if there's more than one terminal. That shouldn't
    // happen since we only ever select one terminal on each stream.
    //

    ITTerminal * pExtraTerminal;
    hr = pEnumTerminal->Next(1, &pExtraTerminal, NULL);
    pEnumTerminal->Release();

    if ( hr == S_OK ) // more than one terminal -- impossible!
    {
        pExtraTerminal->Release();
        (*ppTerminal)->Release();
        *ppTerminal = NULL;
        return E_UNEXPECTED;
    }

    return S_OK;
}

///////////////////////////////////////////////////////////////////
// PlayAndRecordMessage
//
// Plays a recorded message and records the incoming message.
//
///////////////////////////////////////////////////////////////////
HRESULT PlayAndRecordMessage(ITTerminal *pPlayStreamTerm, ITTerminal *pRecordStreamTerm)
{
	CStreamMessageWI *pwi = new CStreamMessageWI();
    BOOL InitStatus = pwi->Init(pPlayStreamTerm, pRecordStreamTerm);
    if (!InitStatus)    return E_FAIL;

    return gWorkerThread.AsyncWorkItem(pwi);
}

///////////////////////////////////////////////////////////////////
// CallEventNotification
//
// The only method in the ITCallEventNotification interface.  This gets
// called by TAPI 3.0 when there is a call event to report. This just
// posts the message to our UI thread, so that we do as little as
// possible on TAPI's callback thread.
//
///////////////////////////////////////////////////////////////////

HRESULT
STDMETHODCALLTYPE
CTAPIEventNotification::Event(
                              TAPI_EVENT TapiEvent,
                              IDispatch * pEvent
                             )
{
    //
    // Addref the event so it doesn't go away.
    //

    pEvent->AddRef();

    //
    // Post a message to our own UI thread.
    //

    PostMessage(
                ghDlg,
                WM_PRIVATETAPIEVENT,
                (WPARAM) TapiEvent,
                (LPARAM) pEvent
               );

    return S_OK;
}

///////////////////////////////////////////////////////////////////
// OnTapiEvent
//
// This is the real event handler, called on our UI thread when
// the WM_PRIVATETAPIEVENT message is received
//
///////////////////////////////////////////////////////////////////

HRESULT
OnTapiEvent(
            TAPI_EVENT TapiEvent,
            IDispatch * pEvent
           )
{
    HRESULT hr;

    switch ( TapiEvent )
    {
        case TE_CALLNOTIFICATION:
        {
            // CET_CALLNOTIFICATION means that the application is being notified
            // of a new call.
            //
            // Note that we don't answer to call at this point.  The application
            // should wait for a CS_OFFERING CallState message before answering
            // the call.

            ITCallNotificationEvent         * pNotify;
            

            hr = pEvent->QueryInterface( IID_ITCallNotificationEvent, (void **)&pNotify );

            if (S_OK != hr)
            {
                DoMessage( TEXT("Incoming call, but failed to get the interface"));
            }
            else
            {
                CALL_PRIVILEGE          cp;
                ITCallInfo *            pCall;

                //
                // get the call
                //

                hr = pNotify->get_Call( &pCall );
                
                //
                // release the event object
                //

                pNotify->Release();

                //
                // check to see if we own the call
                //

                hr = pCall->get_Privilege( &cp );

                if ( CP_OWNER != cp )
                {
                    // just ignore it if we don't own it
                    pCall->Release();

                    pEvent->Release(); // we addrefed it CTAPIEventNotification::Event()

                    return S_OK;
                }

                hr = pCall->QueryInterface( IID_ITBasicCallControl, (void**)&gpCall );

                pCall->Release();

                //
                // update UI
                //
                SetStatusMessage(TEXT("Incoming Owner Call"));
            }
            
            break;
        }
        
        case TE_CALLSTATE:
        {
            // TE_CALLSTATE is a call state event.  pEvent is
            // an ITCallStateEvent

            CALL_STATE         cs;
            ITCallStateEvent * pCallStateEvent;

            // Get the interface
            pEvent->QueryInterface( IID_ITCallStateEvent, (void **)&pCallStateEvent );

            // get the CallState that we are being notified of.
            pCallStateEvent->get_State( &cs );

            pCallStateEvent->Release();

            // if it's offering, update our UI
            if (CS_OFFERING == cs)
            {
                PostMessage(ghDlg, WM_COMMAND, IDC_ANSWER, 0);
            }
            else if (CS_DISCONNECTED == cs)
            {
                PostMessage(ghDlg, WM_COMMAND, IDC_DISCONNECTED, 0);
				step = 0;
				callingnow = false;
				callnow = false;
				if (pdigit == true)
					//update recordT to success
					UpdateSuccess(p_id);
				else
					UpdateNextCall(p_id);
				GetNextCall();
				pdigit = false;
				Sleep(2000);
            }
            else if (CS_CONNECTED == cs)
            {
				ITLegacyCallMediaControl * objITLegacyCallMediaControl;
				// detect DTMF
				// get the interface that allows us to turn on digit detection
				hr = gpCall->QueryInterface( IID_ITLegacyCallMediaControl,(void**)&objITLegacyCallMediaControl );

			    if ( FAILED(hr) )
				{
					break;
				}

				// call DetectDigits; this might return errors, because we let the
				// user select any digit modes.
				objITLegacyCallMediaControl->DetectDigits(LINEDIGITMODE_DTMF);
				objITLegacyCallMediaControl->Release();
            }

            break;
        }

		//digit
		case TE_DIGITEVENT:
        {
			ITDigitDetectionEvent         * pNotify;
            unsigned char digit; 

            hr = pEvent->QueryInterface( IID_ITDigitDetectionEvent, (void **)&pNotify );

            if (S_OK != hr)
            {
                DoMessage( TEXT("Incoming call, but failed to get the DIGIT interface"));
            }
			else
			{
				hr = pNotify->get_Digit(&digit);
				char * tempdigit;
				tempdigit = (char *) &digit;
				tempdigit[1] = '\0';
				SetStatusMessage(tempdigit);
				pdigit = true;
			}
			//play the recorded file
			
			if ( g_pPlayMedStrmTerm != NULL )
            {
				HRESULT hr;
				ITCallInfo *            pCallInfo;
				ITAddress *             pAddress;
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
				}

				// for each stream
				ITStream * pStream;

				while ( S_OK == pEnumStreams->Next(1, &pStream, NULL))
				{
					TERMINAL_DIRECTION td;
					hr = pStream->get_Direction(&td);
					if (td == TD_CAPTURE)
					{
						pStream->UnselectTerminal(g_pPlayMedStrmTerm);
						pStream->Release();
						g_pPlayMedStrmTerm->Release();
						g_pPlayMedStrmTerm = NULL;
					}
				}
            }

			for (int i=0; i < 10; i++)
				g_wszReadFileName[i] = '\0';
			WCHAR tempfile3[] = L".avi";
			WCHAR tempfile2[] = L"data/";
			wcsncpy(g_wszReadFileName,tempfile2,wcslen(tempfile2));
			wcsncat(g_wszReadFileName,pp_file,wcslen(pp_file));
			wcsncat(g_wszReadFileName,tempfile3,wcslen(tempfile3));
            if ( SUCCEEDED( hr = g_pRecordStream->SelectTerminal(g_pRecordMedStrmTerm) ) ) 
            {
				g_pRecordMedStrmTerm->Release();
                g_pRecordStream->Release();
                g_pRecordMedStrmTerm= NULL;
            }
            else 
            {
                ::MessageBox(NULL, "Select Terminal for Record Failed", "Call Media Event", MB_OK);
            }

			pNotify->Release();
			break;
        }

        case TE_CALLMEDIA:
        {
            // TE_CALLMEDIA is a media event.  pEvent is
            // an ITCallMediaEvent

            CALL_MEDIA_EVENT    cme;
            ITCallMediaEvent  * pCallMediaEvent;

            // Get the interface
            pEvent->QueryInterface( IID_ITCallMediaEvent, (void **)&pCallMediaEvent );

            // get the CALL_MEDIA_EVENT that we are being notified of.
            pCallMediaEvent->get_Event( &cme );

            switch ( cme ) 
            {
                case CME_STREAM_INACTIVE:    
                {
					
                //
                // CME_STREAM_INACTIVE tells us that the playback MST finished
                // playing. Since only one terminal, either play or record, has
                // to be selected at a time, the play terminal is first unselected 
                // and then the record terminal is selected. 
                // This event is only invoked in the play or the both case, since the call 
                // is disconnected after the reocrding is done.
                //

					//DoMessage(TEXT("cme not active"));
                    if ( ( g_pRecordMedStrmTerm != NULL ) && ( g_pPlayMedStrmTerm != NULL ) ) 
                    {
                        ITStream *pStream;

                        if ( SUCCEEDED( hr = pCallMediaEvent->get_Stream(&pStream) ) )
                        {
                            pStream->UnselectTerminal(g_pPlayMedStrmTerm);
                            pStream->Release();
                            g_pPlayMedStrmTerm->Release();
                            g_pPlayMedStrmTerm = NULL;
                        }
                        else
                        {
                            ::MessageBox(NULL, "UnSelect for Play Terminal Failed", "Call Media Event", MB_OK);
                        }
                    }
                    break;
                }

                case CME_STREAM_NOT_USED:
                case CME_NEW_STREAM:
                    break;

                case CME_STREAM_FAIL:
                    //::MessageBox(NULL, "Stream failed", "Call media event", MB_OK);
                    break;
    
                case CME_TERMINAL_FAIL:
                    ::MessageBox(NULL, "Terminal failed", "Call media event", MB_OK);
                    break;

                case CME_STREAM_ACTIVE:    
                {
                    ITTerminal *pPlayStreamTerm    = NULL;
                    ITTerminal *pRecordStreamTerm  = NULL;

                    //
                    // Get the terminal that's now active. 
                    //    

                    ITTerminal * pTerminal;
                    hr = GetTerminalFromStreamEvent(pCallMediaEvent, &pTerminal);

                    if ( FAILED(hr) )  break; 
    
                    //
                    // Remember this terminal based on the direction.
                    //

                    TERMINAL_DIRECTION td;
                    hr = pTerminal->get_Direction( &td);

                    if ( FAILED(hr) ) 
                    { 
                        pTerminal->Release(); 
                        break; 
                    }
                   
                    if ( TD_CAPTURE == td ) 
                    {
                        pPlayStreamTerm = pTerminal;
                    }
                    else if ( TD_RENDER == td ) 
                    {
                        pRecordStreamTerm = pTerminal;
                    }
                    else 
                    {
                        // this is not supposed to happen
                        pTerminal->Release();
                        break;
                    }

                    //
                    // Now do the actual streaming...
                    //

					PlayAndRecordMessage(pPlayStreamTerm, pRecordStreamTerm);
                
                    if (NULL != pPlayStreamTerm)   pPlayStreamTerm->Release();
                    if (NULL != pRecordStreamTerm) pRecordStreamTerm->Release();

                    //
                    // Start over for the next call.
                    //

                    pPlayStreamTerm = NULL;
                    pRecordStreamTerm = NULL;
                
                    break;
				}
            
                default:
                    break;
            }

            // We no longer need this interface.
            pCallMediaEvent->Release();
            break;    
        }    

    }    

   
    pEvent->Release(); // we addrefed it CTAPIEventNotification::Event()

    return S_OK;
}

