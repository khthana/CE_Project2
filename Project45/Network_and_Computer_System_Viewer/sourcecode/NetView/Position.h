// Position.h: interface for the CPosition class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_POSITION_H__5ED4E10D_D079_42A9_A431_48642F7DDE9E__INCLUDED_)
#define AFX_POSITION_H__5ED4E10D_D079_42A9_A431_48642F7DDE9E__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

//##ModelId=3E9ABEE600F8
class CPosition : public CObject  
{
public:
	//##ModelId=3E9ABEE6010F
	CPosition();
	//##ModelId=3E9ABEE6010E
	virtual ~CPosition();
	//##ModelId=3E9ABEE6010D
	CString name;
	//int left,top,right,bottom;
	//##ModelId=3E9ABEE60105
	CRectTracker m_tracker;
};

#endif // !defined(AFX_POSITION_H__5ED4E10D_D079_42A9_A431_48642F7DDE9E__INCLUDED_)
