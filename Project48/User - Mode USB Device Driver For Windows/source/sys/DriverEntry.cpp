#include "stddcls.h"
#include "driver.h"
#include "Ioctls.h"

NTSTATUS AddDevice(IN PDRIVER_OBJECT DriverObject, IN PDEVICE_OBJECT pdo);
VOID DriverUnload(IN PDRIVER_OBJECT fdo);

UNICODE_STRING servkey;

///////////////////////////////////////////////////////////////////////////////

#pragma INITCODE

extern "C" NTSTATUS DriverEntry(IN PDRIVER_OBJECT DriverObject,
	IN PUNICODE_STRING RegistryPath)
	{							

	DebugPrintInit("Project...");

// Save the name of the service key
	DebugPrint("DriverEntry");
	servkey.Buffer = (PWSTR) ExAllocatePool(PagedPool, RegistryPath->Length + sizeof(WCHAR));
	if (!servkey.Buffer)
		{
		return STATUS_INSUFFICIENT_RESOURCES;
		}
	servkey.MaximumLength = RegistryPath->Length + sizeof(WCHAR);
	RtlCopyUnicodeString(&servkey, RegistryPath);

// Initialize function pointers

	DriverObject->DriverUnload = DriverUnload;
	DriverObject->DriverExtension->AddDevice = AddDevice;

	DriverObject->MajorFunction[IRP_MJ_CREATE] = DispatchCreate;
	DriverObject->MajorFunction[IRP_MJ_CLOSE] = DispatchClose;
	DriverObject->MajorFunction[IRP_MJ_DEVICE_CONTROL] = DispatchControl;
	DriverObject->MajorFunction[IRP_MJ_POWER] = DispatchPower;
	DriverObject->MajorFunction[IRP_MJ_PNP] = DispatchPnp;
	
	return STATUS_SUCCESS;
	}							

///////////////////////////////////////////////////////////////////////////////

#pragma PAGEDCODE

VOID DriverUnload(IN PDRIVER_OBJECT DriverObject)
	{							
	PAGED_CODE();
	DebugPrint("DriverUnload");
	RtlFreeUnicodeString(&servkey);
	DebugPrintClose();
	}						

///////////////////////////////////////////////////////////////////////////////

NTSTATUS AddDevice(IN PDRIVER_OBJECT DriverObject, IN PDEVICE_OBJECT pdo)
	{							
	PAGED_CODE();
	DebugPrint("AddDevice");
	NTSTATUS status;

// Create a functional device object to represent the hardware we're managing.

	PDEVICE_OBJECT fdo;
	UNICODE_STRING devname;
	RtlInitUnicodeString(&devname, L"\\DosDevices\\TEST");

	ULONG dxsize = (sizeof(DEVICE_EXTENSION) + 7) & ~7;
	ULONG xsize = dxsize + GetSizeofGenericExtension();
	status = IoCreateDevice(DriverObject, xsize, &devname,
		FILE_DEVICE_UNKNOWN, FILE_DEVICE_SECURE_OPEN, FALSE, &fdo);
	if (!NT_SUCCESS(status))
		{					
		return status;
		}					
	
	PDEVICE_EXTENSION pdx = (PDEVICE_EXTENSION) fdo->DeviceExtension;

	__try
		{					
		pdx->DeviceObject = fdo;
		pdx->Pdo = pdo;
		pdx->LowerDeviceObject = IoAttachDeviceToDeviceStack(fdo, pdo);
		if (!pdx->LowerDeviceObject)
			{											 
			status = STATUS_DEVICE_REMOVED;
			__leave;
			}			

// Initialize to use the GENERIC.SYS library

		pdx->pgx = (PGENERIC_EXTENSION) ((PUCHAR) pdx + dxsize);

		GENERIC_INIT_STRUCT gis = {sizeof(GENERIC_INIT_STRUCT)};
		gis.DeviceObject = fdo;
		gis.Pdo = pdo;
		gis.Ldo = pdx->LowerDeviceObject;
		gis.RemoveLock = &pdx->RemoveLock;
		gis.StartDevice = StartDevice;
		gis.StopDevice = StopDevice;
		gis.RemoveDevice = RemoveDevice;
		RtlInitUnicodeString(&gis.DebugName, LDRIVERNAME);

		status = InitializeGenericExtension(pdx->pgx, &gis);
		if (!NT_SUCCESS(status))
			{
			__leave;
			}

		fdo->Flags &= ~DO_DEVICE_INITIALIZING;
		}						
	__finally
		{						
		if (!NT_SUCCESS(status))
			{				
			if (pdx->LowerDeviceObject)
				IoDetachDevice(pdx->LowerDeviceObject);
			IoDeleteDevice(fdo);
			}					
		}					

	return status;
	}							

///////////////////////////////////////////////////////////////////////////////

#pragma LOCKEDCODE

NTSTATUS CompleteRequest(IN PIRP Irp, IN NTSTATUS status, IN ULONG_PTR info)
	{						
//	DebugPrint("CompleteRequest");
	Irp->IoStatus.Status = status;
	Irp->IoStatus.Information = info;
	IoCompleteRequest(Irp, IO_NO_INCREMENT);
	return status;
	}							

///////////////////////////////////////////////////////////////////////////////

#pragma PAGEDCODE

NTSTATUS DispatchPnp(PDEVICE_OBJECT fdo, PIRP Irp)
	{						
	PDEVICE_EXTENSION pdx = (PDEVICE_EXTENSION) fdo->DeviceExtension;
	return GenericDispatchPnp(pdx->pgx, Irp);
	}							

NTSTATUS DispatchPower(PDEVICE_OBJECT fdo, PIRP Irp)
	{						
	PDEVICE_EXTENSION pdx = (PDEVICE_EXTENSION) fdo->DeviceExtension;
	return GenericDispatchPower(pdx->pgx, Irp);
	}							

///////////////////////////////////////////////////////////////////////////////

#pragma PAGEDCODE

VOID RemoveDevice(IN PDEVICE_OBJECT fdo)
	{						
	PAGED_CODE();
//	DebugPrint("RemoveDevice");
	PDEVICE_EXTENSION pdx = (PDEVICE_EXTENSION) fdo->DeviceExtension;
	NTSTATUS status;

	if (pdx->LowerDeviceObject)
		IoDetachDevice(pdx->LowerDeviceObject);

	IoDeleteDevice(fdo);
	}

///////////////////////////////////////////////////////////////////////////////

#pragma PAGEDCODE

NTSTATUS DispatchControl(PDEVICE_OBJECT fdo, PIRP Irp)
	{						
	PAGED_CODE();
	DebugPrint("DispatchControl");
	PDEVICE_EXTENSION pdx = (PDEVICE_EXTENSION) fdo->DeviceExtension;

	NTSTATUS status = IoAcquireRemoveLock(&pdx->RemoveLock, Irp);
	if (!NT_SUCCESS(status))
		return CompleteRequest(Irp, status, 0);
	ULONG info = 0;

	PIO_STACK_LOCATION stack = IoGetCurrentIrpStackLocation(Irp);
	ULONG cbin = stack->Parameters.DeviceIoControl.InputBufferLength;
	ULONG cbout = stack->Parameters.DeviceIoControl.OutputBufferLength;
	ULONG code = stack->Parameters.DeviceIoControl.IoControlCode;

	switch (code)
		{					

	case IOCTL_READ_FILE:			
		{	
		DebugPrint("IOCTL_READ_FILE");
		ULONG ncopy;
		if (cbout < pdx->RandomJunkSize)
			ncopy = cbout;
		else
			ncopy = pdx->RandomJunkSize;

		RtlCopyMemory(Irp->AssociatedIrp.SystemBuffer, pdx->RandomJunk, ncopy);
		info = ncopy;
		break;
		}					

	default:
		status = STATUS_INVALID_DEVICE_REQUEST;
		break;

		}						

	IoReleaseRemoveLock(&pdx->RemoveLock, Irp);
	return CompleteRequest(Irp, status, info);
	}
	
///////////////////////////////////////////////////////////////////////////////

#ifdef _X86_


NTSTATUS OpenFile(PWCHAR filename, BOOLEAN read, PHANDLE phandle)
	{						
		DebugPrint("OpenFile");
		NTSTATUS status;
		OBJECT_ATTRIBUTES oa;
		UNICODE_STRING usname;
		HANDLE hfile;
		IO_STATUS_BLOCK iostatus;

		RtlInitUnicodeString(&usname, filename);
		InitializeObjectAttributes(&oa, &usname, OBJ_CASE_INSENSITIVE | OBJ_KERNEL_HANDLE, NULL, NULL);

		if (read)
			status = ZwCreateFile(&hfile, GENERIC_READ, &oa, &iostatus, NULL,
				0, FILE_SHARE_READ, FILE_OPEN, FILE_SYNCHRONOUS_IO_NONALERT, NULL, 0);
		else
			status = ZwCreateFile(&hfile, GENERIC_WRITE, &oa, &iostatus, NULL,
				FILE_ATTRIBUTE_NORMAL, 0, FILE_OVERWRITE_IF, FILE_SYNCHRONOUS_IO_NONALERT, NULL, 0);

		if (NT_SUCCESS(status))
			*phandle = hfile;
		return status;
	}						

///////////////////////////////////////////////////////////////////////////////

NTSTATUS CloseFile(HANDLE handle)
	{							
		DebugPrint("CloseFile");
		return ZwClose(handle);
	}						

///////////////////////////////////////////////////////////////////////////////

unsigned __int64 GetFileSize(HANDLE handle)
	{						
//		DebugPrint("GetFileSize");
		NTSTATUS status;
		IO_STATUS_BLOCK iostatus;
		FILE_STANDARD_INFORMATION fi;

		status = ZwQueryInformationFile(handle, &iostatus, (PVOID) &fi, sizeof(fi), FileStandardInformation);
		if (!NT_SUCCESS(status))
			return 0;

		return fi.EndOfFile.QuadPart;
	}						

///////////////////////////////////////////////////////////////////////////////

NTSTATUS ReadFile(HANDLE handle, PVOID buffer, ULONG nbytes, PULONG pnumread)
	{						
//		DebugPrint("ReadFile");
		IO_STATUS_BLOCK iostatus;
		ZwReadFile(handle, NULL, NULL, NULL, &iostatus, buffer, nbytes, NULL, NULL);
		if (NT_SUCCESS(iostatus.Status))
			*pnumread = iostatus.Information;
		return iostatus.Status;
	}						

///////////////////////////////////////////////////////////////////////////////

NTSTATUS WriteFile(HANDLE handle, PVOID buffer, ULONG nbytes, PULONG pnumwritten)
	{						
		DebugPrint("WriteFile");
		IO_STATUS_BLOCK iostatus;
		ZwWriteFile(handle, NULL, NULL, NULL, &iostatus, buffer, nbytes, NULL, NULL);
		if (NT_SUCCESS(iostatus.Status))
			*pnumwritten = iostatus.Information;
		return iostatus.Status;
	}						

#endif

///////////////////////////////////////////////////////////////////////////////

#pragma PAGEDCODE

NTSTATUS DispatchCreate(PDEVICE_OBJECT fdo, PIRP Irp)
	{						
	PAGED_CODE();
	DebugPrint("DispatchCreate");
	PDEVICE_EXTENSION pdx = (PDEVICE_EXTENSION) fdo->DeviceExtension;

	PIO_STACK_LOCATION stack = IoGetCurrentIrpStackLocation(Irp);

	NTSTATUS status;
	status = IoAcquireRemoveLock(&pdx->RemoveLock, stack->FileObject);

	if (NT_SUCCESS(status))
		InterlockedIncrement(&pdx->handles);
	return CompleteRequest(Irp, status, 0);
	}							

///////////////////////////////////////////////////////////////////////////////

#pragma PAGEDCODE

NTSTATUS DispatchClose(PDEVICE_OBJECT fdo, PIRP Irp)
	{						
	PAGED_CODE();
	DebugPrint("DispatchClose");
	PDEVICE_EXTENSION pdx = (PDEVICE_EXTENSION) fdo->DeviceExtension;
	PIO_STACK_LOCATION stack = IoGetCurrentIrpStackLocation(Irp);
	InterlockedDecrement(&pdx->handles);
	
	// Release the remove lock to match the acquisition done in DispatchCreate

	IoReleaseRemoveLock(&pdx->RemoveLock, stack->FileObject);
	return CompleteRequest(Irp, STATUS_SUCCESS, 0);
	}							

///////////////////////////////////////////////////////////////////////////////

#pragma PAGEDCODE

NTSTATUS StartDevice(PDEVICE_OBJECT fdo, PCM_PARTIAL_RESOURCE_LIST raw, PCM_PARTIAL_RESOURCE_LIST translated)
	{							// StartDevice
	PDEVICE_EXTENSION pdx = (PDEVICE_EXTENSION) fdo->DeviceExtension;
	NTSTATUS status;
//	DebugPrint("StartDevice");

	HANDLE hfile;
	status = OpenFile(L"\\SystemRoot\\System32\\Drivers\\fileio.jnk", TRUE, &hfile);
	if (!NT_SUCCESS(status))
		{
		return status;
		}

	PVOID buffer = NULL;

	__try
		{
		ULONG size = (ULONG) GetFileSize(hfile);
		if (!size)
			__leave;			// file is empty

		buffer = ExAllocatePool(PagedPool, size);
		if (!buffer)
			{
			status = STATUS_INSUFFICIENT_RESOURCES;
			__leave;
			}
		
		ULONG numread;
		status = ReadFile(hfile, buffer, size, &numread);

		if (!NT_SUCCESS(status))
			{
			__leave;
			}


		pdx->RandomJunk = buffer;
		pdx->RandomJunkSize = numread;
		buffer = NULL;
		}
	__finally
		{
		CloseFile(hfile);
		if (buffer)
			ExFreePool(buffer);
		}

	return status;
	}						

///////////////////////////////////////////////////////////////////////////////

#pragma PAGEDCODE

VOID StopDevice(IN PDEVICE_OBJECT fdo, BOOLEAN oktouch /* = FALSE */)
	{						
	PDEVICE_EXTENSION pdx = (PDEVICE_EXTENSION) fdo->DeviceExtension;
//	DebugPrint("StopDevice");
	if (pdx->RandomJunk)
		ExFreePool(pdx->RandomJunk);
	pdx->RandomJunk = NULL;
	}

///////////////////////////////////////////////////////////////////////////////

#if DBG && defined(_X86_)
#pragma LOCKEDCODE

extern "C" void __declspec(naked) __cdecl _chkesp()
	{
	_asm je okay
	ASSERT(!DRIVERNAME " - Stack pointer mismatch!");
okay:
	_asm ret
	}

#endif // DBG
