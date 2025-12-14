// WizardSheet.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CWizardSheet

#if !defined(AFX_WIZ_PROP_SHEET_H__89F88759_F90E_4597_AEAA_092872D7A8D3__INCLUDED_)
#define AFX_WIZ_PROP_SHEET_H__89F88759_F90E_4597_AEAA_092872D7A8D3__INCLUDED_


#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "dtpicker.h"
#include "WizardPage.h"

typedef enum eCTRLTYPE
{
  None,Edit,CheckBox,RadioBox,ListBoxIdx,ComboBoxIdx,ListBoxTxt,ComboBoxTxt,
  ScrollBar, Slider, MonthCalCtrl, DateTimeCtrl, DateTimePicker
}CTRLTYPE;

struct DDX_MAP_ENTRY
{
 CWnd* pDlgWnd;
 int nIDCtrl;
 CTRLTYPE nTypeCtrl;
 void *pVariable;
};


#define DECLARE_DDX_MAP() \
public: \
	const DDX_MAP_ENTRY *_pddxEntries; \
	virtual void DoDataExchange(CDataExchange* pDX); \


#define BEGIN_DDX_MAP(theMap) \
	const DDX_MAP_ENTRY theMap##_ddxEntries[] = \
	{ \

#define END_DDX_MAP() \
		{NULL, 0, None, NULL} \
	}; \


#define DDX_ENTRY(winDlg, idCtrl, typeCtrl, varObj) \
		{&winDlg, idCtrl, typeCtrl, &varObj}, \


#define ASSOCIATE_DDX_MAP(theClassInst,theMap) \
	theClassInst._pddxEntries = theMap##_ddxEntries;


struct CDTPickerEx : public CDTPicker, public CTime
{
};

class CWizardSheet : public CPropertySheetEx
{
	DECLARE_DYNAMIC(CWizardSheet)
	DECLARE_DDX_MAP()

// Construction
public:
	CWizardSheet(UINT nIDCaption, CWnd* pParentWnd = NULL, UINT iSelectPage = 0,
		              HBITMAP hbmWatermark = NULL, HPALETTE hpalWatermark = NULL, HBITMAP hbmHeader = NULL);
	CWizardSheet(LPCTSTR pszCaption, CWnd* pParentWnd = NULL, UINT iSelectPage = 0,
		              HBITMAP hbmWatermark = NULL, HPALETTE hpalWatermark = NULL, HBITMAP hbmHeader = NULL);
	
	void AddPage( CWizardPage *pPage );


// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWizardSheet)
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CWizardSheet();

	// Generated message map functions
protected:
	//{{AFX_MSG(CWizardSheet)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

	//friend class CPropertyPage;
};

/////////////////////////////////////////////////////////////////////////////
#endif