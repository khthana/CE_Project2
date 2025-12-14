unit newc;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, RefComboBox;

type
  TNewClassDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    cmbClassRef: TReferenceComboBox;
    edClassName: TLabeledEdit;
    edDescription: TLabeledEdit;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewClassDlg: TNewClassDlg;

implementation

{$R *.dfm}

end.
