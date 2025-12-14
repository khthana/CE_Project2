unit FoodType_Source;

interface

uses
  ActiveX, MtsObj, ComObj, UserSystem_TLB, OlalaTourDBConnector_TLB,
    StdVcl, COMSVCSLib_TLB, ADODB_TLB, Dialogs, Windows, SysUtils;

type
  TFoodType = class(TMtsAutoObject, IFoodType)
  protected
    function QueryData(const NameKeyword: WideString): OleVariant; safecall;
    function View(const FoodTypeID: WideString): OleVariant; safecall;
    { Protected declarations }

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
function TFoodType.Activate: HRESULT;
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

function TFoodType.CanBePooled: Longint;
begin
  Result := 1;
end;

procedure TFoodType.Deactivate;
begin
  objctx := nil;
end;

//////////////////////// TFoodType Methods Implementation //////////////////////

function TFoodType.QueryData(const NameKeyword: WideString): OleVariant;
var
  dbConnection : IOlalaTourDBConnector;
  SQLCmd, StrCond : WideString;
  //OleVar : OleVariant;
begin
  dbConnection := CoOlalaTourDBConnector_.Create;
  StrCond := '';
  if NameKeyword <> '' then
    StrCond := ' WHERE Name LIKE ''' + NameKeyword + '''';
  SQLCmd := 'SELECT FoodTypeID, Name FROM FoodType ' + StrCond;

  Result := dbConnection.QueryCmd(SQLCmd);
end;

function TFoodType.View(const FoodTypeID: WideString): OleVariant;
var
  dbConnection : IOlalaTourDBConnector;
  SQLCmd : WideString;
begin
  dbConnection := CoOlalaTourDBConnector_.Create;
  SQLCmd := 'SELECT * FROM FoodType WHERE FoodTypeID = ''' +
    FoodTypeID + '''';
  Result := dbConnection.QueryCmd(SQLCmd);
end;

initialization
  TAutoObjectFactory.Create(ComServer, TFoodType, Class_FoodType,
    ciMultiInstance, tmBoth);
end.
