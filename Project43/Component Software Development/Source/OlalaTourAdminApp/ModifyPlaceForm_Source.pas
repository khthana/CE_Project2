unit ModifyPlaceForm_Source;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Grids,
  PlaceSystem_TLB;

type
  TModifyPlaceForm = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    RdoActivity: TRadioButton;
    RdoCategory: TRadioButton;
    RdoFestival: TRadioButton;
    btnModify: TButton;
    StringGrid1: TStringGrid;
    btnViewPlaceProperty: TButton;
    btnAddToPlace: TButton;
    btnRemoveFromPlace: TButton;
    EdtPlaceName: TEdit;
    EdtCountry: TEdit;
    EdtState: TEdit;
    EdtProvince: TEdit;
    EdtDescription: TEdit;
    EdtImageFilePath: TEdit;
    btnOpenFile: TButton;
    StatusBar1: TStatusBar;
    ListBox1: TListBox;
    Label1: TLabel;
    btnClose: TButton;
    Label8: TLabel;
    EdtPlaceID: TEdit;

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
  private
    // Private Fields
    PlaceManager : IPlaceManager;
    ActivityManager : IActivityManager;
    CategoryManager : ICategoryManager;
    FestivalManager : IFestivalManager;

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
    PlaceID : WideString;
    AdminID : WideString;

    // pulbic Methods
    procedure ResetForm;
  end;

var
  ModifyPlaceForm: TModifyPlaceForm;

implementation

{$R *.DFM}

procedure TModifyPlaceForm.UpdateGrid;
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

procedure TModifyPlaceForm.StringGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Column, Row: Longint;
begin
  StringGrid1.MouseToCell(X, Y, Column, Row);
  if (Row > 0) and (Row <= TotalRow) then
  begin
    StringGrid1.MouseToCell(X, Y, Column, Row);
    PlacePropertyID := StringGrid1.Cells[0, Row];
    ShowMessage(PlacePropertyID);
    PlacePropertyName := StringGrid1.Cells[1, Row];
  end;
end;

procedure TModifyPlaceForm.ListBox1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X,Y: integer);
var
  APoint: TPoint;
begin
  APoint.X := X;
  APoint.Y := Y;
  ListIndex := ListBox1.ItemAtPos(APoint, True);
end;


procedure TModifyPlaceForm.btnViewPlacePropertyClick(Sender: TObject);
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

procedure TModifyPlaceForm.FormCreate(Sender: TObject);
begin
  PlaceManager := CoPlaceManager.Create;
  ActivityManager := CoActivityManager.Create;
  CategoryManager := CoCategoryManager.Create;
  FestivalManager := CoFestivalManager.Create;
  EdtPlaceID.Text := PlaceID;
end;

procedure TModifyPlaceForm.ResetForm;
begin
  ListIndex := 0;
  PlacePropertyType := 0;
  PlacePropertyID := '';
  strResult := '';
end;

procedure TModifyPlaceForm.RdoActivityClick(Sender: TObject);
begin
  PlacePropertyType := 1;
end;

procedure TModifyPlaceForm.RdoCategoryClick(Sender: TObject);
begin
  PlacePropertyType := 2;
end;

procedure TModifyPlaceForm.RdoFestivalClick(Sender: TObject);
begin
  PlacePropertyType := 3;
end;

procedure TModifyPlaceForm.btnAddToPlaceClick(Sender: TObject);
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
            ActivityManager.Add(PlaceID, PlacePropertyID);
            strPropType := 'Activity';
          end;
      2 : begin
            CategoryManager.Add(PlaceID, PlacePropertyID);
            strPropType := 'Category';
          end;
      3 : begin
            FestivalManager.Add(PlaceID, PlacePropertyID);
            strPropType := 'Festival';
          end;
    end;
    PlacePropertyID := '' ;
    ListBox1.Items.Add(strPropType + ':' + PlacePropertyName);
  end;
end;

procedure TModifyPlaceForm.btnCloseClick(Sender: TObject);
begin
  ListBox1.Clear;
  Close;
end;

procedure TModifyPlaceForm.btnCreateClick(Sender: TObject);
begin
  PlaceManager.Modify(PlaceID, EdtPlaceName.Text, EdtCountry.Text, EdtState.Text,
    EdtProvince.Text, EdtDescription.Text, EdtImageFilePath.Text, AdminID);
end;

end.



