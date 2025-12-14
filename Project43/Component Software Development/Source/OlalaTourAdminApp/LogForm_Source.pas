unit LogForm_Source;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  LogSystem_TLB, StdCtrls, Grids, DBGrids, ADODB_TLB, ComCtrls;

type
  TLogForm = class(TForm)
    LogType: TGroupBox;
    RdoSystemLog: TRadioButton;
    RdoBussinessLog: TRadioButton;
    BtnView: TButton;
    BtnClear: TButton;
    BtnClose: TButton;
    StringGrid1: TStringGrid;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnViewClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
  private
    // Private Fields
    SystemLogManager : ISystemLogManager;
    BussinessLogManager : IBussinessLogManager;
    OleVar : OleVariant;
    strResult : WideString;
    TotalRow : Integer; 
  public

    // Private Methods
    procedure UpdateGrid;
  end;

var
  LogForm: TLogForm;

implementation

{$R *.DFM}

procedure TLogForm.FormCreate(Sender: TObject);
begin
  SystemLogManager := CoSystemLogManager.Create;
  BussinessLogManager := CoBussinessLog.Create;
end;

procedure TLogForm.BtnCloseClick(Sender: TObject);
begin
  //OleVar.Close;
  Close;
end;

procedure TLogForm.BtnViewClick(Sender: TObject);
var
  Row, Col : Integer;
  strResult : WideString;
begin
  if (not RdoSystemLog.Checked) and (not RdoBussinessLog.Checked) then
  begin
    ShowMessage('You Must Select LogType Before View!!');
    strResult := 'Data Not Complete.';
  end
  else
  begin
    if RdoSystemLog.Checked then
    begin
      OleVar := SystemLogManager.View;
    end
    else begin
      OleVar := BussinessLogManager.View;
    end;
    UpdateGrid;
  end;
end;

procedure TLogForm.BtnClearClick(Sender: TObject);
begin
  if (not RdoSystemLog.Checked) and (not RdoBussinessLog.Checked) then
  begin
    ShowMessage('You Must Select LogType Before View!!');
    strResult := 'Data Not Complete.';
  end
  else
  begin
    if RdoSystemLog.Checked then
    begin
      SystemLogManager.Clear;
    end
    else begin
      BussinessLogManager.Clear;
    end;
    BtnViewClick(Self);
    strResult := 'Complete';
  end;
  UpdateGrid;
end;

procedure TLogForm.UpdateGrid;
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

end.
