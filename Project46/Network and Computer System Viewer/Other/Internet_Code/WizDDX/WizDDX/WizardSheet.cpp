// WizardSheet.cpp : implementation file
//

#include "stdafx.h"
#include "resource.h"
#include "WizardSheet.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CWizardSheet

IMPLEMENT_DYNAMIC(CWizardSheet, CPropertySheetEx)


CWizardSheet::CWizardSheet(UINT nIDCaption, CWnd* pParentWnd, UINT iSelectPage,
									 HBITMAP hbmWatermark, HPALETTE hpalWatermark, HBITMAP hbmHeader)
	:CPropertySheetEx(nIDCaption, pParentWnd, iSelectPage, hbmWatermark, hpalWatermark, hbmHeader)
{
	SetWizardMode();
	_pddxEntries = NULL;
}

CWizardSheet::CWizardSheet(LPCTSTR pszCaption, CWnd* pParentWnd, UINT iSelectPage,
									 HBITMAP hbmWatermark, HPALETTE hpalWatermark, HBITMAP hbmHeader)
	:CPropertySheetEx(pszCaption, pParentWnd, iSelectPage, hbmWatermark, hpalWatermark, hbmHeader)
{
	SetWizardMode();
    _pddxEntries = NULL;
}

CWizardSheet::~CWizardSheet()
{
}

void CWizardSheet::AddPage( CWizardPage *pPage )
{
	CPropertySheetEx::AddPage(pPage);
	pPage->m_pps = this;
}


BEGIN_MESSAGE_MAP(CWizardSheet, CPropertySheetEx)
	//{{AFX_MSG_MAP(CWizardSheet)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CWizardSheet message handlers


void CWizardSheet::DoDataExchange(CDataExchange* pDX)
{
    const DDX_MAP_ENTRY *_pddxEntries = this->_pddxEntries;
	if( !_pddxEntries ) return;

	while( _pddxEntries->nIDCtrl )
	{
	  if( pDX->m_pDlgWnd == _pddxEntries->pDlgWnd)
	  {
		  switch (_pddxEntries->nTypeCtrl)
		  {
			  case Edit:
				   DDX_Text(pDX, _pddxEntries->nIDCtrl, *(CString*)_pddxEntries->pVariable);
				  break;
			  case CheckBox:
                   DDX_Check(pDX, _pddxEntries->nIDCtrl, *(int*)_pddxEntries->pVariable);
				  break;
			  case RadioBox:
                   DDX_Radio(pDX, _pddxEntries->nIDCtrl, *(int*)_pddxEntries->pVariable);
				  break;
			  case ListBoxIdx:
				   DDX_LBIndex(pDX, _pddxEntries->nIDCtrl, *(int*)_pddxEntries->pVariable);
				  break;
			  case ComboBoxIdx:
				   DDX_CBIndex(pDX, _pddxEntries->nIDCtrl, *(int*)_pddxEntries->pVariable);
				  break;
			  case ListBoxTxt:
				   DDX_LBString(pDX, _pddxEntries->nIDCtrl, *(CString*)_pddxEntries->pVariable);
				  break;
			  case ComboBoxTxt:
				   DDX_CBString(pDX, _pddxEntries->nIDCtrl, *(CString*)_pddxEntries->pVariable);
				  break;
			  case ScrollBar:
				   DDX_Scroll(pDX, _pddxEntries->nIDCtrl, *(int*)_pddxEntries->pVariable);
				  break;
			  case Slider:
				   DDX_Slider(pDX, _pddxEntries->nIDCtrl, *(int*)_pddxEntries->pVariable);
                  break;
			  case MonthCalCtrl:
				   DDX_MonthCalCtrl(pDX, _pddxEntries->nIDCtrl, *(CTime*)_pddxEntries->pVariable);
				  break;
			  case DateTimeCtrl:
				   DDX_DateTimeCtrl(pDX, _pddxEntries->nIDCtrl, *(CTime*)_pddxEntries->pVariable);
				  break;
			  case DateTimePicker:
				   CDTPicker& picker=static_cast<CDTPicker&>(*(CDTPickerEx*)_pddxEntries->pVariable);
                   CTime& timeVal= static_cast<CTime&>(*(CDTPickerEx*)_pddxEntries->pVariable);

                   DDX_Control(pDX, _pddxEntries->nIDCtrl, picker);

				   if(pDX->m_bSaveAndValidate){
				   timeVal = CTime(picker.GetYear().intVal,
										  picker.GetMonth().intVal,
										  picker.GetDay().intVal,
										  picker.GetHour().intVal,
										  picker.GetMinute().intVal,
										  picker.GetSecond().intVal);
				   }
				   else{
				   //We don't support it yet!
				   }
				  break;
				   
		  }
	  }
	  _pddxEntries++;
	}

}
