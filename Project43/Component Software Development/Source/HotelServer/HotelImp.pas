unit HotelImp;

interface

uses
  ActiveX, MtsObj, ComObj, HotelManager_TLB, StdVcl, SysUtils,
  ADODB_TLB, COMSVCSLib_TLB, Dialogs, Windows, MSSQL2K_HotelPrj_TLB;

type
  THotel = class(TMtsAutoObject, IHotel, IObjectControl)
  protected
    function findByNameDescriptionAddressStar(const name, description,
      address: WideString; star: SYSINT): OleVariant; safecall;
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

function THotel.Activate: HRESULT;
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

function THotel.CanBePooled: Longint;
begin
  Result := 1;
end;

procedure THotel.Deactivate;
begin
  objctx := nil;
end;

///////////// THotel Methods Implementation ////////////////////////////////////

function THotel.findByNameDescriptionAddressStar(const name, description,
  address: WideString; star: SYSINT): OleVariant;
var
  mssql: IMSSQL2K_Hotel;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Hotel.Create;
  if star<>0 then
  begin
    sSQL:= 'Select HOTELID,HOTELNAME,DESCRIPTION,ADDRESS,STAR,TELEPHONENO From HOTEL Where '+
           '  HOTELNAME like ''%'+name+'%'' '+
            description+
           ' and ADDRESS like ''%'+address+'%'''+
           ' and STAR = '+IntToStr(star);
  end else
        begin
          sSQL:= 'Select HOTELID,HOTELNAME,DESCRIPTION,ADDRESS,STAR,TELEPHONENO From HOTEL Where '+
                 ' HOTELNAME like ''%'+name+'%'' '+
                  description+
                 ' and ADDRESS like ''%'+address+'%''';
        end;
  try
    v:= mssql.Query(sSQL);
    Result:= v;
  except

  end;
end;

initialization
  TAutoObjectFactory.Create(ComServer, THotel, Class_Hotel,
    ciMultiInstance, tmBoth);
end.
