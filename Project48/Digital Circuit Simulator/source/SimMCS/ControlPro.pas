unit ControlPro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables, StdCtrls;

type
  TControllerProp = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Query1: TQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Button3: TButton;
    Edit2: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    Label6: TLabel;
    Edit4: TEdit;
    Query2: TQuery;
    Label7: TLabel;
    Edit5: TEdit;
    Button2: TButton;
    Query3: TQuery;
    Button4: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateToEdit;
    procedure UpdateHexDataBase;
    procedure UpdateTitle;
  end;

var
  ControllerProp: TControllerProp;

implementation

{$R *.dfm}

procedure TControllerProp.FormShow(Sender: TObject);
begin
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
  Edit5.Text := '';
  ComboBox1.ItemIndex := 0;

  UpdateHexDataBase;

  If (Query1.RecordCount>0) And (Query1.Fields[0].AsString<>'') Then
  Begin
    Button1.Enabled := True;
    Button3.Enabled := True;
    ComboBox1.Enabled := True;
  End
  Else
  Begin
    Button1.Enabled := False;
    Button3.Enabled := False;
    ComboBox1.Enabled := False;
  End;

  UpdateToEdit;
end;

procedure TControllerProp.UpdateHexDataBase;
Var i:Integer;
begin
  Query1.Active := False;
  Query1.DatabaseName := 'C:\SimMCS\Data'; // set initial directory
  Query2.Active := False;
  Query2.DatabaseName := 'C:\SimMCS\Data'; // set initial directory
  Query3.Active := False;
  Query3.DatabaseName := 'C:\SimMCS\Data'; // set initial directory

  Query1.Active:=False;
  Query1.SQL.Clear;
  Query1.SQL.Append('SELECT *  From MCS');
  Query1.Active:=True;

  Query1.First;
  For i:=1 To Query1.RecordCount Do
  begin
    Query2.Active:=False;
    Query2.SQL.Clear;
    Query2.SQL.Append('SELECT *  From SimMCS');
    Query2.SQL.Append('Where (Flag=8 Or Flag=9) and Serial='+Chr(39)+
                      Query1.Fields[0].AsString+Chr(39)+' and '+
                      'LName='+Chr(39)+Query1.Fields[1].AsString+Chr(39));
    Query2.Active:=True;

    If Query2.RecordCount=0 Then
      Query1.Delete
    Else
    Begin
      Query1.Edit;
      Query1.Fields[2].AsString := Query2.Fields[2].AsString;
      Query1.Fields[3].AsString := Query2.Fields[3].AsString;
      Query1.Post;
      Query1.Next;
    End;
  End;
  Query1.Edit;
  Query1.Post;

  Query2.Active:=False;
  Query2.SQL.Clear;
  Query2.SQL.Append('SELECT *  From SimMCS');
  Query2.SQL.Append('Where Flag=8 Or Flag=9');
  Query2.Active:=True;

  Query2.First;
  For i:=1 To Query2.RecordCount Do
  Begin
    Query3.Active:=False;
    Query3.SQL.Clear;
    Query3.SQL.Append('SELECT *  From MCS');
    Query3.SQL.Append('Where Serial='+Chr(39)+Query2.Fields[0].AsString+Chr(39)+
                      ' and '+'Name='+Chr(39)+Query2.Fields[1].AsString+Chr(39));
    Query3.Active:=True;
    If Query3.RecordCount=0 Then
    Begin
      If Query1.Fields[0].AsString='' Then
        Query1.Edit
      Else
        Query1.Append;

      Query1.Fields[0].AsString:=Query2.Fields[0].AsString;
      Query1.Fields[1].AsString:=Query2.Fields[1].AsString;
      Query1.Fields[2].AsString:=Query2.Fields[2].AsString;
      Query1.Fields[3].AsString:=Query2.Fields[3].AsString;
      Query1.Fields[4].AsString:='';
      Query1.Fields[5].AsString:='0';
      Query1.Post;
    End;

    Query2.Next;
  End;

  Query3.Active:=False;
  Query2.Active:=False;
  UpdateTitle;
End;

procedure TControllerProp.Button1Click(Sender: TObject);
begin
  If OpenDialog1.Execute Then
  Begin
    Edit1.Text := OpenDialog1.FileName;
  End;
end;

procedure TControllerProp.Button2Click(Sender: TObject);
begin
  Query1.Active:=False;
  ControllerProp.Close;
end;

procedure TControllerProp.DBGrid1CellClick(Column: TColumn);
begin
  UpdateToEdit;
end;

procedure TControllerProp.UpdateToEdit;
begin
  If Query1.Fields[0].AsString<>'' Then
  Begin
    Edit5.Text := Query1.Fields[0].AsString;
    Edit2.Text := Query1.Fields[1].AsString;
    Edit3.Text := Query1.Fields[2].AsString;
    Edit4.Text := Query1.Fields[3].AsString;
    Edit1.Text := Query1.Fields[4].AsString;
    ComboBox1.ItemIndex := Query1.Fields[5].AsInteger;
  End;
end;

procedure TControllerProp.Button3Click(Sender: TObject);
begin
  Query1.Edit;
{  Query1.Fields[0].AsString:=Edit5.Text;
  Query1.Fields[1].AsString:=Edit2.Text;
  Query1.Fields[2].AsString:=Edit3.Text;
  Query1.Fields[3].AsString:=Edit4.Text;}
  Query1.Fields[4].AsString:=Edit1.Text;
  Query1.Fields[5].AsInteger:=ComboBox1.ItemIndex;
  Query1.Post;
end;

procedure TControllerProp.Button4Click(Sender: TObject);
begin
  Edit1.Text:='';
end;

procedure TControllerProp.UpdateTitle;
begin
  DBGrid1.Columns.Items[0].Width:=55;
  DBGrid1.Columns.Items[0].Title.Caption := 'Serial';
  DBGrid1.Columns.Items[1].Width:=140;
  DBGrid1.Columns.Items[1].Title.Caption := 'Name';
  DBGrid1.Columns.Items[2].Width:=30;
  DBGrid1.Columns.Items[2].Title.Caption := 'X';
  DBGrid1.Columns.Items[3].Width:=30;
  DBGrid1.Columns.Items[3].Title.Caption := 'Y';
  DBGrid1.Columns.Items[4].Width:=190;
  DBGrid1.Columns.Items[4].Title.Caption := 'File Name';
  DBGrid1.Columns.Items[5].Width:=50;
  DBGrid1.Columns.Items[5].Title.Caption := 'XTAL';
end;

end.
