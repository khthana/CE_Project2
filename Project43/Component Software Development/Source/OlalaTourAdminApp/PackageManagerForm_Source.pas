unit PackageManagerForm_Source;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, CreatePackageFrom_Source, ViewPackageIDForm_Source,
  ConfirmCancelForm_Source;

type
  TPackageManagerForm = class(TForm)
    btnViewPackage: TButton;
    btnCreatePackage: TButton;
    btnConfirmPackage: TButton;
    btnClose: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnCreatePackageClick(Sender: TObject);
    procedure btnViewPackageClick(Sender: TObject);
    procedure btnConfirmPackageClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    AdminID : WideString;
  end;

var
  PackageManagerForm: TPackageManagerForm;

implementation

{$R *.DFM}

procedure TPackageManagerForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TPackageManagerForm.btnCreatePackageClick(Sender: TObject);
begin
  frmCreatePackage.AdminID := AdminID;
  frmCreatePackage.edtAdminID.Text := AdminID;
  frmCreatePackage.ShowModal;
end;

procedure TPackageManagerForm.btnViewPackageClick(Sender: TObject);
begin
  frmViewPackageID.ShowModal;
end;

procedure TPackageManagerForm.btnConfirmPackageClick(Sender: TObject);
begin
  frmConfirmCancel.ShowModal;
end;

end.
