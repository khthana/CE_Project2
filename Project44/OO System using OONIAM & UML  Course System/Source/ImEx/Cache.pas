unit Cache;

interface
uses Windows,Forms,Messages,Dialogs,CacheObject_TLB,MyUnits;

    procedure InitCache;
    function MyFactory : Factory;
    procedure DisConnect;
    function Connect(username, password, alias : string):boolean;
    function Query(classname,queryname : string) : ResultSet;
    function NewObject(classname : string) : Variant;
    function OpenObject(classname,oid : string) : Variant;

implementation

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
		else
			Application.MessageBox( 'No connection selected!', 'Error', IDOK);
	except
		mFactory := nil;
		ThaiDlg( 'Couldn''t open Cache Factory!',mtError,[mbCancel],0);
	end;
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

function Query(classname,queryname : string) : ResultSet;
begin
  Result := ResultSet( mFactory.ResultSet( classname, queryname));
end;

function NewObject(classname : string) : Variant;
begin
  Result := mFactory.New(classname,0);
end;

function OpenObject(classname,oid : string) : Variant;
begin
  Result := mFactory.OpenId(classname,oid,0);
end;

end.
