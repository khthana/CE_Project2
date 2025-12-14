unit custom2;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, ComCtrls, QDialogs;

type
  TCustomStep1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  end;

var
  CustomStep1: TCustomStep1;

implementation

uses custom1, custom3;

{$R *.DFM}

procedure TCustomStep1.Button1Click(Sender: TObject);
begin
    if CustomStep2 = nil then
        Application.CreateForm(TCustomStep2,CustomStep2);
    CustomStep2.show;
    CustomStep1.Hide;
end;

procedure TCustomStep1.Button2Click(Sender: TObject);
begin
    if MessageDlg('ต้องการออกจากโปรแกรม ใช่หรือไม่', mtConfirmation, [mbYes, mbNo], 0) = 3 then
        CustomForm1.Close;

end;

end.
