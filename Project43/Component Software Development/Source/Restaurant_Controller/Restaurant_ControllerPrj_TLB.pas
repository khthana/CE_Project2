unit Restaurant_ControllerPrj_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : $Revision:   1.88  $
// File generated on 04/08/2001 1:06:31 from Type Library described below.

// ************************************************************************ //
// Type Lib: D:\ball\OlalaProject\RestaurantProject\Restaurant_Controller\Server\Restaurant_ControllerPrj.tlb (1)
// IID\LCID: {AFE87F9C-2226-486C-A07B-32BABECA0FB3}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINNT\System32\STDVCL40.DLL)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  Restaurant_ControllerPrjMajorVersion = 1;
  Restaurant_ControllerPrjMinorVersion = 0;

  LIBID_Restaurant_ControllerPrj: TGUID = '{AFE87F9C-2226-486C-A07B-32BABECA0FB3}';

  IID_IRestaurant_Controller: TGUID = '{C026A6A4-96A0-4D2F-B816-36EA3712DDF4}';
  CLASS_Restaurant_Controller: TGUID = '{0E30FEF7-2ED7-4CE9-A1B9-8393874CFCFF}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IRestaurant_Controller = interface;
  IRestaurant_ControllerDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Restaurant_Controller = IRestaurant_Controller;


// *********************************************************************//
// Interface: IRestaurant_Controller
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C026A6A4-96A0-4D2F-B816-36EA3712DDF4}
// *********************************************************************//
  IRestaurant_Controller = interface(IDispatch)
    ['{C026A6A4-96A0-4D2F-B816-36EA3712DDF4}']
    function  findRestaurant(const RestaurantName: WideString; const Description: WideString; 
                             const Address: WideString; Star: SYSINT): OleVariant; safecall;
    function  viewRestaurant(const RestaurantID: WideString): OleVariant; safecall;
    function  viewBooking(const BookingID: WideString): OleVariant; safecall;
    function  reserve(const RestaurantID: WideString; Meal: SYSINT; ReserveDate: TDateTime; 
                      NoOfReserveSeat: SYSINT; const AgencyID: WideString): WideString; safecall;
    function  confirm(const BookingID: WideString): WideString; safecall;
    function  cancel(const BookingID: WideString): WideString; safecall;
    function  modify(const BookingID: WideString; const RestaurantID: WideString; Meal: SYSINT; 
                     ReserveDate: TDateTime; NoOfReserveSeat: SYSINT): WideString; safecall;
    function  findAgency(const AgencyName: WideString; const Address: WideString): OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  IRestaurant_ControllerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C026A6A4-96A0-4D2F-B816-36EA3712DDF4}
// *********************************************************************//
  IRestaurant_ControllerDisp = dispinterface
    ['{C026A6A4-96A0-4D2F-B816-36EA3712DDF4}']
    function  findRestaurant(const RestaurantName: WideString; const Description: WideString; 
                             const Address: WideString; Star: SYSINT): OleVariant; dispid 1;
    function  viewRestaurant(const RestaurantID: WideString): OleVariant; dispid 2;
    function  viewBooking(const BookingID: WideString): OleVariant; dispid 3;
    function  reserve(const RestaurantID: WideString; Meal: SYSINT; ReserveDate: TDateTime; 
                      NoOfReserveSeat: SYSINT; const AgencyID: WideString): WideString; dispid 4;
    function  confirm(const BookingID: WideString): WideString; dispid 5;
    function  cancel(const BookingID: WideString): WideString; dispid 6;
    function  modify(const BookingID: WideString; const RestaurantID: WideString; Meal: SYSINT; 
                     ReserveDate: TDateTime; NoOfReserveSeat: SYSINT): WideString; dispid 7;
    function  findAgency(const AgencyName: WideString; const Address: WideString): OleVariant; dispid 8;
  end;

// *********************************************************************//
// The Class CoRestaurant_Controller provides a Create and CreateRemote method to          
// create instances of the default interface IRestaurant_Controller exposed by              
// the CoClass Restaurant_Controller. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRestaurant_Controller = class
    class function Create: IRestaurant_Controller;
    class function CreateRemote(const MachineName: string): IRestaurant_Controller;
  end;

implementation

uses ComObj;

class function CoRestaurant_Controller.Create: IRestaurant_Controller;
begin
  Result := CreateComObject(CLASS_Restaurant_Controller) as IRestaurant_Controller;
end;

class function CoRestaurant_Controller.CreateRemote(const MachineName: string): IRestaurant_Controller;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Restaurant_Controller) as IRestaurant_Controller;
end;

end.
