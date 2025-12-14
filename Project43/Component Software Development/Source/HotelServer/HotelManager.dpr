library HotelManager;

uses
  ComServ,
  HotelManager_TLB in 'HotelManager_TLB.pas',
  HotelImp in 'HotelImp.pas' {Hotel: CoClass},
  ADODB_TLB in 'C:\Program Files\Borland\Delphi5\Imports\ADODB_TLB.pas',
  COMSVCSLib_TLB in 'C:\Program Files\Borland\Delphi5\Imports\COMSVCSLib_TLB.pas',
  MSSQL2K_HotelPrj_TLB in 'C:\Program Files\Borland\Delphi5\Imports\MSSQL2K_HotelPrj_TLB.pas',
  CustomerImp in 'CustomerImp.pas' {HotelCustomer: CoClass},
  HotelRoomImp in 'HotelRoomImp.pas' {HotelRoom: CoClass},
  HotelBookingImp in 'HotelBookingImp.pas' {HotelBooking: CoClass},
  CreateRS_TLB in 'C:\Program Files\Borland\Delphi5\Imports\CreateRS_TLB.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
