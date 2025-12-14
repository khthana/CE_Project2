unit Move_Department;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls;

type
  TFr_Move_Department = class(TForm)
    Label1: TLabel;
    Cb_Department_Name: TDBLookupComboBox;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_Move_Department: TFr_Move_Department;

implementation

uses DataModule, Main_Durable;

{$R *.DFM}

procedure TFr_Move_Department.Button1Click(Sender: TObject);
begin
     // Is User Select Department Name?
     if Cb_Department_Name.Text = '' then
     begin
          showmessage('กรุณาเลือกฝ่ายที่จะย้ายเจ้าหน้าที่ไป');
          exit;
     end;
     with DataModule1.Qr_Transaction do
     begin
          // Update Officer To New Department
          close;
          Params.Clear;
          SQL.Clear;
          SQL.Add('Update Officer');
          SQL.Add('Set Department_ID = :New_ID');
          SQL.Add('Where Department_ID = :ID');
          ParamByName('New_ID').AsInteger := Cb_Department_Name.KeyValue;
          ParamByName('ID').AsInteger := Fr_Durable.Department_ID;
          execSQL;
     end;
     Close;
end;

procedure TFr_Move_Department.Button2Click(Sender: TObject);
var Temp:String;
begin
     // Ask For Sure
     Temp := 'คุณแน่ใจหรือไม่ที่จะลบเจ้าหน้าที่' ;
     if MessageDlg(Temp,mtConfirmation,[mbYes,mbNo],0) = mrNo then exit;
     with DataModule1.Qr_Transaction do
     begin
          // Delete Officer Who In This Department
          close;
          Params.Clear;
          SQL.Clear;
          SQL.Add('Delete From Officer');
          SQL.Add('Where Department_ID = :ID');
          ParamByName('ID').AsInteger := Fr_Durable.Department_ID;
          execSQL;
     end;
     Close;
end;

end.
