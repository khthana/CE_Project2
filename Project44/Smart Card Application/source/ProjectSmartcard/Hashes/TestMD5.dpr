program TestMD5;

uses
  Forms,
  UTestMD5 in 'UTestMD5.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
