unit mainmenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ActnList, ExtCtrls, classmodule;

type
  Tmenuform = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  menuform: Tmenuform;
  student : Tstudent;

implementation

uses member, service, data;

{$R *.dfm}


procedure Tmenuform.Button4Click(Sender: TObject);
begin
	menuform.Close;
end;

procedure Tmenuform.Button1Click(Sender: TObject);
begin
	if (memberform = nil) then Application.CreateForm(Tmemberform,memberform);
   memberform.show;
   menuform.Hide;
end;

procedure Tmenuform.Button2Click(Sender: TObject);
begin
	if (serviceform = nil) then Application.CreateForm(Tserviceform,serviceform);
   serviceform.show;
   menuform.Hide;
end;

procedure Tmenuform.Button3Click(Sender: TObject);
begin
	if (dataform = nil) then Application.CreateForm(Tdataform,dataform);
   dataform.show;
   menuform.Hide;
end;

end.
