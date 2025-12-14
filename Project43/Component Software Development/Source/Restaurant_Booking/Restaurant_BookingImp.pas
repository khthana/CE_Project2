unit Restaurant_BookingImp;

interface

uses
  ActiveX, MtsObj, ComObj, Restaurant_BookingPrj_TLB, StdVcl, SysUtils,
  ADODB_TLB, COMSVCSLib_TLB, Dialogs, Windows, MSSQL2K_RestaurantPrj_TLB,
  RestaurantPrj_TLB, CreateRS_TLB;

type
  TRestaurant_Booking = class(TMtsAutoObject, IRestaurant_Booking, IObjectControl)
  protected
    function Cancel(const BookingID: WideString): WideString; safecall;
    function Confirm(const BookingID: WideString): WideString; safecall;
    function Create(const RestaurantID: WideString; Meal: SYSINT;
      ReserveDate: TDateTime; NoOfReserveSeat: SYSINT;
      const BookingID: WideString): WideString; safecall;
    function getAgencyID(const BookingID: WideString): WideString; safecall;
    function getConfirmation(const BookingID: WideString): SYSINT; safecall;
    function getMeal(const subBookingID: WideString): SYSINT; safecall;
    function getNoOfReserveSeat(const subBookingID: WideString): SYSINT; safecall;
    function getReserveDate(const subBookingID: WideString): TDateTime; safecall;
    function getRestaurantID(const subBookingID: WideString): WideString;
      safecall;
    function Modify(const BookingID, subBooking, RestaurantID: WideString;
      Meal: SYSINT; ReserveDate: TDateTime;
      NoOfReserveSeat: SYSINT): WideString; safecall;
    { Protected declarations }
    
    // IObjectControl Methods Definition
    function Activate: HRESULT; stdcall;
    function CanBePooled: Longint; stdcall;
    procedure Deactivate; stdcall;
    function CreateReserve(rsReserve: OleVariant;
      out strResult: WideString): OleVariant; safecall;
    function getSubBookingID(const BookingID: WideString): OleVariant;
      safecall;
    function viewBooking(const BookingID: WideString): OleVariant; safecall;

    private
      objctx : ObjectContext;
      
  end;

implementation

uses ComServ;

////////////////// IObjectControl Methods Implementation ///////////////////////

function TRestaurant_Booking.Activate: HRESULT;
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

function TRestaurant_Booking.CanBePooled: Longint;
begin
  Result := 1;
end;

procedure TRestaurant_Booking.Deactivate;
begin
  objctx := nil;
end;

///////////// TRestaurant_Booking Methods Implementation ///////////////////////

function TRestaurant_Booking.Cancel(
  const BookingID: WideString): WideString;
var
  mssql: IMSSQL2K_Restaurant;
  sSQL: WideString;
  confirmation: SYSINT;
begin
  confirmation:=getConfirmation(BookingID);
  mssql:= CoMSSQL2K_Restaurant.Create;
  //sSQL:= 'update BOOKING set CONFIRMATION = 2 where BOOKINGID ='''+ BookingID+'''';
  sSQL:= 'delete from BOOKING where BOOKINGID ='''+BookingID+'''';

  try
    if confirmation=0 then
    begin
      mssql.ExecSQL(sSQL);
      Result:= 'Cancel OK';
    end else
    if confirmation=1 then Result:='Already confirm' else
    if confirmation=2 then Result:='Already cancel';
    objctx.SetComplete;
  except
    Result:='Error';
    objctx.SetAbort;
  end;
end;

function TRestaurant_Booking.Confirm(
  const BookingID: WideString): WideString;
var
  mssql: IMSSQL2K_Restaurant;
  sSQL: WideString;
  confirmation: SYSINT;
begin
  confirmation:= getConfirmation(BookingID);
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'update BOOKING set CONFIRMATION = 1 where BOOKINGID ='''+ BookingID+'''';

  try
    if confirmation=0 then
    begin
      mssql.ExecSQL(sSQL);
      Result:= 'Confirm OK';
    end else
    if confirmation=1 then Result:='Already confirm' else
    if confirmation=2 then Result:='Already cancel';
    objctx.SetComplete;
  except
    Result:='Error';
    objctx.SetAbort;
  end;
end;

function TRestaurant_Booking.Create(const RestaurantID: WideString;
  Meal: SYSINT; ReserveDate: TDateTime; NoOfReserveSeat: SYSINT;
  const BookingID: WideString): WideString;
var
  mssql: IMSSQL2K_Restaurant;
  sSQL: WideString;
  Guid: TGUID;
  subbookingID: WideString;
  restaurant: IRestaurant;
  totalSeat,seatReserved: SYSINT;
  v: OleVariant;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  restaurant:= CoRestaurant.Create;

  sSQL:= 'Select Sum(NO_OF_RESERVESEAT) From SUBBOOKING'+
         ' Where MEAL='+IntToStr(Meal)+' and RESERVEDATE='''+DateToStr(Date)+''''+
         ' and RESTAURANTID='''+RestaurantID+'''';

  try
  totalSeat:= restaurant.getTotalSeat(RestaurantID);

  v:= mssql.Query(sSQL);
  v.MoveFirst;
  if v.fields.item[0].value <> null then
  begin
    seatReserved:= v.fields.item[0].value;
    v.Close;
  end else
        begin
          seatReserved:= 0;
          v.Close;
        end;

  if ((seatReserved+NoOfReserveSeat)<= totalSeat)and(Meal<=4)and(Meal>0)
     and(Date>Now-1)and(NoOfReserveSeat>0) then
  begin
    CoCreateGuid(Guid);
    subbookingID:=GUIDToString(Guid);

    sSQL:= 'insert into SUBBOOKING '+
           '(SUBBOOKINGID,RESTAURANTID,NO_OF_RESERVESEAT,MEAL,RESERVEDATE,BOOKINGID)'+
           'values ('''+subbookingID+''','''+RestaurantID+''','+
           IntToStr(NoOfReserveSeat)+','+IntToStr(Meal)+','''+DateToStr(Date)+''','+
           ''''+BookingID+''')';

    mssql.ExecSQL(sSQL);
    Result:='Reserve OK';
    objctx.SetComplete;
  end else
        begin
          Result:= 'Not available seat';
          objctx.SetAbort;
        end;

  except
    Result:= 'Error';
    objctx.SetAbort;
  end;
end;

function TRestaurant_Booking.getAgencyID(
  const BookingID: WideString): WideString;
var
  mssql: IMSSQL2K_Restaurant;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'Select AGENCYID From BOOKING Where BOOKINGID = '''+ BookingID+'''';
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

function TRestaurant_Booking.getConfirmation(
  const BookingID: WideString): SYSINT;
var
  mssql: IMSSQL2K_Restaurant;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'Select CONFIRMATION From BOOKING Where BOOKINGID = '''+ BookingID+'''';
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

function TRestaurant_Booking.getMeal(const subBookingID: WideString): SYSINT;
var
  mssql: IMSSQL2K_Restaurant;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'Select MEAL From SUBBOOKING Where SUBBOOKINGID = '''+ subBookingID+'''';
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

function TRestaurant_Booking.getNoOfReserveSeat(
  const subBookingID: WideString): SYSINT;
var
  mssql: IMSSQL2K_Restaurant;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'Select NO_OF_RESERVESEAT From SUBBOOKING Where SUBBOOKINGID = '''+ subBookingID+'''';
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

function TRestaurant_Booking.getReserveDate(
  const subBookingID: WideString): TDateTime;
var
  mssql: IMSSQL2K_Restaurant;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'Select RESERVEDATE From SUBBOOKING Where SUBBOOKINGID = '''+ subBookingID+'''';
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

function TRestaurant_Booking.getRestaurantID(
  const subBookingID: WideString): WideString;
var
  mssql: IMSSQL2K_Restaurant;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'Select RESTAURANTID From SUBBOOKING Where SUBBOOKINGID = '''+ subBookingID+'''';
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

function TRestaurant_Booking.Modify(const BookingID, subBooking,
  RestaurantID: WideString; Meal: SYSINT; ReserveDate: TDateTime;
  NoOfReserveSeat: SYSINT): WideString;
var
  mssql: IMSSQL2K_Restaurant;
  sSQL: WideString;
  confirmation,totalSeat,seatReserved: SYSINT;
  restaurant: IRestaurant;
  v: OleVariant;
  addComma:Boolean;
begin
  confirmation:= getConfirmation(BookingID);
  mssql:= CoMSSQL2K_Restaurant.Create;
  restaurant:=CoRestaurant.Create;

  sSQL:= 'Select Sum(NO_OF_RESERVESEAT) From BOOKING Where ';
  
  if (Meal>0)and(Meal<=4) then
  begin
    sSQL:=sSQL+ ' MEAL='+IntToStr(Meal);
  end else
        begin
          sSQL:= sSQL+ ' MEAL='+IntToStr(getMeal(BookingID));
        end;

  if ReserveDate>Now-1 then
  begin
    sSQL:= sSQL+' and RESERVEDATE='''+DateToStr(ReserveDate)+'''';
  end else
        begin
          sSQL:= sSQL+  ' and RESERVEDATE='''+DateToStr(getReserveDate(BookingID))+'''';
        end;

  if RestaurantID<>'' then
  begin
    sSQL:= sSQL+' and RESTAURANTID='''+RestaurantID+'''';
  end else
        begin
          sSQL:= sSQL+  ' and RESTAURANTID='''+getRestaurantID(BookingID)+'''';
        end;

  sSQL:= sSQL+ ' and BOOKINGID<>'''+BookingID+'''';

  try
    if RestaurantID<>'' then
    begin
    totalSeat:= restaurant.getTotalSeat(RestaurantID);
    end else
          begin
            totalSeat:= restaurant.getTotalSeat(getRestaurantID(BookingID));
          end;

    v:= mssql.Query(sSQL);
    v.MoveFirst;
    if v.fields.item[0].value <> null then
    begin
      seatReserved:= v.fields.item[0].value;
      v.Close;
    end else
          begin
            seatReserved:= 0;
            v.Close;
          end;
          
    if confirmation=1 then Result:='Already confirm' else
    if confirmation=2 then Result:='Already cancel' else
    if (confirmation=0)and((seatReserved+NoOfReserveSeat)<= totalSeat) then
    begin
    addComma:=False;    
    sSQL:= '';
    sSQL:= 'update BOOKING set ';

    if RestaurantID<>'' then
    begin
      sSQL:= sSQL+ ' RESTAURANTID='''+RestaurantID+'''';
      addComma:=True;
    end;

    if  (Meal>0)and(Meal<=4) then
    begin
      if addComma then
      begin
        sSQL:= sSQL+ ',';
      end;
      sSQL:= sSQL+ ' MEAL= '+IntToStr(Meal);
      addComma:=True;
    end;

    if ReserveDate>Now-1 then
    begin
      if addComma then
      begin
        sSQL:= sSQL+ ',';
      end;
      sSQL:= sSQL+ ' RESERVEDATE='''+DateToStr(ReserveDate)+'''';
      addComma:=True;
    end;

    if NoOfReserveSeat>0 then
    begin
      if addComma then
      begin
        sSQL:= sSQL+ ',';
      end;
      sSQL:= sSQL+ ' NO_OF_RESERVESEAT= '+IntToStr(NoOfReserveSeat);
    end;

    sSQL:= sSQL+' where BOOKINGID ='''+ BookingID+'''';

        mssql.ExecSQL(sSQL);
        Result:='Modify OK';
      end else
      Result:='Not available seat';
    
    objctx.SetComplete;
  except
    Result:='Error';
    objctx.SetAbort;
  end;
end;

function TRestaurant_Booking.CreateReserve(rsReserve: OleVariant;
  out strResult: WideString): OleVariant;
var
  Guid: TGUID;
  bookingID, retMessage, agencyID, sSQL: WideString;
  i, j: SYSINT;
  newRecordset: _ICreateRS;
  rs: _Recordset;
  v: OleVariant;
  mssql: IMSSQL2K_Restaurant;
  
begin
  newRecordset:= CoICreateRS.Create;
   mssql:= CoMSSQL2K_Restaurant.Create;

  CoCreateGuid(Guid);
  bookingID:=GUIDToString(Guid);

  try
    i:= rsReserve.RecordCount;
    rsReserve.MoveFirst;
    rs:= newRecordset.CreateReserveRecordset();
    
    sSQL:= 'insert into BOOKING '+
           '(BOOKINGID,AGENCYID)'+
           'values ('''+bookingID+''','''+rsReserve.fields.item[4].value+''')';

    mssql.ExecSQL(sSQL);

    agencyID:= rsReserve.fields.item[4].value;

    while i>0 do
    begin
      retMessage:= Create(rsReserve.fields.item[0].value,rsReserve.fields.item[1].value,
                StrToDate(rsReserve.fields.item[2].value),rsReserve.fields.item[3].value,
                bookingID);

      if (retMessage='Not available seat')or(retMessage='Error') then
      begin
        strResult:=retMessage;
        Result:= rs;
        objctx.SetAbort;
        Exit;
      end;

      rsReserve.MoveNext;
      i:=i-1;
    end;

    v:= getSubBookingID(bookingID);
    j:= v.RecordCount;
    v.MoveFirst;
      while j>0 do
      begin
        newRecordset.AddReserveRecord(rs,bookingID,agencyID,'',0);
        v.MoveNext;
        j:=j-1;
      end;
    v.Close;

     strResult:= 'Reserve OK';
     Result:=rs;
     objctx.SetComplete;
  except
    strResult:='Error';
    Result:= rs;
    objctx.SetAbort;
  end;
end;

function TRestaurant_Booking.getSubBookingID(
  const BookingID: WideString): OleVariant;
var
  mssql: IMSSQL2K_Restaurant;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;
  sSQL:= 'Select SUBBOOKINGID From SUBBOOKING Where BOOKINGID = '''+ BookingID+'''';
  try
    v:= mssql.Query(sSQL);
    Result:= v;
  except

  end;
end;

function TRestaurant_Booking.viewBooking(
  const BookingID: WideString): OleVariant;
var
  mssql: IMSSQL2K_Restaurant;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Restaurant.Create;

    sSQL:= 'Select SUBBOOKINGID, RESTAURANTNAME, NO_OF_RESERVESEAT,MEAL, RESERVEDATE From SUBBOOKING,RESTAURANT  Where '+
           ' BOOKINGID = '''+BookingID+''''+
           ' AND SUBBOOKING.RESTAURANTID=RESTAURANT.RESTAURANTID ';
  try
    v:= mssql.Query(sSQL);
    Result:= v;
  except

  end;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TRestaurant_Booking, Class_Restaurant_Booking,
    ciMultiInstance, tmBoth);
end.
