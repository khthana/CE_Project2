unit DevMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, DBTables, Grids, DBGrids;

type
  TDevComp = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Query1: TQuery;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateTitleTable;
    procedure CheckUpdatePicture;    
  end;

var
  DevComp: TDevComp;

implementation

uses DevCreat;

{$R *.dfm}

procedure TDevComp.FormShow(Sender: TObject);
begin
  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Append('Select * From LibComp');
  Query1.Active := True;

  Edit1.Text := '';

  If Query1.Fields[3].AsString<>'' Then
    Begin
    Image1.Picture.LoadFromFile(Query1.Fields[3].AsString);
    Image1.Visible := True;
    End
  Else
    Begin
    Image1.Visible :=False
    End;
    
  UpdateTitleTable;
end;

procedure TDevComp.Button4Click(Sender: TObject);
begin
  DevComp.Close;
end;

procedure TDevComp.Button1Click(Sender: TObject);
begin
  ECComp.ClearStatus;
  ECComp.ShowModal;
  Query1.Active:=False;
  Query1.Active:=True;
  UpdateTitleTable;    
end;

procedure TDevComp.Button3Click(Sender: TObject);
begin
  Query1.Delete;
  Query1.Edit;
  Query1.Post;
  Query1.Active:=False;
  Query1.Active:=True;
  UpdateTitleTable;
  CheckUpdatePicture;  
end;

procedure TDevComp.Button2Click(Sender: TObject);
begin
  ECComp.SetVale(Query1.Fields[0].AsString,Query1.Fields[1].AsString,
                 Query1.Fields[4].AsString,Query1.Fields[3].AsString,
                 Query1.Fields[2].AsString);
  ECComp.ShowModal;
  UpdateTitleTable;
  CheckUpdatePicture;  
end;

procedure TDevComp.DBGrid1CellClick(Column: TColumn);
begin
  CheckUpdatePicture;
end;

procedure TDevComp.CheckUpdatePicture;
Begin
  If Query1.Fields[0].AsString<>'' then
    Button2.Enabled := True
  Else
    Button2.Enabled := False;

  If Query1.Fields[3].AsString<>'' Then
    Begin
    Image1.Picture.LoadFromFile(Query1.Fields[3].AsString);
    Image1.Visible := True;
    End
  Else
    Begin
    Image1.Visible :=False
    End;
End;

procedure TDevComp.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  If Key=Chr(13) Then
  Begin
    Query1.Active:=False;
    Query1.SQL.Clear;
    Query1.SQL.Append('Select * From LibComp');
    Query1.SQL.Append('WHERE LName LIKE '+chr(39)+'%'+Edit1.Text+'%'+chr(39));
    Query1.SQL.Append('Or LType LIKE '+chr(39)+'%'+Edit1.Text+'%'+chr(39));
    Query1.SQL.Append('Or LDescription LIKE '+chr(39)+'%'+Edit1.Text+'%'+chr(39));
    Query1.SQL.Append('Or LBmpName LIKE '+chr(39)+'%'+Edit1.Text+'%'+chr(39));
//    Query1.SQL.Append('Or LPins = '+Edit1.Text);
//    Query1.SQL.Append('Order By Name');
    Query1.Active:=True;
    UpdateTitleTable;    
  End;
end;

procedure TDevComp.UpdateTitleTable;
begin
  DBGrid1.Columns.Items[0].Title.Caption := 'Name';
  DBGrid1.Columns.Items[1].Title.Caption := 'Type';
  DBGrid1.Columns.Items[2].Title.Caption := 'Description';
  DBGrid1.Columns.Items[3].Title.Caption := 'Bmp File Name';
  DBGrid1.Columns.Items[4].Title.Caption := 'Pins';
end;

procedure TDevComp.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CheckUpdatePicture;
end;

end.
