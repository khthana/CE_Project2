unit UIncBal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,USCardInterface;

type
  TIncBalfrm = class(TForm)
    Label1: TLabel;
    bal: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    bal2: TEdit;
    confirmbtn: TButton;
    cancelbtn: TButton;
    procedure FormShow(Sender: TObject);
    procedure confirmbtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cancelbtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  scard:TSCard;
  IncBalfrm: TIncBalfrm;

implementation

{$R *.dfm}

procedure TIncBalfrm.FormShow(Sender: TObject);
begin
  scard:=TSCard.Create;
  scard.Connect(1);
  bal.Caption:=scard.GetBalance;
end;

procedure TIncBalfrm.confirmbtnClick(Sender: TObject);
var newbal:longint; code:integer; tmp:longint;
begin
  val(scard.GetBalance,newbal,code);
  val(bal2.Text,tmp,code);
  scard.ChangeBalance(newbal+tmp);
  bal.Caption:=scard.GetBalance;
  bal2.Text:='';
end;

procedure TIncBalfrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  scard.disconnect;
  bal2.Text:='';
end;

procedure TIncBalfrm.cancelbtnClick(Sender: TObject);
begin
  self.Close;
end;

end.
