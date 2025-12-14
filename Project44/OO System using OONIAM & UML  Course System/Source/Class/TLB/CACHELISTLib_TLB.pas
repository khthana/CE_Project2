unit CACHELISTLib_TLB;

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
// File generated on 12/12/2001 21:21:12 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\CacheSys\Bin\CacheList.ocx (1)
// LIBID: {F4D7DECE-EB39-11D1-A333-0000F8773CDC}
// LCID: 0
// Helpfile: C:\CacheSys\Bin\CacheList.hlp
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINDOWS\System32\stdvcl40.dll)
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

uses ActiveX, Classes, Graphics, OleCtrls, OleServer, StdVCL, Variants, 
Windows;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  CACHELISTLibMajorVersion = 1;
  CACHELISTLibMinorVersion = 0;

  LIBID_CACHELISTLib: TGUID = '{F4D7DECE-EB39-11D1-A333-0000F8773CDC}';

  DIID__DCacheList: TGUID = '{F4D7DECF-EB39-11D1-A333-0000F8773CDC}';
  DIID__DCacheListEvents: TGUID = '{F4D7DED0-EB39-11D1-A333-0000F8773CDC}';
  CLASS_CacheList: TGUID = '{C76ADD35-EA7C-11D1-A332-0000F8773CDC}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _DCacheList = dispinterface;
  _DCacheListEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  CacheList = _DCacheList;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PSmallint1 = ^Smallint; {*}


// *********************************************************************//
// DispIntf:  _DCacheList
// Flags:     (4112) Hidden Dispatchable
// GUID:      {F4D7DECF-EB39-11D1-A333-0000F8773CDC}
// *********************************************************************//
  _DCacheList = dispinterface
    ['{F4D7DECF-EB39-11D1-A333-0000F8773CDC}']
    property HideId: WordBool dispid 5;
    property MinToDisplay: Smallint dispid 1;
    property Factory: IDispatch dispid 6;
    property MaxToDisplay: Integer dispid 4;
    procedure AutosizeColumnByHeader(Column: Smallint); dispid 24;
    procedure SetColumnWidth(Column: Integer; newValue: Single); dispid 13;
    property HideColumnHeaders: WordBool dispid 3;
    property Autosize: WordBool dispid 7;
    function  Connect(const Connection: WideString): WordBool; dispid 8;
    procedure Clear; dispid 9;
    function  GetSelectedIndex: Integer; dispid 11;
    property HideSelection: WordBool dispid 2;
    function  GetData(Index: Integer; Column: Smallint): WideString; dispid 10;
    procedure SetAlignment(Column: Integer; nNewValue: Integer); dispid 12;
    function  ResultSet(const ClassName: WideString; const OueryName: WideString): WordBool; dispid 14;
    function  Run(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; Param3: OleVariant; 
                  Param4: OleVariant; Param5: OleVariant; Param6: OleVariant; Param7: OleVariant; 
                  Param8: OleVariant; Param9: OleVariant): WordBool; dispid 15;
    procedure ClearData; dispid 16;
    function  GetColumnCount: Smallint; dispid 17;
    function  GetParamCount: Smallint; dispid 18;
    function  GetColumnName(ColumnNo: Smallint): WideString; dispid 19;
    function  GetParamName(ColumnNo: Smallint): WideString; dispid 20;
    procedure AutosizeColumnByData(Column: Smallint); dispid 25;
    function  GetIndexCount: Integer; dispid 22;
    function  GetDataByName(Index: Integer; const ColumnName: WideString): WideString; dispid 23;
    procedure AboutBox; dispid -552;
    function  GetColumnHeader(ColumnNo: Smallint): WideString; dispid 21;
    function  GetIdColumn: Smallint; dispid 26;
    function  DynamicSQL(const SQL_statement: WideString): WordBool; dispid 27;
    property Font: IFontDisp dispid -512;
    property BackColor: OLE_COLOR dispid -501;
    property ForeColor: OLE_COLOR dispid -513;
  end;

// *********************************************************************//
// DispIntf:  _DCacheListEvents
// Flags:     (4096) Dispatchable
// GUID:      {F4D7DED0-EB39-11D1-A333-0000F8773CDC}
// *********************************************************************//
  _DCacheListEvents = dispinterface
    ['{F4D7DED0-EB39-11D1-A333-0000F8773CDC}']
    procedure Click; dispid -600;
    procedure DblClick; dispid -601;
    procedure KeyDown(var KeyCode: Smallint; Shift: Smallint); dispid -602;
    procedure KeyUp(var KeyCode: Smallint; Shift: Smallint); dispid -604;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TCacheList
// Help String      : CacheList Control
// Default Interface: _DCacheList
// Def. Intf. DISP? : Yes
// Event   Interface: _DCacheListEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TCacheList = class(TOleControl)
  private
    FIntf: _DCacheList;
    function  GetControlInterface: _DCacheList;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Factory: IDispatch;
    procedure Set_Factory(const Value: IDispatch);
  public
    procedure AutosizeColumnByHeader(Column: Smallint);
    procedure SetColumnWidth(Column: Integer; newValue: Single);
    function  Connect(const Connection: WideString): WordBool;
    procedure Clear;
    function  GetSelectedIndex: Integer;
    function  GetData(Index: Integer; Column: Smallint): WideString;
    procedure SetAlignment(Column: Integer; nNewValue: Integer);
    function  ResultSet(const ClassName: WideString; const OueryName: WideString): WordBool;
    function  Run: WordBool; overload;
    function  Run(Param0: OleVariant): WordBool; overload;
    function  Run(Param0: OleVariant; Param1: OleVariant): WordBool; overload;
    function  Run(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant): WordBool; overload;
    function  Run(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; Param3: OleVariant): WordBool; overload;
    function  Run(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; Param3: OleVariant; 
                  Param4: OleVariant): WordBool; overload;
    function  Run(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; Param3: OleVariant; 
                  Param4: OleVariant; Param5: OleVariant): WordBool; overload;
    function  Run(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; Param3: OleVariant; 
                  Param4: OleVariant; Param5: OleVariant; Param6: OleVariant): WordBool; overload;
    function  Run(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; Param3: OleVariant; 
                  Param4: OleVariant; Param5: OleVariant; Param6: OleVariant; Param7: OleVariant): WordBool; overload;
    function  Run(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; Param3: OleVariant; 
                  Param4: OleVariant; Param5: OleVariant; Param6: OleVariant; Param7: OleVariant; 
                  Param8: OleVariant): WordBool; overload;
    function  Run(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; Param3: OleVariant; 
                  Param4: OleVariant; Param5: OleVariant; Param6: OleVariant; Param7: OleVariant; 
                  Param8: OleVariant; Param9: OleVariant): WordBool; overload;
    procedure ClearData;
    function  GetColumnCount: Smallint;
    function  GetParamCount: Smallint;
    function  GetColumnName(ColumnNo: Smallint): WideString;
    function  GetParamName(ColumnNo: Smallint): WideString;
    procedure AutosizeColumnByData(Column: Smallint);
    function  GetIndexCount: Integer;
    function  GetDataByName(Index: Integer; const ColumnName: WideString): WideString;
    procedure AboutBox;
    function  GetColumnHeader(ColumnNo: Smallint): WideString;
    function  GetIdColumn: Smallint;
    function  DynamicSQL(const SQL_statement: WideString): WordBool;
    property  ControlInterface: _DCacheList read GetControlInterface;
    property  DefaultInterface: _DCacheList read GetControlInterface;
    property Factory: IDispatch index 6 read GetIDispatchProp write SetIDispatchProp;
  published
    property  ParentColor;
    property  ParentFont;
    property  TabStop;
    property  Align;
    property  DragCursor;
    property  DragMode;
    property  ParentShowHint;
    property  PopupMenu;
    property  ShowHint;
    property  TabOrder;
    property  Visible;
    property  OnDragDrop;
    property  OnDragOver;
    property  OnEndDrag;
    property  OnEnter;
    property  OnExit;
    property  OnStartDrag;
    property  OnKeyUp;
    property  OnKeyDown;
    property  OnDblClick;
    property  OnClick;
    property HideId: WordBool index 5 read GetWordBoolProp write SetWordBoolProp stored False;
    property MinToDisplay: Smallint index 1 read GetSmallintProp write SetSmallintProp stored False;
    property MaxToDisplay: Integer index 4 read GetIntegerProp write SetIntegerProp stored False;
    property HideColumnHeaders: WordBool index 3 read GetWordBoolProp write SetWordBoolProp stored False;
    property Autosize: WordBool index 7 read GetWordBoolProp write SetWordBoolProp stored False;
    property HideSelection: WordBool index 2 read GetWordBoolProp write SetWordBoolProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property BackColor: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property ForeColor: TColor index -513 read GetTColorProp write SetTColorProp stored False;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

implementation

uses ComObj;

procedure TCacheList.InitControlData;
const
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData2 = (
    ClassID: '{C76ADD35-EA7C-11D1-A332-0000F8773CDC}';
    EventIID: '{F4D7DED0-EB39-11D1-A333-0000F8773CDC}';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004005*);
    Flags: $00000007;
    Version: 401;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TCacheList.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _DCacheList;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TCacheList.GetControlInterface: _DCacheList;
begin
  CreateControl;
  Result := FIntf;
end;

function TCacheList.Get_Factory: IDispatch;
begin
  Result := DefaultInterface.Factory;
end;

procedure TCacheList.Set_Factory(const Value: IDispatch);
begin
  DefaultInterface.Factory := Value;
end;

procedure TCacheList.AutosizeColumnByHeader(Column: Smallint);
begin
  DefaultInterface.AutosizeColumnByHeader(Column);
end;

procedure TCacheList.SetColumnWidth(Column: Integer; newValue: Single);
begin
  DefaultInterface.SetColumnWidth(Column, newValue);
end;

function  TCacheList.Connect(const Connection: WideString): WordBool;
begin
  DefaultInterface.Connect(Connection);
end;

procedure TCacheList.Clear;
begin
  DefaultInterface.Clear;
end;

function  TCacheList.GetSelectedIndex: Integer;
begin
  DefaultInterface.GetSelectedIndex;
end;

function  TCacheList.GetData(Index: Integer; Column: Smallint): WideString;
begin
  DefaultInterface.GetData(Index, Column);
end;

procedure TCacheList.SetAlignment(Column: Integer; nNewValue: Integer);
begin
  DefaultInterface.SetAlignment(Column, nNewValue);
end;

function  TCacheList.ResultSet(const ClassName: WideString; const OueryName: WideString): WordBool;
begin
  DefaultInterface.ResultSet(ClassName, OueryName);
end;

function  TCacheList.Run: WordBool;
begin
  DefaultInterface.Run(EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                       EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

function  TCacheList.Run(Param0: OleVariant): WordBool;
begin
  DefaultInterface.Run(Param0, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                       EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

function  TCacheList.Run(Param0: OleVariant; Param1: OleVariant): WordBool;
begin
  DefaultInterface.Run(Param0, Param1, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                       EmptyParam, EmptyParam, EmptyParam);
end;

function  TCacheList.Run(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant): WordBool;
begin
  DefaultInterface.Run(Param0, Param1, Param2, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 
                       EmptyParam, EmptyParam, EmptyParam);
end;

function  TCacheList.Run(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                         Param3: OleVariant): WordBool;
begin
  DefaultInterface.Run(Param0, Param1, Param2, Param3, EmptyParam, EmptyParam, EmptyParam, 
                       EmptyParam, EmptyParam, EmptyParam);
end;

function  TCacheList.Run(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                         Param3: OleVariant; Param4: OleVariant): WordBool;
begin
  DefaultInterface.Run(Param0, Param1, Param2, Param3, Param4, EmptyParam, EmptyParam, EmptyParam, 
                       EmptyParam, EmptyParam);
end;

function  TCacheList.Run(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                         Param3: OleVariant; Param4: OleVariant; Param5: OleVariant): WordBool;
begin
  DefaultInterface.Run(Param0, Param1, Param2, Param3, Param4, Param5, EmptyParam, EmptyParam, 
                       EmptyParam, EmptyParam);
end;

function  TCacheList.Run(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                         Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                         Param6: OleVariant): WordBool;
begin
  DefaultInterface.Run(Param0, Param1, Param2, Param3, Param4, Param5, Param6, EmptyParam, 
                       EmptyParam, EmptyParam);
end;

function  TCacheList.Run(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                         Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                         Param6: OleVariant; Param7: OleVariant): WordBool;
begin
  DefaultInterface.Run(Param0, Param1, Param2, Param3, Param4, Param5, Param6, Param7, EmptyParam, 
                       EmptyParam);
end;

function  TCacheList.Run(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                         Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                         Param6: OleVariant; Param7: OleVariant; Param8: OleVariant): WordBool;
begin
  DefaultInterface.Run(Param0, Param1, Param2, Param3, Param4, Param5, Param6, Param7, Param8, 
                       EmptyParam);
end;

function  TCacheList.Run(Param0: OleVariant; Param1: OleVariant; Param2: OleVariant; 
                         Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                         Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                         Param9: OleVariant): WordBool;
begin
  DefaultInterface.Run(Param0, Param1, Param2, Param3, Param4, Param5, Param6, Param7, Param8, 
                       Param9);
end;

procedure TCacheList.ClearData;
begin
  DefaultInterface.ClearData;
end;

function  TCacheList.GetColumnCount: Smallint;
begin
  DefaultInterface.GetColumnCount;
end;

function  TCacheList.GetParamCount: Smallint;
begin
  DefaultInterface.GetParamCount;
end;

function  TCacheList.GetColumnName(ColumnNo: Smallint): WideString;
begin
  DefaultInterface.GetColumnName(ColumnNo);
end;

function  TCacheList.GetParamName(ColumnNo: Smallint): WideString;
begin
  DefaultInterface.GetParamName(ColumnNo);
end;

procedure TCacheList.AutosizeColumnByData(Column: Smallint);
begin
  DefaultInterface.AutosizeColumnByData(Column);
end;

function  TCacheList.GetIndexCount: Integer;
begin
  DefaultInterface.GetIndexCount;
end;

function  TCacheList.GetDataByName(Index: Integer; const ColumnName: WideString): WideString;
begin
  DefaultInterface.GetDataByName(Index, ColumnName);
end;

procedure TCacheList.AboutBox;
begin
  DefaultInterface.AboutBox;
end;

function  TCacheList.GetColumnHeader(ColumnNo: Smallint): WideString;
begin
  DefaultInterface.GetColumnHeader(ColumnNo);
end;

function  TCacheList.GetIdColumn: Smallint;
begin
  DefaultInterface.GetIdColumn;
end;

function  TCacheList.DynamicSQL(const SQL_statement: WideString): WordBool;
begin
  DefaultInterface.DynamicSQL(SQL_statement);
end;

procedure Register;
begin
  RegisterComponents('ActiveX',[TCacheList]);
end;

end.
