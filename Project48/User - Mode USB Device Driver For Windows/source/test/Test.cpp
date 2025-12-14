#include "stdafx.h"
#include <winioctl.h>
#include "..\sys\ioctls.h"

int main(int argc, char* argv[])
	{						
	HANDLE hdevice = CreateFile("\\\\.\\TEST", GENERIC_READ | GENERIC_WRITE, 0, NULL, OPEN_EXISTING, 0, NULL);
	if (hdevice == INVALID_HANDLE_VALUE)
		{
		printf("Unable to open FILEIO device - error %d\n", GetLastError());
		return 1;
		}

	char answer[512];
	DWORD junk;
	if (DeviceIoControl(hdevice, IOCTL_READ_FILE, NULL, 0, answer, sizeof(answer), &junk, NULL))
		{
		answer[junk] = 0;
		printf("%s",answer);
		}
	else
		printf("Error %d in call to DeviceIoControl\n", GetLastError());
	
	CloseHandle(hdevice);
	return 0;
	}						

