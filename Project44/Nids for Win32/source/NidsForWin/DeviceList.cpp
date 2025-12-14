// DeviceList.cpp: implementation of the CDeviceList class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "NidsForWin.h"
#include "DeviceList.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CDeviceList::CDeviceList()
{
	GetAdapterList();

}

CDeviceList::~CDeviceList()
{

}

BOOL CDeviceList::IsEmpty()
{
	if ( SumAdapter == 1 )
		return TRUE;
	return FALSE;

}

void CDeviceList::GetNameDevice(int NumberDevice, CString &NameDevice, int &IP_Field0,int &IP_Field1, int &IP_Field2,int &IP_Field3)
{
	if (( NumberDevice < 0 ) || ( NumberDevice >= SumAdapter - 1 )) NumberDevice = 0;
	CString CodeDevice;
	char TempCodeDevice[512];

	for(int b=0;b<=512;b++)
	{
		if ( b >= 15 )
		{
			if ( AdapterList[NumberDevice][b*2] != -52 )
				TempCodeDevice[b-15] = AdapterList[NumberDevice][b*2];
			else
				TempCodeDevice[b-15] = '\0';
		}
	}
	CodeDevice = TempCodeDevice;

	CStringArray TempNameDeviceArray, TempIpArray;

	BOOL Found = FALSE;
	CString Key;

	for ( int CountSubDir = 0 ; Found == FALSE ; CountSubDir++ )
	{
		char SubDir[3];
		Key = "SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\NetworkCards\\";
		sprintf(SubDir,"%d",CountSubDir);
		Key += SubDir;
		if( RegistryNameDevice.OpenReg(Key) == TRUE )
		{
			TempNameDeviceArray.RemoveAll();
			int SumValue = RegistryNameDevice.GetValueCount();
			if ( RegistryNameDevice.GetRegistryList(TempNameDeviceArray) == TRUE )
			{
				CString TempNameDevice;
				for ( b = 0 ; b  < SumValue ; b++ )
				{
					TempNameDevice = TempNameDeviceArray.ElementAt(b);
					if ( TempNameDevice.Find(CodeDevice) != -1 )
					{
						Found = TRUE;
					}
				}
			}
		}
	}

	if( RegistryNameDevice.OpenReg(Key) == TRUE )
	{
		int SumValue = RegistryNameDevice.GetValueCount();
		if ( RegistryNameDevice.GetRegistryList(TempNameDeviceArray) == TRUE )
		{
			CString TempNameDevice;
			char TempTempNameDevice[100];
			for ( b = 0 ; b  < SumValue ; b++ )
			{
				TempNameDevice = TempNameDeviceArray.ElementAt(b);
				if ( TempNameDevice.Find("Description") != -1 )
				{
					int CountChar,a = TempNameDevice.GetLength();
					BOOL MarkPoint = FALSE;

					for ( int i = 0 ; i < a ; i++ )
					{
						if ( TempNameDevice[i] == '\#' )
						{
							MarkPoint = TRUE;
							CountChar = i + 1;
						}
						if (( MarkPoint == TRUE ) && ( TempNameDevice[i] != '\#' ) )
							TempTempNameDevice[i-CountChar] = TempNameDevice[i];
					}
					TempTempNameDevice[i-CountChar] = '\0';
				}
			NameDevice = (CString)TempTempNameDevice;
			}
		}
	}

	Key = "SYSTEM\\CurrentControlSet\\Services\\Tcpip\\Parameters\\Interfaces\\";
	Key += CodeDevice;

	if( RegistryIp.OpenReg(Key) == TRUE)
	{
		TempIpArray.RemoveAll();
		int SumValue = RegistryIp.GetValueCount();
		if ( RegistryIp.GetRegistryList(TempIpArray) == TRUE )
		{
			CString TempIp;
			BOOL Stop = FALSE;
			for ( b = 0 ; b  < SumValue && Stop == FALSE; b++ )
			{
				char TempTempIp[20];
				TempIp = TempIpArray.ElementAt(b);
				if ( TempIp.Find("IPAddress") != -1 )
				{
					int CountChar,a = TempIp.GetLength();
					BOOL MarkPoint = FALSE;

					for ( int i = 0 ; i < a ; i++ )
					{
						if ( TempIp[i] == '\#' )
						{
							MarkPoint = TRUE;
							CountChar = i + 1;
						}
						if (( MarkPoint == TRUE ) && ( TempIp[i] != '\#' ) )
							TempTempIp[i-CountChar] = TempIp[i];
					}
					TempTempIp[i-CountChar] = '\0';

					int Cycle = 1;
					char Ip[5];
					i = i - CountChar;
					CountChar = 0;

					for ( int j = 0 ; j < i ; j++ )
					{
						if ( TempTempIp[j] == '\.' )
						{
							if ( Cycle == 1 )
								IP_Field0 = atoi(Ip);
							if ( Cycle == 2 )
								IP_Field1 = atoi(Ip);
							if ( Cycle == 3 )
								IP_Field2 = atoi(Ip);

							Cycle++;
							CountChar = 0;
							for (int k = 0 ; k < 5 ; k++ )
								Ip[k] = '\0';
						}
						else
						{
							Ip[CountChar] = TempTempIp[j];
							CountChar++;
						}
					}
					if ( Cycle == 4 )
						IP_Field3 = atoi(Ip);
					Stop = TRUE;
				}
			}
		}
	}

}

void CDeviceList::GetAdapterList()
{
	WCHAR		AdapterName[512]; // string that contains a list of the network adapters
	WCHAR		*temp,*temp1;

	TCHAR		AdapterNameTmp[1024];

	ULONG		AdapterLength;

	AdapterLength=512;

	SumAdapter=0;

	PacketGetAdapterNames(AdapterNameTmp,&AdapterLength);
	for ( int a = 0 ; a <= 511 ; a++)
		AdapterName[a] = AdapterNameTmp[a*2];
	temp=AdapterName;
	temp1=AdapterName;
	while ((*temp!='\0')||(*(temp-1)!='\0'))
	{
		if (*temp=='\0') 
		{
			memcpy(AdapterList[SumAdapter],temp1,(temp-temp1)*2);
			temp1=temp+1;
			SumAdapter++;
		}
		temp++;
	}

}
