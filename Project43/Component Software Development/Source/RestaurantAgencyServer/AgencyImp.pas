unit AgencyImp;

interface

uses
  ActiveX, MtsObj, ComObj, AgencyPrj_TLB, StdVcl,SysUtils,
  ADODB_TLB, COMSVCSLib_TLB, Dialogs, Windows, MSSQL2K_RestaurantPrj_TLB;

type
  TRestaurantAgency = class(TMtsAutoObject, IRestaurantAgency, IObjectControl)
  protected
    function findByNameAddress(const Name, Address: WideString): OleVariant;
      safecall;
    function getAddress(const AgencyID: WideString): WideString; safecall;
    function getAgencyName(const AgencyID: WideString): WideString; safecall;
    function getTelePhoneNo(const AgencyID: WideString): WideString; safecall;
    procedure setAddress(const AgencyID, newAddress: WideString); safecall;
    procedure setAgencyName(const AgencyID, newName: WideString); safecall;
    procedure setTelephoneNo(const AgencyID, newTelephoneNo: WideString);
      safecall;
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

function TRestaurantAgency.Activate: HRESULT;
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

function TRestaurantAgency.CanBePooled: Longint;
begin
  Result := 1;
end;

procedure TRestaurantAgency.Deactivate;
begin
  objctx := nil;
end;

///////////// TAgency Methods Implementation ///////////////////////////////////


function TRestaurantAgency.findByNameAddress(const Name,
  Address: WideString): OleVariant;
var
  mssql: IMSSQL2K_Restaurant;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;


  sSQL:= 'Select AGENCYID,AGENCYNAME From AGENCY Where'+
         ' AGENCYNAME like ''%'+Name+'%'''+
         ' and ADDRESS like ''%'+Address+'%''';

  try
    v:= mssql.Query(sSQL);
    Result:= v;
  except
  
  end;
end;

function TRestaurantAgency.getAddress(const AgencyID: WideString): WideString;
var
  mssql: IMSSQL2K_Restaurant;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'Select ADDRESS From AGENCY Where AGENCYID = '''+ AgencyID+'''';
  try
    v:= mssql.Query(sSQL);
    v.MoveFirst;
    Result:= v.fields.item[0].value;
    v.Close;
    objctx.SetComplete;
  except
    Result:= 'Not Found';
    objctx.SetAbort;
  end;
end;

function TRestaurantAgency.getAgencyName(const AgencyID: WideString): WideString;
var
  mssql: IMSSQL2K_Restaurant;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'Select AGENCYNAME From AGENCY Where AGENCYID = '''+ AgencyID+'''';
  try
    v:= mssql.Query(sSQL);
    v.MoveFirst;
    Result:= v.fields.item[0].value;
    v.Close;
    objctx.SetComplete;
  except
    Result:= 'Not Found';
    objctx.SetAbort;
  end;
end;

function TRestaurantAgency.getTelePhoneNo(const AgencyID: WideString): WideString;
var
  mssql: IMSSQL2K_Restaurant;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'Select TELEPHONENO From AGENCY Where AGENCYID = '''+ AgencyID+'''';
  try
    v:= mssql.Query(sSQL);
    v.MoveFirst;
    Result:= v.fields.item[0].value;
    v.Close;
    objctx.SetComplete;
  except
    Result:= 'Not Found';
    objctx.SetAbort;
  end;
end;

procedure TRestaurantAgency.setAddress(const AgencyID, newAddress: WideString);
var
  mssql: IMSSQL2K_Restaurant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'update AGENCY set ADDRESS = '+newAddress+' where AGENCYID ='''+ AgencyID+'''';

  try
    mssql.ExecSQL(sSQL);
    objctx.SetComplete;
  except
    objctx.SetAbort;
  end;
end;

procedure TRestaurantAgency.setAgencyName(const AgencyID, newName: WideString);
var
  mssql: IMSSQL2K_Restaurant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'update AGENCY set AGENCYNAME = '+newName+' where AGENCYID ='''+ AgencyID+'''';

  try
    mssql.ExecSQL(sSQL);
    objctx.SetComplete;
  except
    objctx.SetAbort;
  end;
end;

procedure TRestaurantAgency.setTelephoneNo(const AgencyID,
  newTelephoneNo: WideString);
var
  mssql: IMSSQL2K_Restaurant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'update AGENCY set TELEPHONENO = '+newTelephoneNo+' where AGENCYID ='''+ AgencyID+'''';

  try
    mssql.ExecSQL(sSQL);
    objctx.SetComplete;
  except
    objctx.SetAbort;
  end;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TRestaurantAgency, Class_RestaurantAgency,
    ciMultiInstance, tmBoth);
end.
