unit FState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, DBTables, StdCtrls;

type
  TFindState = class(TForm)
    Query1: TQuery;
    Query2: TQuery;
    Query3: TQuery;
    Query4: TQuery;
    Query5: TQuery;
    Timer1: TTimer;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    MyPath:String;
  public
    { Public declarations }
    procedure SetPath(s:String);
    procedure ClearAllDataBase;
    procedure CopyPinConnection;
    procedure FindingOutPut;
    Function  CheckEndState:Boolean;
  end;

var
  FindState: TFindState;

implementation

{$R *.dfm}

procedure TFindState.SetPath(s:String);
Begin
  MyPath:=s;
  Query1.Active := False;
  Query1.DatabaseName := MyPath+'Data'; // set initial directory
  Query2.Active := False;
  Query2.DatabaseName := MyPath+'Data'; // set initial directory
  Query3.Active := False;
  Query3.DatabaseName := MyPath+'Process'; // set initial directory
  Query4.Active := False;
  Query4.DatabaseName := MyPath+'Lib'; // set initial directory
  Query5.Active := False;
  Query5.DatabaseName := MyPath+'Process'; // set initial directory
End;

procedure TFindState.FormShow(Sender: TObject);
begin
  ClearAllDataBase;
  CopyPinConnection;
  Timer1.Enabled := True;
end;

procedure TFindState.ClearAllDataBase;
Var i:Integer;
begin
  Query2.Active := False;
  Query2.SQL.Clear;
  Query2.SQL.Append('SELECT * FROM PinRound');
  Query2.Active := True;
  For i:=1 To Query2.RecordCount Do
    Query2.Delete;
  Query2.Edit;
  Query2.Post;
  Query2.Active := False;

  Query3.Active := False;
  Query3.SQL.Clear;
  Query3.SQL.Append('SELECT * FROM PinValue');
  Query3.Active := True;
  For i:=1 To Query3.RecordCount Do
    Query3.Delete;
  Query3.Edit;
  Query3.Post;
  Query3.Active := False;
end;

procedure TFindState.CopyPinConnection;
Var i:Integer;
begin
  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Append('SELECT * FROM ConnectP');
  Query1.SQL.Append('Where NameOut<>'+Chr(39)+'VCC'+Chr(39));
  Query1.SQL.Append('And NameOut<>'+Chr(39)+'GND'+Chr(39));
  Query1.Active := True;

  Query2.Active := False;
  Query2.SQL.Clear;
  Query2.SQL.Append('SELECT * FROM PinRound');
  Query2.Active := True;
  For i:=1 To Query1.RecordCount Do
  Begin
    If Query2.Fields[0].AsString='' Then
      Query2.Edit
    Else
      Query2.Append;

    Query2.Fields[0].AsString:=Query1.Fields[0].AsString;
    Query2.Fields[1].AsString:=Query1.Fields[1].AsString;
    Query2.Fields[2].AsString:=Query1.Fields[2].AsString;
    Query2.Fields[3].AsString:=Query1.Fields[3].AsString;
    Query2.Fields[4].AsString:=Query1.Fields[4].AsString;
    Query2.Fields[5].AsString:=Query1.Fields[5].AsString;
    Query2.Post;

    Query1.Next;
  End;

  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Append('SELECT * FROM ConnectP');
  Query1.SQL.Append('Where NameOut='+Chr(39)+'VCC'+Chr(39));
  Query1.SQL.Append('Or NameOut='+Chr(39)+'GND'+Chr(39));
  Query1.Active := True;

  Query3.Active := False;
  Query3.SQL.Clear;
  Query3.SQL.Append('SELECT * FROM PinValue');
  Query3.Active := True;
  For i:=1 To Query1.RecordCount Do
  Begin
    If Query3.Fields[0].AsString='' Then
      Query3.Edit
    Else
      Query3.Append;

    Query3.Fields[0].AsString:=Query1.Fields[0].AsString;
    Query3.Fields[1].AsString:=Query1.Fields[1].AsString;
    Query3.Fields[2].AsString:=Query1.Fields[2].AsString;
    Query3.Fields[3].AsString:=Query1.Fields[5].AsString;
    Query3.Post;

    Query1.Next;
  End;

  Query1.Active := False;
  Query2.Active := False;
  Query3.Active := False;
end;

procedure TFindState.Timer1Timer(Sender: TObject);
begin
  If CheckEndState Then
    Timer1.Enabled := False
  Else
    FindingOutPut;
end;

procedure TFindState.Button1Click(Sender: TObject);
begin
  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Append('SELECT * FROM ConnectP');
  Query1.Active := True;

  Query2.Active := False;
  Query2.SQL.Clear;
  Query2.SQL.Append('SELECT * FROM PinRound');
  Query2.Active := True;

  Query3.Active := False;
  Query3.SQL.Clear;
  Query3.SQL.Append('SELECT * FROM PinValue');
  Query3.Active := True;
end;

Function TFindState.CheckEndState:Boolean;
Begin
  Query2.Active := False;
  Query2.SQL.Clear;
  Query2.SQL.Append('SELECT * FROM PinRound');
  Query2.SQL.Append('Where SerialIN<>'+Chr(39)+Chr(39));
  Query2.Active := True;

  If Query2.RecordCount>0 Then
    CheckEndState:=False
  Else
    CheckEndState:=True;
  Query2.Active := False;
End;


procedure TFindState.FindingOutPut;
Var StateOn,SerialIn,NameIn,PinIn,SerialOut,NameOut,PinOut,buf:String;
    i:Integer;
    LoopState:Boolean;
    BufSQL:String;
begin
  LoopState:=True;
  Query2.Active := False;
  Query2.SQL.Clear;
  Query2.SQL.Append('SELECT * FROM PinRound');
  Query2.SQL.Append('Where SerialIN<>'+Chr(39)+Chr(39));
  Query2.Active := True;
  Query2.First;

  SerialIn  :=Query2.Fields[0].AsString;
  NameIn    :=Query2.Fields[1].AsString;
  PinIn     :=Query2.Fields[2].AsString;
  SerialOut :=Query2.Fields[3].AsString;
  NameOut   :=Query2.Fields[4].AsString;
  PinOut    :=Query2.Fields[5].AsString;

  Query5.Active := False;
  Query5.SQL.Clear;
  Query5.SQL.Append('SELECT * FROM ItemState');
  Query5.SQL.Append('Where Serial='+Chr(39)+SerialOut+Chr(39));
  Query5.Active := True;
  StateOn:=Query5.Fields[1].AsString;
                 
  BufSQL:='';
  BufSQL:=BufSQL+' '+'Select '+PinOut+'In From Fn'+NameOut;
  BufSQL:=BufSQL+' '+'Where PresentState='+Chr(39)+StateOn+Chr(39);

  Query2.Delete;
  Query2.Edit;
  Query2.Post;

  Query3.Active := False;
  Query3.SQL.Clear;
  Query3.SQL.Append('SELECT State FROM PinValue');
  Query3.SQL.Append('Where Serial='+chr(39)+SerialOut+chr(39));
  Query3.SQL.Append('And Name='+chr(39)+NameOut+chr(39));
  Query3.SQL.Append('And Pin='+chr(39)+PinOut+chr(39));
  Query3.Active := True;

  If Query3.RecordCount>0 Then
  Begin
    buf:=Query3.Fields[0].AsString;

    Query3.Append;
    Query3.Fields[0].AsString:=SerialIN;
    Query3.Fields[1].AsString:=NameIN;
    Query3.Fields[2].AsString:=PinIN;
    Query3.Fields[3].AsString:=buf;
    Query3.Post;
  End
  Else
  Begin
    Query4.Active := False;
    Query4.SQL.Clear;
    Query4.SQL.Append('SELECT CName FROM Pin'+NameOut);
    Query4.SQL.Append('Where CType=1');
    Query4.Active := True;

    For i:=1 To Query4.RecordCount Do
    Begin
      Buf:=Query4.Fields[0].AsString;

      Query2.Active := False;
      Query2.SQL.Clear;
      Query2.SQL.Append('SELECT * FROM PinRound');
      Query2.SQL.Append('Where SerialIN='+Chr(39)+SerialOut+Chr(39));
      Query2.SQL.Append('And NameIN='+Chr(39)+NameOut+Chr(39));
      Query2.SQL.Append('And PinNameIN='+Chr(39)+PinOut+Chr(39));
      Query2.Active := True;
      If Query2.RecordCount>0 Then
      Begin
      // If Pin Input Wait Another
        Query2.Append;
        Query2.Fields[0].AsString:=SerialIn;
        Query2.Fields[1].AsString:=NameIn;
        Query2.Fields[2].AsString:=PinIn;
        Query2.Fields[3].AsString:=SerialOut;
        Query2.Fields[4].AsString:=NameOut;
        Query2.Fields[5].AsString:=PinOut;
        Query2.Post;
        LoopState:=False;
        Break;
      End
      Else
      Begin
        Query3.Active := False;
        Query3.SQL.Clear;
        Query3.SQL.Append('SELECT State FROM PinValue');
        Query3.SQL.Append('Where Serial='+chr(39)+SerialOut+chr(39));
        Query3.SQL.Append('And Name='+chr(39)+NameOut+chr(39));
        Query3.SQL.Append('And Pin='+chr(39)+Buf+chr(39));
        Query3.Active := True;
        // check input have in table
        If Query3.RecordCount>0 Then
        Begin
          BufSQL:=BufSQL+' '+'And '+Buf+'='+Chr(39)+Query3.Fields[0].AsString+Chr(39);
        End
        Else
        Begin
          BufSQL:=BufSQL+' '+'And '+Buf+'='+Chr(39)+'1'+Chr(39);
        End;
      End;
      Query4.Next;
    End;

    If LoopState Then
    Begin
      Query4.Active := False;
      Query4.SQL.Clear;
      Query4.SQL.Append(BufSQL);
      Query4.Active := True;

      Query3.Active := False;
      Query3.SQL.Clear;
      Query3.SQL.Append('SELECT * FROM PinValue');
      Query3.Active := True;

      Query3.Append;
      Query3.Fields[0].AsString:=SerialIn;
      Query3.Fields[1].AsString:=NameIn;
      Query3.Fields[2].AsString:=PinIn;
      If Query4.RecordCount>0 Then
        Query3.Fields[3].AsString:=Query4.Fields[0].AsString
      Else
        Query3.Fields[3].AsString:='1';
      Query3.Post;
    End;
  End;

  Query2.Active := False;
  Query3.Active := False;
  Query4.Active := False;
  Query5.Active := False;
End;

end.
