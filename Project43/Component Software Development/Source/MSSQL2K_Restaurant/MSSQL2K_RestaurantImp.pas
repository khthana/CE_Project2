unit MSSQL2K_RestaurantImp;

interface

uses
  ActiveX, MtsObj, ComObj, MSSQL2K_RestaurantPrj_TLB, StdVcl,
  ADODB_TLB, COMSVCSLib_TLB, SysUtils, Dialogs, Windows;

const
  ConnectionString =
        'Provider=SQLOLEDB.1;Persist Security Info=False;'+
        'User ID=sa;Initial Catalog=Restaurant;Data Source=SUMMERSERVER';

type
  TMSSQL2K_Restaurant = class(TMtsAutoObject, IMSSQL2K_Restaurant,IObjectControl)
  protected
    function Query(const sSQL: WideString): OleVariant; safecall;
    procedure ExecSQL(const sSQL: WideString); safecall;
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

////////////////// IObjectControl Methods Implementation ///////////////////////

function TMSSQL2K_Restaurant.Activate: HRESULT;
var
  imtx : IMTxAS;
begin
  try
    imtx := CoAppServer.Create;
    objctx := imtx.GetObjectContext;
    if objctx = nil then
    begin
      Result := 0;
    end
    else
      Result := S_OK;
  except
    Result := 0;
  end;
end;

function TMSSQL2K_Restaurant.CanBePooled: Longint;
begin
  Result := 1;
end;

procedure TMSSQL2K_Restaurant.Deactivate;
begin
  objctx := nil;
end;

///////////// TMSSQL2K_Restaurant Methods Implementation ///////////////////////

function TMSSQL2K_Restaurant.Query(const sSQL: WideString): OleVariant;
var
  con:_Connection;
  rs:_Recordset;
begin
  Con:=CoConnection.Create;
  Con.Open(ConnectionString,'sa','',-1);

  rs:=CoRecordset.Create;

  rs.Open(sSQL,Con,adOpenKeyset,adLockOptimistic,adCmdText);
  Result:=rs;
end;

procedure TMSSQL2K_Restaurant.ExecSQL(const sSQL: WideString);
var
  con:_Connection;
  cmd:_Command;
  v:OleVariant;
begin
  con:=CoConnection.Create;
  con.Open(ConnectionString,'sa','',-1);

  cmd:=CoCommand.Create;
  cmd.Set_ActiveConnection(con);
  cmd.Set_CommandType(adCmdText);
  cmd.Set_CommandText(sSQL);

  try
    cmd.Execute(v,EmptyParam,adAsyncFetch);
    objctx.SetComplete;
  except
    objctx.SetAbort;
  end;
  
end;

initialization
  TAutoObjectFactory.Create(ComServer, TMSSQL2K_Restaurant, Class_MSSQL2K_Restaurant,
    ciMultiInstance, tmBoth);
end.
