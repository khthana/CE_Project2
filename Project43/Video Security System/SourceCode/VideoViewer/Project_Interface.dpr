program Project_Interface;

uses
  Forms,
  main in 'Main.pas' {Form1},
  Unit1 in 'Unit1.pas',
  Unit2 in 'Unit2.pas',
  SaveFile in 'SaveFile.pas' {Form4},
  NewFolder in 'NewFolder.pas' {Form5};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, FormMain);
  Application.CreateForm(TForm4, FormSaveFile);
  Application.CreateForm(TForm5, FormNewFolder);
  Application.Run;
end.
