unit LoginForm_Source;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, UserSystem_TLB;

type
  TLoginForm = class(TForm)
    EdtLoginName: TEdit;
    BtnLogin: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtPassword: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtnLoginClick(Sender: TObject);
  private
    // Private Fields
    AdminManager : IAdminManager;

  public
    AdminID : WideString;
    { Public declarations }
  end;

var
  LoginForm: TLoginForm;

implementation

{$R *.DFM}

procedure TLoginForm.FormCreate(Sender: TObject);
begin
  AdminManager := CoAdminManager.Create;
end;

procedure TLoginForm.BtnLoginClick(Sender: TObject);
var
  AuthenticateResult :WideString;
begin
  AuthenticateResult := AdminManager.Authenticate(EdtLoginName.Text,
    EdtPassword.Text);
  if AuthenticateResult<>'' then
  begin
    AdminID := AuthenticateResult;
    close;
    ShowMessage('Login Complete');
  end
  else begin
    ShowMessage('Incorrect LoginName or Password !!');
    EdtLoginName.Text := '';
    EdtPassword.Text := '';
  end;
end;

end.
