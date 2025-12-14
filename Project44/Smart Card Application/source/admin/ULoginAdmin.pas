unit ULoginAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TLoginfrm = class(TForm)
    pwd: TLabel;
    password: TEdit;
    okbtn: TButton;
    cancelbtn: TButton;
    Username: TEdit;
    Label1: TLabel;
    procedure okbtnClick(Sender: TObject);
    procedure cancelbtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Loginfrm: TLoginfrm;

implementation
uses UAdminMain;
{$R *.dfm}

procedure TLoginfrm.okbtnClick(Sender: TObject);
begin
  if ((Username.Text='s1014089') and (password.Text='eton')) or
     ((Username.Text='s1014097') and (password.Text='logitech')) then
  begin
    login:=true;
    Mainfrm.Caption:=Username.Text;
    Loginfrm.Close;
  end
  else
  begin
    showmessage('รหัสผ่านไม่ถูกต้อง');
    password.Text:='';
  end;


end;

procedure TLoginfrm.cancelbtnClick(Sender: TObject);
begin
  self.Close;
end;

procedure TLoginfrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    username.Text:='';
    password.Text:='';
end;

end.
