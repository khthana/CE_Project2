program Project1;

uses
  Forms,
  Histrogram in 'Histrogram.pas' {Form1},
  ShowHistrogram in 'ShowHistrogram.pas' {Form2};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
