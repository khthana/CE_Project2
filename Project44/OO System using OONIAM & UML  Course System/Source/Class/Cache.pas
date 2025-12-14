unit Cache;

interface
uses Windows,Forms,Messages,Dialogs,CacheObject_TLB,MyUnits,Variants, User_Department_TLB;

    procedure InitCache;
    procedure TerminateCache;
    function MyFactory : Factory;
    procedure DisConnect;
    function Connect(username, password, alias : string):boolean;

    function Query(classname,queryname : string) : ResultSet;
    function NewObjectI(classname : string) : IUnknown; overload;
    function NewObject(classname : string) : Variant;
    function OpenObjectI(classname,oid : string) : IUnknown; overload;
    function OpenObject(classname,oid : string) : Variant; overload;
    procedure SaveObject(var obj : Variant);
    procedure CloseObject( var obj : Variant);

implementation

uses constant;



var
    mFactory : Factory;

procedure InitCache;
var
	conn: String;
begin
	try
		mFactory := CoFactory.Create;
		conn := mFactory.ConnectDlg( Application.MainForm.Caption );
		if conn <> '' then
			mFactory.Connect( conn)
	except
		mFactory := nil;
		ThaiDlg( 'Couldn''t open Cache Factory!',mtError,[mbCancel],0);
	end;
end;

procedure TerminateCache;
begin
  if mFactory.IsConnected then mFactory.Disconnect;
end;

function MyFactory : Factory;
begin
  result := mFactory;
end;

procedure DisConnect;
begin

end;

function Connect(username, password, alias : string):boolean;
begin

end;

procedure SaveObject(var obj : Variant);
begin
  obj.SYS_Save(0);
end;

procedure CloseObject( var obj : Variant);
begin
  obj.SYS_Close;
  obj := NULL;
end;

function Query(classname,queryname : string) : ResultSet;
begin
  Result := ResultSet( mFactory.ResultSet( classname, queryname));
end;

function NewObjectI(classname : string) : IUnknown;
begin
  Result := IUnknown(mFactory.New(classname,0));
end;

function NewObject(classname : string) : Variant;
begin
  Result := mFactory.New(classname,0);
end;

function OpenObjectI(classname,oid : string) : IUnknown;
begin
  Result := IUnknown(mFactory.OpenId(classname,oid,0));
end;

function OpenObject(classname,oid : string) : Variant; overload;
begin
  Result := mFactory.OpenId(classname,oid,0);
end;

end.
