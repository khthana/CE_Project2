// CRtcsession.cpp


#include "stdafx.h"


// CRTCSession
 
CRTCSession::CRTCSession()
{
    m_hWnd = NULL;
    m_pSession = NULL;
    m_pWin = NULL;
    m_enState = RTCSS_IDLE;
}


// ~CRTCSession
 

CRTCSession::~CRTCSession()
{
}


// ShowMessageBox


void CRTCSession::ShowMessageBox(PWSTR szText)
{
    MessageBoxW(m_hWnd, szText, APP_TITLE, MB_OK);
}


// SetStatusText


void CRTCSession::SetStatusText(PWSTR szText)
{
    SetWindowTextW(m_hStatusBar, szText);
    InvalidateRect(m_hStatusBar, NULL, FALSE);
}


// OnCreate


LRESULT CRTCSession::OnCreate(UINT uMsg, WPARAM wParam, LPARAM lParam)
{
	// WM_CREATE has three parameters. We will pass them to our Create Proc for future use
	// They are not all currently used.
	UNREFERENCED_PARAMETER(wParam);
	UNREFERENCED_PARAMETER(lParam);
	UNREFERENCED_PARAMETER(uMsg);

    // Create the status bar
    m_hStatusBar = CreateStatusWindow(
        WS_CHILD | WS_VISIBLE,
        NULL,
        m_hWnd,
        IDC_STATUSBAR
        );

    if ( !m_hStatusBar )
    {
        return -1;
    }

    return 0;
}


// OnDestroy
 

LRESULT CRTCSession::OnDestroy(UINT uMsg, WPARAM wParam, LPARAM lParam)
{  

	UNREFERENCED_PARAMETER(wParam);
	UNREFERENCED_PARAMETER(lParam);
	UNREFERENCED_PARAMETER(uMsg);


	HRESULT hr = S_OK;


    if (m_pSession)
    {
        // Terminate and release the session
        hr = m_pSession->Terminate(RTCTR_NORMAL);
        SAFE_RELEASE(m_pSession);
    }


    if (m_pWin)
    {
        // Remove the session from the session list
        m_pWin->RemoveSession(this);
    }

    return 0;
}


// OnClose
 

LRESULT CRTCSession::OnClose(UINT uMsg, WPARAM wParam, LPARAM lParam)
{
	// WM_CLOSE has three parameters. We will pass them to our Close Proc for future use
	// They are not all currently used.

	UNREFERENCED_PARAMETER(wParam);
	UNREFERENCED_PARAMETER(lParam);
	UNREFERENCED_PARAMETER(uMsg);
	

    DestroyWindow(m_hWnd);

    return 0;
}


// OnSize


LRESULT CRTCSession::OnSize(UINT uMsg, WPARAM wParam, LPARAM lParam)
{
    // Resize the status bar
	SendMessage(m_hStatusBar, uMsg, wParam, lParam);

    return 0;
}


// DeliverSessionState


HRESULT CRTCSession::DeliverSessionState(RTC_SESSION_STATE enState)
{
	m_enState = enState;

    // Display the session state in the status bar
    switch(m_enState)
    {
    case RTCSS_IDLE:
        SetStatusText(L"Idle");
        break;

    case RTCSS_INCOMING:
        SetStatusText(L"Incoming");
        break;

    case RTCSS_ANSWERING:
        SetStatusText(L"Answering");
        break;

    case RTCSS_INPROGRESS:
        SetStatusText(L"Inprogress");
        break;

    case RTCSS_CONNECTED:
        SetStatusText(L"Connected");
        break;

    case RTCSS_DISCONNECTED:
        SetStatusText(L"Disconnected");
        break;
    }

    return S_OK;
}


// DeliverParticipantState


HRESULT CRTCSession::DeliverParticipantState(IRTCParticipant * pParticipant, RTC_PARTICIPANT_STATE enState)
{
	// The SubClasses will implement the Deliver functions important to them.
	// By default, we just return S_OK.
	UNREFERENCED_PARAMETER(pParticipant);
	UNREFERENCED_PARAMETER(enState);

    return S_OK;
}


// DeliverMessage


HRESULT CRTCSession::DeliverMessage(IRTCParticipant * pParticipant, BSTR bstrContentType, BSTR bstrMessage)
{
	// The SubClasses will implement the Deliver functions important to them.
	// By default, we just return S_OK.
	UNREFERENCED_PARAMETER(pParticipant);
	UNREFERENCED_PARAMETER(bstrContentType);
	UNREFERENCED_PARAMETER(bstrMessage);

    return S_OK;
}


// DeliverUserStatus


HRESULT CRTCSession::DeliverUserStatus(IRTCParticipant * pParticipant, RTC_MESSAGING_USER_STATUS enStatus)
{
	// The SubClasses will implement the Deliver functions important to them.
	// By default, we just return S_OK.
	UNREFERENCED_PARAMETER(pParticipant);
	UNREFERENCED_PARAMETER(enStatus);

    return S_OK;
}


// DeliverMedia


HRESULT CRTCSession::DeliverMedia(long lMediaType, RTC_MEDIA_EVENT_TYPE enType, RTC_MEDIA_EVENT_REASON enReason)
{
	// The SubClasses will implement the Deliver functions important to them.
	// By default, we just return S_OK.
	UNREFERENCED_PARAMETER(lMediaType);
	UNREFERENCED_PARAMETER(enType);
	UNREFERENCED_PARAMETER(enReason);

    return S_OK;
}


// DeliverIntensity


HRESULT CRTCSession::DeliverIntensity(RTC_AUDIO_DEVICE enDevice, long lLevel)
{
	// The SubClasses will implement the Deliver functions important to them.
	// By default, we just return S_OK.
	UNREFERENCED_PARAMETER(enDevice);
	UNREFERENCED_PARAMETER(lLevel);

    return S_OK;
}


// DeliverClient


HRESULT CRTCSession::DeliverClient(RTC_CLIENT_EVENT_TYPE enEventType)
{
	// The SubClasses will implement the Deliver functions important to them.
	// By default, we just return S_OK.

	UNREFERENCED_PARAMETER(enEventType);

    return S_OK;
}