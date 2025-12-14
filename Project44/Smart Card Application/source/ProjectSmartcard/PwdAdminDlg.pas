unit PwdAdminDlg;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons;

type
  TAdminLoginFrm = class(TForm)
    UsernameEdit: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    PwdEdit: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AdminLoginFrm: TAdminLoginFrm;

implementation

uses ULockForm,UMain;

{$R *.dfm}

procedure TAdminLoginFrm.OKBtnClick(Sender: TObject);
begin
  if (PwdEdit.Text = 'eton') and (UsernameEdit.Text = 's1014089') then
  begin
    scard.disconnect;
    MainFrm.Close;
    PwdEdit.Clear;
    AdminLoginFrm.Close;
  end
  else
  begin
    PwdEdit.Clear;
    AdminLoginFrm.Close;
    LockForm.Show;
  end;

end;

procedure TAdminLoginFrm.CancelBtnClick(Sender: TObject);
begin
  AdminLoginFrm.Close;
end;

end.

