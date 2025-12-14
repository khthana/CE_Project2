unit PlaceForm_Source;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, PlacePropertyForm_Source, Grids, ADODB_TLB, ComCtrls,
  PlaceSystem_TLB,
  CreatePlaceForm_Source, ModifyPlaceForm_Source;

type
  TPlaceForm = class(TForm)
    btnPlacePropertyManager: TButton;
    btnCreatePlace: TButton;
    btnModifyPlace: TButton;
    btnDeletePlace: TButton;
    btnViewPlace: TButton;
    StringGrid1: TStringGrid;
    btnClose: TButton;
    StatusBar1: TStatusBar;

    procedure btnPlacePropertyManagerClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnViewPlaceClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSetPlacePropertyClick(Sender: TObject);
    procedure StringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCreatePlaceClick(Sender: TObject);
    procedure btnDeletePlaceClick(Sender: TObject);
    procedure btnModifyPlaceClick(Sender: TObject);
  private
    // Private Fields
    PlaceManager : IPlaceManager;
    StrResult : WideString;
    OleVar : OleVariant;
    TotalRow : Integer;

    // Private Methods
    procedure UpdateGrid;

  public
    // Public Fields
    AdminID : WideString;
    PlaceID : WideString;
    PlacePropertyIDList : WideString;
    PlacePropertyTypeList : WideString;
    ActivityID : WideString;
    CategoryID : WideString;
    FestivalID : WideString;
  end;

var
  PlaceForm: TPlaceForm;

implementation

{$R *.DFM}

procedure TPlaceForm.btnPlacePropertyManagerClick(Sender: TObject);
begin
  PlacePropertyForm.Show;
end;

procedure TPlaceForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TPlaceForm.btnViewPlaceClick(Sender: TObject);
begin
  OleVar := PlaceManager.QueryData('', '', '', '', '', '', '', '');
  UpdateGrid;
end;

procedure TPlaceForm.FormCreate(Sender: TObject);
begin
  PlaceManager := CoPlaceManager.Create;
end;

procedure TPlaceForm.UpdateGrid;
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
  StatusBar1.SimpleText := strResult;
end;

procedure TPlaceForm.btnSetPlacePropertyClick(Sender: TObject);
begin
  PlacePropertyForm.AdminID := AdminID;
  PlacePropertyForm.PlaceID := PlaceID;
  PlacePropertyForm.Show;
end;

procedure TPlaceForm.StringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Column, Row: Longint;
begin
  StringGrid1.MouseToCell(X, Y, Column, Row);
  if (Row > 0) and (Row <= TotalRow) then
  begin
    PlaceID := StringGrid1.Cells[0, Row];
  end;
end;

procedure TPlaceForm.btnCreatePlaceClick(Sender: TObject);
begin
  CreatePlaceForm.ResetForm;
  CreatePlaceForm.AdminID := AdminID;
  CreatePlaceForm.ShowModal;
end;

procedure TPlaceForm.btnDeletePlaceClick(Sender: TObject);
begin
  PlaceManager.Delete(PlaceID, AdminID);
  OleVar := PlaceManager.QueryData('', '', '', '', '', '', '', '');
  UpdateGrid;
end;

procedure TPlaceForm.btnModifyPlaceClick(Sender: TObject);
begin
  ModifyPlaceForm.ResetForm;
  ModifyPlaceForm.AdminID := AdminID;
  ModifyPlaceForm.PlaceID := PlaceID;
  ModifyPlaceForm.EdtPlaceID.Text := PlaceID;
  ModifyPlaceForm.ShowModal;
end;

end.
