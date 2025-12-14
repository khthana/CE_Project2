// Machine generated IDispatch wrapper class(es) created with ClassWizard

#include "stdafx.h"
#include "mso97.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif



/////////////////////////////////////////////////////////////////////////////
// CommandBars properties

/////////////////////////////////////////////////////////////////////////////
// CommandBars operations

LPDISPATCH CommandBars::GetApplication()
{
	LPDISPATCH result;
	InvokeHelper(0x60020000, DISPATCH_PROPERTYGET, VT_DISPATCH, (void*)&result, NULL);
	return result;
}

long CommandBars::GetCreator()
{
	long result;
	InvokeHelper(0x60020001, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

LPDISPATCH CommandBars::GetActionControl()
{
	LPDISPATCH result;
	InvokeHelper(0x60030000, DISPATCH_PROPERTYGET, VT_DISPATCH, (void*)&result, NULL);
	return result;
}

LPDISPATCH CommandBars::GetActiveMenuBar()
{
	LPDISPATCH result;
	InvokeHelper(0x60030001, DISPATCH_PROPERTYGET, VT_DISPATCH, (void*)&result, NULL);
	return result;
}

LPDISPATCH CommandBars::Add(const VARIANT& Name, const VARIANT& Position, const VARIANT& MenuBar, const VARIANT& Temporary)
{
	LPDISPATCH result;
	static BYTE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x60030002, DISPATCH_METHOD, VT_DISPATCH, (void*)&result, parms,
		&Name, &Position, &MenuBar, &Temporary);
	return result;
}

long CommandBars::GetCount()
{
	long result;
	InvokeHelper(0x60030003, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

BOOL CommandBars::GetDisplayTooltips()
{
	BOOL result;
	InvokeHelper(0x60030004, DISPATCH_PROPERTYGET, VT_BOOL, (void*)&result, NULL);
	return result;
}

void CommandBars::SetDisplayTooltips(BOOL bNewValue)
{
	static BYTE parms[] =
		VTS_BOOL;
	InvokeHelper(0x60030004, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 bNewValue);
}

BOOL CommandBars::GetDisplayKeysInTooltips()
{
	BOOL result;
	InvokeHelper(0x60030006, DISPATCH_PROPERTYGET, VT_BOOL, (void*)&result, NULL);
	return result;
}

void CommandBars::SetDisplayKeysInTooltips(BOOL bNewValue)
{
	static BYTE parms[] =
		VTS_BOOL;
	InvokeHelper(0x60030006, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 bNewValue);
}

LPDISPATCH CommandBars::FindControl(const VARIANT& Type, const VARIANT& Id, const VARIANT& Tag, const VARIANT& Visible)
{
	LPDISPATCH result;
	static BYTE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x60030008, DISPATCH_METHOD, VT_DISPATCH, (void*)&result, parms,
		&Type, &Id, &Tag, &Visible);
	return result;
}

LPDISPATCH CommandBars::GetItem(const VARIANT& Index)
{
	LPDISPATCH result;
	static BYTE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x0, DISPATCH_PROPERTYGET, VT_DISPATCH, (void*)&result, parms,
		&Index);
	return result;
}

BOOL CommandBars::GetLargeButtons()
{
	BOOL result;
	InvokeHelper(0x6003000a, DISPATCH_PROPERTYGET, VT_BOOL, (void*)&result, NULL);
	return result;
}

void CommandBars::SetLargeButtons(BOOL bNewValue)
{
	static BYTE parms[] =
		VTS_BOOL;
	InvokeHelper(0x6003000a, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 bNewValue);
}

long CommandBars::GetMenuAnimationStyle()
{
	long result;
	InvokeHelper(0x6003000c, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

void CommandBars::SetMenuAnimationStyle(long nNewValue)
{
	static BYTE parms[] =
		VTS_I4;
	InvokeHelper(0x6003000c, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 nNewValue);
}

LPUNKNOWN CommandBars::Get_NewEnum()
{
	LPUNKNOWN result;
	InvokeHelper(0xfffffffc, DISPATCH_PROPERTYGET, VT_UNKNOWN, (void*)&result, NULL);
	return result;
}

LPDISPATCH CommandBars::GetParent()
{
	LPDISPATCH result;
	InvokeHelper(0x6003000f, DISPATCH_PROPERTYGET, VT_DISPATCH, (void*)&result, NULL);
	return result;
}

void CommandBars::ReleaseFocus()
{
	InvokeHelper(0x60030010, DISPATCH_METHOD, VT_EMPTY, NULL, NULL);
}


/////////////////////////////////////////////////////////////////////////////
// CommandBar properties

/////////////////////////////////////////////////////////////////////////////
// CommandBar operations

LPDISPATCH CommandBar::GetApplication()
{
	LPDISPATCH result;
	InvokeHelper(0x60030000, DISPATCH_PROPERTYGET, VT_DISPATCH, (void*)&result, NULL);
	return result;
}

long CommandBar::GetCreator()
{
	long result;
	InvokeHelper(0x60030001, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

BOOL CommandBar::GetBuiltIn()
{
	BOOL result;
	InvokeHelper(0x60040000, DISPATCH_PROPERTYGET, VT_BOOL, (void*)&result, NULL);
	return result;
}

CString CommandBar::GetContext()
{
	CString result;
	InvokeHelper(0x60040001, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
	return result;
}

void CommandBar::SetContext(LPCTSTR lpszNewValue)
{
	static BYTE parms[] =
		VTS_BSTR;
	InvokeHelper(0x60040001, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 lpszNewValue);
}

LPDISPATCH CommandBar::GetControls()
{
	LPDISPATCH result;
	InvokeHelper(0x60040003, DISPATCH_PROPERTYGET, VT_DISPATCH, (void*)&result, NULL);
	return result;
}

void CommandBar::Delete()
{
	InvokeHelper(0x60040004, DISPATCH_METHOD, VT_EMPTY, NULL, NULL);
}

BOOL CommandBar::GetEnabled()
{
	BOOL result;
	InvokeHelper(0x60040005, DISPATCH_PROPERTYGET, VT_BOOL, (void*)&result, NULL);
	return result;
}

void CommandBar::SetEnabled(BOOL bNewValue)
{
	static BYTE parms[] =
		VTS_BOOL;
	InvokeHelper(0x60040005, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 bNewValue);
}

LPDISPATCH CommandBar::FindControl(const VARIANT& Type, const VARIANT& Id, const VARIANT& Tag, const VARIANT& Visible, const VARIANT& Recursive)
{
	LPDISPATCH result;
	static BYTE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x60040007, DISPATCH_METHOD, VT_DISPATCH, (void*)&result, parms,
		&Type, &Id, &Tag, &Visible, &Recursive);
	return result;
}

long CommandBar::GetHeight()
{
	long result;
	InvokeHelper(0x60040008, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

void CommandBar::SetHeight(long nNewValue)
{
	static BYTE parms[] =
		VTS_I4;
	InvokeHelper(0x60040008, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 nNewValue);
}

long CommandBar::GetIndex()
{
	long result;
	InvokeHelper(0x6004000a, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

long CommandBar::GetLeft()
{
	long result;
	InvokeHelper(0x6004000c, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

void CommandBar::SetLeft(long nNewValue)
{
	static BYTE parms[] =
		VTS_I4;
	InvokeHelper(0x6004000c, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 nNewValue);
}

CString CommandBar::GetName()
{
	CString result;
	InvokeHelper(0x6004000e, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
	return result;
}

void CommandBar::SetName(LPCTSTR lpszNewValue)
{
	static BYTE parms[] =
		VTS_BSTR;
	InvokeHelper(0x6004000e, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 lpszNewValue);
}

CString CommandBar::GetNameLocal()
{
	CString result;
	InvokeHelper(0x60040010, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
	return result;
}

void CommandBar::SetNameLocal(LPCTSTR lpszNewValue)
{
	static BYTE parms[] =
		VTS_BSTR;
	InvokeHelper(0x60040010, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 lpszNewValue);
}

LPDISPATCH CommandBar::GetParent()
{
	LPDISPATCH result;
	InvokeHelper(0x60040012, DISPATCH_PROPERTYGET, VT_DISPATCH, (void*)&result, NULL);
	return result;
}

long CommandBar::GetPosition()
{
	long result;
	InvokeHelper(0x60040013, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

void CommandBar::SetPosition(long nNewValue)
{
	static BYTE parms[] =
		VTS_I4;
	InvokeHelper(0x60040013, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 nNewValue);
}

long CommandBar::GetRowIndex()
{
	long result;
	InvokeHelper(0x60040015, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

void CommandBar::SetRowIndex(long nNewValue)
{
	static BYTE parms[] =
		VTS_I4;
	InvokeHelper(0x60040015, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 nNewValue);
}

long CommandBar::GetProtection()
{
	long result;
	InvokeHelper(0x60040017, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

void CommandBar::SetProtection(long nNewValue)
{
	static BYTE parms[] =
		VTS_I4;
	InvokeHelper(0x60040017, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 nNewValue);
}

void CommandBar::Reset()
{
	InvokeHelper(0x60040019, DISPATCH_METHOD, VT_EMPTY, NULL, NULL);
}

void CommandBar::ShowPopup(const VARIANT& x, const VARIANT& y)
{
	static BYTE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x6004001a, DISPATCH_METHOD, VT_EMPTY, NULL, parms,
		 &x, &y);
}

long CommandBar::GetTop()
{
	long result;
	InvokeHelper(0x6004001b, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

void CommandBar::SetTop(long nNewValue)
{
	static BYTE parms[] =
		VTS_I4;
	InvokeHelper(0x6004001b, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 nNewValue);
}

long CommandBar::GetType()
{
	long result;
	InvokeHelper(0x6004001d, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

BOOL CommandBar::GetVisible()
{
	BOOL result;
	InvokeHelper(0x6004001e, DISPATCH_PROPERTYGET, VT_BOOL, (void*)&result, NULL);
	return result;
}

void CommandBar::SetVisible(BOOL bNewValue)
{
	static BYTE parms[] =
		VTS_BOOL;
	InvokeHelper(0x6004001e, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 bNewValue);
}

long CommandBar::GetWidth()
{
	long result;
	InvokeHelper(0x60040020, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

void CommandBar::SetWidth(long nNewValue)
{
	static BYTE parms[] =
		VTS_I4;
	InvokeHelper(0x60040020, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 nNewValue);
}


/////////////////////////////////////////////////////////////////////////////
// CommandBarControls properties

/////////////////////////////////////////////////////////////////////////////
// CommandBarControls operations

LPDISPATCH CommandBarControls::GetApplication()
{
	LPDISPATCH result;
	InvokeHelper(0x60020000, DISPATCH_PROPERTYGET, VT_DISPATCH, (void*)&result, NULL);
	return result;
}

long CommandBarControls::GetCreator()
{
	long result;
	InvokeHelper(0x60020001, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

LPDISPATCH CommandBarControls::Add(const VARIANT& Type, const VARIANT& Id, const VARIANT& Parameter, const VARIANT& Before, const VARIANT& Temporary)
{
	LPDISPATCH result;
	static BYTE parms[] =
		VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x60030000, DISPATCH_METHOD, VT_DISPATCH, (void*)&result, parms,
		&Type, &Id, &Parameter, &Before, &Temporary);
	return result;
}

long CommandBarControls::GetCount()
{
	long result;
	InvokeHelper(0x60030001, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

LPDISPATCH CommandBarControls::GetItem(const VARIANT& Index)
{
	LPDISPATCH result;
	static BYTE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x0, DISPATCH_PROPERTYGET, VT_DISPATCH, (void*)&result, parms,
		&Index);
	return result;
}

LPUNKNOWN CommandBarControls::Get_NewEnum()
{
	LPUNKNOWN result;
	InvokeHelper(0xfffffffc, DISPATCH_PROPERTYGET, VT_UNKNOWN, (void*)&result, NULL);
	return result;
}

LPDISPATCH CommandBarControls::GetParent()
{
	LPDISPATCH result;
	InvokeHelper(0x60030004, DISPATCH_PROPERTYGET, VT_DISPATCH, (void*)&result, NULL);
	return result;
}


/////////////////////////////////////////////////////////////////////////////
// CommandBarControl properties

/////////////////////////////////////////////////////////////////////////////
// CommandBarControl operations

LPDISPATCH CommandBarControl::GetApplication()
{
	LPDISPATCH result;
	InvokeHelper(0x60030000, DISPATCH_PROPERTYGET, VT_DISPATCH, (void*)&result, NULL);
	return result;
}

long CommandBarControl::GetCreator()
{
	long result;
	InvokeHelper(0x60030001, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

BOOL CommandBarControl::GetBeginGroup()
{
	BOOL result;
	InvokeHelper(0x60040000, DISPATCH_PROPERTYGET, VT_BOOL, (void*)&result, NULL);
	return result;
}

void CommandBarControl::SetBeginGroup(BOOL bNewValue)
{
	static BYTE parms[] =
		VTS_BOOL;
	InvokeHelper(0x60040000, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 bNewValue);
}

BOOL CommandBarControl::GetBuiltIn()
{
	BOOL result;
	InvokeHelper(0x60040002, DISPATCH_PROPERTYGET, VT_BOOL, (void*)&result, NULL);
	return result;
}

CString CommandBarControl::GetCaption()
{
	CString result;
	InvokeHelper(0x60040003, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
	return result;
}

void CommandBarControl::SetCaption(LPCTSTR lpszNewValue)
{
	static BYTE parms[] =
		VTS_BSTR;
	InvokeHelper(0x60040003, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 lpszNewValue);
}

LPDISPATCH CommandBarControl::Copy(const VARIANT& Bar, const VARIANT& Before)
{
	LPDISPATCH result;
	static BYTE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x60040006, DISPATCH_METHOD, VT_DISPATCH, (void*)&result, parms,
		&Bar, &Before);
	return result;
}

void CommandBarControl::Delete(const VARIANT& Temporary)
{
	static BYTE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x60040007, DISPATCH_METHOD, VT_EMPTY, NULL, parms,
		 &Temporary);
}

CString CommandBarControl::GetDescriptionText()
{
	CString result;
	InvokeHelper(0x60040008, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
	return result;
}

void CommandBarControl::SetDescriptionText(LPCTSTR lpszNewValue)
{
	static BYTE parms[] =
		VTS_BSTR;
	InvokeHelper(0x60040008, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 lpszNewValue);
}

BOOL CommandBarControl::GetEnabled()
{
	BOOL result;
	InvokeHelper(0x6004000a, DISPATCH_PROPERTYGET, VT_BOOL, (void*)&result, NULL);
	return result;
}

void CommandBarControl::SetEnabled(BOOL bNewValue)
{
	static BYTE parms[] =
		VTS_BOOL;
	InvokeHelper(0x6004000a, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 bNewValue);
}

void CommandBarControl::Execute()
{
	InvokeHelper(0x6004000c, DISPATCH_METHOD, VT_EMPTY, NULL, NULL);
}

long CommandBarControl::GetHeight()
{
	long result;
	InvokeHelper(0x6004000d, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

void CommandBarControl::SetHeight(long nNewValue)
{
	static BYTE parms[] =
		VTS_I4;
	InvokeHelper(0x6004000d, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 nNewValue);
}

long CommandBarControl::GetHelpContextId()
{
	long result;
	InvokeHelper(0x6004000f, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

void CommandBarControl::SetHelpContextId(long nNewValue)
{
	static BYTE parms[] =
		VTS_I4;
	InvokeHelper(0x6004000f, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 nNewValue);
}

CString CommandBarControl::GetHelpFile()
{
	CString result;
	InvokeHelper(0x60040011, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
	return result;
}

void CommandBarControl::SetHelpFile(LPCTSTR lpszNewValue)
{
	static BYTE parms[] =
		VTS_BSTR;
	InvokeHelper(0x60040011, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 lpszNewValue);
}

long CommandBarControl::GetId()
{
	long result;
	InvokeHelper(0x60040013, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

long CommandBarControl::GetIndex()
{
	long result;
	InvokeHelper(0x60040014, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

LPDISPATCH CommandBarControl::Move(const VARIANT& Bar, const VARIANT& Before)
{
	LPDISPATCH result;
	static BYTE parms[] =
		VTS_VARIANT VTS_VARIANT;
	InvokeHelper(0x60040016, DISPATCH_METHOD, VT_DISPATCH, (void*)&result, parms,
		&Bar, &Before);
	return result;
}

long CommandBarControl::GetLeft()
{
	long result;
	InvokeHelper(0x60040017, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

long CommandBarControl::GetOLEUsage()
{
	long result;
	InvokeHelper(0x60040018, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

void CommandBarControl::SetOLEUsage(long nNewValue)
{
	static BYTE parms[] =
		VTS_I4;
	InvokeHelper(0x60040018, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 nNewValue);
}

CString CommandBarControl::GetOnAction()
{
	CString result;
	InvokeHelper(0x6004001a, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
	return result;
}

void CommandBarControl::SetOnAction(LPCTSTR lpszNewValue)
{
	static BYTE parms[] =
		VTS_BSTR;
	InvokeHelper(0x6004001a, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 lpszNewValue);
}

LPDISPATCH CommandBarControl::GetParent()
{
	LPDISPATCH result;
	InvokeHelper(0x6004001c, DISPATCH_PROPERTYGET, VT_DISPATCH, (void*)&result, NULL);
	return result;
}

CString CommandBarControl::GetParameter()
{
	CString result;
	InvokeHelper(0x6004001d, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
	return result;
}

void CommandBarControl::SetParameter(LPCTSTR lpszNewValue)
{
	static BYTE parms[] =
		VTS_BSTR;
	InvokeHelper(0x6004001d, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 lpszNewValue);
}

long CommandBarControl::GetPriority()
{
	long result;
	InvokeHelper(0x6004001f, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

void CommandBarControl::SetPriority(long nNewValue)
{
	static BYTE parms[] =
		VTS_I4;
	InvokeHelper(0x6004001f, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 nNewValue);
}

void CommandBarControl::Reset()
{
	InvokeHelper(0x60040021, DISPATCH_METHOD, VT_EMPTY, NULL, NULL);
}

void CommandBarControl::SetFocus()
{
	InvokeHelper(0x60040022, DISPATCH_METHOD, VT_EMPTY, NULL, NULL);
}

CString CommandBarControl::GetTag()
{
	CString result;
	InvokeHelper(0x60040023, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
	return result;
}

void CommandBarControl::SetTag(LPCTSTR lpszNewValue)
{
	static BYTE parms[] =
		VTS_BSTR;
	InvokeHelper(0x60040023, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 lpszNewValue);
}

CString CommandBarControl::GetTooltipText()
{
	CString result;
	InvokeHelper(0x60040025, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
	return result;
}

void CommandBarControl::SetTooltipText(LPCTSTR lpszNewValue)
{
	static BYTE parms[] =
		VTS_BSTR;
	InvokeHelper(0x60040025, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 lpszNewValue);
}

long CommandBarControl::GetTop()
{
	long result;
	InvokeHelper(0x60040027, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

long CommandBarControl::GetType()
{
	long result;
	InvokeHelper(0x60040028, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

BOOL CommandBarControl::GetVisible()
{
	BOOL result;
	InvokeHelper(0x60040029, DISPATCH_PROPERTYGET, VT_BOOL, (void*)&result, NULL);
	return result;
}

void CommandBarControl::SetVisible(BOOL bNewValue)
{
	static BYTE parms[] =
		VTS_BOOL;
	InvokeHelper(0x60040029, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 bNewValue);
}

long CommandBarControl::GetWidth()
{
	long result;
	InvokeHelper(0x6004002b, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

void CommandBarControl::SetWidth(long nNewValue)
{
	static BYTE parms[] =
		VTS_I4;
	InvokeHelper(0x6004002b, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 nNewValue);
}
