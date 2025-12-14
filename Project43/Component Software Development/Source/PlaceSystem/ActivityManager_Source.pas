unit ActivityManager_Source;

interface

uses
  ActiveX, MtsObj, ComObj, PlaceSystem_TLB, OlalaTourDBConnector_TLB,
    StdVcl, COMSVCSLib_TLB, ADODB_TLB, Dialogs, Windows, SysUtils,
    LogSystem_TLB;

type
  TActivityManager = class(TMtsAutoObject, IActivityManager, IObjectControl)
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
function TActivityManager.Activate: HRESULT;
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

function TActivityManager.CanBePooled: Longint;
begin
  Result := 1;
end;

procedure TActivityManager.Deactivate;
begin
  objctx := nil;
end;

/////////////////// TActivityManager Methods Implementation ////////////////////

procedure TActivityManager.Add(const PlaceID, PlacePropertyID: WideString);
var
  dbConnector : IOlalaTourDBConnector;
  SQLCmd : WideString;
begin
  dbConnector := CoOlalaTourDBConnector_.Create;
  SQLCmd := 'INSERT INTO PlaceActivity VALUES (''' + PlaceID + ''', ''' +
    PlacePropertyID + ''')';
  try
    //ShowMessage(SQLCmd);
    dbConnector.ExecSQLCmd(SQLCmd);
    objctx.SetComplete;
    //ShowMessage('SetComplete in TActivityManager.Add');
  except
    objctx.SetAbort;
    //ShowMessage('SetAbort in TActivityManager.Add');
  end;
end;

function TActivityManager.Create(const Name, Description, AdminID: WideString)
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
  SQLCmd := 'INSERT INTO Activity VALUES (''' + StrGuid + ''', ''' +
    Name + ''', ''' + Description + ''')';
  try
    //ShowMessage(SQLCmd);
    dbConnector.ExecSQLCmd(SQLCmd);
    //ShowMessage('AddLog');
    SystemLog.Add('Create Activity :' + Name + ' ID:' + StrGuid,AdminID);
    objctx.SetComplete;
    //ShowMessage('SetComplete in TActivityManager.Create');
  except
    objctx.SetAbort;
    //ShowMessage('SetAbort in TActivityManager.Create');
  end;
end;

procedure TActivityManager.Delete(const PlacePropertyID, AdminID: WideString);
var
  dbConnector : IOlalaTourDBConnector;
  SystemLog : ISystemLogManager;
  SQLCmd : WideString;
begin
  dbConnector := CoOlalaTourDBConnector_.Create;
  SystemLog := CoSystemLogManager.Create;
  SQLCmd := 'DELETE FROM Activity WHERE ActivityID = ''' +
    PlacePropertyID + '''';
  try
    //ShowMessage(SQLCmd);
    dbConnector.ExecSQLCmd(SQLCmd);
    SystemLog.Add('Delete Activity ID:' + PlacePropertyID, AdminID);
    objctx.SetComplete;
    //ShowMessage('SetComplete in TActivityManager.Remove');
  except
    objctx.SetAbort;
    //ShowMessage('SetAbort in TActivityManager.Remove');
  end;
end;

function TActivityManager.QueryData(const NameKeyword,
  DescriptionKeyword: WideString): OleVariant;
var
  dbConnection : IOlalaTourDBConnector;
  SQLCmd, StrCond : WideString;
begin
  dbConnection := CoOlalaTourDBConnector_.Create;
  StrCond := '';
  if NameKeyword <> '' then StrCond := StrCond + ' ActivityName LIKE ''%'
    + NameKeyword + '%''';
  if DescriptionKeyword <> '' then
  begin
    if StrCond <> '' then StrCond := StrCond + ' AND ';
    StrCond := StrCond + ' Description LIKE ''%' + DescriptionKeyword + '%''';
  end;

  if StrCond <> '' then
    StrCond := ' WHERE ' + StrCond;

  //SQLCmd := 'SELECT ActivityID FROM Activity WHERE ' + StrCond;
  SQLCmd := 'SELECT * FROM Activity ' + StrCond;
  //ShowMessage(SQLCmd);
  Result := dbConnection.QueryCmd(SQLCmd);
end;

procedure TActivityManager.Remove(const PlaceID,
  PlacePropertyID: WideString);
var
  dbConnector : IOlalaTourDBConnector;
  SQLCmd : WideString;
begin
  dbConnector := CoOlalaTourDBConnector_.Create;
  SQLCmd := 'DELETE FROM PlaceActivity WHERE PlaceID = ''' + PlaceID +
    ''' AND PlacePropertyID = ''' + PlacePropertyID + ''')';
  try
    //ShowMessage(SQLCmd);
    dbConnector.ExecSQLCmd(SQLCmd);
    objctx.SetComplete;
    //ShowMessage('SetComplete in TActivityManager.Remove');
  except
    objctx.SetAbort;
    //ShowMessage('SetAbort in TActivityManager.Remove');
  end;
end;

function TActivityManager.View(
  const PlacePropertyID: WideString): OleVariant;
var
  dbConnector : IOlalaTourDBConnector;
  SQLCmd : WideString;
begin
  dbConnector := CoOlalaTourDBConnector_.Create;
  SQLCmd := 'SELECT * FROM Activity WHERE ActivityID = ''' +
    PlacePropertyID + '''';
  //ShowMessage(SQLCmd);
  Result := dbConnector.QueryCmd(SQLCmd);
end;

procedure TActivityManager.Modify(const PlacePropertyID, Name, Description,
      AdminID: WideString);
var
  dbConnector : IOlalaTourDBConnector;
  SystemLog : ISystemLogManager;
  SQLCmd, StrUpdate : WideString;
begin
  dbConnector := CoOlalaTourDBConnector_.Create;
  SystemLog := CoSystemLogManager.Create;
  StrUpdate := '';
  if Name <> '' then StrUpdate := StrUpdate + ' ActivityName = ''' + Name + '''';
  if Description <> '' then
  begin
    if StrUpdate <> '' then StrUpdate := StrUpdate + ',';
    StrUpdate := StrUpdate + ' Description = ''' + Description + '''';
  end;

  if StrUpdate <> '' then
  begin
    StrUpdate := ' Set ' + StrUpdate;
    SQLCmd := 'UPDATE Activity' + StrUpdate +
      ' WHERE ActivityID = ''' + PlacePropertyID + '''' ;
    try
      //ShowMessage(SQLCmd);
      dbConnector.ExecSQLCmd(SQLCmd);
      SystemLog.Add('Modify Activity ID:' + PlacePropertyID,AdminID);
      objctx.SetComplete;
      //ShowMessage('SetComplete in TActivityManager.Modify');
    except
      objctx.SetAbort;
      //ShowMessage('SetAbort in TActivityManager.Modify');
    end;
  end;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TActivityManager, Class_ActivityManager,
    ciMultiInstance, tmBoth);
end.
