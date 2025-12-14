unit UCardInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask;

type
  TCardInfoFrm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    NameEdit: TEdit;
    Label4: TLabel;
    TelEdit: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    SerialEdit: TEdit;
    Label5: TLabel;
    DateExpireEdit: TMaskEdit;
    OKbtn: TButton;
    SurnameEdit: TEdit;
    Label3: TLabel;
    AddressMemo: TMemo;
    Label7: TLabel;
    ExtEdit: TEdit;
    procedure OKbtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CardInfoFrm: TCardInfoFrm;

implementation
uses UMain;
{$R *.dfm}







procedure TCardInfoFrm.OKbtnClick(Sender: TObject);
begin
  SerialEdit.Text:='';
  NameEdit.Text:='';
  SurnameEdit.Text:='';
  TelEdit.Text:='';
  ExtEdit.Text:='';
  AddressMemo.Text:='';
  DateExpireEdit.Text:='';
  CardInfoFrm.Close;
end;

procedure TCardInfoFrm.FormShow(Sender: TObject);
begin
  if scard.CardIn and scard.Reset then
  begin
    cardrec.Serial:=scard.GetCardSerial;
    cardrec.Name:=scard.GetName;
    cardrec.Surname:=scard.GetSurname;
    cardrec.Tel:=scard.GetTel;
    cardrec.Ext:=scard.GetExt;
    cardrec.DateExpire:=scard.GetDateExpire;
    cardrec.Address:=scard.GetAddress;
  end;


  SerialEdit.Text:=cardrec.Serial;
  NameEdit.Text:=cardrec.Name;
  SurnameEdit.Text:=cardrec.Surname;
  TelEdit.Text:=cardrec.Tel;
  ExtEdit.Text:=cardrec.Ext;
  AddressMemo.Text:=cardrec.Address;
  DateExpireEdit.Text:=cardrec.DateExpire;

end;

end.
