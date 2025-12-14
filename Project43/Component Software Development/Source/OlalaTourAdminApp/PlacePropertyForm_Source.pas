unit PlacePropertyForm_Source;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, ExtCtrls, ComCtrls,ADODB_TLB,
  PlaceSystem_TLB;

type
  TPlacePropertyForm = class(TForm)
    GroupBox1: TGroupBox;
    RdoActivity: TRadioButton;
    RdoCategory: TRadioButton;
    RdoFestival: TRadioButton;
    btnCreate: TButton;
    btnModify: TButton;
    btnDelete: TButton;
    btnClose: TButton;
    btnViewPlaceProperty: TButton;

    ////////////////////////////////
    Bevel1: TBevel;
    EdtPlacePropertyName: TEdit;
    EdtPlacePropertyDescription: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtPlacePropertyID: TEdit;
    StringGrid1: TStringGrid;

    StatusBar1: TStatusBar;

    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RdoActivityClick(Sender: TObject);
    procedure RdoCategoryClick(Sender: TObject);
    procedure RdoFestivalClick(Sender: TObject);
    procedure btnViewPlacePropertyClick(Sender: TObject);
    procedure StringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnModifyClick(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnAddToPlaceClick(Sender: TObject);

  private
    // Private Fields
    OleVar : OleVariant;
    PlacePropertyType : Integer;
    PlacePropertyID : WideString;
    strResult : WideString;
    TotalRow : Integer;

    ActivityManager : IActivityManager;
    CategoryManager : ICategoryManager;
    FestivalManager : IFestivalManager;

    // Private Methods
    procedure UpdateGrid;
  public
    // Public Field
    AdminID : WideString;
    PlaceID : WideString;
    PlacePropertyIDList : WideString;
    PlacePropertyTypeList : WideString;
    ActivityID : WideString;
    CategoryID : WideString;
    FestivalID : WideString;
  end;

var
  PlacePropertyForm: TPlacePropertyForm;

implementation

{$R *.DFM}

procedure TPlacePropertyForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TPlacePropertyForm.FormCreate(Sender: TObject);
begin
  // Initailize Variable
  PlacePropertyType := 0;
  ActivityManager := CoActivityManager.Create;
  CategoryManager := CoCategoryManager.Create;
  FestivalManager := CoFestivalManager.Create;
  PlacePropertyIDList := '';
  PlacePropertyTypeList := '';
  ActivityID := '';
  CategoryID := '';
  FestivalID := '';
end;

procedure TPlacePropertyForm.RdoActivityClick(Sender: TObject);
begin
  PlacePropertyType := 1;
end;

procedure TPlacePropertyForm.RdoCategoryClick(Sender: TObject);
begin
  PlacePropertyType := 2;
end;

procedure TPlacePropertyForm.RdoFestivalClick(Sender: TObject);
begin
  PlacePropertyType := 3;
end;

procedure TPlacePropertyForm.btnViewPlacePropertyClick(Sender: TObject);
begin
  if PlacePropertyType = 0 then
  begin
    ShowMessage('You Must Select Property Type');
    strResult := '';
  end
  else begin
    case PlacePropertyType of
      1 : OleVar := ActivityManager.QueryData(EdtPlacePropertyName.Text,
            EdtPlacePropertyDescription.Text);
      2 : OleVar := CategoryManager.QueryData(EdtPlacePropertyName.Text,
            EdtPlacePropertyDescription.Text);
      3 : OleVar := FestivalManager.QueryData(EdtPlacePropertyName.Text,
            EdtPlacePropertyDescription.Text);
    end;
    UpdateGrid;
  end;
end;

procedure TPlacePropertyForm.UpdateGrid;
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

procedure TPlacePropertyForm.StringGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Column, Row: Longint;
begin
  if (Row > 0) and (Row <= TotalRow) then
  begin
    StringGrid1.MouseToCell(X, Y, Column, Row);
    PlacePropertyID := StringGrid1.Cells[0, Row];
    EdtPlacePropertyID.Text := PlacePropertyID;
  end;
end;

procedure TPlacePropertyForm.btnModifyClick(Sender: TObject);
begin
  if PlacePropertyType = 0 then
  begin
    ShowMessage('You Must Select Property Type');
    strResult := '';
  end
  else begin
    case PlacePropertyType of
      1 : begin
            ActivityManager.Modify(PlacePropertyID, EdtPlacePropertyName.Text,
              EdtPlacePropertyDescription.Text, AdminID);
            OleVar := ActivityManager.QueryData('', '');
          end;
      2 : begin
            CategoryManager.Modify(PlacePropertyID, EdtPlacePropertyName.Text,
              EdtPlacePropertyDescription.Text, AdminID);
            OleVar := CategoryManager.QueryData('', '');
          end;
      3 : begin
            FestivalManager.Modify(PlacePropertyID, EdtPlacePropertyName.Text,
              EdtPlacePropertyDescription.Text, AdminID);
            OleVar := FestivalManager.QueryData('', '');
          end;
    end;
    UpdateGrid;
  end;
end;

procedure TPlacePropertyForm.btnCreateClick(Sender: TObject);
begin
  if PlacePropertyType = 0 then
  begin
    ShowMessage('You Must Select Property Type');
    strResult := '';
  end
  else begin
    case PlacePropertyType of
      1 : begin
            ActivityManager.Create(EdtPlacePropertyName.Text,
              EdtPlacePropertyDescription.Text, AdminID);
            OleVar := ActivityManager.QueryData('', '');
          end;
      2 : begin
            CategoryManager.Create(EdtPlacePropertyName.Text,
              EdtPlacePropertyDescription.Text, AdminID);
            OleVar := CategoryManager.QueryData('', '');
          end;
      3 : begin
            FestivalManager.Create(EdtPlacePropertyName.Text,
              EdtPlacePropertyDescription.Text, AdminID);
            OleVar := FestivalManager.QueryData('', '');
          end;
    end;
    UpdateGrid;
  end;
end;

procedure TPlacePropertyForm.btnDeleteClick(Sender: TObject);
begin
  if PlacePropertyType = 0 then
  begin
    ShowMessage('You Must Select Property Type');
    strResult := '';
  end
  else begin
    case PlacePropertyType of
      1 : begin
            ActivityManager.Delete(EdtPlacePropertyID.Text, AdminID);
            OleVar := ActivityManager.QueryData('', '');
          end;
      2 : begin
            CategoryManager.Delete(EdtPlacePropertyID.Text, AdminID);
            OleVar := CategoryManager.QueryData('', '');
          end;
      3 : begin
            FestivalManager.Delete(EdtPlacePropertyID.Text, AdminID);
            OleVar := FestivalManager.QueryData('', '');
          end;
    end;
    UpdateGrid;
  end;
end;

procedure TPlacePropertyForm.btnAddToPlaceClick(Sender: TObject);
begin
  if PlacePropertyType = 0 then
  begin
    ShowMessage('You Must Select Property Type');
    strResult := '';
  end
  else begin
    case PlacePropertyType of
      1 : begin
            ActivityID := EdtPlacePropertyID.Text;
            PlacePropertyIDList := PlacePropertyIDList + ':' + ActivityID;
            PlacePropertyTypeList := PlacePropertyTypeList + 'A'
          end;
      2 : begin
            CategoryID := EdtPlacePropertyID.Text;
            PlacePropertyIDList := PlacePropertyIDList + ':' + CategoryID;
            PlacePropertyTypeList := PlacePropertyTypeList + 'C'
          end;
      3 : begin
            FestivalID := EdtPlacePropertyID.Text;
            PlacePropertyIDList := PlacePropertyIDList + ':' + FestivalID;
            PlacePropertyTypeList := PlacePropertyTypeList + 'F'
          end;
    end;
  end;
end;

end.
