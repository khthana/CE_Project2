unit HotelBookingImp;

interface

uses
  ActiveX, MtsObj, ComObj, HotelManager_TLB, StdVcl, SysUtils,
  ADODB_TLB, COMSVCSLib_TLB, Dialogs, Windows, MSSQL2K_HotelPrj_TLB,
  CreateRS_TLB;

type
  THotelBooking = class(TMtsAutoObject, IHotelBooking, IObjectControl)
  protected
    function Cancel(const BookingID: WideString): WideString; safecall;
    function Confirm(const BookingID: WideString): WideString; safecall;
    function Create(rsReserve: OleVariant;
      out strResult: WideString): OleVariant; safecall;
    function getBookCheckInTime(const subBookingID: WideString): TDateTime;
      safecall;
    function getBookCheckOutTime(const subBookingID: WideString): TDateTime;
      safecall;
    function getConfirmation(const BookingID: WideString): SYSINT; safecall;
    function getCustomerID(const subBookingID: WideString): WideString;
      safecall;
    function getHotelID(const subBookingID: WideString): WideString; safecall;
    function getPrice(const BookingID: WideString): Currency; safecall;
    function getRoomNo(const subBookingID: WideString): WideString; safecall;
    function getSubBookingID(const BookingID: WideString): OleVariant;
      safecall;
    function Modify(const BookingID, subBookingID: WideString; BookCheckInTime,
      BookCheckOutTime: TDateTime; const hotelID: WideString;
      PricePerDay: Currency; const description: WideString;
      NumberOfSingleBed, NumberOfCoupleBed, RoomClass, Floor: SYSINT;
      const CustomerID: WideString): WideString; safecall;
    { Protected declarations }

    // IObjectControl Methods Definition
    function Activate: HRESULT; stdcall;
    function CanBePooled: Longint; stdcall;
    procedure Deactivate; stdcall;

    function subCreate(BookCheckInTime, BookCheckOutTime: TDateTime;
      const hotelID: WideString; PricePerDay: Currency;
      const description: WideString; NumberOfSingleBed, NumberOfCoupleBed,
      RoomClass, Floor, RoomAmount: SYSINT;
      const CustomerID, inBookingID: WideString;
      out totalPrice: Currency): WideString; safecall;
    function viewBooking(const BookingID: WideString): OleVariant; safecall;

    private
      objctx : ObjectContext;

  end;

implementation

uses ComServ;

////////////////// IObjectControl Methods Implementation ///////////////////////

function THotelBooking.Activate: HRESULT;
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

function THotelBooking.CanBePooled: Longint;
begin
  Result := 1;
end;

procedure THotelBooking.Deactivate;
begin
  objctx := nil;
end;

///////////// TBooking Methods Implementation //////////////////////////////////

function THotelBooking.subCreate(BookCheckInTime, BookCheckOutTime: TDateTime;
  const hotelID: WideString; PricePerDay: Currency;
  const description: WideString; NumberOfSingleBed, NumberOfCoupleBed,
  RoomClass, Floor, RoomAmount: SYSINT;
  const CustomerID, inBookingID: WideString; out totalPrice: Currency): WideString;
var
  mssql,b1,b2,b3: IMSSQL2K_Hotel;
  sSQL: WideString;
  Guid2: TGUID;
  bookingID,subBookingID,roomNo: WideString;
  v,vBookTime,vBookBefore,vBookAfter: OleVariant;
  room,getRoomPrice: IHotelRoom;
  price: Currency;
  i,j,totalBook,bookBefore,bookAfter: SYSINT;
  roomList: array [1..10000] of WideString;
begin
  mssql:= CoMSSQL2K_Hotel.Create;
  b1:=CoMSSQL2K_Hotel.Create;
  b2:= CoMSSQL2K_Hotel.Create;
  b3:= CoMSSQL2K_Hotel.Create;
  room:= CoHotelRoom.Create;
  getRoomPrice:= CoHotelRoom.Create;
  price:=0;
  i:=0;
  j:=0;
  bookBefore:=0;
  bookAfter:=0;
  totalBook:=0;
  
  try
  v:= room.findByHotelIDPricePerDayDescriptionNumberOfSingleBedNumberOfCoupleBedRoomClassFloor(
           HotelID,PricePerDay,Description,NumberOfSingleBed,NumberOfCoupleBed,RoomClass,Floor);

  if (v.RecordCount>=RoomAmount)and(BookCheckInTime>Now-1)and(BookCheckOutTime>BookCheckInTime)
     and(BookCheckOutTime>Now-1)and(RoomAmount>0)and(v.RecordCount>0) then
  begin
    bookingID:= inBookingID;
    v.MoveFirst;

    while (i<RoomAmount)and(not v.EOF) do
    begin
      roomNo:= v.fields.item[0].value;

      sSQL:= 'select count(*) from SUBBOOKING where '+
             ' HOTELID='''+HotelID+''''+
             ' and ROOMNO='''+roomNo+'''';

      vBookTime:= b1.Query(sSQL);
      vBookTime.MoveFirst;
      totalBook:= vBookTime.fields.item[0].value;
      vBookTime.Close;

      sSQL:= 'select count(*) from SUBBOOKING where '+
             ' HOTELID='''+HotelID+''''+
             ' and ROOMNO='''+roomNo+''''+
             ' and BOOKCHECKOUTTIME<='''+DateToStr(BookCheckInTime)+'''';

      vBookBefore:= b2.Query(sSQL);
      vBookBefore.MoveFirst;
      bookBefore:= vBookBefore.fields.item[0].value;
      vBookBefore.Close;


      sSQL:= 'select count(*) from SUBBOOKING where '+
             ' HOTELID='''+HotelID+''''+
             ' and ROOMNO='''+roomNo+''''+
             ' and BOOKCHECKINTIME>='''+DateToStr(BookCheckOutTime)+'''';

      vBookAfter:= b3.Query(sSQL);
      vBookAfter.MoveFirst;
      bookAfter:= vBookAfter.fields.item[0].value;
      vBookAfter.Close;


      if totalBook=(bookBefore+bookAfter) then
      begin
        j:=j+1;
        roomList[j]:=roomNo;
        price:= price+getRoomPrice.getPricePerDay(roomNo,HotelID);
        i:=i+1;
      end;

      v.MoveNext;
    end;

    v.Close;

    if i=RoomAmount then
    begin
      j:=0;

      totalPrice:= totalPrice+ price;

      while RoomAmount>0 do
      begin
        CoCreateGuid(Guid2);
        subBookingID:=GUIDToString(Guid2);
        j:=j+1;
        roomNo:=roomList[j];

        sSQL:= 'insert into SUBBOOKING '+
               '(SUBBOOKINGID,BOOKCHECKINTIME,BOOKCHECKOUTTIME,ROOMNO,HOTELID,CUSTOMERID,BOOKINGID)'+
               'values ('''+subBookingID+''','''+DateToStr(BookCheckInTime)+''','''+DateToStr(BookCheckOutTime)+''','+
               ''''+roomNo+''','''+HotelID+''','''+CustomerID+''','''+bookingID+''')';

        mssql.ExecSQL(sSQL);
        RoomAmount:= RoomAmount-1;
      end;

      Result:='Reserve OK';
      objctx.SetComplete;
    end else
          begin
            Result:='Room not enough';
            objctx.SetAbort;
          end;
  end else
        begin
          Result:= 'Not available room';
          v.Close;
          objctx.SetAbort;
        end;

  except
    Result:= 'Error';
    objctx.SetAbort;
  end;
end;

function THotelBooking.Cancel(const BookingID: WideString): WideString;
var
  mssql: IMSSQL2K_Hotel;
  sSQL: WideString;
  confirmation: SYSINT;
begin
  confirmation:=getConfirmation(BookingID);
  mssql:= CoMSSQL2K_Hotel.Create;
  //sSQL:= 'update BOOKING set CONFIRMATION = 2 where BOOKINGID ='''+ BookingID+'''';
  sSQL:= 'delete from SUBBOOKING where BOOKINGID= '''+BookingID+'''';

  try
    if confirmation=0 then
    begin
      mssql.ExecSQL(sSQL);
      sSQL:= 'delete from BOOKING where BOOKINGID ='''+BookingID+'''';
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

function THotelBooking.Confirm(const BookingID: WideString): WideString;
var
  mssql: IMSSQL2K_Hotel;
  sSQL: WideString;
  confirmation: SYSINT;
begin
  confirmation:= getConfirmation(BookingID);
  mssql:= CoMSSQL2K_Hotel.Create;
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

function THotelBooking.Create(rsReserve: OleVariant;
  out strResult: WideString): OleVariant;
var
  Guid: TGUID;
  bookingID, sSQL, retRoomNo, retHotelID, retCustomerID: WideString;
  totalPrice, retPrice: Currency;
  i, j: SYSINT;
  newRecordset: _ICreateRS;
  rs: _Recordset;
  retMessage: WideString;
  mssql: IMSSQL2K_Hotel;
  v: OleVariant;
  getRoomPrice: IHotelRoom;
begin
  newRecordset:= CoICreateRS.Create;
  mssql:= CoMSSQL2K_Hotel.Create;
  getRoomPrice:= CoHotelRoom.Create;

  CoCreateGuid(Guid);
  bookingID:=GUIDToString(Guid);
  totalPrice:= 0;

  try
    sSQL:= 'insert into BOOKING '+
           '(BOOKINGID,PRICE)'+
           'values ('''+bookingID+''','+CurrToStr(0)+')';

    mssql.ExecSQL(sSQL);

    rs:= newRecordset.CreateReserveRecordset();

    i:= rsReserve.RecordCount;
    rsReserve.MoveFirst;
    
    while i>0 do
    begin
      retMessage:= subCreate(StrToDate(rsReserve.fields.item[0].value),StrToDate(rsReserve.fields.item[1].value),
                   rsReserve.fields.item[2].value,rsReserve.fields.item[3].value,rsReserve.fields.item[4].value,
                   rsReserve.fields.item[5].value,rsReserve.fields.item[6].value,rsReserve.fields.item[7].value,
                   rsReserve.fields.item[8].value,rsReserve.fields.item[9].value,rsReserve.fields.item[10].value,
                   bookingID,totalPrice);
      if (retMessage='Room not enough')or(retMessage='Not available room')or(retMessage='Error') then
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
        retRoomNo:= getRoomNo(v.fields.item[0].value);
        retHotelID:= getHotelID(v.fields.item[0].value);
        retCustomerID:= getCustomerID(v.fields.item[0].value);
        v.MoveNext;
        j:=j-1;
        retPrice:=getRoomPrice.getPricePerDay(retRoomNo,retHotelID);
        newRecordset.AddReserveRecord(rs,bookingID,retCustomerID,retRoomNo,retPrice);
      end;
    v.Close;

    sSQL:= 'update BOOKING set '+
           ' PRICE ='+CurrToStr(totalPrice)+
           ' where BOOKINGID ='''+ bookingID+'''';

    mssql.ExecSQL(sSQL);

     strResult:= 'Reserve OK';
     Result:=rs;
     objctx.SetComplete;
  except
    strResult:='Error';
    Result:= rs;
    objctx.SetAbort;
  end;

end;

function THotelBooking.getBookCheckInTime(
  const subBookingID: WideString): TDateTime;
var
  mssql: IMSSQL2K_Hotel;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Hotel.Create;
  sSQL:= 'Select BOOKCHECKINTIME From SUBBOOKING Where SUBBOOKINGID = '''+ subBookingID+'''';
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

function THotelBooking.getBookCheckOutTime(
  const subBookingID: WideString): TDateTime;
var
  mssql: IMSSQL2K_Hotel;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Hotel.Create;
  sSQL:= 'Select BOOKCHECKOUTTIME From SUBBOOKING Where SUBBOOKINGID = '''+ subBookingID+'''';
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

function THotelBooking.getConfirmation(
  const BookingID: WideString): SYSINT;
var
  mssql: IMSSQL2K_Hotel;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Hotel.Create;
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

function THotelBooking.getCustomerID(
  const subBookingID: WideString): WideString;
var
  mssql: IMSSQL2K_Hotel;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Hotel.Create;
  sSQL:= 'Select CUSTOMERID From SUBBOOKING Where SUBBOOKINGID = '''+ subBookingID+'''';
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

function THotelBooking.getHotelID(
  const subBookingID: WideString): WideString;
var
  mssql: IMSSQL2K_Hotel;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Hotel.Create;
  sSQL:= 'Select HOTELID From SUBBOOKING Where SUBBOOKINGID = '''+ subBookingID+'''';
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

function THotelBooking.getPrice(const BookingID: WideString): Currency;
var
  mssql: IMSSQL2K_Hotel;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Hotel.Create;
  sSQL:= 'Select PRICE From BOOKING Where BOOKINGID = '''+ BookingID+'''';
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

function THotelBooking.getRoomNo(
  const subBookingID: WideString): WideString;
var
  mssql: IMSSQL2K_Hotel;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Hotel.Create;
  sSQL:= 'Select ROOMNO From SUBBOOKING Where SUBBOOKINGID = '''+ subBookingID+'''';
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

function THotelBooking.getSubBookingID(
  const BookingID: WideString): OleVariant;
var
  mssql: IMSSQL2K_Hotel;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Hotel.Create;
  sSQL:= 'Select SUBBOOKINGID From SUBBOOKING Where BOOKINGID = '''+ BookingID+'''';
  try
    v:= mssql.Query(sSQL);
    Result:= v;
  except

  end;
end;

function THotelBooking.Modify(const BookingID, subBookingID: WideString;
  BookCheckInTime, BookCheckOutTime: TDateTime; const hotelID: WideString;
  PricePerDay: Currency; const description: WideString; NumberOfSingleBed,
  NumberOfCoupleBed, RoomClass, Floor: SYSINT;
  const CustomerID: WideString): WideString;
var
  mssql,b1,b2,b3: IMSSQL2K_Hotel;
  sSQL: WideString;
  room,getRoomInfo: IHotelRoom;
  price: Currency;
  v,vBookTime,vBookBefore,vBookAfter: OleVariant;
  confirmation: SYSINT;
  roomNo,nHotelID,nCustomerID: WideString;
  i,totalBook,bookBefore,bookAfter: SYSINT;
begin
  confirmation:= getConfirmation(BookingID);
  mssql:= CoMSSQL2K_Hotel.Create;
  b1:=CoMSSQL2K_Hotel.Create;
  b2:= CoMSSQL2K_Hotel.Create;
  b3:= CoMSSQL2K_Hotel.Create;
  room:=CoHotelRoom.Create;
  getRoomInfo:= CoHotelRoom.Create;
  i:=0;
  roomNo:= getRoomNo(subBookingID);
  nHotelID:=hotelID;
  nCustomerID:=CustomerID;
  bookBefore:=0;
  bookAfter:=0;
  totalBook:=0;
  price:=getPrice(BookingID);
  price:= price-getRoomInfo.getPricePerDay(roomNo,nHotelID);


  if BookCheckInTime<=(Now-1) then BookCheckInTime:=getBookCheckInTime(subBookingID);
  if BookCheckOutTime<=(Now-1) then BookCheckOutTime:= getBookCheckOutTime(subBookingID);
  if nHotelID='' then nHotelID:= getHotelID(subBookingID);
  if PricePerDay=0 then PricePerDay:= getRoomInfo.getPricePerDay(roomNo,nHotelID);
  if NumberOfSingleBed=-1 then NumberOfSingleBed:= getRoomInfo.getNumberOfSingleBed(roomNo,nHotelID);
  if NumberOfCoupleBed=-1 then NumberOfCoupleBed:= getRoomInfo.getNumberOfCoupleBed(roomNo,nHotelID);
  if RoomClass=0 then RoomClass:= getRoomInfo.getRoomClass(roomNo,nHotelID);
  if Floor=0 then Floor:= getRoomInfo.getFloor(roomNo,nHotelID);
  if nCustomerID='' then nCustomerID:= getCustomerID(subBookingID);

  try
  v:= room.findByHotelIDPricePerDayDescriptionNumberOfSingleBedNumberOfCoupleBedRoomClassFloor(
           nHotelID,PricePerDay,Description,NumberOfSingleBed,NumberOfCoupleBed,RoomClass,Floor);

  if confirmation=1 then Result:='Already confirm' else
  if confirmation=2 then Result:='Already cancel' else
  if (BookCheckInTime>Now-1)and(BookCheckOutTime>Now-1)and(v.RecordCount>0)
     and(confirmation=0)and(BookCheckOutTime>BookCheckInTime) then
  begin
    v.MoveFirst;

    while (i<1)and(not v.EOF) do
    begin
      roomNo:= v.fields.item[0].value;

      sSQL:= 'select count(*) from SUBBOOKING where '+
             ' HOTELID='''+nHotelID+''''+
             ' and ROOMNO='''+roomNo+''''+
             ' and SUBBOOKINGID<>'''+subBookingID+'''';

      vBookTime:= b1.Query(sSQL);
      vBookTime.MoveFirst;
      totalBook:= vBookTime.fields.item[0].value;
      vBookTime.Close;

      sSQL:= 'select count(*) from SUBBOOKING where '+
             ' HOTELID='''+nHotelID+''''+
             ' and ROOMNO='''+roomNo+''''+
             ' and BOOKCHECKOUTTIME<='''+DateToStr(BookCheckInTime)+''''+
             ' and SUBBOOKINGID<>'''+subBookingID+'''';

      vBookBefore:= b2.Query(sSQL);
      vBookBefore.MoveFirst;
      bookBefore:= vBookBefore.fields.item[0].value;
      vBookBefore.Close;


      sSQL:= 'select count(*) from SUBBOOKING where '+
             ' HOTELID='''+nHotelID+''''+
             ' and ROOMNO='''+roomNo+''''+
             ' and BOOKCHECKINTIME>='''+DateToStr(BookCheckOutTime)+''''+
             ' and SUBBOOKINGID<>'''+subBookingID+'''';

      vBookAfter:= b3.Query(sSQL);
      vBookAfter.MoveFirst;
      bookAfter:= vBookAfter.fields.item[0].value;
      vBookAfter.Close;


      if totalBook=(bookBefore+bookAfter) then
      begin
        price:= price+getRoomInfo.getPricePerDay(roomNo,nHotelID);
        i:=i+1;
      end;

      v.MoveNext;
    end;

    v.Close;

    if i=1 then
    begin
      while i>0 do
      begin
        sSQL:= 'update SUBBOOKING set '+
               ' BOOKCHECKINTIME ='''+DateToStr(BookCheckInTime)+''','+
               ' BOOKCHECKOUTTIME ='''+DateToStr(BookCheckOutTime)+''','+
               ' ROOMNO ='''+roomNo+''','+
               ' HOTELID ='''+nHotelID+''','+
               ' CUSTOMERID ='''+nCustomerID+''''+
               ' where SUBBOOKINGID ='''+ subBookingID+'''';

        mssql.ExecSQL(sSQL);
        i:= i-1;
      end;

      sSQL:= 'update BOOKING set '+
             ' PRICE ='+CurrToStr(price)+
             ' where BOOKINGID ='''+ BookingID+'''';

      mssql.ExecSQL(sSQL);

      Result:='Modify OK';
    end else
          begin
            Result:='Not available room';
          end;

  end else
        begin
          Result:= 'Not available room';
          v.Close;
        end;

    objctx.SetComplete;
  except
    Result:= 'Error';
    objctx.SetAbort;
  end;
end;

function THotelBooking.viewBooking(
  const BookingID: WideString): OleVariant;
var
  mssql: IMSSQL2K_Hotel;
  v: OleVariant;
  sSQL: WideString;
begin
  mssql:= CoMSSQL2K_Hotel.Create;

    sSQL:= 'Select SUBBOOKINGID, BOOKCHECKINTIME, BOOKCHECKOUTTIME, ROOMNO, HOTELNAME, CUSTOMERID, PRICE From '+
           ' SUBBOOKING,HOTEL,BOOKING Where '+
           ' SUBBOOKING.BOOKINGID = '''+ BookingID +''''+
           ' and subbooking.hotelid=hotel.hotelid '+
           ' AND BOOKING.BOOKINGID=  '''+ BookingID +'''';
  try
    v:= mssql.Query(sSQL);
    Result:= v;
  except

  end;
end;

initialization
  TAutoObjectFactory.Create(ComServer, THotelBooking, Class_HotelBooking,
    ciMultiInstance, tmBoth);
end.
