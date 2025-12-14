unit splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls;

type
  TfrmSplash = class(TForm)
    Timer: TTimer;
    Panel1: TPanel;
    Image1: TImage;
    Memo1: TMemo;
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

procedure TfrmSplash.TimerTimer(Sender: TObject);
begin
  Self.Close;
  Self.Free;
end;

end.
