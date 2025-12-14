unit FuncTB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DB, DBTables, DBGrids, ExtCtrls, Menus;

type
  TFnTable = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Query1: TQuery;
    StringGrid1: TStringGrid;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    Label2: TLabel;
    Button4: TButton;
    RadioGroup1: TRadioGroup;
    PopupMenu1: TPopupMenu;
    RemoveItem1: TMenuItem;
    ClearAll1: TMenuItem;
    Label3: TLabel;
    ComboBox2: TComboBox;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RemoveItem1Click(Sender: TObject);
    procedure ClearAll1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    NameTable:String;
  public
    { Public declarations }
    procedure SetTableName(Name:String);
    procedure ClearValue;
    procedure GetValue;
  end;

var
  FnTable: TFnTable;

implementation

{$R *.dfm}

procedure TFnTable.SetTableName(Name:String);
begin
  NameTable := Name;
end;

procedure TFnTable.Button2Click(Sender: TObject);
begin
  FnTable.Close;
end;

procedure TFnTable.FormShow(Sender: TObject);
Var i:Integer;
begin
  ComboBox1.ItemIndex := 0;
  ComboBox2.ItemIndex := 0;
  Button1.Caption := 'Add Function';
  Edit1.Text := '';


  Query1.Active:=False;
  Query1.SQL.Clear;
  Query1.SQL.Append('SELECT * FROM Fn'+NameTable);
  Query1.Active:=True;

  StringGrid1.ColCount := Query1.FieldCount-3;
  For i:=0 To StringGrid1.ColCount-1 Do
  Begin
    StringGrid1.Cells[i,0]:= Query1.Fields[i].FieldName;
    StringGrid1.ColWidths[i] := 50;
    DBGrid1.Columns[i].Width := 50;
  End;
end;

procedure TFnTable.Button3Click(Sender: TObject);
Var i:Integer;
begin
  If OpenDialog1.Execute Then
  Begin
    For i:=1 to Length(OpenDialog1.FileName) Do
      if (OpenDialog1.FileName[i]='\') Then
        Edit1.Text := ''
      Else
        Edit1.Text := Edit1.Text + OpenDialog1.FileName[i];
  End;
end;

procedure TFnTable.Button4Click(Sender: TObject);
begin
  Edit1.Text := '';
end;

procedure TFnTable.RemoveItem1Click(Sender: TObject);
begin
  Query1.Delete;
  Query1.Edit;
  Query1.Post;
end;

procedure TFnTable.ClearAll1Click(Sender: TObject);
Var i:Integer;
begin
  For i:=1 To Query1.RecordCount Do
    Query1.Delete;
  Query1.Edit;
  Query1.Post;
end;

procedure TFnTable.Button1Click(Sender: TObject);
Var i:Integer;
begin
  If RadioGroup1.ItemIndex=0 Then
    If (Query1.RecordCount>0) and (Query1.Fields[0].AsString<>'') Then
      Query1.Append
    Else
      Query1.Edit
  Else
    Query1.Edit;

  For i:=0 To StringGrid1.ColCount-1 Do
    Query1.Fields[i].AsString := StringGrid1.Cells[i,1];

  Query1.Fields[Query1.FieldCount-3].AsString := IntToStr(ComboBox1.ItemIndex);
  Query1.Fields[Query1.FieldCount-2].AsString := Edit1.Text;
  Query1.Fields[Query1.FieldCount-1].AsString := IntToStr(ComboBox2.ItemIndex);
  Query1.Post;

  ClearValue;
end;

procedure TFnTable.ClearValue;
Var i:Integer;
begin
  For i:=0 To StringGrid1.ColCount-1 Do
    StringGrid1.Cells[i,1]:= '';
  Edit1.Text :='';
  ComboBox1.ItemIndex := 0;
End;

procedure TFnTable.GetValue;
  Var i:Integer;
begin
  For i:=0 To StringGrid1.ColCount-1 Do
    StringGrid1.Cells[i,1]:= Query1.Fields[i].AsString;
  ComboBox1.ItemIndex := Query1.Fields[Query1.FieldCount-3].AsInteger;
  Edit1.Text :=Query1.Fields[Query1.FieldCount-2].AsString;
  ComboBox2.ItemIndex := Query1.Fields[Query1.FieldCount-1].AsInteger;
End;

procedure TFnTable.DBGrid1CellClick(Column: TColumn);
begin
  If RadioGroup1.ItemIndex=1 Then
    GetValue;
end;

procedure TFnTable.RadioGroup1Click(Sender: TObject);
begin
  If RadioGroup1.ItemIndex=0 Then
  Begin
    ClearValue;
    Button1.Caption := 'Add Function';
  End
  Else
  Begin
    GetValue;
    Button1.Caption := 'Edit Function';
  End;
end;

procedure TFnTable.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Query1.Active := False;
end;

end.
