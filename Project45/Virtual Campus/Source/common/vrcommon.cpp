#include <windows.h>
#include <string.h>
#include <tchar.h>
#include "vrcommon.h"



////////////////////////////////////////////////////////////////////////////////
// Name : CVRMultilineText()
// Desc :
////////////////////////////////////////////////////////////////////////////////
CVRMultilineText::CVRMultilineText(int nNumLine, int nNumCharPerLine)
{
	m_nCountLine = 0;
	m_nMaxLine = nNumLine;
	m_nMaxCharPerLine = nNumCharPerLine;

	m_aszMessageLog = new char*[m_nMaxLine];
	for (int i = 0; i < m_nMaxLine; i++)
		m_aszMessageLog[i] = new char[m_nMaxCharPerLine];
	m_szMessageLog = new char[m_nMaxLine*m_nMaxCharPerLine];
}



CVRMultilineText::~CVRMultilineText()
{
	for (int i = 0; i < m_nMaxLine; i++)
		delete [] m_aszMessageLog[i];
	delete [] m_aszMessageLog;
	delete [] m_szMessageLog;
}


void CVRMultilineText::AddString(char* szBuffer)
{
	if (m_nCountLine < m_nMaxLine)
	{
		m_nIndexStart = 0;
		strcpy(m_aszMessageLog[m_nCountLine++],szBuffer);
		m_nIndexStop = m_nCountLine-1;
	}
	else
	{
		strcpy(m_aszMessageLog[m_nIndexStart],szBuffer);
		if (m_nIndexStart < m_nMaxLine-1) m_nIndexStart++;
		else m_nIndexStart = 0;
		if (m_nIndexStop < m_nMaxLine-1) m_nIndexStop++;
		else m_nIndexStop = 0;
	}
}


char* CVRMultilineText::Retrieve()
{
	int i;
	strcpy(m_szMessageLog,"");
	if (m_nIndexStart <= m_nIndexStop)
	{
		for (i = m_nIndexStart; i <= m_nIndexStop; i++)
		{
			strcat(m_szMessageLog, m_aszMessageLog[i]);
			strcat(m_szMessageLog, "\r\n");
		}
	}
	else
	{
		for (i = m_nIndexStart; i < m_nMaxLine; i++)
		{
			strcat(m_szMessageLog, m_aszMessageLog[i]);
			strcat(m_szMessageLog, "\r\n");
		}
		for (i = 0; i <= m_nIndexStop; i++)
		{
			strcat(m_szMessageLog, m_aszMessageLog[i]);
			strcat(m_szMessageLog, "\r\n");
		}
	}

	return m_szMessageLog;
}





////////////////////////////////////////////////////////////////////////////////
// Name : CVRLayerWnd()
// Desc :
////////////////////////////////////////////////////////////////////////////////
CVRLayerWnd::CVRLayerWnd()
{
	// Load DLL.
	m_hDll = ::LoadLibrary(_T("USER32.dll"));
}

CVRLayerWnd::~CVRLayerWnd()
{
	// Unload DLL (if any)
	if (m_hDll)	::FreeLibrary(m_hDll);
	m_hDll = NULL;
}

// This function add the WS_EX_LAYERED style to the specified window.
//
// Parameters:
//		[IN]	Handle to the window and, indirectly, the class to which the window belongs. 
//				Windows 95/98/Me: The SetWindowLong function may fail if the window 
//				specified by the hWnd parameter does not belong to the same process 
//				as the calling thread. 
//
// Return value:
//		Non zero
//			Function executed successfully.
//		Zero
//			Function failed. To get extended error information, call ::GetLastError().
//
LONG CVRLayerWnd::AddLayeredStyle(HWND hWnd)
{
	return SetWindowLong(hWnd, GWL_EXSTYLE, GetWindowLong(hWnd, GWL_EXSTYLE) | WS_EX_LAYERED);
} // End of AddLayeredStyle

// This function sets the opacity and transparency color key of a layered window.
//
// Parameters:
//		[IN]	hWnd
//				Handle to the layered window.
//		[IN]	crKey
//				A COLORREF value that specifies the transparency color key to be used when
//				composing the layered window. All pixels painted by the window in this color will be transparent.
//				To generate a COLORREF, use the RGB() macro.
//		[IN]	bAlpha
//				Alpha value used to describe the opacity of the layered window.
//				When bAlpha is 0, the window is completely transparent.
//				When bAlpha is 255, the window is opaque. 
//		[IN]	dwFlags 
//				Specifies an action to take. This parameter can be one or more of the following values:
//					LWA_COLORKEY	Use crKey as the transparency color.  
//					LWA_ALPHA		Use bAlpha to determine the opacity of the layered window.
//
// Return value:
//		TRUE
//			Function executed successfully.
//		FALSE
//			Function failed. To get extended error information, call ::GetLastError().
//
BOOL CVRLayerWnd::SetLayeredWindowAttributes(HWND hWnd, COLORREF crKey, BYTE bAlpha, DWORD dwFlags)
{
	BOOL	bRetValue = TRUE;

	if (m_hDll)
	{
		lpfnSetLayeredWindowAttributes pFn = NULL;
		pFn = (lpfnSetLayeredWindowAttributes)GetProcAddress(m_hDll, "SetLayeredWindowAttributes");
		if (pFn)
		{
			bRetValue = pFn(hWnd, crKey, bAlpha, dwFlags);
		} // if
		else bRetValue = FALSE;
	} // if

	return bRetValue;
} // End of SetLayeredWindowAttributes

// This function sets the percentage of opacity or transparency of a layered window.
//
// Parameters:
//		[IN]	hWnd
//				Handle to the layered window.
//		[IN]	byPercentage
//				Percentage (from 0 to 100)
//
// Return value:
//		TRUE
//			Function executed successfully.
//		FALSE
//			Function failed. To get extended error information, call ::GetLastError().
//
BOOL CVRLayerWnd::SetTransparentPercentage(HWND hWnd, BYTE byPercentage)
{
	// Do not accept values greater than 100%
	if (byPercentage > 100)	byPercentage = 100;

	return SetLayeredWindowAttributes(hWnd, 0, 255 * byPercentage/100, LWA_ALPHA);
} // End of SetTransparentPercentage






/****************************************************************************

 CenterWindow: centers the given window on the screen.

 ****************************************************************************/
void cfnCenterWindow(HWND hwnd)
{
  HWND hWndParent	= GetParent( hwnd );
  int iParentWidth	= 0;
  int iParentHeight	= 0;
  int iDestX = 0;
  int iDestY = 0;
	
  // get the rectangle of the window
  RECT rectWindow;
  GetWindowRect(hwnd, &rectWindow);


  if ( hWndParent )
  {
	  // get the rectangle of the parent window
	  RECT rectParent;
	  GetWindowRect(hWndParent, &rectParent);

	  // get the width and height of the screen or parent
	  iParentWidth = rectParent.right - rectParent.left;// GetSystemMetrics(SM_CXFULLSCREEN);
	  iParentHeight= rectParent.bottom - rectParent.top;// GetSystemMetrics(SM_CYFULLSCREEN);

	  // do the centering math
	  iDestX = rectParent.left + (iParentWidth-(rectWindow.right-rectWindow.left)) / 2;
	  iDestY = rectParent.top  + (iParentHeight-(rectWindow.bottom-rectWindow.top)) / 2;


  } else
  {
	  // get the width and height of the screen or parent
	  iParentWidth = GetSystemMetrics(SM_CXFULLSCREEN);
	  iParentHeight= GetSystemMetrics(SM_CYFULLSCREEN);

	  // do the centering math
	  iDestX = (iParentWidth-(rectWindow.right-rectWindow.left)) / 2;
	  iDestY = (iParentHeight-(rectWindow.bottom-rectWindow.top)) / 2;

  }


  // center the window
  MoveWindow(hwnd, iDestX, iDestY, 
    rectWindow.right-rectWindow.left,
    rectWindow.bottom-rectWindow.top,
    true);
}

/****************************************************************************

 ConvertLastErrorToString: calls GetLastError, then converts it to a string
 using FormatMessage.  Puts up to nMaxStrLen characters of the converted
 error string into szDest.

 ****************************************************************************/
void cfnConvertLastErrorToString(LPSTR szDest, int nMaxStrLen)
{
  LPVOID lpMsgBuf;
  FormatMessage( 
    FORMAT_MESSAGE_ALLOCATE_BUFFER | 
    FORMAT_MESSAGE_FROM_SYSTEM | 
    FORMAT_MESSAGE_IGNORE_INSERTS,
    NULL,
    GetLastError(),
    MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT), // Default language
    (LPTSTR) &lpMsgBuf,
    0,
    NULL 
  );
  
  strncpy(szDest, reinterpret_cast<char *>(lpMsgBuf), nMaxStrLen);

  LocalFree( lpMsgBuf );
}