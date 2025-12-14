unit CustomerImp;

interface

uses
  ActiveX, MtsObj, ComObj, HotelManager_TLB, StdVcl, SysUtils,
  ADODB_TLB, COMSVCSLib_TLB, Dialogs, Windows, MSSQL2K_HotelPrj_TLB;

type
  THotelCustomer = class(TMtsAutoObject, IHotelCustomer, IObjectControl)
  protected
    function createCustomer(const FirstName, LastName, address: WideString;
      gender: SYSINT; const telephoneNo: WideString): WideString; safecall;
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

function THotelCustomer.Activate: HRESULT;
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

function THotelCustomer.CanBePooled: Longint;
begin
  Result := 1;
end;

procedure THotelCustomer.Deactivate;
begin
  objctx := nil;
end;

///////////// TCustomer Methods Implementation /////////////////////////////////

function THotelCustomer.createCustomer(const FirstName, LastName,
  address: WideString; gender: SYSINT;
  const telephoneNo: WideString): WideString;
var
  mssql: IMSSQL2K_Hotel;
  sSQL: WideString;
  Guid: TGUID;
  customerID: WideString;
  v: OleVariant;
begin
  mssql:= CoMSSQL2K_Hotel.Create;

  sSQL:= 'Select CUSTOMERID From CUSTOMER'+
         ' Where FIRSTNAME='''+FirstName+''''+
         ' and LASTNAME='''+LastName+'''';

    try
    v:= mssql.Query(sSQL);
    
    if (not v.EOF)and(not v.BOF) then
     begin
       v.MoveFirst;
       Result:= v.fields.item[0].value;
     end else
           begin
              CoCreateGuid(Guid);
              customerID:=GUIDToString(Guid);

              sSQL:= 'insert into CUSTOMER '+
                     '(CUSTOMERID,FIRSTNAME,LASTNAME,ADDRESS,TELEPHONENO,GENDER)'+
                     'values ('''+customerID+''','''+FirstName+''','''+LastName+''','''+
                     Address+''','''+TelephoneNo+''','+IntToStr(Gender)+')';

              mssql.ExecSQL(sSQL);
              Result:=customerID;
           end;

    objctx.SetComplete;
    except
      Result:='Error';
      objctx.SetAbort;
    end;
end;

initialization
  TAutoObjectFactory.Create(ComServer, THotelCustomer, Class_HotelCustomer,
    ciMultiInstance, tmBoth);
end.
