unit ViewPackageIDForm_Source;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, PackageSystem_TLB, ViewPackageFrom_Source;

type
  TfrmViewPackageID = class(TForm)
    stgViewPackageID: TStringGrid;
    btnClose: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure stgViewPackageIDMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    package: _PackageManager;
    { Private declarations }
  public
    strResult : WideString;
    OleVar : OleVariant;
    TotalRow : Integer;
    { Public declarations }
    procedure UpdateGrid(StringGrid1: TStringGrid);

  end;

var
  frmViewPackageID: TfrmViewPackageID;

implementation

{$R *.DFM}

procedure TfrmViewPackageID.FormCreate(Sender: TObject);
var
  strMessage: WideString;
begin
  package:= CoPackageManager.Create;
  OleVar:= package.ViewAllPackage(strMessage);
  UpdateGrid(stgViewPackageID);
  OleVar.close;
end;

procedure TfrmViewPackageID.UpdateGrid(StringGrid1: TStringGrid);
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

procedure TfrmViewPackageID.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmViewPackageID.stgViewPackageIDMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Column, Row: Longint;
begin
  stgViewPackageID.MouseToCell(X, Y, Column, Row);
  if (Row > 0) and (Row <= TotalRow) then
  begin
    stgViewPackageID.MouseToCell(X, Y, Column, Row);
    frmViewPackage.edtPackageID.Text :=  stgViewPackageID.Cells[0, Row];
    frmViewPackage.edtPackageName.text := stgViewPackageID.Cells[1, Row];
    frmViewPackage.edtDescription.Text := stgViewPackageID.Cells[2, Row];
    frmViewPackage.edtDepartTime.Text := stgViewPackageID.Cells[3, Row];
    frmViewPackage.edtArriveTime.Text := stgViewPackageID.Cells[4, Row];
    frmViewPackage.edtTotalPrice.Text := stgViewPackageID.Cells[5, row];
    frmViewPackage.edtConfirmed.Text := stgViewPackageID.Cells[6, row];
    //frmViewPackage.
    //frmViewPackage.edt
    frmViewPackage.ShowModal;
  end;
end;

end.
