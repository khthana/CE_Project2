program ScanText7;

uses
  Forms,
  ScanTextU7 in 'ScanTextU7.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
