// GetMACNETBIOS.cpp : Defines the entry point for the console application.
//
// Author:	Khalid Shaikh [Shake@ShakeNet.com]
// Date:	April 5th, 2002
//
// This program fetches the MAC address of the localhost by fetching the 
// information through NETBIOS's enumeration function.  
//
// Each NIC card need be connected to a NETBIOS network in order for the MAC
// address to be detected.
//
// Supported in Windows NT/2000/XP
// Supported in Windows 95/98/Me
//
// Supports multiple NIC cards on a PC.

#include "stdafx.h"
#include <Windows.h>
#include <lm.h>
#include <assert.h>
#pragma comment(lib, "Netapi32.lib")

// Prints the MAC address stored in a 6 byte array to stdout
static void PrintMACaddress(unsigned char MACData[])
{
	printf("MAC Address: %02X-%02X-%02X-%02X-%02X-%02X\n", 
		MACData[0], MACData[1], MACData[2], MACData[3], MACData[4], MACData[5]);
}

// Fetches the MAC address and prints it
static void GetMACaddress(void)
{
	unsigned char MACData[8];						// Allocate data structure for MAC (6 bytes needed)

	WKSTA_TRANSPORT_INFO_0 *pwkti;					// Allocate data structure for Netbios
	DWORD dwEntriesRead;
	DWORD dwTotalEntries;
	BYTE *pbBuffer;

	// Get MAC address via NetBios's enumerate function
	NET_API_STATUS dwStatus = NetWkstaTransportEnum(
		NULL,						// [in]  server name
		0,							// [in]  data structure to return
		&pbBuffer,					// [out] pointer to buffer
		MAX_PREFERRED_LENGTH,		// [in]  maximum length
		&dwEntriesRead,				// [out] counter of elements actually enumerated
		&dwTotalEntries,			// [out] total number of elements that could be enumerated
		NULL);						// [in/out] resume handle
	assert(dwStatus == NERR_Success);

	pwkti = (WKSTA_TRANSPORT_INFO_0 *)pbBuffer;		// type cast the buffer

	for(DWORD i=1; i< dwEntriesRead; i++)			// first address is 00000000, skip it
	{												// enumerate MACs and print
		swscanf((wchar_t *)pwkti[i].wkti0_transport_address, L"%2hx%2hx%2hx%2hx%2hx%2hx", 
			&MACData[0], &MACData[1], &MACData[2], &MACData[3], &MACData[4], &MACData[5]);
		PrintMACaddress(MACData);
	}

	// Release pbBuffer allocated by above function
	dwStatus = NetApiBufferFree(pbBuffer);
	assert(dwStatus == NERR_Success);
}

int _tmain(int argc, _TCHAR* argv[])
{
	GetMACaddress();							// Obtain MAC address of adapters

	return 0;
}

