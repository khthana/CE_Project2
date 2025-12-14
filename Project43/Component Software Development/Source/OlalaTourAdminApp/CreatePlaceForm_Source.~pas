unit CreatePlaceForm_Source;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Grids, ADODB_TLB, PlaceSystem_TLB;

type
  TCreatePlaceForm = class(TForm)
    GroupBox1: TGroupBox;
    RdoActivity: TRadioButton;
    RdoCategory: TRadioButton;
    RdoFestival: TRadioButton;
    btnCreate: TButton;
    StringGrid1: TStringGrid;
    btnViewPlaceProperty: TButton;
    btnAddToPlace: TButton;
    btnRemoveFromPlace: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EdtPlaceName: TEdit;
    EdtCountry: TEdit;
    EdtState: TEdit;
    EdtProvince: TEdit;
    EdtDescription: TEdit;
    EdtImageFilePath: TEdit;
    btnOpenFile: TButton;
    StatusBar1: TStatusBar;
    ListBox1: TListBox;
    btnClose: TButton;
    procedure btnViewPlacePropertyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RdoActivityClick(Sender: TObject);
    procedure RdoCategoryClick(Sender: TObject);
    procedure RdoFestivalClick(Sender: TObject);
    procedure btnAddToPlaceClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);

    procedure StringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure btnRemoveFromPlaceClick(Sender: TObject);
  private
    // Private Fields
    PlaceManager : IPlaceManager;
    ActivityManager : IActivityManager;
    CategoryManager : ICategoryManager;
    FestivalManager : IFestivalManager;

    PlacePropertyIDList : WideString;
    PlacePropertyTypeList : WideString;
    PlacePropertyID : WideString;
    PlacePropertyName : WideString;
    PlacePropertyType : Integer;

    strResult : WideString;
    OleVar : OleVariant;
    TotalRow : Integer;
    ListIndex : Integer;

    // Private Mothods
    procedure UpdateGrid;

  public
    // public Fields
    AdminID : WideString;

    // pulbic Methods
    procedure ResetForm;
  end;

var
  CreatePlaceForm: TCreatePlaceForm;

implementation

{$R *.DFM}

procedure TCreatePlaceForm.UpdateGrid;
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

procedure TCreatePlaceForm.StringGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Column, Row: Longint;
begin
  StringGrid1.MouseToCell(X, Y, Column, Row);
  if (Row > 0) and (Row <= TotalRow) then
  begin
    StringGrid1.MouseToCell(X, Y, Column, Row);
    PlacePropertyID := StringGrid1.Cells[0, Row];
    PlacePropertyName := StringGrid1.Cells[1, Row];
  end;
end;

procedure TCreatePlaceForm.ListBox1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X,Y: integer);
var
  APoint: TPoint;
begin
  APoint.X := X;
  APoint.Y := Y;
  ListIndex := ListBox1.ItemAtPos(APoint, True);
end;


procedure TCreatePlaceForm.btnViewPlacePropertyClick(Sender: TObject);
begin
  if PlacePropertyType = 0 then
    ShowMessage('You Must Select PlaceProperty!!')
  else begin
    case PlacePropertyType of
      1 : OleVar := ActivityManager.QueryData('', '');
      2 : OleVar := CategoryManager.QueryData('', '');
      3 : OleVar := FestivalManager.QueryData('', '');
    end;
    UpdateGrid;
  end;
end;

procedure TCreatePlaceForm.FormCreate(Sender: TObject);
begin
  PlaceManager := CoPlaceManager.Create;
  ActivityManager := CoActivityManager.Create;
  CategoryManager := CoCategoryManager.Create;
  FestivalManager := CoFestivalManager.Create;
end;

procedure TCreatePlaceForm.ResetForm;
begin
  ListIndex := 0;
  PlacePropertyType := 0;
  PlacePropertyIDList := '';
  PlacePropertyTypeList := '';
  PlacePropertyID := '';
  strResult := '';
end;

procedure TCreatePlaceForm.RdoActivityClick(Sender: TObject);
begin
  PlacePropertyType := 1;
end;

procedure TCreatePlaceForm.RdoCategoryClick(Sender: TObject);
begin
  PlacePropertyType := 2;
end;

procedure TCreatePlaceForm.RdoFestivalClick(Sender: TObject);
begin
  PlacePropertyType := 3;
end;

procedure TCreatePlaceForm.btnAddToPlaceClick(Sender: TObject);
var
  strPropType : WideString;
begin
  if PlacePropertyType = 0 then
    ShowMessage('You Must Select PlaceProperty Type!!')
  else if PlacePropertyID = '' then
    ShowMessage('You Must Select PlaceProperty!!')
  else begin
    case PlacePropertyType of
      1 : begin
            PlacePropertyTypeList := PlacePropertyTypeList + 'A';
            strPropType := 'Activity';
          end;
      2 : begin
            PlacePropertyTypeList := PlacePropertyTypeList + 'C';
            strPropType := 'Category';
          end;
      3 : begin
            PlacePropertyTypeList := PlacePropertyTypeList + 'F';
            strPropType := 'Festival';
          end;
    end;
    PlacePropertyIDList := PlacePropertyIDList + PlacePropertyID;
    PlacePropertyID := '' ;
    ListBox1.Items.Add(strPropType + ':' + PlacePropertyName);
  end;
end;

procedure TCreatePlaceForm.btnCloseClick(Sender: TObject);
begin
  ListBox1.Clear;
  Close;
end;

procedure TCreatePlaceForm.btnCreateClick(Sender: TObject);
begin
  PlaceManager.Create(EdtPlaceName.Text, EdtCountry.Text, EdtState.Text,
    EdtProvince.Text, EdtDescription.Text, EdtImageFilePath.Text,
    PlacePropertyIDList, PlacePropertyTypeList, AdminID);
  PlacePropertyIDList := '';
  PlacePropertyTypeList := '';
  ListBox1.Clear;
end;

procedure TCreatePlaceForm.btnRemoveFromPlaceClick(Sender: TObject);
var
  tmpID1, tmpID2 : WideString;
  tmpType1, tmpType2 : WideString;
begin
  if ListIndex = -1 then
    ShowMessage('You Must Select Item to Remove!!')
  else begin
    ListBox1.Items.Delete(ListIndex);
    if ListIndex = 0 then
    begin
      tmpID1 := '';
      tmpType1 := '';
    end
    else begin
      tmpID1 := Copy(PlacePropertyIDList, 1, 38* (ListIndex));
      tmpType1 := Copy(PlacePropertyTypeList, 1, ListIndex);
    end;
    tmpID2 := Copy(PlacePropertyIDList, (ListIndex + 2) * 38 + 1, 1000);
    tmpType2 := Copy(PlacePropertyTypeList, (ListIndex + 2), 100);
    PlacePropertyIDList := tmpID1 + tmpID2;
    PlacePropertyTypeList := tmpType1 + tmpType2;
    ListIndex := -1;
  end;
end;

end.
