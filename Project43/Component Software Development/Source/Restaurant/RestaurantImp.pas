unit RestaurantImp;

interface

uses
  ActiveX, MtsObj, ComObj, RestaurantPrj_TLB, StdVcl, SysUtils,
  ADODB_TLB, COMSVCSLib_TLB, Dialogs, Windows, MSSQL2K_RestaurantPrj_TLB;

type
  TRestaurant = class(TMtsAutoObject, IRestaurant, IObjectControl)
  protected
    function findByNameDescriptionAddressStar(const name, description,
      address: WideString; star: SYSINT): OleVariant; safecall;
    function getAddress(const restaurantID: WideString): WideString; safecall;
    function getDescription(const restaurantID: WideString): WideString;
      safecall;
    function getRestaurantName(const restaurantID: WideString): WideString;
      safecall;
    function getStar(const restaurantID: WideString): SYSINT; safecall;
    function getTelephoneNo(const restaurantID: WideString): WideString;
      safecall;
    function getTotalSeat(const restaurantID: WideString): SYSINT; safecall;
    procedure setAddress(const restaurantID, newAddress: WideString); safecall;
    procedure setDescription(const restaurantID, newDescription: WideString);
      safecall;
    procedure setRestaurantName(const restaurantID, newName: WideString);
      safecall;
    procedure setStar(const restaurantID: WideString; newStar: SYSINT);
      safecall;
    procedure setTelephoneNo(const restaurantID, newTelephoneNo: WideString);
      safecall;
    procedure setTotalSeat(const restaurantID: WideString;
      newTotalSeat: SYSINT); safecall;
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

function TRestaurant.Activate: HRESULT;
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

function TRestaurant.CanBePooled: Longint;
begin
  Result := 1;
end;

procedure TRestaurant.Deactivate;
begin
  objctx := nil;
end;

///////////// TRestaurant Methods Implementation ///////////////////////////////

function TRestaurant.findByNameDescriptionAddressStar(const name,
  description, address: WideString; star: SYSINT): OleVariant;
var
  mssql: IMSSQL2K_Restaurant;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  if star<>0 then
  begin
    sSQL:= 'Select RESTAURANTID,RESTAURANTNAME,DESCRIPTION,TOTAL_SEAT,ADDRESS,STAR,TELEPHONENO From RESTAURANT Where'+
           ' RESTAURANTNAME like ''%'+name+'%'''+
           ' and DESCRIPTION like ''%'+description+'%'''+
           ' and ADDRESS like ''%'+address+'%'''+
           ' and STAR = '+IntToStr(star);
  end else
        begin
          sSQL:= 'Select RESTAURANTID,RESTAURANTNAME,DESCRIPTION,TOTAL_SEAT,ADDRESS,STAR,TELEPHONENO From RESTAURANT Where'+
                 ' RESTAURANTNAME like ''%'+name+'%'''+
                 ' and DESCRIPTION like ''%'+description+'%'''+
                 ' and ADDRESS like ''%'+address+'%''';
        end;
  try
    v:= mssql.Query(sSQL);
    Result:= v;
    //objctx.SetComplete;
  except
    //objctx.SetAbort;
  end;
end;

function TRestaurant.getAddress(
  const restaurantID: WideString): WideString;
var
  mssql: IMSSQL2K_Restaurant;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'Select ADDRESS From RESTAURANT Where RESTAURANTID = '''+ restaurantID+'''';
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

function TRestaurant.getDescription(
  const restaurantID: WideString): WideString;
var
  mssql: IMSSQL2K_Restaurant;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'Select DESCRIPTION From RESTAURANT Where RESTAURANTID = '''+ restaurantID+'''';
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

function TRestaurant.getRestaurantName(
  const restaurantID: WideString): WideString;
var
  mssql: IMSSQL2K_Restaurant;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'Select RESTAURANTNAME From RESTAURANT Where RESTAURANTID = '''+ restaurantID+'''';
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

function TRestaurant.getStar(const restaurantID: WideString): SYSINT;
var
  mssql: IMSSQL2K_Restaurant;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'Select STAR From RESTAURANT Where RESTAURANTID = '''+ restaurantID+'''';
  try
    v:= mssql.Query(sSQL);
    v.MoveFirst;
    Result:= v.fields.item[0].value;
    v.Close;
    objctx.SetComplete;
  except
    Result:= 0;
    objctx.SetAbort;
  end;
end;

function TRestaurant.getTelephoneNo(
  const restaurantID: WideString): WideString;
var
  mssql: IMSSQL2K_Restaurant;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'Select TELEPHONENO From RESTAURANT Where RESTAURANTID = '''+ restaurantID+'''';
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

function TRestaurant.getTotalSeat(const restaurantID: WideString): SYSINT;
var
  mssql: IMSSQL2K_Restaurant;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'Select TOTAL_SEAT From RESTAURANT Where RESTAURANTID = '''+ restaurantID+'''';
  try
    v:= mssql.Query(sSQL);
    v.MoveFirst;
    Result:= v.fields.item[0].value;
    v.Close;
    objctx.SetComplete;
  except
    Result:= 0;
    objctx.SetAbort;
  end;
end;

procedure TRestaurant.setAddress(const restaurantID,
  newAddress: WideString);
var
  mssql: IMSSQL2K_Restaurant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'update RESTAURANT set ADDRESS = '+newAddress+' where RESTAURANTID ='''+ restaurantID+'''';

  try
    mssql.ExecSQL(sSQL);
    objctx.SetComplete;
  except
    objctx.SetAbort;
  end;
end;

procedure TRestaurant.setDescription(const restaurantID,
  newDescription: WideString);
var
  mssql: IMSSQL2K_Restaurant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'update RESTAURANT set DESCRIPTION = '+newDescription+' where RESTAURANTID ='''+ restaurantID+'''';

  try
    mssql.ExecSQL(sSQL);
    objctx.SetComplete;
  except
    objctx.SetAbort;
  end;
end;

procedure TRestaurant.setRestaurantName(const restaurantID,
  newName: WideString);
var
  mssql: IMSSQL2K_Restaurant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'update RESTAURANT set RESTAURANTNAME = '+newName+' where RESTAURANTID ='''+ restaurantID+'''';

  try
    mssql.ExecSQL(sSQL);
    objctx.SetComplete;
  except
    objctx.SetAbort;
  end;
end;

procedure TRestaurant.setStar(const restaurantID: WideString;
  newStar: SYSINT);
var
  mssql: IMSSQL2K_Restaurant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'update RESTAURANT set STAR = '+IntToStr(newStar)+' where RESTAURANTID ='''+ restaurantID+'''';

  try
    mssql.ExecSQL(sSQL);
    objctx.SetComplete;
  except
    objctx.SetAbort;
  end;
end;

procedure TRestaurant.setTelephoneNo(const restaurantID,
  newTelephoneNo: WideString);
var
  mssql: IMSSQL2K_Restaurant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'update RESTAURANT set TELEPHONENO = '+newTelephoneNo+' where RESTAURANTID ='''+ restaurantID+'''';

  try
    mssql.ExecSQL(sSQL);
    objctx.SetComplete;
  except
    objctx.SetAbort;
  end;
end;

procedure TRestaurant.setTotalSeat(const restaurantID: WideString;
  newTotalSeat: SYSINT);
var
  mssql: IMSSQL2K_Restaurant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'update RESTAURANT set TOTAL_SEAT = '+IntToStr(newTotalSeat)+' where RESTAURANTID ='''+ restaurantID+'''';

  try
    mssql.ExecSQL(sSQL);
    objctx.SetComplete;
  except
    objctx.SetAbort;
  end;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TRestaurant, Class_Restaurant,
    ciMultiInstance, tmBoth);
end.
