unit NewFolder;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TForm5 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Click : Boolean;
  end;

var
  FormNewFolder: TForm5;

implementation

{$R *.DFM}

procedure TForm5.FormCreate(Sender: TObject);
begin
   Click := FALSE;
end;

procedure TForm5.BitBtn1Click(Sender: TObject);
begin
   Click := TRUE;
   FormNewFolder.Close;
end;

procedure TForm5.BitBtn2Click(Sender: TObject);
begin
   Click := FALSE;
   FormNewFolder.Close;
end;

end.
