program EcgProject;

uses
  Forms,
  MainECG in 'MainECG.pas' {frmEcg},
  ShowGraph in 'ShowGraph.pas' {frmGraph};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmEcg, frmEcg);
  Application.CreateForm(TfrmGraph, frmGraph);
  Application.Run;
end.
