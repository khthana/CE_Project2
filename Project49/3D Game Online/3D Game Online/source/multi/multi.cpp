#include <iostream>
#include <WINDOWS.H>
#include <Winbase.h>
#include "conio.h"

using namespace std;

void main()
{
	int i = 0;
	cout << "type number of client want to create" << endl;
	cin >> i;
	STARTUPINFO si;
	PROCESS_INFORMATION pi;
	ZeroMemory(&si, sizeof(si));
	si.cb = sizeof(STARTUPINFO);
	si.lpTitle = NULL;
	si.dwX = si.dwY = si.dwXSize = si.dwYSize = 0L;
	si.dwFlags = 0;
	si.wShowWindow = SW_SHOW; // at least let the guy see it
	si.lpReserved2 = NULL;
	si.cbReserved2 = 0;
	si.lpDesktop = NULL;

	CreateProcess( NULL, // App name
					"testclient.exe", // Command Line
					NULL, // Process SD
					NULL, // Thread SD
					FALSE, // No inherit
					//CREATE_UNICODE_ENVIRONMENT,
					CREATE_NEW_CONSOLE,
					NULL,
					NULL,
					&si,
					&pi);
	cout << "1" << endl;

	for(int k = 2;k <= i;++k)
	{
		Sleep(5000);
		CreateProcess( NULL, // App name
					"testclient.exe", // Command Line
					NULL, // Process SD
					NULL, // Thread SD
					FALSE, // No inherit
					//CREATE_UNICODE_ENVIRONMENT,
					CREATE_NEW_CONSOLE,
					NULL,
					NULL,
					&si,
					&pi);
		cout << k << endl;
	}
	cout << "complete" << endl;
	getch();
}