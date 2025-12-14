unit CacheObject_TLB;

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

// PASTLWTR : $Revision:   1.130  $
// File generated on 12/12/2001 21:18:52 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\CacheSys\Bin\CacheObject.dll (1)
// LIBID: {A98252DD-17D9-11D1-A181-0000F8773CDC}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINDOWS\System32\stdvcl40.dll)
// Errors:
//   Hint: Member 'Set' of 'ISyslist' changed to 'Set_'
//   Error creating palette bitmap of (TFactory) : Server C:\CacheSys\Bin\CACHEO~1.DLL contains no icons
//   Error creating palette bitmap of (Tsyslist) : Server C:\CacheSys\Bin\CACHEO~1.DLL contains no icons
//   Error creating palette bitmap of (TObjInstance) : Server C:\CacheSys\Bin\CACHEO~1.DLL contains no icons
//   Error creating palette bitmap of (TResultSet) : Server C:\CacheSys\Bin\CACHEO~1.DLL contains no icons
//   Error creating palette bitmap of (TBinaryStream) : Server C:\CacheSys\Bin\CACHEO~1.DLL contains no icons
//   Error creating palette bitmap of (TCharStream) : Server C:\CacheSys\Bin\CACHEO~1.DLL contains no icons
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}

interface

uses ActiveX, Classes, Graphics, OleServer, StdVCL, Variants, Windows;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  CacheObjectMajorVersion = 1;
  CacheObjectMinorVersion = 0;

  LIBID_CacheObject: TGUID = '{A98252DD-17D9-11D1-A181-0000F8773CDC}';

  DIID_IFactory: TGUID = '{A98252EA-17D9-11D1-A181-0000F8773CDC}';
  CLASS_Factory: TGUID = '{A98252EB-17D9-11D1-A181-0000F8773CDC}';
  DIID_ISyslist: TGUID = '{7862E5C0-4A2C-11D1-A201-0000F8773CDC}';
  CLASS_syslist: TGUID = '{7862E5C1-4A2C-11D1-A201-0000F8773CDC}';
  DIID_IObjInstance: TGUID = '{4FF34438-4C87-11D1-A204-0000F8773CDC}';
  CLASS_ObjInstance: TGUID = '{4FF3443A-4C87-11D1-A204-0000F8773CDC}';
  DIID_IResultSet: TGUID = '{23649E9E-C4E1-11D1-A2E2-0000F8773CDC}';
  CLASS_ResultSet: TGUID = '{23649E9F-C4E1-11D1-A2E2-0000F8773CDC}';
  DIID_IBinaryStream: TGUID = '{16A9F463-9B4B-11D2-B639-0000F87C2780}';
  CLASS_BinaryStream: TGUID = '{16A9F464-9B4B-11D2-B639-0000F87C2780}';
  DIID_ICharStream: TGUID = '{16A9F466-9B4B-11D2-B639-0000F87C2780}';
  CLASS_CharStream: TGUID = '{16A9F467-9B4B-11D2-B639-0000F87C2780}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IFactory = dispinterface;
  ISyslist = dispinterface;
  IObjInstance = dispinterface;
  IResultSet = dispinterface;
  IBinaryStream = dispinterface;
  ICharStream = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Factory = IFactory;
  syslist = ISyslist;
  ObjInstance = IObjInstance;
  ResultSet = IResultSet;
  BinaryStream = IBinaryStream;
  CharStream = ICharStream;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PWideString1 = ^WideString; {*}


// *********************************************************************//
// DispIntf:  IFactory
// Flags:     (4096) Dispatchable
// GUID:      {A98252EA-17D9-11D1-A181-0000F8773CDC}
// *********************************************************************//
  IFactory = dispinterface
    ['{A98252EA-17D9-11D1-A181-0000F8773CDC}']
    function  Connect(const ConnectString: WideString): WordBool; dispid 1;
    function  Disconnect: WordBool; dispid 2;
    procedure SetLogMask(LogMask: Integer); dispid 3;
    function  New(const ClassName: WideString; vtInit: OleVariant): IDispatch; dispid 4;
    function  Open(const ClassName: WideString; const OID: WideString; Concurency: OleVariant): IDispatch; dispid 5;
    function  OpenEx(const ClassName: WideString; const ID: WideString; Concurency: OleVariant): IDispatch; dispid 6;
    function  OpenId(const ClassName: WideString; const ID: WideString; Concurency: OleVariant): IDispatch; dispid 7;
    function  Static(const ClassName: WideString): IDispatch; dispid 8;
    function  ConnectDlg(Title: OleVariant): WideString; dispid 9;
    function  IsConnected: WordBool; dispid 10;
    function  ResultSet(const ClassName: WideString; const QueryName: WideString): IDispatch; dispid 11;
    function  GetClassName(var OID: WideString): WideString; dispid 12;
    function  GetId(var OID: WideString): WideString; dispid 13;
    function  GetErrorText(ErrorCode: Integer; Param1: OleVariant; Param2: OleVariant; 
                           Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                           Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                           Param9: OleVariant; Param10: OleVariant): WideString; dispid 14;
    procedure SetOutput(pOut: OleVariant); dispid 15;
    function  GetLastErrorCount: Smallint; dispid 16;
    function  GetLastErrorNumber(ErrNo: OleVariant): Integer; dispid 17;
    function  GetLastErrorParamCount(ErrNo: OleVariant): Smallint; dispid 18;
    function  GetLastErrorParam(ErrNo: OleVariant; ParamNo: OleVariant): WideString; dispid 19;
    function  DynamicSQL(const Statement: WideString): IDispatch; dispid 20;
    procedure TransactionStart; dispid 21;
    procedure TransactionRollBack; dispid 22;
    procedure TransactionCommit; dispid 23;
    function  TransactionLevel: Smallint; dispid 24;
    procedure SetCacheLog(LogMask: Integer); dispid 25;
    function  GetConnectionList: WideString; dispid 26;
    function  IsMultibyte: WordBool; dispid 27;
  end;

// *********************************************************************//
// DispIntf:  ISyslist
// Flags:     (4096) Dispatchable
// GUID:      {7862E5C0-4A2C-11D1-A201-0000F8773CDC}
// *********************************************************************//
  ISyslist = dispinterface
    ['{7862E5C0-4A2C-11D1-A201-0000F8773CDC}']
    property Count: Integer dispid 2;
    property IsMultibyte: WordBool dispid 1;
    property _NewEnum: IUnknown dispid -4;
    property ItemList[Index: Smallint]: IDispatch dispid 8;
    property Item[Index: Smallint]: OleVariant dispid 9;
    procedure Set_(vtPar: OleVariant); dispid 3;
    function  Get: WideString; dispid 4;
    procedure Clear; dispid 5;
    procedure Remove(Index: Smallint); dispid 6;
    procedure Add(Item: OleVariant); dispid 7;
  end;

// *********************************************************************//
// DispIntf:  IObjInstance
// Flags:     (4096) Dispatchable
// GUID:      {4FF34438-4C87-11D1-A204-0000F8773CDC}
// *********************************************************************//
  IObjInstance = dispinterface
    ['{4FF34438-4C87-11D1-A204-0000F8773CDC}']
  end;

// *********************************************************************//
// DispIntf:  IResultSet
// Flags:     (4096) Dispatchable
// GUID:      {23649E9E-C4E1-11D1-A2E2-0000F8773CDC}
// *********************************************************************//
  IResultSet = dispinterface
    ['{23649E9E-C4E1-11D1-A2E2-0000F8773CDC}']
    property QHandle: WideString dispid 1;
    function  Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                      Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                      Param9: OleVariant; Param10: OleVariant; Param11: OleVariant; 
                      Param12: OleVariant; Param13: OleVariant; Param14: OleVariant; 
                      Param15: OleVariant): WordBool; dispid 2;
    function  Next: WordBool; dispid 3;
    function  GetColumnCount: Smallint; dispid 4;
    function  GetData(ColumnNo: Smallint): OleVariant; dispid 5;
    function  Close: WordBool; dispid 6;
    function  GetColumnName(ColumnNo: Smallint): WideString; dispid 7;
    function  GetParamCount: Smallint; dispid 8;
    function  GetParamName(ParamNo: Smallint): WideString; dispid 9;
    function  GetColumnHeader(ColumnNo: Smallint): WideString; dispid 10;
    function  GetDataByName(const ColumnName: WideString): OleVariant; dispid 11;
    function  ContainsID: Smallint; dispid 12;
    procedure SetParam(Index: Smallint; Value: OleVariant); dispid 13;
    procedure Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                      Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                      Param9: OleVariant; Param10: OleVariant; Param11: OleVariant; 
                      Param12: OleVariant; Param13: OleVariant; Param14: OleVariant; 
                      Param15: OleVariant); dispid 14;
    function  Get(const ColumnName: WideString): OleVariant; dispid 15;
    function  IsDataNull(ColumnNo: Smallint): WordBool; dispid 16;
  end;

// *********************************************************************//
// DispIntf:  IBinaryStream
// Flags:     (4096) Dispatchable
// GUID:      {16A9F463-9B4B-11D2-B639-0000F87C2780}
// *********************************************************************//
  IBinaryStream = dispinterface
    ['{16A9F463-9B4B-11D2-B639-0000F87C2780}']
    property Data: OleVariant dispid 1;
    property oref: Integer dispid 2;
    property _oref: Integer dispid 0;
    function  FileRead(const FileName: WideString): WordBool; dispid 3;
    function  FileWrite(const FileName: WideString): WordBool; dispid 4;
    function  GetPicture: IPictureDisp; dispid 5;
    procedure SetPicture(const newValue: IPictureDisp); dispid 6;
    function  Read(size: Smallint): WideString; dispid 7;
    function  Rewind: WordBool; dispid 8;
    function  Write(var Value: WideString): WordBool; dispid 9;
    procedure Clear; dispid 10;
    function  GetAttribute(const Name: WideString; const Default: WideString): WideString; dispid 11;
    procedure SetAttribute(const Name: WideString; const Value: WideString); dispid 12;
    function  IsDefinedAttribute(const Name: WideString): WordBool; dispid 13;
    function  NextAttribute(const Name: WideString): WideString; dispid 14;
    function  DeleteAttribute(const Name: WideString): WordBool; dispid 15;
  end;

// *********************************************************************//
// DispIntf:  ICharStream
// Flags:     (4096) Dispatchable
// GUID:      {16A9F466-9B4B-11D2-B639-0000F87C2780}
// *********************************************************************//
  ICharStream = dispinterface
    ['{16A9F466-9B4B-11D2-B639-0000F87C2780}']
    property Data: OleVariant dispid 1;
    property oref: Integer dispid 2;
    property _oref: Integer dispid 0;
    function  FileRead(const FileName: WideString): WordBool; dispid 3;
    function  FileWrite(const FileName: WideString): WordBool; dispid 4;
    function  Read(size: Smallint): WideString; dispid 5;
    function  Write(const Value: WideString): WordBool; dispid 6;
    function  Rewind: WordBool; dispid 7;
    procedure Clear; dispid 8;
    function  GetAttribute(const Name: WideString; const Default: WideString): WideString; dispid 9;
    procedure SetAttribute(const Name: WideString; const Value: WideString); dispid 10;
    function  IsDefinedAttribute(const Name: WideString): WordBool; dispid 11;
    function  NextAttribute(const Name: WideString): WideString; dispid 12;
    function  DeleteAttribute(const Name: WideString): WordBool; dispid 13;
  end;

// *********************************************************************//
// The Class CoFactory provides a Create and CreateRemote method to          
// create instances of the default interface IFactory exposed by              
// the CoClass Factory. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoFactory = class
    class function Create: IFactory;
    class function CreateRemote(const MachineName: string): IFactory;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TFactory
// Help String      : 
// Default Interface: IFactory
// Def. Intf. DISP? : Yes
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TFactoryProperties= class;
{$ENDIF}
  TFactory = class(TOleServer)
  private
    FIntf:        IFactory;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TFactoryProperties;
    function      GetServerProperties: TFactoryProperties;
{$ENDIF}
    function      GetDefaultInterface: IFactory;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IFactory);
    procedure Disconnect; override;
    function  Connect1(const ConnectString: WideString): WordBool;
    function  Disconnect1: WordBool;
    procedure SetLogMask(LogMask: Integer);
    function  New(const ClassName: WideString): IDispatch; overload;
    function  New(const ClassName: WideString; vtInit: OleVariant): IDispatch; overload;
    function  Open(const ClassName: WideString; const OID: WideString): IDispatch; overload;
    function  Open(const ClassName: WideString; const OID: WideString; Concurency: OleVariant): IDispatch; overload;
    function  OpenEx(const ClassName: WideString; const ID: WideString): IDispatch; overload;
    function  OpenEx(const ClassName: WideString; const ID: WideString; Concurency: OleVariant): IDispatch; overload;
    function  OpenId(const ClassName: WideString; const ID: WideString): IDispatch; overload;
    function  OpenId(const ClassName: WideString; const ID: WideString; Concurency: OleVariant): IDispatch; overload;
    function  Static(const ClassName: WideString): IDispatch;
    function  ConnectDlg: WideString; overload;
    function  ConnectDlg(Title: OleVariant): WideString; overload;
    function  IsConnected: WordBool;
    function  ResultSet(const ClassName: WideString; const QueryName: WideString): IDispatch;
    function  GetClassName(var OID: WideString): WideString;
    function  GetId(var OID: WideString): WideString;
    function  GetErrorText(ErrorCode: Integer): WideString; overload;
    function  GetErrorText(ErrorCode: Integer; Param1: OleVariant): WideString; overload;
    function  GetErrorText(ErrorCode: Integer; Param1: OleVariant; Param2: OleVariant): WideString; overload;
    function  GetErrorText(ErrorCode: Integer; Param1: OleVariant; Param2: OleVariant; 
                           Param3: OleVariant): WideString; overload;
    function  GetErrorText(ErrorCode: Integer; Param1: OleVariant; Param2: OleVariant; 
                           Param3: OleVariant; Param4: OleVariant): WideString; overload;
    function  GetErrorText(ErrorCode: Integer; Param1: OleVariant; Param2: OleVariant; 
                           Param3: OleVariant; Param4: OleVariant; Param5: OleVariant): WideString; overload;
    function  GetErrorText(ErrorCode: Integer; Param1: OleVariant; Param2: OleVariant; 
                           Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                           Param6: OleVariant): WideString; overload;
    function  GetErrorText(ErrorCode: Integer; Param1: OleVariant; Param2: OleVariant; 
                           Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                           Param6: OleVariant; Param7: OleVariant): WideString; overload;
    function  GetErrorText(ErrorCode: Integer; Param1: OleVariant; Param2: OleVariant; 
                           Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                           Param6: OleVariant; Param7: OleVariant; Param8: OleVariant): WideString; overload;
    function  GetErrorText(ErrorCode: Integer; Param1: OleVariant; Param2: OleVariant; 
                           Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                           Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                           Param9: OleVariant): WideString; overload;
    function  GetErrorText(ErrorCode: Integer; Param1: OleVariant; Param2: OleVariant; 
                           Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                           Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                           Param9: OleVariant; Param10: OleVariant): WideString; overload;
    procedure SetOutput(pOut: OleVariant);
    function  GetLastErrorCount: Smallint;
    function  GetLastErrorNumber: Integer; overload;
    function  GetLastErrorNumber(ErrNo: OleVariant): Integer; overload;
    function  GetLastErrorParamCount: Smallint; overload;
    function  GetLastErrorParamCount(ErrNo: OleVariant): Smallint; overload;
    function  GetLastErrorParam: WideString; overload;
    function  GetLastErrorParam(ErrNo: OleVariant): WideString; overload;
    function  GetLastErrorParam(ErrNo: OleVariant; ParamNo: OleVariant): WideString; overload;
    function  DynamicSQL(const Statement: WideString): IDispatch;
    procedure TransactionStart;
    procedure TransactionRollBack;
    procedure TransactionCommit;
    function  TransactionLevel: Smallint;
    procedure SetCacheLog(LogMask: Integer);
    function  GetConnectionList: WideString;
    function  IsMultibyte: WordBool;
    property  DefaultInterface: IFactory read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TFactoryProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TFactory
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TFactoryProperties = class(TPersistent)
  private
    FServer:    TFactory;
    function    GetDefaultInterface: IFactory;
    constructor Create(AServer: TFactory);
  protected
  public
    property DefaultInterface: IFactory read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class Cosyslist provides a Create and CreateRemote method to          
// create instances of the default interface ISyslist exposed by              
// the CoClass syslist. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  Cosyslist = class
    class function Create: ISyslist;
    class function CreateRemote(const MachineName: string): ISyslist;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : Tsyslist
// Help String      : 
// Default Interface: ISyslist
// Def. Intf. DISP? : Yes
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TsyslistProperties= class;
{$ENDIF}
  Tsyslist = class(TOleServer)
  private
    FIntf:        ISyslist;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TsyslistProperties;
    function      GetServerProperties: TsyslistProperties;
{$ENDIF}
    function      GetDefaultInterface: ISyslist;
  protected
    procedure InitServerData; override;
    function Get_Count: Integer;
    procedure Set_Count(Value: Integer);
    function Get_IsMultibyte: WordBool;
    procedure Set_IsMultibyte(Value: WordBool);
    function Get__NewEnum: IUnknown;
    procedure Set__NewEnum(const Value: IUnknown);
    function  Get_ItemList(Index: Smallint): IDispatch;
    procedure _Set_ItemList(Index: Smallint; const Param2: IDispatch);
    function  Get_Item(Index: Smallint): OleVariant;
    procedure Set_Item(Index: Smallint; Param2: OleVariant);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISyslist);
    procedure Disconnect; override;
    procedure Set_(vtPar: OleVariant);
    function  Get: WideString;
    procedure Clear;
    procedure Remove(Index: Smallint);
    procedure Add(Item: OleVariant);
    property  DefaultInterface: ISyslist read GetDefaultInterface;
    property _NewEnum: IUnknown read Get__NewEnum write Set__NewEnum;
    property ItemList[Index: Smallint]: IDispatch read Get_ItemList;
    property Item[Index: Smallint]: OleVariant read Get_Item write Set_Item;
    property Count: Integer read Get_Count write Set_Count;
    property IsMultibyte: WordBool read Get_IsMultibyte write Set_IsMultibyte;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TsyslistProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : Tsyslist
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TsyslistProperties = class(TPersistent)
  private
    FServer:    Tsyslist;
    function    GetDefaultInterface: ISyslist;
    constructor Create(AServer: Tsyslist);
  protected
    function Get_Count: Integer;
    procedure Set_Count(Value: Integer);
    function Get_IsMultibyte: WordBool;
    procedure Set_IsMultibyte(Value: WordBool);
    function Get__NewEnum: IUnknown;
    procedure Set__NewEnum(const Value: IUnknown);
    function  Get_ItemList(Index: Smallint): IDispatch;
    procedure _Set_ItemList(Index: Smallint; const Param2: IDispatch);
    function  Get_Item(Index: Smallint): OleVariant;
    procedure Set_Item(Index: Smallint; Param2: OleVariant);
  public
    property DefaultInterface: ISyslist read GetDefaultInterface;
  published
    property Count: Integer read Get_Count write Set_Count;
    property IsMultibyte: WordBool read Get_IsMultibyte write Set_IsMultibyte;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoObjInstance provides a Create and CreateRemote method to          
// create instances of the default interface IObjInstance exposed by              
// the CoClass ObjInstance. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoObjInstance = class
    class function Create: IObjInstance;
    class function CreateRemote(const MachineName: string): IObjInstance;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TObjInstance
// Help String      : 
// Default Interface: IObjInstance
// Def. Intf. DISP? : Yes
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TObjInstanceProperties= class;
{$ENDIF}
  TObjInstance = class(TOleServer)
  private
    FIntf:        IObjInstance;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TObjInstanceProperties;
    function      GetServerProperties: TObjInstanceProperties;
{$ENDIF}
    function      GetDefaultInterface: IObjInstance;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IObjInstance);
    procedure Disconnect; override;
    property  DefaultInterface: IObjInstance read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TObjInstanceProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TObjInstance
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TObjInstanceProperties = class(TPersistent)
  private
    FServer:    TObjInstance;
    function    GetDefaultInterface: IObjInstance;
    constructor Create(AServer: TObjInstance);
  protected
  public
    property DefaultInterface: IObjInstance read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoResultSet provides a Create and CreateRemote method to          
// create instances of the default interface IResultSet exposed by              
// the CoClass ResultSet. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoResultSet = class
    class function Create: IResultSet;
    class function CreateRemote(const MachineName: string): IResultSet;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TResultSet
// Help String      : 
// Default Interface: IResultSet
// Def. Intf. DISP? : Yes
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TResultSetProperties= class;
{$ENDIF}
  TResultSet = class(TOleServer)
  private
    FIntf:        IResultSet;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TResultSetProperties;
    function      GetServerProperties: TResultSetProperties;
{$ENDIF}
    function      GetDefaultInterface: IResultSet;
  protected
    procedure InitServerData; override;
    function Get_QHandle: WideString;
    procedure Set_QHandle(const Value: WideString);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IResultSet);
    procedure Disconnect; override;
    function  Execute: WordBool; overload;
    function  Execute(Param0: OleVariant): WordBool; overload;
    function  Execute(Param0: OleVariant; Param1: OleVariant): WordBool; overload;
    function  Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant): WordBool; overload;
    function  Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; Param3: OleVariant): WordBool; overload;
    function  Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant): WordBool; overload;
    function  Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant): WordBool; overload;
    function  Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; Param6: OleVariant): WordBool; overload;
    function  Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                      Param6: OleVariant; Param7: OleVariant): WordBool; overload;
    function  Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                      Param6: OleVariant; Param7: OleVariant; Param8: OleVariant): WordBool; overload;
    function  Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                      Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; Param9: OleVariant): WordBool; overload;
    function  Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                      Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                      Param9: OleVariant; Param10: OleVariant): WordBool; overload;
    function  Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                      Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                      Param9: OleVariant; Param10: OleVariant; Param11: OleVariant): WordBool; overload;
    function  Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                      Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                      Param9: OleVariant; Param10: OleVariant; Param11: OleVariant; 
                      Param12: OleVariant): WordBool; overload;
    function  Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                      Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                      Param9: OleVariant; Param10: OleVariant; Param11: OleVariant; 
                      Param12: OleVariant; Param13: OleVariant): WordBool; overload;
    function  Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                      Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                      Param9: OleVariant; Param10: OleVariant; Param11: OleVariant; 
                      Param12: OleVariant; Param13: OleVariant; Param14: OleVariant): WordBool; overload;
    function  Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                      Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                      Param9: OleVariant; Param10: OleVariant; Param11: OleVariant; 
                      Param12: OleVariant; Param13: OleVariant; Param14: OleVariant; 
                      Param15: OleVariant): WordBool; overload;
    function  Next: WordBool;
    function  GetColumnCount: Smallint;
    function  GetData(ColumnNo: Smallint): OleVariant;
    function  Close: WordBool;
    function  GetColumnName(ColumnNo: Smallint): WideString;
    function  GetParamCount: Smallint;
    function  GetParamName(ParamNo: Smallint): WideString;
    function  GetColumnHeader(ColumnNo: Smallint): WideString;
    function  GetDataByName(const ColumnName: WideString): OleVariant;
    function  ContainsID: Smallint;
    procedure SetParam(Index: Smallint; Value: OleVariant);
    procedure Prepare; overload;
    procedure Prepare(Param0: OleVariant); overload;
    procedure Prepare(Param0: OleVariant; Param1: OleVariant); overload;
    procedure Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant); overload;
    procedure Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; Param3: OleVariant); overload;
    procedure Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant); overload;
    procedure Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant); overload;
    procedure Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; Param6: OleVariant); overload;
    procedure Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                      Param6: OleVariant; Param7: OleVariant); overload;
    procedure Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                      Param6: OleVariant; Param7: OleVariant; Param8: OleVariant); overload;
    procedure Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                      Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; Param9: OleVariant); overload;
    procedure Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                      Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                      Param9: OleVariant; Param10: OleVariant); overload;
    procedure Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                      Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                      Param9: OleVariant; Param10: OleVariant; Param11: OleVariant); overload;
    procedure Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                      Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                      Param9: OleVariant; Param10: OleVariant; Param11: OleVariant; 
                      Param12: OleVariant); overload;
    procedure Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                      Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                      Param9: OleVariant; Param10: OleVariant; Param11: OleVariant; 
                      Param12: OleVariant; Param13: OleVariant); overload;
    procedure Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                      Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                      Param9: OleVariant; Param10: OleVariant; Param11: OleVariant; 
                      Param12: OleVariant; Param13: OleVariant; Param14: OleVariant); overload;
    procedure Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                      Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                      Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                      Param9: OleVariant; Param10: OleVariant; Param11: OleVariant; 
                      Param12: OleVariant; Param13: OleVariant; Param14: OleVariant; 
                      Param15: OleVariant); overload;
    function  Get(const ColumnName: WideString): OleVariant;
    function  IsDataNull(ColumnNo: Smallint): WordBool;
    property  DefaultInterface: IResultSet read GetDefaultInterface;
    property QHandle: WideString read Get_QHandle write Set_QHandle;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TResultSetProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TResultSet
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TResultSetProperties = class(TPersistent)
  private
    FServer:    TResultSet;
    function    GetDefaultInterface: IResultSet;
    constructor Create(AServer: TResultSet);
  protected
    function Get_QHandle: WideString;
    procedure Set_QHandle(const Value: WideString);
  public
    property DefaultInterface: IResultSet read GetDefaultInterface;
  published
    property QHandle: WideString read Get_QHandle write Set_QHandle;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoBinaryStream provides a Create and CreateRemote method to          
// create instances of the default interface IBinaryStream exposed by              
// the CoClass BinaryStream. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBinaryStream = class
    class function Create: IBinaryStream;
    class function CreateRemote(const MachineName: string): IBinaryStream;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TBinaryStream
// Help String      : 
// Default Interface: IBinaryStream
// Def. Intf. DISP? : Yes
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TBinaryStreamProperties= class;
{$ENDIF}
  TBinaryStream = class(TOleServer)
  private
    FIntf:        IBinaryStream;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TBinaryStreamProperties;
    function      GetServerProperties: TBinaryStreamProperties;
{$ENDIF}
    function      GetDefaultInterface: IBinaryStream;
  protected
    procedure InitServerData; override;
    function Get_Data: OleVariant;
    procedure Set_Data(Value: OleVariant);
    function Get_oref: Integer;
    procedure Set_oref(Value: Integer);
    function Get__oref: Integer;
    procedure Set__oref(Value: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IBinaryStream);
    procedure Disconnect; override;
    function  FileRead(const FileName: WideString): WordBool;
    function  FileWrite(const FileName: WideString): WordBool;
    function  GetPicture: IPictureDisp;
    procedure SetPicture(const newValue: IPictureDisp);
    function  Read(size: Smallint): WideString;
    function  Rewind: WordBool;
    function  Write(var Value: WideString): WordBool;
    procedure Clear;
    function  GetAttribute(const Name: WideString; const Default: WideString): WideString;
    procedure SetAttribute(const Name: WideString; const Value: WideString);
    function  IsDefinedAttribute(const Name: WideString): WordBool;
    function  NextAttribute(const Name: WideString): WideString;
    function  DeleteAttribute(const Name: WideString): WordBool;
    property  DefaultInterface: IBinaryStream read GetDefaultInterface;
    property Data: OleVariant read Get_Data write Set_Data;
    property oref: Integer read Get_oref write Set_oref;
    property _oref: Integer read Get__oref write Set__oref;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TBinaryStreamProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TBinaryStream
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TBinaryStreamProperties = class(TPersistent)
  private
    FServer:    TBinaryStream;
    function    GetDefaultInterface: IBinaryStream;
    constructor Create(AServer: TBinaryStream);
  protected
    function Get_Data: OleVariant;
    procedure Set_Data(Value: OleVariant);
    function Get_oref: Integer;
    procedure Set_oref(Value: Integer);
    function Get__oref: Integer;
    procedure Set__oref(Value: Integer);
  public
    property DefaultInterface: IBinaryStream read GetDefaultInterface;
  published
    property oref: Integer read Get_oref write Set_oref;
    property _oref: Integer read Get__oref write Set__oref;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoCharStream provides a Create and CreateRemote method to          
// create instances of the default interface ICharStream exposed by              
// the CoClass CharStream. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCharStream = class
    class function Create: ICharStream;
    class function CreateRemote(const MachineName: string): ICharStream;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TCharStream
// Help String      : 
// Default Interface: ICharStream
// Def. Intf. DISP? : Yes
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TCharStreamProperties= class;
{$ENDIF}
  TCharStream = class(TOleServer)
  private
    FIntf:        ICharStream;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TCharStreamProperties;
    function      GetServerProperties: TCharStreamProperties;
{$ENDIF}
    function      GetDefaultInterface: ICharStream;
  protected
    procedure InitServerData; override;
    function Get_Data: OleVariant;
    procedure Set_Data(Value: OleVariant);
    function Get_oref: Integer;
    procedure Set_oref(Value: Integer);
    function Get__oref: Integer;
    procedure Set__oref(Value: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ICharStream);
    procedure Disconnect; override;
    function  FileRead(const FileName: WideString): WordBool;
    function  FileWrite(const FileName: WideString): WordBool;
    function  Read(size: Smallint): WideString;
    function  Write(const Value: WideString): WordBool;
    function  Rewind: WordBool;
    procedure Clear;
    function  GetAttribute(const Name: WideString; const Default: WideString): WideString;
    procedure SetAttribute(const Name: WideString; const Value: WideString);
    function  IsDefinedAttribute(const Name: WideString): WordBool;
    function  NextAttribute(const Name: WideString): WideString;
    function  DeleteAttribute(const Name: WideString): WordBool;
    property  DefaultInterface: ICharStream read GetDefaultInterface;
    property Data: OleVariant read Get_Data write Set_Data;
    property oref: Integer read Get_oref write Set_oref;
    property _oref: Integer read Get__oref write Set__oref;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TCharStreamProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TCharStream
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TCharStreamProperties = class(TPersistent)
  private
    FServer:    TCharStream;
    function    GetDefaultInterface: ICharStream;
    constructor Create(AServer: TCharStream);
  protected
    function Get_Data: OleVariant;
    procedure Set_Data(Value: OleVariant);
    function Get_oref: Integer;
    procedure Set_oref(Value: Integer);
    function Get__oref: Integer;
    procedure Set__oref(Value: Integer);
  public
    property DefaultInterface: ICharStream read GetDefaultInterface;
  published
    property oref: Integer read Get_oref write Set_oref;
    property _oref: Integer read Get__oref write Set__oref;
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

implementation

uses ComObj;

class function CoFactory.Create: IFactory;
begin
  Result := CreateComObject(CLASS_Factory) as IFactory;
end;

class function CoFactory.CreateRemote(const MachineName: string): IFactory;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Factory) as IFactory;
end;

procedure TFactory.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{A98252EB-17D9-11D1-A181-0000F8773CDC}';
    IntfIID:   '{A98252EA-17D9-11D1-A181-0000F8773CDC}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TFactory.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IFactory;
  end;
end;

procedure TFactory.ConnectTo(svrIntf: IFactory);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TFactory.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TFactory.GetDefaultInterface: IFactory;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TFactory.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TFactoryProperties.Create(Self);
{$ENDIF}
end;

destructor TFactory.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TFactory.GetServerProperties: TFactoryProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TFactory.Connect1(const ConnectString: WideString): WordBool;
begin
  DefaultInterface.Connect(ConnectString);
end;

function  TFactory.Disconnect1: WordBool;
begin
  DefaultInterface.Disconnect;
end;

procedure TFactory.SetLogMask(LogMask: Integer);
begin
  DefaultInterface.SetLogMask(LogMask);
end;

function  TFactory.New(const ClassName: WideString): IDispatch;
begin
  DefaultInterface.New(ClassName, EmptyParam);
end;

function  TFactory.New(const ClassName: WideString; vtInit: OleVariant): IDispatch;
begin
  DefaultInterface.New(ClassName, vtInit);
end;

function  TFactory.Open(const ClassName: WideString; const OID: WideString): IDispatch;
begin
  DefaultInterface.Open(ClassName, OID, EmptyParam);
end;

function  TFactory.Open(const ClassName: WideString; const OID: WideString; Concurency: OleVariant): IDispatch;
begin
  DefaultInterface.Open(ClassName, OID, Concurency);
end;

function  TFactory.OpenEx(const ClassName: WideString; const ID: WideString): IDispatch;
begin
  DefaultInterface.OpenEx(ClassName, ID, EmptyParam);
end;

function  TFactory.OpenEx(const ClassName: WideString; const ID: WideString; Concurency: OleVariant): IDispatch;
begin
  DefaultInterface.OpenEx(ClassName, ID, Concurency);
end;

function  TFactory.OpenId(const ClassName: WideString; const ID: WideString): IDispatch;
begin
  DefaultInterface.OpenId(ClassName, ID, EmptyParam);
end;

function  TFactory.OpenId(const ClassName: WideString; const ID: WideString; Concurency: OleVariant): IDispatch;
begin
  DefaultInterface.OpenId(ClassName, ID, Concurency);
end;

function  TFactory.Static(const ClassName: WideString): IDispatch;
begin
  DefaultInterface.Static(ClassName);
end;

function  TFactory.ConnectDlg: WideString;
begin
  DefaultInterface.ConnectDlg(EmptyParam);
end;

function  TFactory.ConnectDlg(Title: OleVariant): WideString;
begin
  DefaultInterface.ConnectDlg(Title);
end;

function  TFactory.IsConnected: WordBool;
begin
  DefaultInterface.IsConnected;
end;

function  TFactory.ResultSet(const ClassName: WideString; const QueryName: WideString): IDispatch;
begin
  DefaultInterface.ResultSet(ClassName, QueryName);
end;

function  TFactory.GetClassName(var OID: WideString): WideString;
begin
  DefaultInterface.GetClassName(OID);
end;

function  TFactory.GetId(var OID: WideString): WideString;
begin
  DefaultInterface.GetId(OID);
end;

function  TFactory.GetErrorText(ErrorCode: Integer): WideString;
begin
  DefaultInterface.GetErrorText(ErrorCode, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                                EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                                EmptyParam);
end;

function  TFactory.GetErrorText(ErrorCode: Integer; Param1: OleVariant): WideString;
begin
  DefaultInterface.GetErrorText(ErrorCode, Param1, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                                EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

function  TFactory.GetErrorText(ErrorCode: Integer; Param1: OleVariant; Param2: OleVariant): WideString;
begin
  DefaultInterface.GetErrorText(ErrorCode, Param1, Param2, EmptyParam, EmptyParam, EmptyParam, 
                                EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

function  TFactory.GetErrorText(ErrorCode: Integer; Param1: OleVariant; Param2: OleVariant; 
                                Param3: OleVariant): WideString;
begin
  DefaultInterface.GetErrorText(ErrorCode, Param1, Param2, Param3, EmptyParam, EmptyParam, 
                                EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

function  TFactory.GetErrorText(ErrorCode: Integer; Param1: OleVariant; Param2: OleVariant; 
                                Param3: OleVariant; Param4: OleVariant): WideString;
begin
  DefaultInterface.GetErrorText(ErrorCode, Param1, Param2, Param3, Param4, EmptyParam, EmptyParam, 
                                EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

function  TFactory.GetErrorText(ErrorCode: Integer; Param1: OleVariant; Param2: OleVariant; 
                                Param3: OleVariant; Param4: OleVariant; Param5: OleVariant): WideString;
begin
  DefaultInterface.GetErrorText(ErrorCode, Param1, Param2, Param3, Param4, Param5, EmptyParam, 
                                EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

function  TFactory.GetErrorText(ErrorCode: Integer; Param1: OleVariant; Param2: OleVariant; 
                                Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                                Param6: OleVariant): WideString;
begin
  DefaultInterface.GetErrorText(ErrorCode, Param1, Param2, Param3, Param4, Param5, Param6, 
                                EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

function  TFactory.GetErrorText(ErrorCode: Integer; Param1: OleVariant; Param2: OleVariant; 
                                Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                                Param6: OleVariant; Param7: OleVariant): WideString;
begin
  DefaultInterface.GetErrorText(ErrorCode, Param1, Param2, Param3, Param4, Param5, Param6, Param7, 
                                EmptyParam, EmptyParam, EmptyParam);
end;

function  TFactory.GetErrorText(ErrorCode: Integer; Param1: OleVariant; Param2: OleVariant; 
                                Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                                Param6: OleVariant; Param7: OleVariant; Param8: OleVariant): WideString;
begin
  DefaultInterface.GetErrorText(ErrorCode, Param1, Param2, Param3, Param4, Param5, Param6, Param7, 
                                Param8, EmptyParam, EmptyParam);
end;

function  TFactory.GetErrorText(ErrorCode: Integer; Param1: OleVariant; Param2: OleVariant; 
                                Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                                Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                                Param9: OleVariant): WideString;
begin
  DefaultInterface.GetErrorText(ErrorCode, Param1, Param2, Param3, Param4, Param5, Param6, Param7, 
                                Param8, Param9, EmptyParam);
end;

function  TFactory.GetErrorText(ErrorCode: Integer; Param1: OleVariant; Param2: OleVariant; 
                                Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                                Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                                Param9: OleVariant; Param10: OleVariant): WideString;
begin
  DefaultInterface.GetErrorText(ErrorCode, Param1, Param2, Param3, Param4, Param5, Param6, Param7, 
                                Param8, Param9, Param10);
end;

procedure TFactory.SetOutput(pOut: OleVariant);
begin
  DefaultInterface.SetOutput(pOut);
end;

function  TFactory.GetLastErrorCount: Smallint;
begin
  DefaultInterface.GetLastErrorCount;
end;

function  TFactory.GetLastErrorNumber: Integer;
begin
  DefaultInterface.GetLastErrorNumber(EmptyParam);
end;

function  TFactory.GetLastErrorNumber(ErrNo: OleVariant): Integer;
begin
  DefaultInterface.GetLastErrorNumber(ErrNo);
end;

function  TFactory.GetLastErrorParamCount: Smallint;
begin
  DefaultInterface.GetLastErrorParamCount(EmptyParam);
end;

function  TFactory.GetLastErrorParamCount(ErrNo: OleVariant): Smallint;
begin
  DefaultInterface.GetLastErrorParamCount(ErrNo);
end;

function  TFactory.GetLastErrorParam: WideString;
begin
  DefaultInterface.GetLastErrorParam(EmptyParam, EmptyParam);
end;

function  TFactory.GetLastErrorParam(ErrNo: OleVariant): WideString;
begin
  DefaultInterface.GetLastErrorParam(ErrNo, EmptyParam);
end;

function  TFactory.GetLastErrorParam(ErrNo: OleVariant; ParamNo: OleVariant): WideString;
begin
  DefaultInterface.GetLastErrorParam(ErrNo, ParamNo);
end;

function  TFactory.DynamicSQL(const Statement: WideString): IDispatch;
begin
  DefaultInterface.DynamicSQL(Statement);
end;

procedure TFactory.TransactionStart;
begin
  DefaultInterface.TransactionStart;
end;

procedure TFactory.TransactionRollBack;
begin
  DefaultInterface.TransactionRollBack;
end;

procedure TFactory.TransactionCommit;
begin
  DefaultInterface.TransactionCommit;
end;

function  TFactory.TransactionLevel: Smallint;
begin
  DefaultInterface.TransactionLevel;
end;

procedure TFactory.SetCacheLog(LogMask: Integer);
begin
  DefaultInterface.SetCacheLog(LogMask);
end;

function  TFactory.GetConnectionList: WideString;
begin
  DefaultInterface.GetConnectionList;
end;

function  TFactory.IsMultibyte: WordBool;
begin
  DefaultInterface.IsMultibyte;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TFactoryProperties.Create(AServer: TFactory);
begin
  inherited Create;
  FServer := AServer;
end;

function TFactoryProperties.GetDefaultInterface: IFactory;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function Cosyslist.Create: ISyslist;
begin
  Result := CreateComObject(CLASS_syslist) as ISyslist;
end;

class function Cosyslist.CreateRemote(const MachineName: string): ISyslist;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_syslist) as ISyslist;
end;

procedure Tsyslist.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{7862E5C1-4A2C-11D1-A201-0000F8773CDC}';
    IntfIID:   '{7862E5C0-4A2C-11D1-A201-0000F8773CDC}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure Tsyslist.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ISyslist;
  end;
end;

procedure Tsyslist.ConnectTo(svrIntf: ISyslist);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure Tsyslist.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function Tsyslist.GetDefaultInterface: ISyslist;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor Tsyslist.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TsyslistProperties.Create(Self);
{$ENDIF}
end;

destructor Tsyslist.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function Tsyslist.GetServerProperties: TsyslistProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function Tsyslist.Get_Count: Integer;
begin
  Result := DefaultInterface.Count;
end;

procedure Tsyslist.Set_Count(Value: Integer);
begin
  DefaultInterface.Count := Value;
end;

function Tsyslist.Get_IsMultibyte: WordBool;
begin
  Result := DefaultInterface.IsMultibyte;
end;

procedure Tsyslist.Set_IsMultibyte(Value: WordBool);
begin
  DefaultInterface.IsMultibyte := Value;
end;

function Tsyslist.Get__NewEnum: IUnknown;
begin
  Result := DefaultInterface._NewEnum;
end;

procedure Tsyslist.Set__NewEnum(const Value: IUnknown);
begin
  DefaultInterface._NewEnum := Value;
end;

function  Tsyslist.Get_ItemList(Index: Smallint): IDispatch;
begin
  Result := DefaultInterface.ItemList[Index];
end;

procedure Tsyslist._Set_ItemList(Index: Smallint; const Param2: IDispatch);
  { Warning: The property ItemList has a setter and a getter whose
  types do not match. Delphi was unable to generate a property of
  this sort and so is using a Variant to set the property instead. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ItemList := Param2;
end;

function  Tsyslist.Get_Item(Index: Smallint): OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Item;
end;

procedure Tsyslist.Set_Item(Index: Smallint; Param2: OleVariant);
begin
  DefaultInterface.Item[Index] := Param2;
end;

procedure Tsyslist.Set_(vtPar: OleVariant);
begin
  DefaultInterface.Set_(vtPar);
end;

function  Tsyslist.Get: WideString;
begin
  DefaultInterface.Get;
end;

procedure Tsyslist.Clear;
begin
  DefaultInterface.Clear;
end;

procedure Tsyslist.Remove(Index: Smallint);
begin
  DefaultInterface.Remove(Index);
end;

procedure Tsyslist.Add(Item: OleVariant);
begin
  DefaultInterface.Add(Item);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TsyslistProperties.Create(AServer: Tsyslist);
begin
  inherited Create;
  FServer := AServer;
end;

function TsyslistProperties.GetDefaultInterface: ISyslist;
begin
  Result := FServer.DefaultInterface;
end;

function TsyslistProperties.Get_Count: Integer;
begin
  Result := DefaultInterface.Count;
end;

procedure TsyslistProperties.Set_Count(Value: Integer);
begin
  DefaultInterface.Count := Value;
end;

function TsyslistProperties.Get_IsMultibyte: WordBool;
begin
  Result := DefaultInterface.IsMultibyte;
end;

procedure TsyslistProperties.Set_IsMultibyte(Value: WordBool);
begin
  DefaultInterface.IsMultibyte := Value;
end;

function TsyslistProperties.Get__NewEnum: IUnknown;
begin
  Result := DefaultInterface._NewEnum;
end;

procedure TsyslistProperties.Set__NewEnum(const Value: IUnknown);
begin
  DefaultInterface._NewEnum := Value;
end;

function  TsyslistProperties.Get_ItemList(Index: Smallint): IDispatch;
begin
  Result := DefaultInterface.Get_ItemList(Index);
end;

procedure TsyslistProperties._Set_ItemList(Index: Smallint; const Param2: IDispatch);
  { Warning: The property ItemList has a setter and a getter whose
  types do not match. Delphi was unable to generate a property of
  this sort and so is using a Variant to set the property instead. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ItemList := Param2;
end;

function  TsyslistProperties.Get_Item(Index: Smallint): OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Item;
end;

procedure TsyslistProperties.Set_Item(Index: Smallint; Param2: OleVariant);
begin
  DefaultInterface.Set_Item(Index) := Param2;
end;

{$ENDIF}

class function CoObjInstance.Create: IObjInstance;
begin
  Result := CreateComObject(CLASS_ObjInstance) as IObjInstance;
end;

class function CoObjInstance.CreateRemote(const MachineName: string): IObjInstance;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ObjInstance) as IObjInstance;
end;

procedure TObjInstance.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{4FF3443A-4C87-11D1-A204-0000F8773CDC}';
    IntfIID:   '{4FF34438-4C87-11D1-A204-0000F8773CDC}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TObjInstance.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IObjInstance;
  end;
end;

procedure TObjInstance.ConnectTo(svrIntf: IObjInstance);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TObjInstance.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TObjInstance.GetDefaultInterface: IObjInstance;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TObjInstance.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TObjInstanceProperties.Create(Self);
{$ENDIF}
end;

destructor TObjInstance.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TObjInstance.GetServerProperties: TObjInstanceProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TObjInstanceProperties.Create(AServer: TObjInstance);
begin
  inherited Create;
  FServer := AServer;
end;

function TObjInstanceProperties.GetDefaultInterface: IObjInstance;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoResultSet.Create: IResultSet;
begin
  Result := CreateComObject(CLASS_ResultSet) as IResultSet;
end;

class function CoResultSet.CreateRemote(const MachineName: string): IResultSet;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ResultSet) as IResultSet;
end;

procedure TResultSet.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{23649E9F-C4E1-11D1-A2E2-0000F8773CDC}';
    IntfIID:   '{23649E9E-C4E1-11D1-A2E2-0000F8773CDC}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TResultSet.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IResultSet;
  end;
end;

procedure TResultSet.ConnectTo(svrIntf: IResultSet);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TResultSet.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TResultSet.GetDefaultInterface: IResultSet;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TResultSet.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TResultSetProperties.Create(Self);
{$ENDIF}
end;

destructor TResultSet.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TResultSet.GetServerProperties: TResultSetProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TResultSet.Get_QHandle: WideString;
begin
  Result := DefaultInterface.QHandle;
end;

procedure TResultSet.Set_QHandle(const Value: WideString);
begin
  DefaultInterface.QHandle := Value;
end;

function  TResultSet.Execute: WordBool;
begin
  DefaultInterface.Execute(EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

function  TResultSet.Execute(Param0: OleVariant): WordBool;
begin
  DefaultInterface.Execute(Param0, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

function  TResultSet.Execute(Param0: OleVariant; Param1: OleVariant): WordBool;
begin
  DefaultInterface.Execute(Param0, Param1, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

function  TResultSet.Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant): WordBool;
begin
  DefaultInterface.Execute(Param0, Param1, Param2, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam);
end;

function  TResultSet.Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant): WordBool;
begin
  DefaultInterface.Execute(Param0, Param1, Param2, Param3, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam);
end;

function  TResultSet.Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant): WordBool;
begin
  DefaultInterface.Execute(Param0, Param1, Param2, Param3, Param4, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam);
end;

function  TResultSet.Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant; Param5: OleVariant): WordBool;
begin
  DefaultInterface.Execute(Param0, Param1, Param2, Param3, Param4, Param5, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam);
end;

function  TResultSet.Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                             Param6: OleVariant): WordBool;
begin
  DefaultInterface.Execute(Param0, Param1, Param2, Param3, Param4, Param5, Param6, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam);
end;

function  TResultSet.Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                             Param6: OleVariant; Param7: OleVariant): WordBool;
begin
  DefaultInterface.Execute(Param0, Param1, Param2, Param3, Param4, Param5, Param6, Param7, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam);
end;

function  TResultSet.Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                             Param6: OleVariant; Param7: OleVariant; Param8: OleVariant): WordBool;
begin
  DefaultInterface.Execute(Param0, Param1, Param2, Param3, Param4, Param5, Param6, Param7, Param8, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam);
end;

function  TResultSet.Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                             Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                             Param9: OleVariant): WordBool;
begin
  DefaultInterface.Execute(Param0, Param1, Param2, Param3, Param4, Param5, Param6, Param7, Param8, 
                           Param9, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam);
end;

function  TResultSet.Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                             Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                             Param9: OleVariant; Param10: OleVariant): WordBool;
begin
  DefaultInterface.Execute(Param0, Param1, Param2, Param3, Param4, Param5, Param6, Param7, Param8, 
                           Param9, Param10, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam);
end;

function  TResultSet.Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                             Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                             Param9: OleVariant; Param10: OleVariant; Param11: OleVariant): WordBool;
begin
  DefaultInterface.Execute(Param0, Param1, Param2, Param3, Param4, Param5, Param6, Param7, Param8, 
                           Param9, Param10, Param11, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

function  TResultSet.Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                             Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                             Param9: OleVariant; Param10: OleVariant; Param11: OleVariant; 
                             Param12: OleVariant): WordBool;
begin
  DefaultInterface.Execute(Param0, Param1, Param2, Param3, Param4, Param5, Param6, Param7, Param8, 
                           Param9, Param10, Param11, Param12, EmptyParam, EmptyParam, EmptyParam);
end;

function  TResultSet.Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                             Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                             Param9: OleVariant; Param10: OleVariant; Param11: OleVariant; 
                             Param12: OleVariant; Param13: OleVariant): WordBool;
begin
  DefaultInterface.Execute(Param0, Param1, Param2, Param3, Param4, Param5, Param6, Param7, Param8, 
                           Param9, Param10, Param11, Param12, Param13, EmptyParam, EmptyParam);
end;

function  TResultSet.Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                             Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                             Param9: OleVariant; Param10: OleVariant; Param11: OleVariant; 
                             Param12: OleVariant; Param13: OleVariant; Param14: OleVariant): WordBool;
begin
  DefaultInterface.Execute(Param0, Param1, Param2, Param3, Param4, Param5, Param6, Param7, Param8, 
                           Param9, Param10, Param11, Param12, Param13, Param14, EmptyParam);
end;

function  TResultSet.Execute(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                             Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                             Param9: OleVariant; Param10: OleVariant; Param11: OleVariant; 
                             Param12: OleVariant; Param13: OleVariant; Param14: OleVariant; 
                             Param15: OleVariant): WordBool;
begin
  DefaultInterface.Execute(Param0, Param1, Param2, Param3, Param4, Param5, Param6, Param7, Param8, 
                           Param9, Param10, Param11, Param12, Param13, Param14, Param15);
end;

function  TResultSet.Next: WordBool;
begin
  DefaultInterface.Next;
end;

function  TResultSet.GetColumnCount: Smallint;
begin
  DefaultInterface.GetColumnCount;
end;

function  TResultSet.GetData(ColumnNo: Smallint): OleVariant;
begin
  DefaultInterface.GetData(ColumnNo);
end;

function  TResultSet.Close: WordBool;
begin
  DefaultInterface.Close;
end;

function  TResultSet.GetColumnName(ColumnNo: Smallint): WideString;
begin
  DefaultInterface.GetColumnName(ColumnNo);
end;

function  TResultSet.GetParamCount: Smallint;
begin
  DefaultInterface.GetParamCount;
end;

function  TResultSet.GetParamName(ParamNo: Smallint): WideString;
begin
  DefaultInterface.GetParamName(ParamNo);
end;

function  TResultSet.GetColumnHeader(ColumnNo: Smallint): WideString;
begin
  DefaultInterface.GetColumnHeader(ColumnNo);
end;

function  TResultSet.GetDataByName(const ColumnName: WideString): OleVariant;
begin
  DefaultInterface.GetDataByName(ColumnName);
end;

function  TResultSet.ContainsID: Smallint;
begin
  DefaultInterface.ContainsID;
end;

procedure TResultSet.SetParam(Index: Smallint; Value: OleVariant);
begin
  DefaultInterface.SetParam(Index, Value);
end;

procedure TResultSet.Prepare;
begin
  DefaultInterface.Prepare(EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TResultSet.Prepare(Param0: OleVariant);
begin
  DefaultInterface.Prepare(Param0, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TResultSet.Prepare(Param0: OleVariant; Param1: OleVariant);
begin
  DefaultInterface.Prepare(Param0, Param1, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TResultSet.Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant);
begin
  DefaultInterface.Prepare(Param0, Param1, Param2, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam);
end;

procedure TResultSet.Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant);
begin
  DefaultInterface.Prepare(Param0, Param1, Param2, Param3, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam);
end;

procedure TResultSet.Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant);
begin
  DefaultInterface.Prepare(Param0, Param1, Param2, Param3, Param4, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam);
end;

procedure TResultSet.Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant; Param5: OleVariant);
begin
  DefaultInterface.Prepare(Param0, Param1, Param2, Param3, Param4, Param5, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam);
end;

procedure TResultSet.Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                             Param6: OleVariant);
begin
  DefaultInterface.Prepare(Param0, Param1, Param2, Param3, Param4, Param5, Param6, EmptyParam, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam);
end;

procedure TResultSet.Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                             Param6: OleVariant; Param7: OleVariant);
begin
  DefaultInterface.Prepare(Param0, Param1, Param2, Param3, Param4, Param5, Param6, Param7, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam, EmptyParam);
end;

procedure TResultSet.Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                             Param6: OleVariant; Param7: OleVariant; Param8: OleVariant);
begin
  DefaultInterface.Prepare(Param0, Param1, Param2, Param3, Param4, Param5, Param6, Param7, Param8, 
                           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam);
end;

procedure TResultSet.Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                             Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                             Param9: OleVariant);
begin
  DefaultInterface.Prepare(Param0, Param1, Param2, Param3, Param4, Param5, Param6, Param7, Param8, 
                           Param9, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam);
end;

procedure TResultSet.Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                             Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                             Param9: OleVariant; Param10: OleVariant);
begin
  DefaultInterface.Prepare(Param0, Param1, Param2, Param3, Param4, Param5, Param6, Param7, Param8, 
                           Param9, Param10, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                           EmptyParam);
end;

procedure TResultSet.Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                             Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                             Param9: OleVariant; Param10: OleVariant; Param11: OleVariant);
begin
  DefaultInterface.Prepare(Param0, Param1, Param2, Param3, Param4, Param5, Param6, Param7, Param8, 
                           Param9, Param10, Param11, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TResultSet.Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                             Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                             Param9: OleVariant; Param10: OleVariant; Param11: OleVariant; 
                             Param12: OleVariant);
begin
  DefaultInterface.Prepare(Param0, Param1, Param2, Param3, Param4, Param5, Param6, Param7, Param8, 
                           Param9, Param10, Param11, Param12, EmptyParam, EmptyParam, EmptyParam);
end;

procedure TResultSet.Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                             Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                             Param9: OleVariant; Param10: OleVariant; Param11: OleVariant; 
                             Param12: OleVariant; Param13: OleVariant);
begin
  DefaultInterface.Prepare(Param0, Param1, Param2, Param3, Param4, Param5, Param6, Param7, Param8, 
                           Param9, Param10, Param11, Param12, Param13, EmptyParam, EmptyParam);
end;

procedure TResultSet.Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                             Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                             Param9: OleVariant; Param10: OleVariant; Param11: OleVariant; 
                             Param12: OleVariant; Param13: OleVariant; Param14: OleVariant);
begin
  DefaultInterface.Prepare(Param0, Param1, Param2, Param3, Param4, Param5, Param6, Param7, Param8, 
                           Param9, Param10, Param11, Param12, Param13, Param14, EmptyParam);
end;

procedure TResultSet.Prepare(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                             Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                             Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                             Param9: OleVariant; Param10: OleVariant; Param11: OleVariant; 
                             Param12: OleVariant; Param13: OleVariant; Param14: OleVariant; 
                             Param15: OleVariant);
begin
  DefaultInterface.Prepare(Param0, Param1, Param2, Param3, Param4, Param5, Param6, Param7, Param8, 
                           Param9, Param10, Param11, Param12, Param13, Param14, Param15);
end;

function  TResultSet.Get(const ColumnName: WideString): OleVariant;
begin
  DefaultInterface.Get(ColumnName);
end;

function  TResultSet.IsDataNull(ColumnNo: Smallint): WordBool;
begin
  DefaultInterface.IsDataNull(ColumnNo);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TResultSetProperties.Create(AServer: TResultSet);
begin
  inherited Create;
  FServer := AServer;
end;

function TResultSetProperties.GetDefaultInterface: IResultSet;
begin
  Result := FServer.DefaultInterface;
end;

function TResultSetProperties.Get_QHandle: WideString;
begin
  Result := DefaultInterface.QHandle;
end;

procedure TResultSetProperties.Set_QHandle(const Value: WideString);
begin
  DefaultInterface.QHandle := Value;
end;

{$ENDIF}

class function CoBinaryStream.Create: IBinaryStream;
begin
  Result := CreateComObject(CLASS_BinaryStream) as IBinaryStream;
end;

class function CoBinaryStream.CreateRemote(const MachineName: string): IBinaryStream;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BinaryStream) as IBinaryStream;
end;

procedure TBinaryStream.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{16A9F464-9B4B-11D2-B639-0000F87C2780}';
    IntfIID:   '{16A9F463-9B4B-11D2-B639-0000F87C2780}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TBinaryStream.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IBinaryStream;
  end;
end;

procedure TBinaryStream.ConnectTo(svrIntf: IBinaryStream);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TBinaryStream.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TBinaryStream.GetDefaultInterface: IBinaryStream;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TBinaryStream.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TBinaryStreamProperties.Create(Self);
{$ENDIF}
end;

destructor TBinaryStream.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TBinaryStream.GetServerProperties: TBinaryStreamProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TBinaryStream.Get_Data: OleVariant;
begin
  Result := DefaultInterface.Data;
end;

procedure TBinaryStream.Set_Data(Value: OleVariant);
begin
  DefaultInterface.Data := Value;
end;

function TBinaryStream.Get_oref: Integer;
begin
  Result := DefaultInterface.oref;
end;

procedure TBinaryStream.Set_oref(Value: Integer);
begin
  DefaultInterface.oref := Value;
end;

function TBinaryStream.Get__oref: Integer;
begin
  Result := DefaultInterface._oref;
end;

procedure TBinaryStream.Set__oref(Value: Integer);
begin
  DefaultInterface._oref := Value;
end;

function  TBinaryStream.FileRead(const FileName: WideString): WordBool;
begin
  DefaultInterface.FileRead(FileName);
end;

function  TBinaryStream.FileWrite(const FileName: WideString): WordBool;
begin
  DefaultInterface.FileWrite(FileName);
end;

function  TBinaryStream.GetPicture: IPictureDisp;
begin
  DefaultInterface.GetPicture;
end;

procedure TBinaryStream.SetPicture(const newValue: IPictureDisp);
begin
  DefaultInterface.SetPicture(newValue);
end;

function  TBinaryStream.Read(size: Smallint): WideString;
begin
  DefaultInterface.Read(size);
end;

function  TBinaryStream.Rewind: WordBool;
begin
  DefaultInterface.Rewind;
end;

function  TBinaryStream.Write(var Value: WideString): WordBool;
begin
  DefaultInterface.Write(Value);
end;

procedure TBinaryStream.Clear;
begin
  DefaultInterface.Clear;
end;

function  TBinaryStream.GetAttribute(const Name: WideString; const Default: WideString): WideString;
begin
  DefaultInterface.GetAttribute(Name, Default);
end;

procedure TBinaryStream.SetAttribute(const Name: WideString; const Value: WideString);
begin
  DefaultInterface.SetAttribute(Name, Value);
end;

function  TBinaryStream.IsDefinedAttribute(const Name: WideString): WordBool;
begin
  DefaultInterface.IsDefinedAttribute(Name);
end;

function  TBinaryStream.NextAttribute(const Name: WideString): WideString;
begin
  DefaultInterface.NextAttribute(Name);
end;

function  TBinaryStream.DeleteAttribute(const Name: WideString): WordBool;
begin
  DefaultInterface.DeleteAttribute(Name);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TBinaryStreamProperties.Create(AServer: TBinaryStream);
begin
  inherited Create;
  FServer := AServer;
end;

function TBinaryStreamProperties.GetDefaultInterface: IBinaryStream;
begin
  Result := FServer.DefaultInterface;
end;

function TBinaryStreamProperties.Get_Data: OleVariant;
begin
  Result := DefaultInterface.Data;
end;

procedure TBinaryStreamProperties.Set_Data(Value: OleVariant);
begin
  DefaultInterface.Data := Value;
end;

function TBinaryStreamProperties.Get_oref: Integer;
begin
  Result := DefaultInterface.oref;
end;

procedure TBinaryStreamProperties.Set_oref(Value: Integer);
begin
  DefaultInterface.oref := Value;
end;

function TBinaryStreamProperties.Get__oref: Integer;
begin
  Result := DefaultInterface._oref;
end;

procedure TBinaryStreamProperties.Set__oref(Value: Integer);
begin
  DefaultInterface._oref := Value;
end;

{$ENDIF}

class function CoCharStream.Create: ICharStream;
begin
  Result := CreateComObject(CLASS_CharStream) as ICharStream;
end;

class function CoCharStream.CreateRemote(const MachineName: string): ICharStream;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CharStream) as ICharStream;
end;

procedure TCharStream.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{16A9F467-9B4B-11D2-B639-0000F87C2780}';
    IntfIID:   '{16A9F466-9B4B-11D2-B639-0000F87C2780}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TCharStream.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ICharStream;
  end;
end;

procedure TCharStream.ConnectTo(svrIntf: ICharStream);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TCharStream.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TCharStream.GetDefaultInterface: ICharStream;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TCharStream.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TCharStreamProperties.Create(Self);
{$ENDIF}
end;

destructor TCharStream.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TCharStream.GetServerProperties: TCharStreamProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TCharStream.Get_Data: OleVariant;
begin
  Result := DefaultInterface.Data;
end;

procedure TCharStream.Set_Data(Value: OleVariant);
begin
  DefaultInterface.Data := Value;
end;

function TCharStream.Get_oref: Integer;
begin
  Result := DefaultInterface.oref;
end;

procedure TCharStream.Set_oref(Value: Integer);
begin
  DefaultInterface.oref := Value;
end;

function TCharStream.Get__oref: Integer;
begin
  Result := DefaultInterface._oref;
end;

procedure TCharStream.Set__oref(Value: Integer);
begin
  DefaultInterface._oref := Value;
end;

function  TCharStream.FileRead(const FileName: WideString): WordBool;
begin
  DefaultInterface.FileRead(FileName);
end;

function  TCharStream.FileWrite(const FileName: WideString): WordBool;
begin
  DefaultInterface.FileWrite(FileName);
end;

function  TCharStream.Read(size: Smallint): WideString;
begin
  DefaultInterface.Read(size);
end;

function  TCharStream.Write(const Value: WideString): WordBool;
begin
  DefaultInterface.Write(Value);
end;

function  TCharStream.Rewind: WordBool;
begin
  DefaultInterface.Rewind;
end;

procedure TCharStream.Clear;
begin
  DefaultInterface.Clear;
end;

function  TCharStream.GetAttribute(const Name: WideString; const Default: WideString): WideString;
begin
  DefaultInterface.GetAttribute(Name, Default);
end;

procedure TCharStream.SetAttribute(const Name: WideString; const Value: WideString);
begin
  DefaultInterface.SetAttribute(Name, Value);
end;

function  TCharStream.IsDefinedAttribute(const Name: WideString): WordBool;
begin
  DefaultInterface.IsDefinedAttribute(Name);
end;

function  TCharStream.NextAttribute(const Name: WideString): WideString;
begin
  DefaultInterface.NextAttribute(Name);
end;

function  TCharStream.DeleteAttribute(const Name: WideString): WordBool;
begin
  DefaultInterface.DeleteAttribute(Name);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TCharStreamProperties.Create(AServer: TCharStream);
begin
  inherited Create;
  FServer := AServer;
end;

function TCharStreamProperties.GetDefaultInterface: ICharStream;
begin
  Result := FServer.DefaultInterface;
end;

function TCharStreamProperties.Get_Data: OleVariant;
begin
  Result := DefaultInterface.Data;
end;

procedure TCharStreamProperties.Set_Data(Value: OleVariant);
begin
  DefaultInterface.Data := Value;
end;

function TCharStreamProperties.Get_oref: Integer;
begin
  Result := DefaultInterface.oref;
end;

procedure TCharStreamProperties.Set_oref(Value: Integer);
begin
  DefaultInterface.oref := Value;
end;

function TCharStreamProperties.Get__oref: Integer;
begin
  Result := DefaultInterface._oref;
end;

procedure TCharStreamProperties.Set__oref(Value: Integer);
begin
  DefaultInterface._oref := Value;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TFactory, Tsyslist, TObjInstance, TResultSet, 
    TBinaryStream, TCharStream]);
end;

end.
