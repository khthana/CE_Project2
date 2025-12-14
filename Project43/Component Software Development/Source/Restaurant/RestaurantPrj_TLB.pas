unit RestaurantPrj_TLB;

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
// File generated on 4/3/2001 15:54:25 from Type Library described below.

// ************************************************************************ //
// Type Lib: D:\ball\OlalaProject\RestaurantProject\Restaurant\Server\RestaurantPrj.tlb (1)
// IID\LCID: {8F3A780A-FBF4-464D-B358-110A30DD3909}\0
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
  RestaurantPrjMajorVersion = 1;
  RestaurantPrjMinorVersion = 0;

  LIBID_RestaurantPrj: TGUID = '{8F3A780A-FBF4-464D-B358-110A30DD3909}';

  IID_IRestaurant: TGUID = '{ECE5DDC1-347A-41F5-B736-C373538745D9}';
  CLASS_Restaurant: TGUID = '{336A1F54-7428-4F7A-A020-E2823B3CC68F}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IRestaurant = interface;
  IRestaurantDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Restaurant = IRestaurant;


// *********************************************************************//
// Interface: IRestaurant
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {ECE5DDC1-347A-41F5-B736-C373538745D9}
// *********************************************************************//
  IRestaurant = interface(IDispatch)
    ['{ECE5DDC1-347A-41F5-B736-C373538745D9}']
    function  getRestaurantName(const restaurantID: WideString): WideString; safecall;
    procedure setRestaurantName(const restaurantID: WideString; const newName: WideString); safecall;
    function  getDescription(const restaurantID: WideString): WideString; safecall;
    procedure setDescription(const restaurantID: WideString; const newDescription: WideString); safecall;
    function  getTotalSeat(const restaurantID: WideString): SYSINT; safecall;
    procedure setTotalSeat(const restaurantID: WideString; newTotalSeat: SYSINT); safecall;
    function  getAddress(const restaurantID: WideString): WideString; safecall;
    procedure setAddress(const restaurantID: WideString; const newAddress: WideString); safecall;
    function  getStar(const restaurantID: WideString): SYSINT; safecall;
    procedure setStar(const restaurantID: WideString; newStar: SYSINT); safecall;
    function  getTelephoneNo(const restaurantID: WideString): WideString; safecall;
    procedure setTelephoneNo(const restaurantID: WideString; const newTelephoneNo: WideString); safecall;
    function  findByNameDescriptionAddressStar(const name: WideString; 
                                               const description: WideString; 
                                               const address: WideString; star: SYSINT): OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  IRestaurantDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {ECE5DDC1-347A-41F5-B736-C373538745D9}
// *********************************************************************//
  IRestaurantDisp = dispinterface
    ['{ECE5DDC1-347A-41F5-B736-C373538745D9}']
    function  getRestaurantName(const restaurantID: WideString): WideString; dispid 1;
    procedure setRestaurantName(const restaurantID: WideString; const newName: WideString); dispid 2;
    function  getDescription(const restaurantID: WideString): WideString; dispid 3;
    procedure setDescription(const restaurantID: WideString; const newDescription: WideString); dispid 4;
    function  getTotalSeat(const restaurantID: WideString): SYSINT; dispid 5;
    procedure setTotalSeat(const restaurantID: WideString; newTotalSeat: SYSINT); dispid 6;
    function  getAddress(const restaurantID: WideString): WideString; dispid 7;
    procedure setAddress(const restaurantID: WideString; const newAddress: WideString); dispid 8;
    function  getStar(const restaurantID: WideString): SYSINT; dispid 9;
    procedure setStar(const restaurantID: WideString; newStar: SYSINT); dispid 10;
    function  getTelephoneNo(const restaurantID: WideString): WideString; dispid 11;
    procedure setTelephoneNo(const restaurantID: WideString; const newTelephoneNo: WideString); dispid 12;
    function  findByNameDescriptionAddressStar(const name: WideString; 
                                               const description: WideString; 
                                               const address: WideString; star: SYSINT): OleVariant; dispid 13;
  end;

// *********************************************************************//
// The Class CoRestaurant provides a Create and CreateRemote method to          
// create instances of the default interface IRestaurant exposed by              
// the CoClass Restaurant. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRestaurant = class
    class function Create: IRestaurant;
    class function CreateRemote(const MachineName: string): IRestaurant;
  end;

implementation

uses ComObj;

class function CoRestaurant.Create: IRestaurant;
begin
  Result := CreateComObject(CLASS_Restaurant) as IRestaurant;
end;

class function CoRestaurant.CreateRemote(const MachineName: string): IRestaurant;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Restaurant) as IRestaurant;
end;

end.
