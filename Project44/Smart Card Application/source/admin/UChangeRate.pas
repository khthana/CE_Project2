unit UChangeRate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TChangeRatefrm = class(TForm)
    Label1: TLabel;
    RateLabel: TLabel;
    Label3: TLabel;
    RateEdit: TEdit;
    Confirmbtn: TButton;
    Button2: TButton;
    Label2: TLabel;
    procedure ConfirmbtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChangeRatefrm: TChangeRatefrm;

implementation
uses UAdminMain;
{$R *.dfm}

procedure TChangeRatefrm.ConfirmbtnClick(Sender: TObject);
begin
  Mainfrm.RegWrite('Software\config\register\','rate',Rateedit.Text);
  RateLabel.Caption:=Mainfrm.RegRead('Software\config\register','rate');
  Rateedit.Text:='';
end;

procedure TChangeRatefrm.FormShow(Sender: TObject);
begin

   RateLabel.Caption:=Mainfrm.RegRead('Software\config\register','rate');
end;

procedure TChangeRatefrm.Button2Click(Sender: TObject);
begin
  self.Close;
  Rateedit.Text:='';
end;

procedure TChangeRatefrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   RateEdit.Text:='';
end;

end.
