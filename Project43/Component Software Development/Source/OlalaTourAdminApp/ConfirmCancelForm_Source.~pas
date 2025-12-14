unit ConfirmCancelForm_Source;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, PackageSystem_TLB;

type
  TfrmConfirmCancel = class(TForm)
    grbView: TGroupBox;
    grbConfirmCancel: TGroupBox;
    stgView: TStringGrid;
    edtPackageID: TEdit;
    btnConfirm: TButton;
    labPackageID: TLabel;
    btnCancel: TButton;
    btnClose: TButton;
    procedure FormCreate(Sender: TObject);
    procedure stgViewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCloseClick(Sender: TObject);
  private
    ConfirmCancel: _PackageManager;
    { Private declarations }
  public
    strResult : WideString;
    OleVar : OleVariant;
    TotalRow : Integer;
    { Public declarations }
    procedure UpdateGrid(StringGrid1: TStringGrid);
  end;

var
  frmConfirmCancel: TfrmConfirmCancel;

implementation

{$R *.DFM}

procedure TfrmConfirmCancel.FormCreate(Sender: TObject);
var
  strMessage: WideString;
begin
  ConfirmCancel:= CoPackageManager.Create;
  OleVar:= ConfirmCancel.ViewAllPackage(strMessage);
  UpdateGrid(stgView);
  OleVar.close;
end;

procedure TfrmConfirmCancel.UpdateGrid(StringGrid1: TStringGrid);
var
  Row, Col : Integer;
begin
  if OleVar.EOF and OleVar.BOF then
    strResult := 'Log is Empty!!'
  else begin
    OleVar.MoveFirst;

    // Get Total Row of RecordSet
    TotalRow := 0;
    while not OleVar.EOF do
    begin
      INC(TotalRow);
      OleVar.MoveNext;
    end;

    StringGrid1.ColCount := OleVar.Fields.Count;
    StringGrid1.RowCount := TotalRow + 1;

    strResult := 'Total Result :' + IntToStr(TotalRow) + ' Rows.';

    for Col := 0 to OleVar.Fields.Count - 1 do
      StringGrid1.Cells[Col, 0] := OleVar.Fields.Item[Col].Name;

    OleVar.MoveFirst;
    Row := 1;
    while not OleVar.EOF do
    begin
      for Col := 0 to OleVar.Fields.Count - 1 do
        StringGrid1.Cells[Col, Row] := VarToStr(OleVar.Fields.Item[Col].Value);
      INC(Row);
      OleVar.MoveNext;
    end;
  end;
 // StatusBar1.SimpleText := strResult;
end;

procedure TfrmConfirmCancel.stgViewMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Column, Row: Longint;
begin
  stgView.MouseToCell(X, Y, Column, Row);
  if (Row > 0) and (Row <= TotalRow) then
  begin
    stgView.MouseToCell(X, Y, Column, Row);
    edtPackageID.Text :=  stgView.Cells[0, Row];
  end;
end;

procedure TfrmConfirmCancel.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
