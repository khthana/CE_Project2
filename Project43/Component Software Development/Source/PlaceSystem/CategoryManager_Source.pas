unit CategoryManager_Source;

interface

uses
  ActiveX, MtsObj, ComObj, PlaceSystem_TLB, OlalaTourDBConnector_TLB,
    StdVcl, COMSVCSLib_TLB, ADODB_TLB, Dialogs, Windows, SysUtils,
    LogSystem_TLB;

type
  TCategoryManager = class(TMtsAutoObject, ICategoryManager, IObjectControl)
  protected
    // PlaceProperty Methods
    function Create(const Name, Description, AdminID: WideString): WideString;
      safecall;
    function QueryData(const NameKeyword,
      DescriptionKeyword: WideString): OleVariant; safecall;
    function View(const PlacePropertyID: WideString): OleVariant; safecall;
    procedure Add(const PlaceID, PlacePropertyID: WideString); safecall;
    procedure Delete(const PlacePropertyID, AdminID: WideString); safecall;
    procedure Remove(const PlaceID, PlacePropertyID: WideString); safecall;
    procedure Modify(const PlacePropertyID, Name, Description,
      AdminID: WideString); safecall;

    // IObjectControl Methods Definition
    function Activate: HRESULT; stdcall;
    function CanBePooled: Longint; stdcall;
    procedure Deactivate; stdcall;

  private
    // Private Fields
    objctx : ObjectContext;
  end;

implementation

uses ComServ;

////////////////// IObjectControl Methods Implementation ///////////////////////
function TCategoryManager.Activate: HRESULT;
var
  imtx : IMTxAS;
begin
  try
    imtx := CoAppServer.Create;
    objctx := imtx.GetObjectContext;
    if objctx = nil then
    begin
      ShowMessage('objctx = nil');
      Result := 0;
    end
    else
      Result := S_OK;
  except
    ShowMessage('Error on TMSSQL2K_OlalaTour_Connect.Activate');
    Result := 0;
  end;
end;

function TCategoryManager.CanBePooled: Longint;
begin
  Result := 1;
end;

procedure TCategoryManager.Deactivate;
begin
  objctx := nil;
end;

/////////////////// TCategoryManager Methods Implementation ////////////////////

procedure TCategoryManager.Add(const PlaceID, PlacePropertyID: WideString);
var
  dbConnector : IOlalaTourDBConnector;
  SQLCmd : WideString;
begin
  dbConnector := CoOlalaTourDBConnector_.Create;
  SQLCmd := 'INSERT INTO PlaceCategory VALUES (''' + PlaceID + ''', ''' +
    PlacePropertyID + ''')';
  try
    //ShowMessage(SQLCmd);
    dbConnector.ExecSQLCmd(SQLCmd);
    objctx.SetComplete;
    //ShowMessage('SetComplete in TCategoryManager.Add');
  except
    objctx.SetAbort;
    //ShowMessage('SetAbort in TCategoryManager.Add');
  end;
end;

function TCategoryManager.Create(const Name, Description, AdminID: WideString)
  : WideString;
var
  dbConnector : IOlalaTourDBConnector;
  SystemLog : ISystemLogManager;
  SQLCmd, StrGuid : WideString;
  Guid : TGuid;
begin
  CoCreateGuid(Guid);
  StrGuid := GUIDToString(Guid);
  dbConnector := CoOlalaTourDBConnector_.Create;
  SystemLog := CoSystemLogManager.Create;
  SQLCmd := 'INSERT INTO Category VALUES (''' + StrGuid + ''', ''' +
    Name + ''', ''' + Description + ''')';
  try
    //ShowMessage(SQLCmd);
    dbConnector.ExecSQLCmd(SQLCmd);
    //ShowMessage('AddLog');
    SystemLog.Add('Create Category :' + Name + ' ID:' + StrGuid,AdminID);
    objctx.SetComplete;
    //ShowMessage('SetComplete in TCategoryManager.Create');
  except
    objctx.SetAbort;
    //ShowMessage('SetAbort in TCategoryManager.Create');
  end;
end;

procedure TCategoryManager.Delete(const PlacePropertyID, AdminID: WideString);
var
  dbConnector : IOlalaTourDBConnector;
  SystemLog : ISystemLogManager;
  SQLCmd : WideString;
begin
  dbConnector := CoOlalaTourDBConnector_.Create;
  SystemLog := CoSystemLogManager.Create;
  SQLCmd := 'DELETE FROM Category WHERE CategoryID = ''' +
    PlacePropertyID + '''';
  try
    //ShowMessage(SQLCmd);
    dbConnector.ExecSQLCmd(SQLCmd);
    SystemLog.Add('Delete Category ID:' + PlacePropertyID, AdminID);
    objctx.SetComplete;
    //ShowMessage('SetComplete in TCategoryManager.Remove');
  except
    objctx.SetAbort;
    //ShowMessage('SetAbort in TCategoryManager.Remove');
  end;
end;

function TCategoryManager.QueryData(const NameKeyword,
  DescriptionKeyword: WideString): OleVariant;
var
  dbConnection : IOlalaTourDBConnector;
  SQLCmd, StrCond : WideString;
begin
  dbConnection := CoOlalaTourDBConnector_.Create;
  StrCond := '';
  if NameKeyword <> '' then StrCond := StrCond + ' CategoryName LIKE ''%'
    + NameKeyword + '%''';
  if DescriptionKeyword <> '' then
  begin
    if StrCond <> '' then StrCond := StrCond + ' AND ';
    StrCond := StrCond + ' Description LIKE ''%' + DescriptionKeyword + '%''';
  end;

  if StrCond <> '' then
    StrCond := ' WHERE ' + StrCond;

  //SQLCmd := 'SELECT CategoryID FROM Category WHERE ' + StrCond;
  SQLCmd := 'SELECT * FROM Category ' + StrCond;
  //ShowMessage(SQLCmd);
  Result := dbConnection.QueryCmd(SQLCmd);
end;

procedure TCategoryManager.Remove(const PlaceID,
  PlacePropertyID: WideString);
var
  dbConnector : IOlalaTourDBConnector;
  SQLCmd : WideString;
begin
  dbConnector := CoOlalaTourDBConnector_.Create;
  SQLCmd := 'DELETE FROM PlaceCategory WHERE PlaceID = ''' + PlaceID +
    ''' AND PlacePropertyID = ''' + PlacePropertyID + ''')';
  try
    //ShowMessage(SQLCmd);
    dbConnector.ExecSQLCmd(SQLCmd);
    objctx.SetComplete;
    //ShowMessage('SetComplete in TCategoryManager.Remove');
  except
    objctx.SetAbort;
    //ShowMessage('SetAbort in TCategoryManager.Remove');
  end;
end;

function TCategoryManager.View(
  const PlacePropertyID: WideString): OleVariant;
var
  dbConnector : IOlalaTourDBConnector;
  SQLCmd : WideString;
begin
  dbConnector := CoOlalaTourDBConnector_.Create;
  SQLCmd := 'SELECT * FROM Category WHERE CategoryID = ''' +
    PlacePropertyID + '''';
  //ShowMessage(SQLCmd);
  Result := dbConnector.QueryCmd(SQLCmd);
end;

procedure TCategoryManager.Modify(const PlacePropertyID, Name, Description,
      AdminID: WideString);
var
  dbConnector : IOlalaTourDBConnector;
  SystemLog : ISystemLogManager;
  SQLCmd, StrUpdate : WideString;
begin
  dbConnector := CoOlalaTourDBConnector_.Create;
  SystemLog := CoSystemLogManager.Create;
  StrUpdate := '';
  if Name <> '' then StrUpdate := StrUpdate + ' CategoryName = ''' + Name + '''';
  if Description <> '' then
  begin
    if StrUpdate <> '' then StrUpdate := StrUpdate + ',';
    StrUpdate := StrUpdate + ' Description = ''' + Description + '''';
  end;

  if StrUpdate <> '' then
  begin
    StrUpdate := ' Set ' + StrUpdate;
    SQLCmd := 'UPDATE Category' + StrUpdate +
      ' WHERE CategoryID = ''' + PlacePropertyID + '''' ;
    try
      //ShowMessage(SQLCmd);
      dbConnector.ExecSQLCmd(SQLCmd);
      SystemLog.Add('Modify Activity ID:' + PlacePropertyID,AdminID);
      objctx.SetComplete;
      //ShowMessage('SetComplete in TCategoryManager.Modify');
    except
      objctx.SetAbort;
      //ShowMessage('SetAbort in TCategoryManager.Modify');
    end;
  end;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TCategoryManager, Class_CategoryManager,
    ciMultiInstance, tmBoth);
end.
