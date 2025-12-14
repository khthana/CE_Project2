unit UTestMD5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Umd5, StdCtrls,uscardinterface;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var Testhash:TDCP_md5;    TestOut: array[0..19] of byte;  st:string; i:integer;
    scard:tscard;   l:longint; r:real; tmp:string;
begin
  l:=12;
  r:=l/100;
  str(r:7:2,tmp);
  TestHash:= TDCP_md5.Create(nil);
  TestHash.Init;
  TestHash.UpdateStr(edit1.Text);
  TestHash.Final(TestOut);
  st:='';
  for i:=0 to 15 do
    st:=st+chr(Testout[i]);
  edit2.Text:=st;
  scard:=tscard.Create;
  scard.Connect(1);
  if scard.CardValid() then
    label1.Caption:='true'
  else label1.Caption:='false';
end;

end.
