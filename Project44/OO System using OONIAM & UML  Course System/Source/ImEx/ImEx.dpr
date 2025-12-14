program ImEx;

uses
  Forms,
  main in 'main.pas' {Mainform},
  CacheObject_TLB in '..\Class\TLB\CacheObject_TLB.pas',
  constant in '..\Utilities\constant.pas',
  MyUnits in '..\Utilities\MyUnits.pas',
  ArrayOfObjects_TLB in '..\Class\TLB\ArrayOfObjects_TLB.pas',
  Cache in 'Cache.pas',
  newc in 'newc.pas' {NewClassDlg};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainform, Mainform);
  Application.Run;
end.
