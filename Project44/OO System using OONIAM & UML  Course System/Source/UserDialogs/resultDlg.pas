unit resultDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dialog, Grids, ValEdit, Buttons, ExtCtrls, StdCtrls;

type
  TResultTypeDialog = class(TEditDialog)
    vle: TValueListEditor;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ResultTypeDialog: TResultTypeDialog;

implementation

{$R *.dfm}

end.
