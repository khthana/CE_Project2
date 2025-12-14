unit MainForm_Source;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, ExtCtrls,
  LoginForm_Source, LogForm_Source, PlaceForm_Source, UserManagerForm_Source,
  PackageManagerForm_Source;


type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    Login1: TMenuItem;
    mnuActionLogIn: TMenuItem;
    N1: TMenuItem;
    mnuActionExit: TMenuItem;
    btnViewLog: TButton;
    btnPlace: TButton;
    btnUser: TButton;
    btnPackageManagement: TButton;
    procedure mnuActionLogInClick(Sender: TObject);
    procedure mnuActionExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnViewLogClick(Sender: TObject);
    procedure btnPlaceClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure btnPackageManagementClick(Sender: TObject);
  private
    // Private Fields
    AdminID : WideString;

    // Private Methods
    procedure EnableAllBtn;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.mnuActionLogInClick(Sender: TObject);
begin
  LoginForm.ShowModal;
  AdminID := LoginForm.AdminID;
  EnableAllBtn;
end;

procedure TMainForm.mnuActionExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  btnViewLog.Enabled := False;
  btnPlace.Enabled := False;
  btnUser.Enabled := False;
  btnPackageManagement.Enabled := False;
end;

procedure TMainForm.EnableAllBtn;
begin
  btnViewLog.Enabled := True;
  btnPlace.Enabled := True;
  btnUser.Enabled := True;
  btnPackageManagement.Enabled := True;
end;

procedure TMainForm.btnViewLogClick(Sender: TObject);
begin
  LogForm.ShowModal;
end;

procedure TMainForm.btnPlaceClick(Sender: TObject);
begin
  PlaceForm.AdminID := AdminID;
  PlaceForm.ShowModal;
end;

procedure TMainForm.btnUserClick(Sender: TObject);
begin
  UserManagerForm.ShowModal;
end;

procedure TMainForm.btnPackageManagementClick(Sender: TObject);
begin
  PackageManagerForm.AdminID := AdminID;
  PackageManagerForm.ShowModal;
end;

end.
