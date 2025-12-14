unit Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFrmmenu = class(TForm)
    GroupBox1: TGroupBox;
    btnreg: TButton;
    Button1: TButton;
    btnreq: TButton;
    btnpay: TButton;
    procedure btnregClick(Sender: TObject);
  //  procedure btnpayclick(Sender: TObject);
    procedure btndelClick(Sender: TObject);
    procedure btnreqClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmmenu: TFrmmenu;

implementation

uses Register, Order, Delete, Service, Request, Pay;

{$R *.dfm}

procedure TFrmmenu.btnregClick(Sender: TObject);
begin
  if (Frmregis = nil) then
  Application.CreateForm(TFrmregis,Frmregis);
  Frmregis.show; Frmmenu.Hide;
end;


procedure TFrmmenu.btndelClick(Sender: TObject);
begin
       if (Frmdel = nil) then
      Application.CreateForm(TFrmdel,Frmdel);
      Frmdel.show; Frmmenu.Hide;
end;

procedure TFrmmenu.btnreqClick(Sender: TObject);
begin
          if (Frmask = nil) then
      Application.CreateForm(TFrmask,Frmask);
      Frmask.show; Frmmenu.Hide;
end;

procedure TFrmmenu.Button1Click(Sender: TObject);
begin
        self.close;
end;

procedure TFrmmenu.Button2Click(Sender: TObject);
begin
           if (frmrequest = nil) then
      Application.CreateForm(Tfrmrequest,Frmrequest);
      Frmrequest.show; Frmmenu.Hide;
end;

procedure TFrmmenu.Button3Click(Sender: TObject);
begin
            if (frmpay = nil) then
      Application.CreateForm(Tfrmpay,Frmpay);
      Frmpay.show; Frmmenu.Hide;
end;

end.
