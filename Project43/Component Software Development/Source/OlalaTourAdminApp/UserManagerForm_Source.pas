unit UserManagerForm_Source;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls, ComCtrls, ADODB_TLB,
  UserSystem_TLB;

type
  TUserManagerForm = class(TForm)
    LogType: TGroupBox;
    RdoAdmin: TRadioButton;
    RdoMember: TRadioButton;
    BtnConditionalView: TButton;
    BtnClose: TButton;
    StringGrid1: TStringGrid;
    EdtLoginName: TEdit;
    EdtLastName: TEdit;
    EdtAddress: TEdit;
    EdtTelephoneNo: TEdit;
    EdtEmailAddress: TEdit;
    EdtBirthDate: TEdit;
    EdtReligion: TEdit;
    btnCreate: TButton;
    btnViewAll: TButton;
    EdtPassword: TEdit;
    EdtFirstName: TEdit;
    btnRemove: TButton;
    StatusBar1: TStatusBar;
    btnModify: TButton;
    RdoTraveller: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ChkHasBusCompanyCustomerID: TCheckBox;
    ChkHasAirlineCustomerID: TCheckBox;
    ChkHasHotelCustomerID: TCheckBox;
    EdtGender: TEdit;
    procedure RdoMemberClick(Sender: TObject);
    procedure RdoTravellerClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure RdoAdminClick(Sender: TObject);
    procedure btnViewAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnConditionalViewClick(Sender: TObject);
  private
    // Private Fields
    AdminManger : IAdminManager;
    MemberManager : IMemberManager;
    TravellerManager : ITravellerManager;

    UserType : Integer;
    TotalRow : Integer;
    OleVarID, OleVarRow : OleVariant;
    strResult : WideString;

    // Private Methods
    procedure UpdateGrid;
    function GetTotalRow : Integer;
  public
    // Private Methods
    procedure Reset;
  end;

var
  UserManagerForm: TUserManagerForm;

implementation

{$R *.DFM}

procedure TUserManagerForm.RdoMemberClick(Sender: TObject);
begin
  btnCreate.Enabled := False;
  btnModify.Enabled := False;
  Label1.Enabled := False;
  EdtLoginName.Enabled := False;
  Label10.Enabled := False;
  EdtPassword.Enabled := False;

  ChkHasBusCompanyCustomerID.Enabled := False;
  ChkHasAirlineCustomerID.Enabled := False;
  ChkHasHotelCustomerID.Enabled := True;

  EdtLoginName.Text := '';
  UserType := 2;
end;

procedure TUserManagerForm.RdoTravellerClick(Sender: TObject);
begin
  btnCreate.Enabled := False;
  btnModify.Enabled := False;
  Label1.Enabled := False;
  EdtLoginName.Enabled := False;
  Label10.Enabled := False;
  EdtPassword.Enabled := False;

  ChkHasBusCompanyCustomerID.Enabled := True;
  ChkHasAirlineCustomerID.Enabled := True;
  ChkHasHotelCustomerID.Enabled := True;

  ChkHasBusCompanyCustomerID.Enabled := True;
  ChkHasAirlineCustomerID.Enabled := True;
  ChkHasHotelCustomerID.Enabled := False;

  EdtLoginName.Text := '';
  UserType := 3;
end;

procedure TUserManagerForm.RdoAdminClick(Sender: TObject);
begin
  btnCreate.Enabled := True;
  btnModify.Enabled := True;

  Label1.Enabled := True;
  EdtLoginName.Enabled := True;
  Label10.Enabled := True;
  EdtPassword.Enabled := True;

  ChkHasBusCompanyCustomerID.Enabled := False;
  ChkHasAirlineCustomerID.Enabled := False;
  ChkHasHotelCustomerID.Enabled := False;

  ChkHasBusCompanyCustomerID.Enabled := False;
  ChkHasAirlineCustomerID.Enabled := False;
  ChkHasHotelCustomerID.Enabled := False;

  UserType := 1;
end;

procedure TUserManagerForm.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TUserManagerForm.Reset;
begin
  UserType := 0;
end;

procedure TUserManagerForm.btnViewAllClick(Sender: TObject);
begin
  if UserType = 0 then
    ShowMessage('You Must Select User Type')
  else begin
    case UserType of
      1 : OleVarID := AdminManger.QueryData('', '', '', '', '', '', '', '', '');
      2 : OleVarID := MemberManager.QueryData('', '', '', '', '', '', '','', 0);
      3 : OleVarID := TravellerManager.QueryData('', '', '', '', '', '',
            '', '', 0, 0, '');
    end;
    UpdateGrid;
  end;
end;

procedure TUserManagerForm.UpdateGrid;
var
  Col, Row, TotalCol : Integer;
begin
  TotalRow := GetTotalRow;
  if TotalRow = 0 then
    strResult := 'Not Found'
  else
  begin
    StringGrid1.RowCount := TotalRow + 1;
    strResult := 'Total Result :' + IntToStr(TotalRow) + ' Rows.';

    case UserType of
      1 : OleVarRow := AdminManger.ViewProfile(VarToStr(
            OleVarID.Fields.Item[0].Value));
      2 : OleVarRow := MemberManager.ViewProfile(VarToStr(
            OleVarID.Fields.Item[0].Value));
      3 : OleVarRow := TravellerManager.ViewProfile(VarToStr(
            OleVarID.Fields.Item[0].Value));
    end;

    StringGrid1.ColCount := OleVarRow.Fields.Count;
    TotalCol := StringGrid1.ColCount - 1;
    for Col := 0 to TotalCol do
    begin
      StringGrid1.Cells[Col, 0] := OleVarRow.Fields.Item[Col].Name;
    end;

    Row := 1;
    if UserType = 1 then
    begin
      while not OleVarid.EOF do
      begin
        OleVarRow := AdminManger.ViewProfile(VarToStr(
          OleVarID.Fields.Item[0].Value));

        if not (OleVarRow.EOF and OleVarRow.BOF) then
        begin
          for Col := 0 to TotalCol do
            StringGrid1.Cells[Col, Row] := VarToStr(
              OleVarRow.Fields.Item[Col].Value);
        end;
        INC(Row);
        OleVarID.MoveNext;
      end;
    end
    else if UserType = 2 then
    begin
      while not OleVarid.EOF do
      begin
        OleVarRow := MemberManager.ViewProfile(VarToStr(
          OleVarID.Fields.Item[0].Value));

        if not (OleVarRow.EOF and OleVarRow.BOF) then
        begin
          for Col := 0 to TotalCol do
            StringGrid1.Cells[Col, Row] := VarToStr(
              OleVarRow.Fields.Item[Col].Value);
        end;;
        INC(Row);
        OleVarID.MoveNext;
      end;
    end
    else if UserType = 3 then
    begin
      while not OleVarid.EOF do
      begin
        OleVarRow := MemberManager.ViewProfile(VarToStr(
          OleVarID.Fields.Item[0].Value));

        if not (OleVarRow.EOF and OleVarRow.BOF) then
        begin
          for Col := 0 to TotalCol do
            StringGrid1.Cells[Col, Row] := VarToStr(
              OleVarRow.Fields.Item[Col].Value);
        end;;
        INC(Row);
        OleVarID.MoveNext;
      end;
    end;
    StatusBar1.SimpleText := strResult;
  end;
end;

function TUserManagerForm.GetTotalRow: Integer;
var
  _TotalRow : Integer;
begin
  if OleVarID.EOF and OleVarID.BOF then
    Result := 0
  else begin
    OleVarID.MoveFirst;

    // Get Total Row of RecordSet
    _TotalRow := 0;
    while not OleVarID.EOF do
    begin
      INC(_TotalRow);
      OleVarID.MoveNext;
    end;
    Result := _TotalRow;
    OleVarID.MoveFirst
  end;
end;

procedure TUserManagerForm.FormCreate(Sender: TObject);
begin
  AdminManger := CoAdminManager.Create;
  MemberManager := CoMemberManager.Create;
  TravellerManager := CoTravellerManager.Create;
end;

procedure TUserManagerForm.BtnConditionalViewClick(Sender: TObject);
var
  hasBusCustID, hasAirlineCustID, hasHotelCustID : Integer;
begin
  if UserType = 0 then
    ShowMessage('You Must Select User Type')
  else begin
    if ChkHasBusCompanyCustomerID.Checked then
      hasBusCustID := 2
    else
      hasBusCustID := 1;

    if ChkHasAirlineCustomerID.Checked then
      hasAirlineCustID := 2
    else
      hasAirlineCustID := 1;

    if ChkHasHotelCustomerID.Checked then
      hasHotelCustID := 2
    else
      hasHotelCustID := 1;

    case UserType of
      1 : OleVarID := AdminManger.QueryData(EdtLoginName.Text,
            EdtFirstName.Text, EdtLastName.Text, EdtAddress.Text,
            EdtTelephoneNo.Text, EdtEmailAddress.Text, EdtGender.Text,
            EdtBirthDate.Text, EdtReligion.Text);
      2 : OleVarID := MemberManager.QueryData(EdtFirstName.Text,
            EdtLastName.Text, EdtAddress.Text, EdtTelephoneNo.Text,
            EdtEmailAddress.Text, EdtGender.Text, EdtBirthDate.Text,
            EdtReligion.Text, hasHotelCustID );
      3 : OleVarID := TravellerManager.QueryData(EdtFirstName.Text,
            EdtLastName.Text, EdtAddress.Text, EdtTelephoneNo.Text,
            EdtEmailAddress.Text, EdtGender.Text, EdtBirthDate.Text,
            EdtReligion.Text, hasBusCustID, hasAirlineCustID, '');
            //hasHotelCustID,
    end;
    UpdateGrid;
  end;
end;

end.
