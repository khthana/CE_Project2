unit UCardInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,USCardInterface, Mask;

type
  TCardInfofrm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Name: TEdit;
    Label2: TLabel;
    Surname: TEdit;
    Label3: TLabel;
    Address: TMemo;
    Label4: TLabel;
    Ext: TEdit;
    Label5: TLabel;
    Bal: TEdit;
    Label6: TLabel;
    Serial: TEdit;
    Label7: TLabel;
    Applybtn: TButton;
    Cancelbtn: TButton;
    Tel: TMaskEdit;
    DateExpire: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApplybtnClick(Sender: TObject);
    procedure CancelbtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  scard:TSCard;
  CardInfofrm: TCardInfofrm;

implementation

{$R *.dfm}

procedure TCardInfofrm.FormShow(Sender: TObject);
begin
  scard:=TSCard.Create;
  scard.Connect(1);
  if scard.CardIn and scard.Reset then
  begin
    if scard.CardValid then
    begin
      serial.Text:=scard.GetCardSerial;
      Name.Text:=scard.GetName;
      Surname.Text:=scard.GetSurname;
      Tel.Text:=scard.GetTel;
      Ext.Text:=scard.GetExt;
      bal.Text:=scard.GetBalance;
      DateExpire.Text:=scard.GetDateExpire;
      Address.Text:=scard.GetAddress;
    end;
  end
  else showmessage('Card not found');
end;

procedure TCardInfofrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  scard.disconnect;
end;

procedure TCardInfofrm.ApplybtnClick(Sender: TObject);
var balint:longint;  code:integer;
begin
  val(bal.Text,balint,code);
  scard.ChangeBalance(balint);
  scard.ChangeName(name.Text);
  scard.ChangeSurname(surname.Text);
  scard.ChangeTel(tel.Text);
  scard.ChangeExt(ext.Text);
  scard.ChangeAddress(address.Text);
  scard.ChangeDateExpire(DateExpire.Text);
  scard.ChangeCardSerial(Serial.Text);
  self.Close;
end;

procedure TCardInfofrm.CancelbtnClick(Sender: TObject);
begin
  self.Close;
end;

end.
