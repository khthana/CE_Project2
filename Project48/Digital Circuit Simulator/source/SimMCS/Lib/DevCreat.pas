unit DevCreat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, DBTables;

type
  TECComp = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit6: TEdit;
    Button1: TButton;
    Image1: TImage;
    Label8: TLabel;
    Label9: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    OpenDialog1: TOpenDialog;
    Query1: TQuery;
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Function CheckTable(name:String):Boolean;
    procedure ClearStatus;
    procedure SetVale(IName:String; IType:String; IPins:String;
                      IBmpName:String; IDescription:String);
  end;

var
  ECComp: TECComp;

implementation

uses FuncTB, DecPins;

{$R *.dfm}

procedure TECComp.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  If ( (Key>=chr($30)) and (Key<=chr($39)) ) or (Key=chr(08)) Then
    Begin
    End
  Else
    Key := Chr(0);
end;

procedure TECComp.ClearStatus;
begin
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit6.Text := '0';
  Edit7.Text := '';
  Edit8.Text := '';
  ComboBox1.Text := '';
  Button2.Enabled := False;
  Button4.Enabled := False;
  Button5.Enabled := False;
end;

procedure TECComp.SetVale(IName:String; IType:String; IPins:String;
                          IBmpName:String; IDescription:String);
begin
  Edit1.Text := IName;
  Edit2.Text := IDescription;
  Edit3.Text := IBmpName;
  Edit6.Text := IPins;
  Edit7.Text := 'Fn'+IName;
  Edit8.Text := 'Pin'+IName;
  ComboBox1.Text := IType;
end;

procedure TECComp.Button3Click(Sender: TObject);
begin
  ECComp.Close;
end;

procedure TECComp.Button1Click(Sender: TObject);
Var i:Integer;
begin
  If OpenDialog1.Execute Then
  Begin
    For i:=1 to Length(OpenDialog1.FileName) Do
      if (OpenDialog1.FileName[i]='\') Then
        Edit3.Text := ''
      Else
        Edit3.Text := Edit3.Text + OpenDialog1.FileName[i];

    Image1.Picture.LoadFromFile(Edit3.Text);
    Edit1Change(Sender);
  End;
end;

procedure TECComp.Button4Click(Sender: TObject);
begin
  FnTable.SetTableName(Edit7.Text);
  FnTable.ShowModal;
end;

procedure TECComp.Button5Click(Sender: TObject);
begin
  If Not(FileExists('Pin'+Edit8.Text+'.db')) Then
  Begin
    Query1.Active:=False;
    Query1.SQL.Clear;
    Query1.SQL.Append('CREATE TABLE Pin'+Edit8.Text+' (');
    Query1.SQL.Append('CName CHAR(25),');
    Query1.SQL.Append('CType INTEGER,');
    Query1.SQL.Append('Cx INTEGER,');
    Query1.SQL.Append('Cy INTEGER,');
    Query1.SQL.Append('CDesc CHAR(25));');
    Query1.ExecSQL;
  End;
  PinsComp.SetNameTable(Edit8.Text);
  PinsComp.SetPins(StrToInt(Edit6.Text));
  PinsComp.SetBitmap(Edit3.Text);
  PinsComp.ShowModal;

  If CheckTable('FN'+Edit1.Text) Then
    Button4.Enabled := True
  Else
    Button4.Enabled := False;
end;

Function TECComp.CheckTable(name:String):Boolean;
Begin
  CheckTable := FileExists(name+'.db');
End;

procedure TECComp.Edit1Change(Sender: TObject);
begin
  Edit7.Text:=Edit1.Text;
  Edit8.Text:=Edit1.Text;

  if Edit1.Text<>'' Then
  Begin
    Button4.Enabled := True;
      If (Edit6.Text<>'') and (Edit3.Text<>'') Then
        If  StrToInt(Edit6.Text)>0 Then
          Button5.Enabled := True
        Else
          Button5.Enabled := False
      Else
      Button5.Enabled := False;
  End
  Else
  Begin
    Button4.Enabled := False;
    Button5.Enabled := False;
  End;

  If (Edit1.Text<>'') and (Edit2.Text<>'') and
     (Edit3.Text<>'') and (Edit6.Text<>'') and
     (Edit7.Text<>'') and (Edit8.Text<>'') and
     (ComboBox1.Text<>'') Then
     Begin
      If (StrToInt(Edit6.Text)>0) Then
           Button2.Enabled := True
         Else
           Button2.Enabled := False;
     End
     Else
      Button2.Enabled := False;

  If CheckTable('FN'+Edit1.Text) Then
    Button4.Enabled := True
  Else
    Button4.Enabled := False;

  If Edit3.Text='' Then
    Image1.Visible := False
  Else
    Image1.Visible := True;  
end;

procedure TECComp.Button2Click(Sender: TObject);
begin
  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Append('Select * From LibComp');
  Query1.SQL.Append('Where LName = '+chr(39)+Edit1.Text+chr(39));
  Query1.Active := True;

  If Query1.RecordCount>0 Then
    Query1.Edit
  Else
    Query1.Append;

  Query1.Fields[0].AsString := Edit1.Text;      // LNAME
  Query1.Fields[1].AsString := ComboBox1.Text;  // LTYPE
  Query1.Fields[2].AsString := Edit2.Text;      // LDescription
  Query1.Fields[3].AsString := Edit3.Text;      // LBmpName
  Query1.Fields[4].AsString := Edit6.Text;      // LPins
  Query1.Post;

  Query1.Active := False;
  ECComp.Close;
end;

procedure TECComp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Query1.Active := False;
end;

end.
