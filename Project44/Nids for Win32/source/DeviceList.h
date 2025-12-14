// DeviceList.h: interface for the CDeviceList class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_DEVICELIST_H__E1C412BC_ABAD_4224_AFFA_09017109A353__INCLUDED_)
#define AFX_DEVICELIST_H__E1C412BC_ABAD_4224_AFFA_09017109A353__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "Registry.h"	// Added by ClassView
#include "Include\packet32.h"

#define Max_Num_Adapter 10

class CDeviceList  
{
public:
	void GetNameDevice(int NumberDevice, CString &NameDevice, int &IP_Field0,int &IP_Field1, int &IP_Field2,int &IP_Field3);
	inline int GetNumDevice(){return SumAdapter-1;};
	BOOL IsEmpty();
	CDeviceList();
	virtual ~CDeviceList();

protected:
	CRegistry RegistryIp;
	char AdapterList[Max_Num_Adapter][1024];
	void GetAdapterList();
	int SumAdapter;
	CRegistry RegistryNameDevice;
};

#endif // !defined(AFX_DEVICELIST_H__E1C412BC_ABAD_4224_AFFA_09017109A353__INCLUDED_)
