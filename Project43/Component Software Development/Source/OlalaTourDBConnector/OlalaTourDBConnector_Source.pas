unit OlalaTourDBConnector_Source;

interface

uses
  ActiveX, MtsObj, ComObj, OlalaTourDBConnector_TLB, StdVcl, COMSVCSLib_TLB,
  ADODB_TLB, Dialogs, Windows, SysUtils;

  const ConnectionString = 'Provider=SQLOLEDB.1;Persist Security Info=False;' +
    'User ID=sa;Initial Catalog=Olala Tour';

type
  TOlalaTourDBConnector = class(TMtsAutoObject, IOlalaTourDBConnector,
    IObjectControl)
  protected
    function ExecSQLCmd(const SQLCmd: WideString): Shortint; safecall;
    function QueryCmd(const SQLCmd: WideString): OleVariant; safecall;
    { Protected declarations }

    // IObjectControl Methods Definition
    function Activate: HRESULT; stdcall;
    function CanBePooled: Longint; stdcall;
    procedure Deactivate; stdcall;

    private
      objctx : ObjectContext;
  end;

implementation

uses ComServ;

////////////////// TOlalaTourDBConnector Methods Implementation ///////////////////////
function TOlalaTourDBConnector.Activate: HRESULT;
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
    ShowMessage('Error on TOlalaTourDBConnector.Activate');
    Result := 0;
  end;
end;

function TOlalaTourDBConnector.CanBePooled: Longint;
begin
  Result := 1;
end;

procedure TOlalaTourDBConnector.Deactivate;
begin
  objctx := nil;
end;

///////////////// TOlalaTourDBConnector Methods Implementation ///////////////////////

function TOlalaTourDBConnector.ExecSQLCmd(
  const SQLCmd: WideString): Shortint;
var
  Connection : _Connection;
  Command : _Command;
  OleVar : OleVariant;
begin
  Connection := CoConnection.Create;
  Connection.Open(ConnectionString, 'sa', '', -1);
  try
    Command := CoCommand.Create;
    Command.Set_ActiveConnection(Connection);
    Command.Set_CommandType(adCmdText);
    Command.Set_CommandText(SQLCmd);
//    ShowMessage('Before Execute');
    Command.Execute(OleVar, EmptyParam, adAsyncFetch);
//    ShowMessage('After Execute');
    objctx.SetComplete;
//    ShowMessage('SetComplete');
  except
    objctx.SetAbort;
  end;
end;

function TOlalaTourDBConnector.QueryCmd(
  const SQLCmd: WideString): OleVariant;
var
  Connection:_Connection;
  RecordSet:_Recordset;
begin
  Connection := CoConnection.Create;
  Connection.Open(ConnectionString, 'sa', '', -1);

  RecordSet := CoRecordset.Create;

  RecordSet.Open(SQLCmd, Connection, adOpenKeyset, adLockOptimistic, adCmdText);
  Result := RecordSet;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TOlalaTourDBConnector, Class_OlalaTourDBConnector,
    ciMultiInstance, tmBoth);
end.
