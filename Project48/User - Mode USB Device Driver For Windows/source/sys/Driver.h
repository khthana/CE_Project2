#ifndef DRIVER_H
#define DRIVER_H
#include <generic.h>
#include "debugprint.h"

#define DRIVERNAME "FILEIO"			
#define LDRIVERNAME L"FILEIO"			

///////////////////////////////////////////////////////////////////////////////

typedef struct tagDEVICE_EXTENSION {
	PDEVICE_OBJECT DeviceObject;		
	PDEVICE_OBJECT LowerDeviceObject;	
	PDEVICE_OBJECT Pdo;						
	IO_REMOVE_LOCK RemoveLock;				
	PGENERIC_EXTENSION pgx;					
	LONG handles;							
	PVOID RandomJunk;						
	ULONG RandomJunkSize;					
	} DEVICE_EXTENSION, *PDEVICE_EXTENSION;

///////////////////////////////////////////////////////////////////////////////

VOID RemoveDevice(IN PDEVICE_OBJECT fdo);
NTSTATUS CompleteRequest(IN PIRP Irp, IN NTSTATUS status, IN ULONG_PTR info);
NTSTATUS StartDevice(PDEVICE_OBJECT fdo, PCM_PARTIAL_RESOURCE_LIST raw, PCM_PARTIAL_RESOURCE_LIST translated);
VOID StopDevice(PDEVICE_OBJECT fdo, BOOLEAN oktouch = FALSE);


NTSTATUS DispatchCreate(PDEVICE_OBJECT fdo, PIRP Irp);
NTSTATUS DispatchClose(PDEVICE_OBJECT fdo, PIRP Irp);
NTSTATUS DispatchControl(PDEVICE_OBJECT fdo, PIRP Irp);
NTSTATUS DispatchPower(PDEVICE_OBJECT fdo, PIRP Irp);
NTSTATUS DispatchPnp(PDEVICE_OBJECT fdo, PIRP Irp);


NTSTATUS OpenFile(PWCHAR filename, BOOLEAN read, PHANDLE phandle);
NTSTATUS CloseFile(HANDLE handle);
unsigned __int64 GetFileSize(HANDLE handle);
NTSTATUS ReadFile(HANDLE handle, PVOID buffer, ULONG nbytes, PULONG pnumread);
NTSTATUS WriteFile(HANDLE handle, PVOID buffer, ULONG nbytes, PULONG pnumread);

extern BOOLEAN win98;
extern UNICODE_STRING servkey;

#endif
