unit Open_ASM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Fmxutils;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Asm_File: TEdit;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    Memo1: TMemo;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
        Opendialog1.execute;
        Form1.Asm_File.text := Opendialog1.FileName;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
        fmxutils.ExecuteFile('sxa51.exe',Form1.Asm_File.text+'>Output.txt','C:\CFM\sxa51',1);
        Memo1.Lines.LoadFromFile('C:\CFM\SXA51\Output.txt');
//        fmxutils.Executefile('notepad.exe','Output.txt','C:\CFM\SXA51',1);
//        close;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
        close;
end;

end.
