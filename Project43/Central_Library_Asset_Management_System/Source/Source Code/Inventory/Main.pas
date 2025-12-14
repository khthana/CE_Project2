unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Grids, DBGrids, DBCtrls, Db, DBTables, Mask, DBCGrids,
  Buttons, Menus, CheckLst;

type
  TFr_Main = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Return_Name: TEdit;
    ReturnDepart: TDBLookupComboBox;
    TabSheet3: TTabSheet;
    GroupBox4: TGroupBox;
    Label21: TLabel;
    Bring_ID: TEdit;
    Label22: TLabel;
    Recieve_Name: TEdit;
    Label23: TLabel;
    Bring_Name: TEdit;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    TabSheet5: TTabSheet;
    PageControl2: TPageControl;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    Label28: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    CP_Addr: TDBMemo;
    CP_Tel1: TDBEdit;
    CP_Tel2: TDBEdit;
    CP_Tel3: TDBEdit;
    CP_Fax: TDBEdit;
    GroupBox5: TGroupBox;
    Inventory_List: TDBGrid;
    GroupBox7: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    GroupBox8: TGroupBox;
    DBG_Depart: TDBGrid;
    TabSheet9: TTabSheet;
    Label29: TLabel;
    LB_CompanyN: TDBLookupComboBox;
    Button3: TBitBtn;
    BtnClear: TBitBtn;
    TabSheet4: TTabSheet;
    Lv_Voucher_Detail: TListView;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StringGrid2: TStringGrid;
    President: TEdit;
    InvenOfficer: TEdit;
    InvenSec: TEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn11: TBitBtn;
    BringDate: TDateTimePicker;
    Date_Return: TDateTimePicker;
    BitBtn12: TBitBtn;
    StringGrid3: TStringGrid;
    Pay_Name: TEdit;
    Command_Pay: TEdit;
    Bring_Department: TDBLookupComboBox;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    ReTake: TEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    PageControl4: TPageControl;
    TabSheet13: TTabSheet;
    TabSheet14: TTabSheet;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Add_ID: TEdit;
    At: TEdit;
    Case_Buy: TEdit;
    Req_For: TEdit;
    Reason: TMemo;
    Day_Use: TEdit;
    MSource: TEdit;
    Referee1: TEdit;
    Referee3: TEdit;
    Referee2: TEdit;
    Date_Buy: TDateTimePicker;
    BitBtn10: TBitBtn;
    StringGrid1: TStringGrid;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Add_CP1: TButton;
    Respond_name: TEdit;
    LC_Company_Name: TDBLookupComboBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox3: TComboBox;
    ComboBox9: TComboBox;
    ComboBox10: TComboBox;
    ComboBox12: TComboBox;
    ComboBox11: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    ComboBox15: TComboBox;
    ComboBox14: TComboBox;
    ComboBox13: TComboBox;
    ComboBox16: TComboBox;
    ComboBox17: TComboBox;
    ComboBox18: TComboBox;
    ComboBox19: TComboBox;
    ComboBox20: TComboBox;
    ComboBox21: TComboBox;
    ComboBox22: TComboBox;
    ComboBox23: TComboBox;
    ComboBox24: TComboBox;
    ComboBox25: TComboBox;
    ComboBox26: TComboBox;
    ComboBox27: TComboBox;
    ComboBox28: TComboBox;
    ComboBox29: TComboBox;
    ComboBox30: TComboBox;
    ComboBox31: TComboBox;
    ComboBox32: TComboBox;
    ComboBox33: TComboBox;
    ComboBox34: TComboBox;
    ComboBox35: TComboBox;
    ComboBox36: TComboBox;
    ComboBox37: TComboBox;
    ComboBox38: TComboBox;
    ComboBox39: TComboBox;
    ComboBox40: TComboBox;
    ComboBox41: TComboBox;
    ComboBox42: TComboBox;
    ComboBox43: TComboBox;
    ComboBox44: TComboBox;
    ComboBox45: TComboBox;
    Label37: TLabel;
    RReason: TMemo;
    PageControl3: TPageControl;
    TabSheet10: TTabSheet;
    Label10: TLabel;
    Label36: TLabel;
    DBGrid1: TDBGrid;
    Type_Print: TButton;
    CkL_Type: TCheckListBox;
    BitBtn16: TBitBtn;
    CkL_Cat: TCheckListBox;
    TabSheet11: TTabSheet;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label38: TLabel;
    Bring_Show: TSpeedButton;
    Bring_Print: TButton;
    Ckl_Cat2: TCheckListBox;
    Ckl_Type2: TCheckListBox;
    CkL_Depart: TCheckListBox;
    Bring_D1: TDateTimePicker;
    Bring_D2: TDateTimePicker;
    TabSheet12: TTabSheet;
    Year_Report: TDBGrid;
    Year_Print: TButton;
    Bring_Report: TDBGrid;
    Temp_Date: TDateTimePicker;
    N4: TMenuItem;
    Money: TComboBox;
    Label43: TLabel;
    Code: TComboBox;
    Label44: TLabel;
    Edit1: TEdit;
    procedure TakeClick(Sender: TObject);
    procedure CP_AddClick(Sender: TObject);
    procedure CP_EditClick(Sender: TObject);
    procedure BuyClick(Sender: TObject);
    procedure CP_DelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Init1;
    procedure Init2;
    procedure Init3;
    procedure LC_Company_NameMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure LB_CompanyNMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button13Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure BtnEdit_VClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure TabSheet6Show(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure StringGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure PageControl1Enter(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure TabSheet7Show(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure Lv_Voucher_DetailDblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure TabSheet8Show(Sender: TObject);
    procedure TabSheet14Show(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure ComboBox7Change(Sender: TObject);
    procedure ComboBox8Change(Sender: TObject);
    procedure ComboBox9Change(Sender: TObject);
    procedure ComboBox10Change(Sender: TObject);
    procedure ComboBox11Change(Sender: TObject);
    procedure ComboBox12Change(Sender: TObject);
    procedure ComboBox13Change(Sender: TObject);
    procedure ComboBox14Change(Sender: TObject);
    procedure ComboBox15Change(Sender: TObject);
    procedure Day_UseExit(Sender: TObject);
    procedure Lv_Voucher_DetailKeyPress(Sender: TObject; var Key: Char);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure ComboBox16Change(Sender: TObject);
    procedure ComboBox17Change(Sender: TObject);
    procedure ComboBox18Change(Sender: TObject);
    procedure ComboBox19Change(Sender: TObject);
    procedure ComboBox20Change(Sender: TObject);
    procedure ComboBox21Change(Sender: TObject);
    procedure ComboBox22Change(Sender: TObject);
    procedure ComboBox23Change(Sender: TObject);
    procedure ComboBox24Change(Sender: TObject);
    procedure ComboBox25Change(Sender: TObject);
    procedure ComboBox26Change(Sender: TObject);
    procedure ComboBox27Change(Sender: TObject);
    procedure ComboBox28Change(Sender: TObject);
    procedure ComboBox29Change(Sender: TObject);
    procedure ComboBox30Change(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure ComboBox2DropDown(Sender: TObject);
    procedure ComboBox3DropDown(Sender: TObject);
    procedure ComboBox4DropDown(Sender: TObject);
    procedure ComboBox5DropDown(Sender: TObject);
    procedure ComboBox6DropDown(Sender: TObject);
    procedure ComboBox7DropDown(Sender: TObject);
    procedure ComboBox8DropDown(Sender: TObject);
    procedure ComboBox9DropDown(Sender: TObject);
    procedure ComboBox10DropDown(Sender: TObject);
    procedure ComboBox11DropDown(Sender: TObject);
    procedure ComboBox12DropDown(Sender: TObject);
    procedure ComboBox13DropDown(Sender: TObject);
    procedure ComboBox14DropDown(Sender: TObject);
    procedure ComboBox15DropDown(Sender: TObject);
    procedure ComboBox16DropDown(Sender: TObject);
    procedure ComboBox17DropDown(Sender: TObject);
    procedure ComboBox18DropDown(Sender: TObject);
    procedure ComboBox19DropDown(Sender: TObject);
    procedure ComboBox20DropDown(Sender: TObject);
    procedure ComboBox21DropDown(Sender: TObject);
    procedure ComboBox22DropDown(Sender: TObject);
    procedure ComboBox23DropDown(Sender: TObject);
    procedure ComboBox24DropDown(Sender: TObject);
    procedure ComboBox25DropDown(Sender: TObject);
    procedure ComboBox26DropDown(Sender: TObject);
    procedure ComboBox27DropDown(Sender: TObject);
    procedure ComboBox28DropDown(Sender: TObject);
    procedure ComboBox29DropDown(Sender: TObject);
    procedure ComboBox30DropDown(Sender: TObject);
    procedure ComboBox31DropDown(Sender: TObject);
    procedure ComboBox32DropDown(Sender: TObject);
    procedure ComboBox33DropDown(Sender: TObject);
    procedure ComboBox34DropDown(Sender: TObject);
    procedure ComboBox35DropDown(Sender: TObject);
    procedure ComboBox36DropDown(Sender: TObject);
    procedure ComboBox37DropDown(Sender: TObject);
    procedure ComboBox38DropDown(Sender: TObject);
    procedure ComboBox39DropDown(Sender: TObject);
    procedure ComboBox40DropDown(Sender: TObject);
    procedure ComboBox41DropDown(Sender: TObject);
    procedure ComboBox42DropDown(Sender: TObject);
    procedure ComboBox43Change(Sender: TObject);
    procedure ComboBox43DropDown(Sender: TObject);
    procedure ComboBox44Change(Sender: TObject);
    procedure ComboBox44DropDown(Sender: TObject);
    procedure ComboBox45Change(Sender: TObject);
    procedure ComboBox45DropDown(Sender: TObject);
    procedure ComboBox31Change(Sender: TObject);
    procedure ComboBox32Change(Sender: TObject);
    procedure ComboBox33Change(Sender: TObject);
    procedure ComboBox34Change(Sender: TObject);
    procedure ComboBox35Change(Sender: TObject);
    procedure ComboBox36Change(Sender: TObject);
    procedure ComboBox37Change(Sender: TObject);
    procedure ComboBox38Change(Sender: TObject);
    procedure ComboBox39Change(Sender: TObject);
    procedure ComboBox40Change(Sender: TObject);
    procedure ComboBox41Change(Sender: TObject);
    procedure ComboBox42Change(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox2Exit(Sender: TObject);
    procedure ComboBox3Exit(Sender: TObject);
    procedure ComboBox4Exit(Sender: TObject);
    procedure ComboBox5Exit(Sender: TObject);
    procedure ComboBox6Exit(Sender: TObject);
    procedure ComboBox7Exit(Sender: TObject);
    procedure ComboBox8Exit(Sender: TObject);
    procedure ComboBox9Exit(Sender: TObject);
    procedure ComboBox10Exit(Sender: TObject);
    procedure ComboBox11Exit(Sender: TObject);
    procedure ComboBox12Exit(Sender: TObject);
    procedure ComboBox13Exit(Sender: TObject);
    procedure ComboBox14Exit(Sender: TObject);
    procedure ComboBox15Exit(Sender: TObject);
    procedure ComboBox16Exit(Sender: TObject);
    procedure ComboBox17Exit(Sender: TObject);
    procedure ComboBox18Exit(Sender: TObject);
    procedure ComboBox19Exit(Sender: TObject);
    procedure ComboBox20Exit(Sender: TObject);
    procedure ComboBox21Exit(Sender: TObject);
    procedure ComboBox22Exit(Sender: TObject);
    procedure ComboBox23Exit(Sender: TObject);
    procedure ComboBox24Exit(Sender: TObject);
    procedure ComboBox25Exit(Sender: TObject);
    procedure ComboBox26Exit(Sender: TObject);
    procedure ComboBox27Exit(Sender: TObject);
    procedure ComboBox28Exit(Sender: TObject);
    procedure ComboBox29Exit(Sender: TObject);
    procedure ComboBox30Exit(Sender: TObject);
    procedure ComboBox31Exit(Sender: TObject);
    procedure ComboBox32Exit(Sender: TObject);
    procedure ComboBox33Exit(Sender: TObject);
    procedure ComboBox34Exit(Sender: TObject);
    procedure ComboBox35Exit(Sender: TObject);
    procedure ComboBox36Exit(Sender: TObject);
    procedure ComboBox37Exit(Sender: TObject);
    procedure ComboBox38Exit(Sender: TObject);
    procedure ComboBox39Exit(Sender: TObject);
    procedure ComboBox40Exit(Sender: TObject);
    procedure ComboBox41Exit(Sender: TObject);
    procedure ComboBox42Exit(Sender: TObject);
    procedure ComboBox43Exit(Sender: TObject);
    procedure ComboBox44Exit(Sender: TObject);
    procedure ComboBox45Exit(Sender: TObject);
    procedure StringGrid3KeyPress(Sender: TObject; var Key: Char);
    procedure CkL_CatClickCheck(Sender: TObject);
    procedure CkL_TypeClickCheck(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure CkL_DepartClickCheck(Sender: TObject);
    procedure Ckl_Cat2ClickCheck(Sender: TObject);
    procedure Ckl_Type2ClickCheck(Sender: TObject);
    procedure Bring_ShowClick(Sender: TObject);
    procedure TabSheet9Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure Bring_D1Change(Sender: TObject);
    procedure Bring_D2Change(Sender: TObject);
    procedure TabSheet11Show(Sender: TObject);
    procedure Bring_PrintClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Type_PrintClick(Sender: TObject);
    procedure Year_PrintClick(Sender: TObject);
    procedure TabSheet12Show(Sender: TObject);

  private
    { Private declarations }
  public
     Update : Boolean;
     //Update_Type : Boolean;
     Update_Depart : Boolean;
     Old_Name : String;
     Insert2 : Boolean;
     Update_V : Boolean;
     Officer_Flag : Boolean;
     Inven_Change : Boolean;
     Inven_Change2 : Boolean;
     Inven_Change3 : Boolean;
    { Public declarations }
  end;
var
     Fr_Main: TFr_Main;
     Procedure Refresh_LV_Voucher_Detail;
implementation

uses Recieve, TypeAdd, DataModule, CompanyDetail, Depart, InventoryDetail,
  Buy_Detail, EditVoucher, Print_Bring, Edit_Inven, Print_Inven_Cat,
  Print_Year;

{$R *.DFM}

procedure TFr_Main.Init1;
var   i,j : integer;
begin
        Date_Buy.date := date;
        //Set Text
        Add_ID.text := '';
        At.Text := '';
        Case_Buy.Text := '';
        Req_For.Text := '';
        Reason.Text := '';
        Day_Use.Text := '';
        Msource.Text := '';
        Referee1.Text := '';
        Referee2.Text := '';
        Referee3.Text := '';
        Respond_Name.Text := '';
        LC_Company_Name.KeyValue := 0;
        i := 1;
        while i < 16 do
        begin
             j := 1;
             while j < 6 do
             begin
                  StringGrid1.Cells[j,i] := '';
                  j:=j+1;
             end;
             i := i+1;
        end;
        Fr_Main.Update_Depart := False;
        Fr_Main.StringGrid1.Cells[0,0] := '   ลำดับ';
        Fr_Main.StringGrid1.Cells[1,0] := '   จำนวน';
        Fr_Main.StringGrid1.Cells[2,0] := '                            รายการและขนาด';
        Fr_Main.StringGrid1.Cells[3,0] := ' ราคาต่อหน่วย';
        Fr_Main.StringGrid1.Cells[4,0] := '  VAT(%)';
        Fr_Main.StringGrid1.Cells[5,0] := '   ราคาซื้อ';
        Fr_Main.StringGrid1.Cells[0,1] := '      1';
        Fr_Main.StringGrid1.Cells[0,2] := '      2';
        Fr_Main.StringGrid1.Cells[0,3] := '      3';
        Fr_Main.StringGrid1.Cells[0,4] := '      4';
        Fr_Main.StringGrid1.Cells[0,5] := '      5';
        Fr_Main.StringGrid1.Cells[0,6] := '      6';
        Fr_Main.StringGrid1.Cells[0,7] := '      7';
        Fr_Main.StringGrid1.Cells[0,8] := '      8';
        Fr_Main.StringGrid1.Cells[0,9] := '      9';
        Fr_Main.StringGrid1.Cells[0,10] := '     10';
        Fr_Main.StringGrid1.Cells[0,11] := '     11';
        Fr_Main.StringGrid1.Cells[0,12] := '     12';
        Fr_Main.StringGrid1.Cells[0,13] := '     13';
        Fr_Main.StringGrid1.Cells[0,14] := '     14';
        Fr_Main.StringGrid1.Cells[0,15] := '     15';
        Fr_Main.ComboBox1.ItemIndex := -1;
        Fr_Main.ComboBox2.ItemIndex := -1;
        Fr_Main.ComboBox3.ItemIndex := -1;
        Fr_Main.ComboBox4.ItemIndex := -1;
        Fr_Main.ComboBox5.ItemIndex := -1;
        Fr_Main.ComboBox6.ItemIndex := -1;
        Fr_Main.ComboBox7.ItemIndex := -1;
        Fr_Main.ComboBox8.ItemIndex := -1;
        Fr_Main.ComboBox9.ItemIndex := -1;
        Fr_Main.ComboBox10.ItemIndex := -1;
        Fr_Main.ComboBox11.ItemIndex := -1;
        Fr_Main.ComboBox12.ItemIndex := -1;
        Fr_Main.ComboBox13.ItemIndex := -1;
        Fr_Main.ComboBox14.ItemIndex := -1;
        Fr_Main.ComboBox15.ItemIndex := -1;
        Fr_Main.PageControl4.ActivePageIndex := 0;
end;

procedure TFr_Main.Init2;
var SystemTime: TSystemTime;
  i,j : integer;
begin
        Fr_Main.StringGrid2.Cells[0,0] := '   ลำดับ';
        Fr_Main.StringGrid2.Cells[1,0] := '                            รายการและขนาด';
        Fr_Main.StringGrid2.Cells[2,0] := '   จำนวน';
        Fr_Main.StringGrid2.Cells[0,1] := '     1';
        Fr_Main.StringGrid2.Cells[0,2] := '     2';
        Fr_Main.StringGrid2.Cells[0,3] := '     3';
        Fr_Main.StringGrid2.Cells[0,4] := '     4';
        Fr_Main.StringGrid2.Cells[0,5] := '     5';
        Fr_Main.StringGrid2.Cells[0,6] := '     6';
        Fr_Main.StringGrid2.Cells[0,7] := '     7';
        Fr_Main.StringGrid2.Cells[0,8] := '     8';
        Fr_Main.StringGrid2.Cells[0,9] := '     9';
        Fr_Main.StringGrid2.Cells[0,10] := '    10';
        Fr_Main.StringGrid2.Cells[0,11] := '    11';
        Fr_Main.StringGrid2.Cells[0,12] := '    12';
        Fr_Main.StringGrid2.Cells[0,13] := '    13';
        Fr_Main.StringGrid2.Cells[0,14] := '    14';
        Fr_Main.StringGrid2.Cells[0,15] := '    15';
        Bring_ID.Text :='';
        Bring_Name.Text := '';
        Recieve_Name.Text := '';
        Bring_Department.KeyValue := 0;
        GetLocalTime(SystemTime);
        BringDate.DateTime := SystemTimeToDateTime(SystemTime);
        with DM.Qr_Transaction do
        begin
             Close;
             SQL.Text := 'Select * From Officer';
             open;
             Pay_Name.Text := FieldValues['InvenSec'];
             Command_Pay.Text := FieldValues['President'];
        i := 1;
        while i < 16 do
        begin
             j := 1;
             while j < 3 do
             begin
                  StringGrid2.Cells[j,i] := '';
                  j:=j+1;
             end;
             i := i+1;
        end;
     end;{with}
     Fr_Main.ComboBox16.ItemIndex := -1;
     Fr_Main.ComboBox17.ItemIndex := -1;
     Fr_Main.ComboBox18.ItemIndex := -1;
     Fr_Main.ComboBox19.ItemIndex := -1;
     Fr_Main.ComboBox20.ItemIndex := -1;
     Fr_Main.ComboBox21.ItemIndex := -1;
     Fr_Main.ComboBox22.ItemIndex := -1;
     Fr_Main.ComboBox23.ItemIndex := -1;
     Fr_Main.ComboBox24.ItemIndex := -1;
     Fr_Main.ComboBox25.ItemIndex := -1;
     Fr_Main.ComboBox26.ItemIndex := -1;
     Fr_Main.ComboBox27.ItemIndex := -1;
     Fr_Main.ComboBox28.ItemIndex := -1;
     Fr_Main.ComboBox29.ItemIndex := -1;
     Fr_Main.ComboBox30.ItemIndex := -1;
end;

procedure TFr_Main.Init3;
var SystemTime: TSystemTime;
  i,j : integer;
begin
        Fr_Main.StringGrid3.Cells[0,0] := '   ลำดับ';
        Fr_Main.StringGrid3.Cells[1,0] := '                            รายการและขนาด';
        Fr_Main.StringGrid3.Cells[2,0] := '   จำนวน';
        Fr_Main.StringGrid3.Cells[0,1] := '     1';
        Fr_Main.StringGrid3.Cells[0,2] := '     2';
        Fr_Main.StringGrid3.Cells[0,3] := '     3';
        Fr_Main.StringGrid3.Cells[0,4] := '     4';
        Fr_Main.StringGrid3.Cells[0,5] := '     5';
        Fr_Main.StringGrid3.Cells[0,6] := '     6';
        Fr_Main.StringGrid3.Cells[0,7] := '     7';
        Fr_Main.StringGrid3.Cells[0,8] := '     8';
        Fr_Main.StringGrid3.Cells[0,9] := '     9';
        Fr_Main.StringGrid3.Cells[0,10] := '    10';
        Fr_Main.StringGrid3.Cells[0,11] := '    11';
        Fr_Main.StringGrid3.Cells[0,12] := '    12';
        Fr_Main.StringGrid3.Cells[0,13] := '    13';
        Fr_Main.StringGrid3.Cells[0,14] := '    14';
        Fr_Main.StringGrid3.Cells[0,15] := '    15';
        Return_Name.Text :='';
        ReturnDepart.KeyValue := 0;
        GetLocalTime(SystemTime);
        Date_Return.DateTime := SystemTimeToDateTime(SystemTime);
        with DM.Qr_Transaction do
        begin
             Close;
             SQL.Text := 'Select * From Officer';
             open;
             ReTake.Text := FieldValues['InvenSec'];
        i := 1;
        while i < 16 do
        begin
             j := 1;
             while j < 3 do
             begin
                  StringGrid3.Cells[j,i] := '';
                  j:=j+1;
             end;
             i := i+1;
        end;
     end;{with}
     Fr_Main.ComboBox31.ItemIndex := -1;
     Fr_Main.ComboBox32.ItemIndex := -1;
     Fr_Main.ComboBox33.ItemIndex := -1;
     Fr_Main.ComboBox34.ItemIndex := -1;
     Fr_Main.ComboBox35.ItemIndex := -1;
     Fr_Main.ComboBox36.ItemIndex := -1;
     Fr_Main.ComboBox37.ItemIndex := -1;
     Fr_Main.ComboBox38.ItemIndex := -1;
     Fr_Main.ComboBox39.ItemIndex := -1;
     Fr_Main.ComboBox40.ItemIndex := -1;
     Fr_Main.ComboBox41.ItemIndex := -1;
     Fr_Main.ComboBox42.ItemIndex := -1;
     Fr_Main.ComboBox43.ItemIndex := -1;
     Fr_Main.ComboBox44.ItemIndex := -1;
     Fr_Main.ComboBox45.ItemIndex := -1;
end;

procedure TFr_Main.TakeClick(Sender: TObject);
begin
        Fr_Recieve.ShowModal;
end;

procedure TFr_Main.CP_AddClick(Sender: TObject);
begin
     Fr_Company.Ed_Company_Name.Text:='';
     Fr_Company.Mm_Address.Text:='';
     Fr_Company.Ed_Phone1.Text:='';
     Fr_Company.Ed_Phone2.Text:='';
     Fr_Company.Ed_Phone3.Text:='';
     Fr_Company.Ed_Fax.Text:='';
     Fr_Company.Update_Flag := False;
     Fr_Company.ShowModal;
end;

procedure TFr_Main.CP_EditClick(Sender: TObject);
begin
     if LB_CompanyN.Text = '' then
     begin
          Showmessage('กรุณาเลือกบริษัทที่จะแก้ไข');
          exit;
     end;
     with DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          SQL.Add('Select * From Company');
          SQL.Add('Where Company_Name = '+Char(39) +LB_CompanyN.Text+Char(39));
          Open;
          Fr_Company.Ed_Company_Name.Text:= FieldValues['Company_Name'];
          Fr_Company.Mm_Address.Text:=FieldValues['Address'];
          Fr_Company.Ed_Phone1.Text:=FieldValues['Phone1'];
          Fr_Company.Ed_Phone2.Text:=FieldValues['Phone2'];
          Fr_Company.Ed_Phone3.Text:=FieldValues['Phone3'];
          Fr_Company.Ed_Fax.Text:=FieldValues['Fax'];
          Fr_Company.Company_ID:=FieldValues['Company_ID'];
          Fr_Company.Update_Flag := True;
          Fr_Company.ShowModal;
     end;
end;

procedure TFr_Main.BuyClick(Sender: TObject);
var Company_ID : String;
begin
        if Add_ID.Text = '' then
        begin
                Showmessage('กรุณาใส่เลขที่ใบสำคัญ');
                init1;
                exit;
        end;
        with DM.Qr_Transaction do
        begin
                Close;
                SQL.Text := 'select Voucher_ID from Voucher where Voucher_ID = ' +char(39) +Add_ID.Text +char(39);
                Open;
                if FieldValues['Voucher_ID'] <> null then
                begin
                        Init1;
                        with Dm.Qr_Transaction do
                        begin
                                close;
                                SQL.Text := 'select * from Voucher where Voucher_ID = '+char(39)+Add_ID.Text+char(39);
                                Open;
                                At.Text := FieldValues['At'];
                                Case_Buy.Text := FieldValues['Case_Buy'];
                                Req_For.Text := FieldValues['Req_For'];
                                Reason.Text := FieldValues['Reason'];
                                Day_Use.Text := IntToStr(FieldValues['Day_Use']);
                                Msource.Text := FieldValues['Msource'];
                                Referee1.Text := FieldValues['Referee1'];
                                Referee2.Text := FieldValues['Referee2'];
                                Referee3.Text := FieldValues['Referee3'];
                                Respond_Name.Text := FieldValues['Respond_Name'];
                                Company_ID := FieldValues['Company_ID'];
                                //if  FieldValues['Invoice_NO'] = null then Take.Enabled := True;
                                //Close;
                                //SQL.Text := 'Select * from Company where Company_ID ='+ Company_ID;
                                //Open;
                                //if FieldValues['Company_Name'] = null then ED_Company_Name.Text := 'รายชื่อบริษัทถูกลบทิ้งไปแล้ว'
                                //else ED_Company_Name.Text := FieldValues['Company_Name'];
                                //showmessage('มีเลขใบสั่งซื้อนี้ในฐานข้อมูลแล้ว');
                                //exit;
                        end
                end;
        end;
end;

procedure TFr_Main.CP_DelClick(Sender: TObject);
var Temp : String;
begin
     if LB_CompanyN.Text = '' then
     begin
          Showmessage('กรุณาเลือกบริษัทที่จะลบ');
          exit;
     end;
     Temp := 'คุณแน่ใจหรือไม่ที่จะลบ ' + LB_CompanyN.Text;
     if MessageDlg(Temp,mtConfirmation,[mbYes,mbNo],0) = mrNo then exit;
     DM.Database1.StartTransaction;
     try
         with DM.Qr_Transaction do
         begin
              close;
              Params.Clear;
              SQL.Clear;
              SQL.Add('Delete From Company');
              SQL.Add('Where Company_Name = :Name');
              ParamByName('Name').AsString := LB_CompanyN.Text;
              execSQL;
         end;
         DM.Database1.Commit;
         showmessage('ลบบริษัทเรียบร้อย');
     except
         showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
         DM.Database1.Rollback;
     raise;
     end;
    DM.Qr_Company.Close;
    DM.Qr_Company.Open;
    CP_Addr.Text := '';
    CP_Tel1.Text := '';
    CP_Tel2.Text := '';
    CP_Tel3.Text := '';
    CP_Fax.Text := '';
    end;

procedure TFr_Main.FormCreate(Sender: TObject);
Begin
     Reason.Text := '';
     Fr_Main.Update := False;
     Fr_Main.Insert2 := False;
     Fr_Main.Update_Depart := False;
     with DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          Params.Clear;
          SQL.text := 'Select Distinct Inventory_Name From Inventory';
          Open;
     end;
     ComboBox1.Items.Clear;
     while not DM.Qr_Transaction.Eof do
     begin
          with DM.Qr_Transaction do
          begin
               Combobox1.Items.Add(FieldValues['Inventory_Name']);
               DM.Qr_Transaction.Next;
          end;
          ComboBox2.Items := ComboBox1.Items;
          ComboBox3.Items := ComboBox1.Items;
          ComboBox4.Items := ComboBox1.Items;
          ComboBox5.Items := ComboBox1.Items;
          ComboBox6.Items := ComboBox1.Items;
          ComboBox7.Items := ComboBox1.Items;
          ComboBox8.Items := ComboBox1.Items;
          ComboBox9.Items := ComboBox1.Items;
          ComboBox10.Items := ComboBox1.Items;
          ComboBox11.Items := ComboBox1.Items;
          ComboBox12.Items := ComboBox1.Items;
          ComboBox13.Items := ComboBox1.Items;
          ComboBox14.Items := ComboBox1.Items;
          ComboBox15.Items := ComboBox1.Items;
          ComboBox16.Items := ComboBox1.Items;
          ComboBox17.Items := ComboBox1.Items;
          ComboBox18.Items := ComboBox1.Items;
          ComboBox19.Items := ComboBox1.Items;
          ComboBox20.Items := ComboBox1.Items;
          ComboBox21.Items := ComboBox1.Items;
          ComboBox22.Items := ComboBox1.Items;
          ComboBox23.Items := ComboBox1.Items;
          ComboBox24.Items := ComboBox1.Items;
          ComboBox25.Items := ComboBox1.Items;
          ComboBox26.Items := ComboBox1.Items;
          ComboBox27.Items := ComboBox1.Items;
          ComboBox28.Items := ComboBox1.Items;
          ComboBox29.Items := ComboBox1.Items;
          ComboBox30.Items := ComboBox1.Items;
          ComboBox31.Items := ComboBox1.Items;
          ComboBox32.Items := ComboBox1.Items;
          ComboBox33.Items := ComboBox1.Items;
          ComboBox34.Items := ComboBox1.Items;
          ComboBox35.Items := ComboBox1.Items;
          ComboBox36.Items := ComboBox1.Items;
          ComboBox37.Items := ComboBox1.Items;
          ComboBox38.Items := ComboBox1.Items;
          ComboBox39.Items := ComboBox1.Items;
          ComboBox40.Items := ComboBox1.Items;
          ComboBox41.Items := ComboBox1.Items;
          ComboBox42.Items := ComboBox1.Items;
          ComboBox43.Items := ComboBox1.Items;    
     end;
     Inven_Change := False;
     Inven_Change2 := False;
     Inven_Change3 := False;
end;

procedure TFr_Main.BtnDelClick(Sender: TObject);
begin
    if MessageDlg('!!! คุณแน่ใจที่จะลบข้อมูลบันทึกรายงานขอซื้อ '+Add_ID.Text+' !!!',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DM.Database1.StartTransaction;
    try
         with DM.Qr_Transaction do
         begin
              SQL.Text := 'select Invoice_ID from buy_detail where Voucher_ID ='+char(39)+ Add_ID.text +Char(39);
              open;
              if FieldValues['Invoice_ID'] <> null
              then
                  begin
                  Showmessage('!!!ข้อมูลบันทึกรายงานขอซื้อ '+Add_ID.Text+' มีบัญทึกการรับของแล้ว!!!');
                  Init1;
                  exit;
                  end
              else
                  begin
                  close;
                  Params.Clear;
                  SQL.Clear;
                  SQL.Add('Delete From Voucher');
                  SQL.Add('Where Voucher_ID = '+char(39)+Add_ID.Text+char(39));
                  execSQL;

                  Close;
                  Params.Clear;
                  SQL.Clear;
                  SQL.Add('Delete From Buy_detail');
                  SQL.Add('Where Voucher_ID = '+char(39)+Add_ID.Text+char(39));
                  execSQL;
         end;
         end;
         DM.Database1.Commit;
         Showmessage ('ลบรายงานขอซื้อเรียบร้อยแล้ว');
         Except
               Showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
               DM.Database1.Rollback;
         raise;
         Add_ID.Text := '';
         init1;
    end;
  end;

end;




procedure TFr_Main.Button4Click(Sender: TObject);
begin
        Init1;
end;

procedure TFr_Main.LC_Company_NameMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        LC_Company_Name.KeyValue := 0;
end;

procedure TFr_Main.LB_CompanyNMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        LB_CompanyN.KeyValue := 0;
        CP_addr.Text := '';
        CP_Tel1.Text := '';
        CP_Tel2.Text := '';
        CP_Tel3.Text := '';
        CP_Fax.Text := '';
end;
procedure TFr_Main.Button13Click(Sender: TObject);
begin
     Fr_Depart.Ed_Add_Depart.Text:='';
     Fr_Depart.ShowModal;
end;

procedure TFr_Main.Button10Click(Sender: TObject);
begin
       Fr_Type.Ed_Type_Name.Text := '';
       Fr_Type.DBL_Cat.Items.Clear;
       Fr_Type.DBL_Cat.Text := '';
       Fr_Type.DBL_Cat.Text := '';
  //     DM.Qr_Type.Active := True;
       with DM.Qr_Transaction do
            begin
                    Close;
                    SQL.Clear;
                    Params.Clear;
                    SQL.text := 'Select Distinct Category From Type';
                    Open;
            end;
       while not DM.Qr_Transaction.Eof do
       begin
            with DM.Qr_Transaction do
            Fr_type.DBL_Cat.Items.Add(FieldValues['Category']);
            DM.Qr_Transaction.Next;
       end;
       DM.Qr_Transaction.close;
       Fr_Type.ShowModal;
end;

procedure TFr_Main.Button14Click(Sender: TObject);
begin
     if DBG_Depart.Fields[0].Text = ''
     Then
          Begin
          Showmessage('กรุณาเลือกชนิดที่จะแก้ไข');
          exit;
          end;
     Fr_Depart.Ed_Add_Depart.text := DBG_Depart.Fields[0].Text;
     Fr_Depart.Old_Name := Fr_Depart.Ed_Add_Depart.text;
     Fr_Main.Update_Depart := True;
     Fr_Depart.ShowModal;
     Fr_Main.Update_Depart := False;
     end;

procedure TFr_Main.Button15Click(Sender: TObject);
Var  Depart_Name : String;
     Temp  : String;
begin
     Depart_Name := DBG_Depart.Fields[0].Text;
     if Depart_Name = '' then
     begin
          Showmessage('กรุณาเลือกฝ่ายที่จะลบ');
          exit;
     end;
     Temp := 'คุณแน่ใจหรือไม่ที่จะลบ ' + Depart_Name;
     if MessageDlg(Temp,mtConfirmation,[mbYes,mbNo],0) = mrNo then exit;
     DM.Database1.StartTransaction;
     try
         with DM.Qr_Transaction do
         begin
              close;
              Params.Clear;
              SQL.Clear;
              SQL.Add('Delete From Department');
              SQL.Add('Where Department_Name = :Name');
              ParamByName('Name').AsString := Depart_Name;
              execSQL;
         end;
         DM.Database1.Commit;
         showmessage('ลบฝ่ายเรียบร้อย');
     except
         showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
         DM.Database1.Rollback;
     raise;
     end;
end;

procedure TFr_Main.BtnEdit_VClick(Sender: TObject);
begin
{     Update_V := true;
     //Showmessage ('ยังไม่มีข้อมูล');
     Date_Buy.Date := StrToDate(Ed_Date.Text);
     Date_Buy.Enabled := True;}
end;

procedure TFr_Main.Button8Click(Sender: TObject);
begin
     Fr_Main.Update :=  false;
     Fr_Inventory.Ed_Type_Name.Text := '';
     Fr_Type.DBL_Cat.Items.Clear;
     Fr_Type.DBL_Cat.Text := '';
   //  DM.Qr_Type.Active := True;
     with DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          Params.Clear;
          SQL.text := 'Select Distinct Category From Inventory';
          Open;
     end;
     Fr_Inventory.DBL_Cat.Items.Clear;
     while not DM.Qr_Transaction.Eof do
     begin
          with DM.Qr_Transaction do
          Fr_Inventory.DBL_Cat.Items.Add(FieldValues['Category']);
          DM.Qr_Transaction.Next;
     end;
     DM.Qr_Transaction.close;
     Fr_Inventory.Ed_No.Text := '0';
     Fr_Inventory.Ed_Enum.Text := '';
     Fr_Inventory.Ed_MinNo.Text := '0';
     Fr_Inventory.Ed_Ppe.Text := '0';
     Fr_Inventory.ShowModal;
end;

procedure TFr_Main.Button1Click(Sender: TObject);
var I_name : String;
begin
     I_Name := Inventory_List.Fields[0].Text;
     if I_Name = ''
     Then
          Begin
          Showmessage('กรุณาเลือกวัสดุที่จะแก้ไข');
          exit;
          end;
     Fr_Inventory.Ed_Type_Name.Text := I_name;
     with DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          Params.Clear;
          SQL.text := 'Select Distinct Category From Inventory';
          Open;
     end;
     Fr_Inventory.DBL_Cat.Items.Clear;
     while not DM.Qr_Transaction.Eof do
     begin
          with DM.Qr_Transaction do
          Fr_Inventory.DBL_Cat.Items.Add(FieldValues['Category']);
          DM.Qr_Transaction.Next;
     end;
     Fr_Inventory.DBL_Cat.text := (Inventory_List.Fields[1].Text);
     Fr_Inventory.Ed_No.Text := (Inventory_List.Fields[2].Text);
     Fr_Inventory.Ed_Enum.Text := Inventory_List.Fields[3].Text;
     Fr_Inventory.Ed_MinNo.Text := (Inventory_List.Fields[4].Text);
     Fr_Inventory.Ed_Ppe.Text := (Inventory_List.Fields[5].Text);
     Fr_Main.Update := True;
     Fr_Inventory.ShowModal;
     Fr_Main.Insert2 := false;
end;

procedure TFr_Main.Button9Click(Sender: TObject);
Var  I_Name : String;
     Temp  : String;
begin
     I_Name := Inventory_List.Fields[0].Text;
     if I_Name = '' then
     begin
          Showmessage('กรุณาเลือกวัสดุที่จะลบ');
          exit;
     end;
     Temp := 'คุณแน่ใจหรือไม่ที่จะลบ ' + I_Name;
     if MessageDlg(Temp,mtConfirmation,[mbYes,mbNo],0) = mrNo then exit;
     DM.Database1.StartTransaction;
     try
         with DM.Qr_Transaction do
         begin
              close;
              Params.Clear;
              SQL.Clear;
              SQL.Add('Delete From Inventory');
              SQL.Add('Where Inventory_Name = :Name');
              ParamByName('Name').AsString := I_Name;
              execSQL;
         end;
         DM.Database1.Commit;
         showmessage('ลบวัสดุเรียบร้อย');
     except
         showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
         DM.Database1.Rollback;
     raise;
     end;
     DM.Qr_Inventory_Detail.close;
     DM.Qr_Inventory_Detail.Open;
end;

procedure TFr_Main.Button3Click(Sender: TObject);
Var Company_ID : String;
    I,j,I_ID : integer;
    InvenAdd : Boolean;
begin
        if Add_ID.Text = '' then
        begin
                Showmessage('กรุณาใส่เลขที่ใบสำคัญ');
                init1;
                Add_ID.SetFocus;
                PageControl4.ActivePageIndex := 0;
                exit;
        end;
        if Update_V = false
        then
        With DM.Qr_Transaction do
        begin
             Close;
             SQL.Text := 'Select Voucher_ID from Voucher where Voucher_ID = ' +char(39) +Add_ID.Text +char(39);
             Open;
             if FieldValues['Voucher_ID'] <> null then
             begin
                  Showmessage ('มีใบสั่งซื้อนี้ในฐานข้อมูลแล้ว');
                  Add_ID.SetFocus;
                  exit;
             end;
             if LC_Company_Name.Text = '' then
             begin
                    Showmessage ('กรุณาเลือกบริษัท');
                    PageControl4.ActivePageIndex := 0;
                    LC_Company_Name.SetFocus;
                    exit;
             end;
             If Money.Text = '' then MSource.Text := ''
             else if code.text = '' then
                  begin
                       Showmessage ('กรุณาเลือกหรือใส่รหัส');
                       PageControl4.ActivePageIndex := 0;
                       Code.SetFocus;
                       exit;
                  end
                  else if Edit1.text = '' then
                       begin
                            Showmessage ('กรุณาใส่หมวดค่า');
                            PageControl4.ActivePageIndex := 0;
                            Edit1.SetFocus;
                            exit;
                       end
                       else MSource.Text := Money.Text +' รหัส '+ code.Text+' หมวดค่า '+Edit1.Text;


             InvenAdd := False;
             i := 1;
             while (i < 16) and (InvenAdd = False) do
             begin
                    j := 1;
                    while (j < 6) and (InvenAdd = False) do
                    begin
                         if StringGrid1.Cells[j,i] <> '' then InvenAdd := True;
                         j:=j+1;
                    end;
                    i := i+1;
             end;
                          if InvenAdd = False then
             begin
             ShowMessage('กรุณาใส่รายการวัสดุ');
             PageControl4.ActivePageIndex := 1;
             exit;
             end;
             i:=1;
             while {(StringGrid1.Cells[2,i] <> '') and} (i < 16) do
             begin
                    if not((StringGrid1.Cells[1,i] = '') and (StringGrid1.Cells[2,i] = '') and (StringGrid1.Cells[3,i] = '') and (StringGrid1.Cells[4,i] = '')) then
                    Begin
                         Close;
                         SQL.Text:='select Inventory_ID from Inventory where Inventory_Name ='+ char(39) +Trim(StringGrid1.Cells[2,i]) + Char(39);
                         Open;
                         if FieldValues['Inventory_ID'] = null then
                         begin
                              Close;
                              SQL.Clear;
                              Showmessage('ไม่พบวัสดุภัณฑ์ชื่อ '+Trim(StringGrid1.Cells[2,i])+' ในฐานข้อมูล');
                              StringGrid1.SetFocus;
                              exit;
                         end;
                    end;
                    i:=i+1;
             End;
             DM.Database1.StartTransaction;
             try
             With DM.Qr_Transaction do
                  if Update_V = false then
                  begin
                       Close;
                       SQL.Clear;
                       SQL.Add('Insert into Voucher');
                       SQL.Add('(Voucher_ID,AT,Case_Buy,Date_Buy,Req_For,Reason,Day_Use,MSource,Referee1,Referee2,Referee3,Company_ID,Respond_Name)');
                       SQL.Add('Values (:VNO,:AT,:Case,:DB,:Req,:Reason,:Day,:MS,:Ref1,:Ref2,:Ref3,:Com_ID,:Respon)');
                       ParamByName('VNO').AsString := Add_ID.Text;
                       ParamByName('AT').AsString := AT.Text;
                       ParamByName('DB').AsDateTime := Date_Buy.DateTime;
                       ParamByName('Case').AsString := Case_Buy.Text;
                       ParamByName('Req').AsString := Req_For.Text;
                       ParamByName('Reason').AsString := Reason.Text;
                       ParamByName('Day').AsInteger := StrToIntDef(Day_Use.Text,0);
                       ParamByName('MS').AsString := MSource.Text;
                       ParamByName('Ref1').AsString := Referee1.Text;
                       ParamByName('Ref2').AsString := Referee2.Text;
                       ParamByName('Ref3').AsString := Referee3.Text;
                       ParamByName('Com_ID').AsInteger := LC_Company_Name.KeyValue;
                       ParamByName('Respon').AsString := Respond_Name.Text;
                       execSQL;
                       i:=1;
                       //I_ID:=-1;
                       j:=1;
                       while {(StringGrid1.Cells[2,i] <> '') and} (i < 16) do
                       begin
                            if not((StringGrid1.Cells[1,i] = '') and (StringGrid1.Cells[2,i] = '') and (StringGrid1.Cells[3,i] = '') and (StringGrid1.Cells[4,i] = '')) then
                            begin
                                   Close;
                                   SQL.Text:='select Inventory_ID from Inventory where Inventory_Name ='+ char(39) +Trim(StringGrid1.Cells[2,i]) + Char(39);
                                   Open;
                                   I_ID := FieldValues['Inventory_ID'];
                                   if (StringGrid1.Cells[1,i] = '') or (StringGrid1.Cells[3,i] = '') or (StringGrid1.Cells[4,i] = '')  then
                                   begin
                                        Showmessage('กรุณาใส่ข้อมูลของรายการ '+Trim(StringGrid1.Cells[2,i]));
                                        Close;
                                        DM.Database1.Rollback;
                                        exit;
                                   end;
                                   Close;
                                   SQL.Clear;
                                   SQL.Add('Insert into Buy_detail');
                                   SQL.Add('(Voucher_ID,Order_No,Buy_No,Inventory_ID,PPE_Buy,VAT,TotalBuy)');
                                   SQL.Add('Values (:VNO,:ON,:BN,:IID,:PPE,:VAT,:TB)');
                                   ParamByName('VNO').AsString := Add_ID.Text;
                                   ParamByName('ON').AsInteger := j;
                                   ParamByName('BN').AsInteger := StrToInt(StringGrid1.Cells[1,i]);
                                   ParamByName('IID').AsInteger := I_ID;
                                   ParamByName('PPE').AsFloat := StrToFloat(StringGrid1.Cells[3,i]);
                                   ParamByName('VAT').AsInteger := StrToInt(StringGrid1.Cells[4,i]);
                                   ParamByName('TB').AsFloat := Trunc(((StrToFloat(StringGrid1.Cells[1,i])*StrToInt(StringGrid1.Cells[3,i]))));
                                   execSQL;
                                   j:=j+1;
                            end;
                            i:=i+1;

                       end;
                       init1;
                  end; {with-if}
                  DM.Database1.Commit;
                  Showmessage ('บันทึกรายงานขอซื้อเรียบร้อยแล้ว');
                  Init1;
             Except
                   Showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
                   DM.Database1.Rollback;
                   Raise;
             end; {Try}
             DM.Qr_Company.Close;
             DM.Qr_Company.Open;
             //Set Text
                        Add_ID.Text :='';
                        At.Text := '';
                        Case_Buy.Text := '';
                        Req_For.Text := '';
                        Reason.Text := '';
                        Day_Use.Text := '';
                        Msource.Text := '';
                        Referee1.Text := '';
                        Referee2.Text := '';
                        Referee3.Text := '';
                        Respond_Name.Text := '';
                        Company_ID := '';
        end;{with - then}
        Update_V := False;
        Init1;
end;

procedure TFr_Main.BtnClearClick(Sender: TObject);
begin
     Init1;
end;

procedure TFr_Main.TabSheet3Show(Sender: TObject);
begin
     if not (Inven_Change2) then exit;
     with DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          Params.Clear;
          SQL.text := 'Select Distinct Inventory_Name From Inventory';
          Open;
     end;
     ComboBox16.Items.Clear;
     while not DM.Qr_Transaction.Eof do
     begin
          with DM.Qr_Transaction do
          begin
               Combobox16.Items.Add(FieldValues['Inventory_Name']);
               DM.Qr_Transaction.Next;
          end;
          ComboBox17.Items := ComboBox16.Items;
          ComboBox18.Items := ComboBox16.Items;
          ComboBox19.Items := ComboBox16.Items;
          ComboBox20.Items := ComboBox16.Items;
          ComboBox21.Items := ComboBox16.Items;
          ComboBox21.Items := ComboBox16.Items;
          ComboBox23.Items := ComboBox16.Items;
          ComboBox24.Items := ComboBox16.Items;
          ComboBox25.Items := ComboBox16.Items;
          ComboBox26.Items := ComboBox16.Items;
          ComboBox27.Items := ComboBox16.Items;
          ComboBox28.Items := ComboBox16.Items;
          ComboBox29.Items := ComboBox16.Items;
          ComboBox30.Items := ComboBox16.Items;
          Inven_Change2 := False;
     end;
end;

procedure TFr_Main.BitBtn3Click(Sender: TObject);
begin
     DM.Database1.StartTransaction;
     try
     With DM.Qr_Transaction do
          Begin
               Close;
               Params.Clear;
               SQL.Clear;
               SQL.Add('Update Officer');
               SQL.Add('Set President = :Pres');
               SQL.Add(',InvenOfficer = :IO');
               SQL.Add(',InvenSec = :IS');
               ParamByName('Pres').AsString := President.Text;
               ParamByName('IO').AsString := InvenOfficer.Text;
               ParamByName('IS').AsString := InvenSec.Text;
               execSQL;
          end;
          DM.Database1.Commit;
     Except
           Showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
           DM.Database1.Rollback;
     Raise;
     Close;
     end
end;

procedure TFr_Main.BitBtn4Click(Sender: TObject);
begin
     Fr_Main.Update :=  false;
     Fr_Inventory.Ed_Type_Name.Text := '';
     Fr_Type.DBL_Cat.Items.Clear;
     Fr_Type.DBL_Cat.Text := '';
     with DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          Params.Clear;
          SQL.text := 'Select Distinct Category From Inventory';
          Open;
     end;
     Fr_Inventory.DBL_Cat.Items.Clear;
     while not DM.Qr_Transaction.Eof do
     begin
          with DM.Qr_Transaction do
          Fr_Inventory.DBL_Cat.Items.Add(FieldValues['Category']);
          DM.Qr_Transaction.Next;
     end;
     DM.Qr_Transaction.close;
     Fr_Inventory.Ed_No.Text := '0';
     Fr_Inventory.Ed_Enum.Text := '';
     Fr_Inventory.Ed_MinNo.Text := '0';
     Fr_Inventory.Ed_Ppe.Text := '0';
     Fr_Inventory.DBL_Cat.Text := '';
     Fr_Inventory.ShowModal;
end;

procedure TFr_Main.BitBtn5Click(Sender: TObject);
var I_name : String;
begin
    I_Name := Inventory_List.Fields[0].Text;
     if I_Name = ''
     Then
          Begin
          Showmessage('กรุณาเลือกวัสดุที่จะแก้ไข');
          exit;
          end;
     Fr_Edit_Inven.Ed_Type_Name.Text := I_name;
     with DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          Params.Clear;
          SQL.text := 'Select Distinct Category From Inventory';
          Open;
     end;
     Fr_Edit_Inven.DBL_Cat.Items.Clear;
     while not DM.Qr_Transaction.Eof do
     begin
          with DM.Qr_Transaction do
          Fr_Edit_Inven.DBL_Cat.Items.Add(FieldValues['Category']);
          DM.Qr_Transaction.Next;
     end;
     Fr_Edit_Inven.DBL_Cat.text := (Inventory_List.Fields[1].Text);
     Fr_Edit_Inven.Ed_No.Text := (Inventory_List.Fields[2].Text);
     Fr_Edit_Inven.Ed_Enum.Text := Inventory_List.Fields[3].Text;
     Fr_Edit_Inven.Ed_MinNo.Text := (Inventory_List.Fields[4].Text);
     Fr_Edit_Inven.Ed_Ppe.Text := (Inventory_List.Fields[5].Text);
     Fr_Main.Update := True;
     Fr_Main.Old_Name := I_name;
     Fr_Edit_Inven.ShowModal;
     Fr_Main.Insert2 := false;
end;

procedure TFr_Main.BitBtn6Click(Sender: TObject);
Var  I_Name : String;
     Temp  : String;
begin
     I_Name := Inventory_List.Fields[0].Text;
     if I_Name = '' then
     begin
          Showmessage('กรุณาเลือกวัสดุที่จะลบ');
          exit;
     end;

     With DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          SQL.Text := 'select * from Buy_Detail B,Inventory I where (B.Inventory_ID = I.Inventory_ID) and (I.Inventory_Name = '+char(39)+I_Name+char(39)+')';
          open;
          if FieldValues['Inventory_ID'] <> null then
          begin
               ShowMessage ('รายการวัสดุภัณฑ์ ' + I_Name + ' มีการใช้งานในฐานข้อมูล ไม่สามารถลบได้');
               Close;
               exit;
          end;
     end;
          With DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          SQL.Text := 'select * from Bring_Detail B,Inventory I where (B.Inventory_ID = I.Inventory_ID) and (I.Inventory_Name = '+char(39)+I_Name+char(39)+')';
          open;
          if FieldValues['Inventory_ID'] <> null then
          begin
               ShowMessage ('รายการวัสดุภัณฑ์ ' + I_Name + ' มีการใช้งานในฐานข้อมูล ไม่สามารถลบได้');
               Close;
               exit;
          end;
     end;

     With DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          SQL.Text := 'select * from Return_Detail B,Inventory I where (B.Inventory_ID = I.Inventory_ID) and (I.Inventory_Name = '+char(39)+I_Name+char(39)+')';
          open;
          if FieldValues['Inventory_ID'] <> null then
          begin
               ShowMessage ('รายการวัสดุภัณฑ์ ' + I_Name + ' มีการใช้งานในฐานข้อมูล ไม่สามารถลบได้');
               Close;
               exit;
          end;
     end;


     Temp := 'คุณแน่ใจหรือไม่ที่จะลบ ' + I_Name;
     if MessageDlg(Temp,mtConfirmation,[mbYes,mbCancel],0) = mrCancel then exit;


     DM.Database1.StartTransaction;
     try
         with DM.Qr_Transaction do
         begin
              close;
              Params.Clear;
              SQL.Clear;
              SQL.Add('Delete From Inventory');
              SQL.Add('Where Inventory_Name = :Name');
              ParamByName('Name').AsString := I_Name;
              execSQL;
         end;
         DM.Database1.Commit;
         showmessage('ลบวัสดุเรียบร้อย');
     except
         showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
         DM.Database1.Rollback;
     raise;
     end;
     DM.Qr_Inventory_Detail.close;
     DM.Qr_Inventory_Detail.Open;
end;

procedure TFr_Main.BitBtn7Click(Sender: TObject);
begin
     Fr_Company.Ed_Company_Name.Text:='';
     Fr_Company.Mm_Address.Text:='';
     Fr_Company.Ed_Phone1.Text:='';
     Fr_Company.Ed_Phone2.Text:='';
     Fr_Company.Ed_Phone3.Text:='';
     Fr_Company.Ed_Fax.Text:='';
     Fr_Company.Update_Flag := False;
     Fr_Company.ShowModal;
end;

procedure TFr_Main.BitBtn8Click(Sender: TObject);
begin
     if LB_CompanyN.Text = '' then
     begin
          Showmessage('กรุณาเลือกบริษัทที่จะแก้ไข');
          exit;
     end;
     with DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          SQL.Add('Select * From Company');
          SQL.Add('Where Company_Name = '+Char(39) +LB_CompanyN.Text+Char(39));
          Open;
          Fr_Company.Ed_Company_Name.Text:= FieldValues['Company_Name'];
          Fr_Company.Mm_Address.Text:=FieldValues['Address'];
          Fr_Company.Ed_Phone1.Text:=FieldValues['Phone1'];
          Fr_Company.Ed_Phone2.Text:=FieldValues['Phone2'];
          Fr_Company.Ed_Phone3.Text:=FieldValues['Phone3'];
          Fr_Company.Ed_Fax.Text:=FieldValues['Fax'];
          Fr_Company.Company_ID:=FieldValues['Company_ID'];
          Fr_Company.Update_Flag := True;
          Fr_Company.ShowModal;
     end;
end;

procedure TFr_Main.BitBtn9Click(Sender: TObject);
var Temp : String;
begin
     if LB_CompanyN.Text = '' then
     begin
          Showmessage('กรุณาเลือกบริษัทที่จะลบ');
          exit;
     end;

          With DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          SQL.Text := 'select * from voucher v ,Company C where (V.company_ID = C.Company_ID) and (v.company_ID = '+IntToStr(LB_CompanyN.KeyValue)+')';
          open;
          if FieldValues['Voucher_ID'] <> null then
          begin
               ShowMessage ('รายการบริษัท ' + LB_CompanyN.Text + ' มีการใช้งานในฐานข้อมูล ไม่สามารถลบได้');
               Close;
               exit;
          end;
     end;

     Temp := 'คุณแน่ใจหรือไม่ที่จะลบ ' + LB_CompanyN.Text;
     if MessageDlg(Temp,mtConfirmation,[mbYes,mbCancel],0) = mrCancel then exit;

     DM.Database1.StartTransaction;
     try
         with DM.Qr_Transaction do
         begin
              close;
              Params.Clear;
              SQL.Clear;
              SQL.Add('Delete From Company');
              SQL.Add('Where Company_Name = :Name');
              ParamByName('Name').AsString := LB_CompanyN.Text;
              execSQL;
         end;
         DM.Database1.Commit;
         showmessage('ลบบริษัทเรียบร้อย');
     except
         showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
         DM.Database1.Rollback;
     raise;
     end;
    DM.Qr_Company.Close;
    DM.Qr_Company.Open;
    CP_Addr.Text := '';
    CP_Tel1.Text := '';
    CP_Tel2.Text := '';
    CP_Tel3.Text := '';
    CP_Fax.Text := '';
end;

procedure TFr_Main.BitBtn10Click(Sender: TObject);
begin
     BitBtn4.Click;
end;

procedure TFr_Main.BitBtn1Click(Sender: TObject);
var Temp : String;
    I,j,I_ID,Have_No,Lot_Have,Mlot,Bring_NO,New_Lot_Have,L_ID,MH,MaxT,New_Have_No : integer;
    InvenAdd : Boolean;
    PPE : Real;
begin
        if Bring_ID.Text = '' then
        begin
                Showmessage('กรุณาใส่เลขที่ใบสำคัญ');
                Bring_ID.SetFocus;
                exit;
        end;
        With DM.Qr_Transaction do
        begin
             Close;
             SQL.Text := 'Select Bring_ID from Bring where Bring_ID = ' +char(39) +Trim(Bring_ID.Text) +char(39);
             Open;
             if FieldValues['Bring_ID'] <> null then
             begin
                  Showmessage ('มีรายการเบิกนี้ในฐานข้อมูลแล้ว');
                  Bring_ID.SetFocus;
                  exit;
             end; {then}
        end; {with}
        if Bring_Name.Text = '' then
        begin
                Showmessage('กรุณาใส่ชื่อผู้เบิก');
                Bring_Name.SetFocus;
                exit;
        end;
        if Bring_Department.Text = '' then
        begin
                Showmessage('กรุณาเลือกฝ่าย');
                Bring_Department.SetFocus;
                exit;
        end;
        if Recieve_Name.Text = '' then
        begin
                Showmessage('กรุณาใส่ชื่อผู้รับ');
                Recieve_Name.SetFocus;
                exit;
        end;
        if Pay_Name.Text = '' then
        begin
                Showmessage('กรุณาใส่ชื่อผู้จ่าย');
                Pay_Name.SetFocus;
                exit;
        end;
        if Command_Pay.Text = '' then
        begin
                Showmessage('กรุณาใส่ชื่อผู้สั่งจ่าย');
                Command_Pay.SetFocus;
                exit;
        end;

        InvenAdd := False;
        i := 1;
        while (i < 16) and (InvenAdd = False) do
        begin
             j := 1;
             while (j < 2) and (InvenAdd = False) do
             begin
                  if StringGrid2.Cells[j,i] <> '' then InvenAdd := True;
                  j:=j+1;
             end;
             i := i+1;
        end;
        if InvenAdd = False then
        begin
             ShowMessage('กรุณาใส่รายการวัสดุ');
             StringGrid2.SetFocus;
             exit;
        end;

        With DM.Qr_Transaction do
        begin
             i:=1;
             while (StringGrid2.Cells[1,i] <> '') and (i < 16) do
             begin
                  if StringGrid2.Cells[2,i] = '' then
                  begin
                       Showmessage('กรุณาใส่จำนวน '+Trim(StringGrid2.Cells[1,i])+' ที่จะเบิก');
                       StringGrid2.SetFocus;
                       exit;
                  end;
                  i := i+1;
             end;
             i:=1;
             while (StringGrid2.Cells[1,i] <> '') and (i < 16) do
             begin
                  Close;
                  SQL.Clear;
                  SQL.Add('Select Sum(Have_No)[HN] ');
                  SQL.Add('From Inventory I,Lot L');
                  SQL.Add('Where I.Inventory_ID = L.Inventory_ID and Inventory_Name = '+#39+Trim(StringGrid2.Cells[1,i])+#39);
                  SQL.Add('Group By Inventory_Name,Category');
                  SQL.Add('Order By Inventory_Name');
                  Open;
                  Have_No := FieldValues['HN'];
                  if StrToInt(StringGrid2.Cells[2,i]) > Have_No then
                  begin
                       Showmessage('จำนวน '+Trim(StringGrid2.Cells[1,i])+' ไม่พอเบิก');
                       StringGrid2.SetFocus;
                       exit;
                  end;
                  i := i+1;
             end;
     End; {With DM.Qr_Transaction do}
     Temp := 'คุณแน่ใจหรือไม่ที่จะทำรายการเบิก ' + Bring_ID.Text;
     if MessageDlg(Temp,mtConfirmation,[mbYes,mbCancel],0) = mrCancel then
     begin
          exit;
     end;
     DM.Database1.StartTransaction;
     try
     With DM.Qr_Transaction do
     Begin
          Close;
          SQL.Clear;
          Params.Clear;
          SQL.Add('Insert into Bring');
          SQL.Add('(Bring_ID,Date_Bring,Bring_Name,Department_ID,Recieve_Name,Pay_Name,Command_Pay)');
          SQL.Add('Values (:BID,:DB,:BN,:DID,:RN,:PN,:CP)');
          ParamByName('BID').AsString := Bring_ID.Text;
          ParamByName('DB').AsString := datetostr(BringDate.date);
          ParamByName('BN').AsString := Bring_Name.Text;
          ParamByName('RN').AsString := Recieve_Name.Text;
          ParamByName('PN').AsString := Pay_Name.Text;
          ParamByName('CP').AsString := Command_Pay.Text;
          ParamByName('DID').AsInteger := Bring_Department.KeyValue;
          execSQL;
          i:=1;
          while (StringGrid2.Cells[1,i] <> '') and (i < 16) do
          begin
               Bring_No := StrToInt(StringGrid2.Cells[2,i]);
               While Bring_No <> 0 Do
               begin
                    Close;
                    SQL.Clear;
                    Params.Clear;
                    SQL.text := 'Select Min(Lot_ID)[M] From Inventory I,Lot L Where Have_No <> 0 and I.Inventory_ID = L.Inventory_ID and I.Inventory_Name = '+#39+StringGrid2.Cells[1,i]+#39+' Group By Inventory_Name';
                    Open;
                    MLot := FieldValues['M'];
                    Close;
                    SQL.Clear;
                    Params.Clear;
                    SQL.text := 'Select * From Inventory I,Lot L Where Lot_ID = '+IntToStr(MLot)+'and I.Inventory_ID = L.Inventory_ID and I.Inventory_Name = '+#39+StringGrid2.Cells[1,i]+#39;
                    Open;
                    Lot_Have  := FieldValues['Have_No'];
                    I_ID      := FieldValues['Inventory_ID'];
                    PPE       := FieldValues['PPE'];
                    L_ID      := FieldValues['Lot_ID'];
                    if Lot_Have > Bring_No then
                    Begin
                         New_Lot_Have := Lot_Have - Bring_No;
                         Bring_No := 0;
                    end
                    Else
                    Begin
                         Bring_No := Bring_No - Lot_Have;
                         New_Lot_Have := 0;
                    End;
                    Close;
                    SQL.Clear;
                    Params.Clear;
                    SQL.Add('Update Lot');
                    SQL.Add('Set Have_NO = :HN');
                    SQL.Add('Where Lot_ID = :L_ID');
                    SQL.Add('and Inventory_ID = :I_ID');
                    ParamByName('HN').AsInteger := New_Lot_Have;
                    ParamByName('L_ID').AsInteger := L_ID;
                    ParamByName('I_ID').AsInteger := I_ID;
                    execSQL;
               end; {while Bring_No <> 0}
               Close;
               SQL.Clear;
               SQL.Text := 'Select Max(Transaction_ID)[MT] From Transaction_ T,Inventory I Where I.Inventory_ID = T.Inventory_ID and I.inventory_Name = '+#39+StringGrid2.Cells[1,i]+#39;
               Open;
               MaxT := FieldValues['MT']+1;
               Close;
               SQL.Clear;
               SQL.Add('Select Sum(Have_No)[HN] ');
               SQL.Add('From Inventory I,Lot L');
               SQL.Add('Where I.Inventory_ID = L.Inventory_ID and Inventory_Name = '+#39+Trim(StringGrid2.Cells[1,i])+#39);
               SQL.Add('Group By Inventory_Name,Category');
               SQL.Add('Order By Inventory_Name');
               Open;
               New_Have_No := FieldValues['HN'];
               Close;
               SQL.Clear;
               SQL.Add('Insert into Transaction_');
               SQL.Add('(Transaction_ID,Inventory_ID,Voice_ID,PassTo,PPE,Bring_No,Have_No,DepartMent_ID,Date_)');
               SQL.Add('Values(:T_ID,:I_ID,:V_ID,:PT,:PPE,:GN,:HN,:DP,:Date_)');
               ParamByName('T_ID').AsInteger := MaxT;
               ParamByName('I_ID').AsInteger := I_ID;
               ParamByName('V_ID').AsString  := Bring_ID.Text;
               ParamByName('PT').AsString    := Bring_Name.Text;
               ParamByName('PPE').AsFloat  := PPE;
               ParamByName('GN').AsInteger   := StrToInt(StringGrid2.Cells[2,i]);
               ParamByName('HN').AsInteger   := New_Have_No;
               ParamByName('DP').AsInteger    := Bring_Department.KeyValue;
               ParamByName('Date_').AsDateTime := BringDate.DateTime;
               ExecSQL;
               i:=i+1;
          end; {while (StringGrid2.Cells[1,i] <> '')}
          DM.Database1.Commit;
          Showmessage ('บันทึกรายงานการเบิกเรียบร้อยแล้ว');
          DM.Qr_Inventory_Detail.Close;
          DM.Qr_Inventory_Detail.open;
          i:=1;
          while (StringGrid2.Cells[1,i] <> '') and (i < 16) do
          begin
               Close;
               SQL.Clear;
               SQL.Add('Select Sum(Have_No)[HN],Min_have ');
               SQL.Add('From Inventory I,Lot L');
               SQL.Add('Where I.Inventory_ID = L.Inventory_ID and Inventory_Name = '+#39+Trim(StringGrid2.Cells[1,i])+#39);
               SQL.Add('Group By Inventory_Name,Category,Min_have');
               SQL.Add('Order By Inventory_Name');
               Open;
               Have_No := FieldValues['HN'];
               MH := FieldValues['Min_have'];
               if MH >= Have_No then
               begin
                    Showmessage('จำนวน '+Trim(StringGrid2.Cells[1,i])+' น้อยกว่าจำนวนต่ำสุด');
               end;
               i := i+1;
          end;


     End;{with}
     Except
          Showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
          DM.Database1.Rollback;
          raise;
          Close;
     end;
        Init2;
end;

procedure TFr_Main.BitBtn2Click(Sender: TObject);
var SystemTime: TSystemTime;
begin
        Init2;
        GetLocalTime(SystemTime);
        BringDate.DateTime := SystemTimeToDateTime(SystemTime);
end;

procedure TFr_Main.TabSheet6Show(Sender: TObject);
begin
       LB_CompanyN.KeyValue := 0;
       CP_addr.Text := '';
       CP_Addr.clear;
       CP_Tel1.Text := '';
       CP_Tel2.Text := '';
       CP_Tel3.Text := '';
       CP_Fax.Text := '';
end;

procedure TFr_Main.BitBtn13Click(Sender: TObject);
begin
     Fr_Depart.Ed_Add_Depart.Text:='';
     Fr_Depart.ShowModal;
end;

procedure TFr_Main.BitBtn14Click(Sender: TObject);
begin
     if DBG_Depart.Fields[0].Text = ''
     Then
          Begin
          Showmessage('กรุณาเลือกชนิดที่จะแก้ไข');
          exit;
          end;
     Fr_Depart.Ed_Add_Depart.text := DBG_Depart.Fields[0].Text;
     Fr_Depart.Old_Name := Fr_Depart.Ed_Add_Depart.text;
     Fr_Main.Update_Depart := True;
     Fr_Depart.ShowModal;
     Fr_Main.Update_Depart := False;
end;

procedure TFr_Main.BitBtn15Click(Sender: TObject);
Var  Depart_Name : String;
     Temp  : String;
begin
     Depart_Name := DBG_Depart.Fields[0].Text;
     if Depart_Name = '' then
     begin
          Showmessage('กรุณาเลือกฝ่ายที่จะลบ');
          exit;
     end;

     With DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          SQL.Text := 'select * from Return_ R,Department D where (R.Department_ID = D.Department_ID) and (Department_Name = '+char(39)+Depart_Name+char(39)+')';
          open;
          if FieldValues['Department_ID'] <> null then
          begin
               ShowMessage ('ฝ่าย ' + Depart_Name + ' มีการใช้งานในฐานข้อมูล ไม่สามารถลบได้');
               Close;
               exit;
          end;
     end;
          With DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          SQL.Text := 'select * from Bring B,Department D where (B.Department_ID = D.Department_ID) and (Department_Name = '+char(39)+Depart_Name+char(39)+')';
          open;
          if FieldValues['Bring_ID'] <> null then
          begin
               ShowMessage ('ฝ่าย ' + Depart_Name + ' มีการใช้งานในฐานข้อมูล ไม่สามารถลบได้');
               Close;
               exit;
          end;
     end;

     Temp := 'คุณแน่ใจหรือไม่ที่จะลบ ' + Depart_Name;
     if MessageDlg(Temp,mtConfirmation,[mbYes,mbCancel],0) = mrCancel then exit;
     DM.Database1.StartTransaction;
     try
         with DM.Qr_Transaction do
         begin
              close;
              Params.Clear;
              SQL.Clear;
              SQL.Add('Delete From Department');
              SQL.Add('Where Department_Name = :Name');
              ParamByName('Name').AsString := Depart_Name;
              execSQL;
         end;
         DM.Database1.Commit;
         showmessage('ลบฝ่ายเรียบร้อย');
     except
         showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
         DM.Database1.Rollback;
     raise;
     end;
     DM.Qr_Depart.Close;
     Dm.Qr_Depart.Open;
end;

procedure TFr_Main.StringGrid2KeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #9 then
     begin
          if StringGrid2.Col = 1 then
          begin
               if StringGrid2.Row = 1 then Combobox16.SetFocus else
               if StringGrid2.Row = 2 then Combobox17.SetFocus else
               if StringGrid2.Row = 3 then Combobox18.SetFocus else
               if StringGrid2.Row = 4 then Combobox19.SetFocus else
               if StringGrid2.Row = 5 then Combobox20.SetFocus else
               if StringGrid2.Row = 6 then Combobox21.SetFocus else
               if StringGrid2.Row = 7 then Combobox22.SetFocus else
               if StringGrid2.Row = 8 then Combobox23.SetFocus else
               if StringGrid2.Row = 9 then Combobox24.SetFocus else
               if StringGrid2.Row = 10 then Combobox25.SetFocus else
               if StringGrid2.Row = 11 then Combobox26.SetFocus else
               if StringGrid2.Row = 12 then Combobox27.SetFocus else
               if StringGrid2.Row = 13 then Combobox28.SetFocus else
               if StringGrid2.Row = 14 then Combobox29.SetFocus else
               if StringGrid2.Row = 15 then Combobox30.SetFocus;
          end;

     end
     else if Key = #13 then
     begin
          BitBtn1.SetFocus;
     end;
end;

procedure TFr_Main.PageControl1Enter(Sender: TObject);
begin
     Init1;
     Init2;
     Init3;
     
end;

procedure TFr_Main.BitBtn11Click(Sender: TObject);
var Temp : String;
    I,j,I_ID,L_ID,MAxT,New_Have_No,MLot,Return_No,Lot_Have : integer;
    InvenAdd : Boolean;
    PPE : Real;
begin
        if Return_Name.Text = '' then
        begin
                Showmessage('กรุณาใส่ชื่อผู้คืน');
                Return_Name.SetFocus;
                exit;
        end;
        if ReTake.Text = '' then
        begin
                Showmessage('กรุณาใส่ชื่อผู้รับคืน');
                ReTake.SetFocus;
                exit;
        end;
        if ReturnDepart.Text = '' then
        begin
                Showmessage('กรุณาเลือกฝ่าย');
                Bring_Department.SetFocus;
                exit;
        end;

        InvenAdd := False;
        i := 1;
        while (i < 16) and (InvenAdd = False) do
        begin
             j := 1;
             while (j < 2) and (InvenAdd = False) do
             begin
                  if StringGrid3.Cells[j,i] <> '' then InvenAdd := True;
                  j:=j+1;
             end;
             i := i+1;
        end;
        if InvenAdd = False then
        begin
             ShowMessage('กรุณาใส่รายการวัสดุ');
             StringGrid3.SetFocus;
             exit;
        end;
        With DM.Qr_Transaction do
        begin
             i:=1;
             while (StringGrid3.Cells[1,i] <> '') and (i < 16) do
             begin
                  if StringGrid3.Cells[2,i] = '' then
                  begin
                       Showmessage('กรุณาใส่จำนวน '+Trim(StringGrid3.Cells[1,i])+' ที่จะคืน');
                       StringGrid3.SetFocus;
                       exit;
                  end;
                  i := i+1;
             end;
        end;
        Temp := 'คุณแน่ใจหรือไม่ที่จะทำรายการคืนนี้';
        if MessageDlg(Temp,mtConfirmation,[mbYes,mbCancel],0) = mrCancel then
        begin
             exit;
        end;
        DM.Database1.StartTransaction;
        try
        With DM.Qr_Transaction do
        Begin
             Close;
             SQL.Clear;
             Params.Clear;
             SQL.Add('Insert into Return_');
             SQL.Add('(Date_Return,Return_Name,Retake,Reason)');
             SQL.Add('Values (:DR,:RN,:RT,:R)');
             ParamByName('DR').AsDateTime := Date_Return.DateTime;
             ParamByName('RN').AsString := Return_Name.Text;
             ParamByName('RT').AsString := ReTake.Text;
             ParamByName('R').AsString := RReason.Text;
             execSQL;
             i:=1;
             while (StringGrid3.Cells[1,i] <> '') and (i < 16) do
             begin
                  Return_No := StrToInt(StringGrid3.Cells[2,i]);
                  Close;
                  SQL.Clear;
                  Params.Clear;
                  SQL.text := 'Select Max(Lot_ID)[M] From Inventory I,Lot L Where I.Inventory_ID = L.Inventory_ID and I.Inventory_Name = '+#39+StringGrid3.Cells[1,i]+#39+' Group By Inventory_Name';
                  Open;
                  MLot := FieldValues['M'];
                  Close;
                  SQL.Clear;
                  Params.Clear;
                  SQL.text := 'Select * From Inventory I,Lot L Where Lot_ID = '+IntToStr(MLot)+'and I.Inventory_ID = L.Inventory_ID and I.Inventory_Name = '+#39+StringGrid3.Cells[1,i]+#39;
                  Open;
                  Lot_Have  := FieldValues['Have_No'];
                  I_ID      := FieldValues['Inventory_ID'];
                  PPE       := FieldValues['PPE'];
                  L_ID      := FieldValues['Lot_ID'];
                  Close;
                  SQL.Clear;
                  Params.Clear;
                  SQL.Add('Update Lot');
                  SQL.Add('Set Have_NO = :HN');
                  SQL.Add('Where Lot_ID = :L_ID');
                  SQL.Add('and Inventory_ID = :I_ID');
                  ParamByName('HN').AsInteger := Lot_Have + Return_No;
                  ParamByName('L_ID').AsInteger := L_ID;
                  ParamByName('I_ID').AsInteger := I_ID;
                  execSQL;
                  Close;
                  SQL.Clear;
                  SQL.Text := 'Select Max(Transaction_ID)[MT] From Transaction_ T,Inventory I Where I.Inventory_ID = T.Inventory_ID and I.inventory_Name = '+#39+StringGrid3.Cells[1,i]+#39;
                  Open;
                  MaxT := FieldValues['MT']+1;
                  Close;
                  SQL.Clear;
                  SQL.Add('Select Sum(Have_No)[HN] ');
                  SQL.Add('From Inventory I,Lot L');
                  SQL.Add('Where I.Inventory_ID = L.Inventory_ID and Inventory_Name = '+#39+Trim(StringGrid3.Cells[1,i])+#39);
                  SQL.Add('Group By Inventory_Name,Category');
                  SQL.Add('Order By Inventory_Name');
                  Open;
                  New_Have_No := FieldValues['HN'];
                  Close;
                  SQL.Clear;
                  SQL.Add('Insert into Transaction_');
                  SQL.Add('(Transaction_ID,Inventory_ID,Voice_ID,PassTo,PPE,Recieve_No,Have_No,DepartMent_ID,Date_)');
                    SQL.Add('Values(:T_ID,:I_ID,:V_ID,:PT,:PPE,:RN,:HN,:DP,:Date_)');
                    ParamByName('T_ID').AsInteger := MaxT;
                    ParamByName('I_ID').AsInteger := I_ID;
                    ParamByName('V_ID').AsString  := '';
                    ParamByName('PT').AsString    := Return_Name.Text;
                    ParamByName('PPE').AsFloat  := PPE;
                    ParamByName('RN').AsInteger   := StrToInt(StringGrid3.Cells[2,i]);
                    ParamByName('HN').AsInteger   := New_Have_No;
                    ParamByName('DP').AsInteger    := ReturnDepart.KeyValue;
                    ParamByName('Date_').AsDateTime := Date_Return.DateTime;
               ExecSQL;
               i:=i+1;
          end; {while (StringGrid3.Cells[1,i] <> '')}
          DM.Database1.Commit;
          Showmessage ('บันทึกรายงานการคืนเรียบร้อยแล้ว');
          DM.Qr_Inventory_Detail.Close;
          DM.Qr_Inventory_Detail.open;
     End;{with}
     Except
          Showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
          DM.Database1.Rollback;
          raise;
          Close;
     end;
        Init3;
end; {with}

procedure TFr_Main.BitBtn12Click(Sender: TObject);
begin
     init3;
end;

procedure TFr_Main.TabSheet7Show(Sender: TObject);
begin
     DM.Qr_Inventory_Detail.Close;
     DM.Qr_Inventory_Detail.Open;
end;

Procedure Refresh_LV_Voucher_Detail ();
begin

     Fr_Main.Lv_Voucher_Detail.Items.Clear;
     With DM.Qr_Transaction do
     Begin
          Close;
          SQL.Clear;
          SQL.Text := 'Select Voucher_ID,DateAdd(year,543,Date_Buy)[d1],DateAdd(year,543,(DateAdd(Day,Day_Use,Date_Buy)))[d2],Company_Name,Respond_Name From Voucher V,Company C Where (C.Company_ID = V.Company_ID) and (Complete = '+#39+'False'+#39+')';
          Open;
          First;
          while not DM.Qr_Transaction.Eof do
          begin
               with Fr_Main.Lv_Voucher_Detail.Items.Add  do
               begin
                    Caption := DM.Qr_Transaction.FieldValues['Voucher_ID'];
                    SubItems.Add(DateToStr(FieldValues['d1'])){Fields.Fields[1].Value)};
                    SubItems.Add(DateToStr(FieldValues['d2']));
                    SubItems.Add(FieldValues['Company_Name']);
                    SubItems.Add(FieldValues['Respond_Name']);
               end;
               Next;
          end;
     End;



end;

procedure TFr_Main.TabSheet4Show(Sender: TObject);
begin
     Refresh_LV_Voucher_Detail;
end;

procedure TFr_Main.Lv_Voucher_DetailDblClick(Sender: TObject);
begin
     if Lv_Voucher_Detail.SelCount = 0 then exit;
     Fr_Recieve.Voucher_ID := Lv_Voucher_Detail.Selected.Caption;
     Fr_Recieve.ShowModal;
end;

procedure TFr_Main.N1Click(Sender: TObject);
begin
     if Lv_Voucher_Detail.SelCount = 0 then exit;
     Fr_Recieve.Voucher_ID := Lv_Voucher_Detail.Selected.Caption;
     Fr_Recieve.ShowModal;
end;

procedure TFr_Main.TabSheet8Show(Sender: TObject);
begin
     with DM.Qr_Transaction do
        begin
             Close;
             SQL.Text := 'Select * From Officer';
             open;
             President.Text := FieldValues['President'];
             InvenOfficer.Text := FieldValues['InvenOfficer'];
             InvenSec.Text := FieldValues['InvenSec'];
        end;
end;

procedure TFr_Main.TabSheet14Show(Sender: TObject);
begin
     if not (Inven_Change) then exit;
     with DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          Params.Clear;
          SQL.text := 'Select Distinct Inventory_Name From Inventory';
          Open;
     end;
     ComboBox1.Items.Clear;
     while not DM.Qr_Transaction.Eof do
     begin
          with DM.Qr_Transaction do
          begin
               Combobox1.Items.Add(FieldValues['Inventory_Name']);
               DM.Qr_Transaction.Next;
          end;
          ComboBox2.Items := ComboBox1.Items;
          ComboBox3.Items := ComboBox1.Items;
          ComboBox4.Items := ComboBox1.Items;
          ComboBox5.Items := ComboBox1.Items;
          ComboBox6.Items := ComboBox1.Items;
          ComboBox7.Items := ComboBox1.Items;
          ComboBox8.Items := ComboBox1.Items;
          ComboBox9.Items := ComboBox1.Items;
          ComboBox10.Items := ComboBox1.Items;
          ComboBox11.Items := ComboBox1.Items;
          ComboBox12.Items := ComboBox1.Items;
          ComboBox13.Items := ComboBox1.Items;
          ComboBox14.Items := ComboBox1.Items;
          ComboBox15.Items := ComboBox1.Items;
          Inven_Change := False;
     end;
end;

procedure TFr_Main.ComboBox1Change(Sender: TObject);
begin
     StringGrid1.Cells[2,1] := ComboBox1.Text;
end;

procedure TFr_Main.ComboBox2Change(Sender: TObject);
begin
     StringGrid1.Cells[2,2] := ComboBox2.Text;
end;

procedure TFr_Main.ComboBox3Change(Sender: TObject);
begin
     StringGrid1.Cells[2,3] := ComboBox3.Text;
end;

procedure TFr_Main.ComboBox4Change(Sender: TObject);
begin
     StringGrid1.Cells[2,4] := ComboBox4.Text;
end;

procedure TFr_Main.ComboBox5Change(Sender: TObject);
begin
     StringGrid1.Cells[2,5] := ComboBox5.Text;
end;

procedure TFr_Main.ComboBox6Change(Sender: TObject);
begin
     StringGrid1.Cells[2,6] := ComboBox6.Text;
end;

procedure TFr_Main.ComboBox7Change(Sender: TObject);
begin
     StringGrid1.Cells[2,7] := ComboBox7.Text;
end;

procedure TFr_Main.ComboBox8Change(Sender: TObject);
begin
     StringGrid1.Cells[2,8] := ComboBox8.Text;
end;

procedure TFr_Main.ComboBox9Change(Sender: TObject);
begin
     StringGrid1.Cells[2,9] := ComboBox9.Text;
end;

procedure TFr_Main.ComboBox10Change(Sender: TObject);
begin
     StringGrid1.Cells[2,10] := ComboBox10.Text;
end;

procedure TFr_Main.ComboBox11Change(Sender: TObject);
begin
     StringGrid1.Cells[2,11] := ComboBox11.Text;
end;

procedure TFr_Main.ComboBox12Change(Sender: TObject);
begin
     StringGrid1.Cells[2,12] := ComboBox12.Text;
end;

procedure TFr_Main.ComboBox13Change(Sender: TObject);
begin
     StringGrid1.Cells[2,13] := ComboBox13.Text;
end;

procedure TFr_Main.ComboBox14Change(Sender: TObject);
begin
     StringGrid1.Cells[2,14] := ComboBox14.Text;
end;

procedure TFr_Main.ComboBox15Change(Sender: TObject);
begin
     StringGrid1.Cells[2,15] := ComboBox15.Text;
end;

procedure TFr_Main.Day_UseExit(Sender: TObject);
begin
        if Day_Use.Text = '' then exit;
        try
            StrToInt(Day_Use.Text);
        except
            showmessage('กรุณาใส่กำหนดเวลาที่ต้องใช้เป็นตัวเลข');
            exit;
        end;
end;

procedure TFr_Main.Lv_Voucher_DetailKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key <> #13 then exit;
     if Lv_Voucher_Detail.SelCount = 0 then exit;
     Fr_Recieve.Voucher_ID := Lv_Voucher_Detail.Selected.Caption;
     Fr_Recieve.ShowModal;
end;

procedure TFr_Main.N2Click(Sender: TObject);
begin
   if Lv_Voucher_Detail.SelCount = 0 then
     begin
          exit;
     end;
     Clear_Voucher;
     ShowVoucherDetail(Lv_Voucher_Detail.Selected.Caption);
     Fr_EditVoucher.Button3.Caption := 'ตกลง';
     Fr_EditVoucher.ShowModal;
end;

procedure TFr_Main.N3Click(Sender: TObject);
Var Add_ID : String;
begin
     if Lv_Voucher_Detail.SelCount = 0 then exit;
     Add_ID := Lv_Voucher_Detail.Selected.Caption;
     if MessageDlg('!!! คุณแน่ใจที่จะลบข้อมูลบันทึกรายงานขอซื้อ '+Add_ID+' !!!',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
          DM.Database1.StartTransaction;
          try
               with DM.Qr_Transaction do
               begin
               SQL.Text := 'select Invoice_ID from buy_detail where Voucher_ID ='+char(39)+ Add_ID +Char(39);
               open;
              if FieldValues['Invoice_ID'] <> null
              then
                  begin
                  Showmessage('!!!ข้อมูลบันทึกรายงานขอซื้อ '+Add_ID+' มีบัญทึกการรับของแล้ว!!!');
                  exit;
                  end
              else
              begin
                  close;
                  Params.Clear;
                  SQL.Clear;
                  SQL.Add('Delete From Voucher');
                  SQL.Add('Where Voucher_ID = '+char(39)+Add_ID+char(39));
                  execSQL;
                  Close;
                  Params.Clear;
                  SQL.Clear;
                  SQL.Add('Delete From Buy_detail');
                  SQL.Add('Where Voucher_ID = '+char(39)+Add_ID+char(39));
                  execSQL;
               end;
         end;
         DM.Database1.Commit;
         Showmessage ('ลบรายงานขอซื้อเรียบร้อยแล้ว');
         Refresh_LV_Voucher_Detail;
         Except
               Showmessage('!!!มีข้อผิดพลาดเกิดขึ้น!!!');
               DM.Database1.Rollback;
         raise;
         Add_ID := '';
    end;
end;


end;

procedure TFr_Main.ComboBox16Change(Sender: TObject);
begin
     StringGrid2.Cells[1,1] := ComboBox16.Text;
end;

procedure TFr_Main.ComboBox17Change(Sender: TObject);
begin
     StringGrid2.Cells[1,2] := ComboBox17.Text;
end;

procedure TFr_Main.ComboBox18Change(Sender: TObject);
begin
     StringGrid2.Cells[1,3] := ComboBox18.Text;
end;

procedure TFr_Main.ComboBox19Change(Sender: TObject);
begin
     StringGrid2.Cells[1,4] := ComboBox19.Text;
end;

procedure TFr_Main.ComboBox20Change(Sender: TObject);
begin
     StringGrid2.Cells[1,5] := ComboBox20.Text;
end;

procedure TFr_Main.ComboBox21Change(Sender: TObject);
begin
     StringGrid2.Cells[1,6] := ComboBox21.Text;
end;

procedure TFr_Main.ComboBox22Change(Sender: TObject);
begin
     StringGrid2.Cells[1,7] := ComboBox22.Text;
end;

procedure TFr_Main.ComboBox23Change(Sender: TObject);
begin
     StringGrid2.Cells[1,8] := ComboBox23.Text;
end;

procedure TFr_Main.ComboBox24Change(Sender: TObject);
begin
     StringGrid2.Cells[1,9] := ComboBox24.Text;
end;

procedure TFr_Main.ComboBox25Change(Sender: TObject);
begin
     StringGrid2.Cells[1,10] := ComboBox25.Text;
end;

procedure TFr_Main.ComboBox26Change(Sender: TObject);
begin
     StringGrid2.Cells[1,11] := ComboBox26.Text;
end;

procedure TFr_Main.ComboBox27Change(Sender: TObject);
begin
     StringGrid2.Cells[1,12] := ComboBox27.Text;
end;

procedure TFr_Main.ComboBox28Change(Sender: TObject);
begin
     StringGrid2.Cells[1,13] := ComboBox28.Text;
end;

procedure TFr_Main.ComboBox29Change(Sender: TObject);
begin
     StringGrid2.Cells[1,14] := ComboBox29.Text;
end;

procedure TFr_Main.ComboBox30Change(Sender: TObject);
begin
     StringGrid2.Cells[1,15] := ComboBox30.Text;
end;

procedure TFr_Main.ComboBox1DropDown(Sender: TObject);
begin
     ComboBox1.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox2DropDown(Sender: TObject);
begin
     ComboBox2.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox3DropDown(Sender: TObject);
begin
     ComboBox3.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox4DropDown(Sender: TObject);
begin
     ComboBox4.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox5DropDown(Sender: TObject);
begin
     ComboBox5.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox6DropDown(Sender: TObject);
begin
     ComboBox6.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox7DropDown(Sender: TObject);
begin
     ComboBox7.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox8DropDown(Sender: TObject);
begin
     ComboBox8.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox9DropDown(Sender: TObject);
begin
     ComboBox9.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox10DropDown(Sender: TObject);
begin
     ComboBox10.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox11DropDown(Sender: TObject);
begin
     ComboBox11.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox12DropDown(Sender: TObject);
begin
     ComboBox12.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox13DropDown(Sender: TObject);
begin
     ComboBox13.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox14DropDown(Sender: TObject);
begin
     ComboBox14.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox15DropDown(Sender: TObject);
begin
     ComboBox15.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox16DropDown(Sender: TObject);
begin
     ComboBox16.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox17DropDown(Sender: TObject);
begin
     ComboBox17.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox18DropDown(Sender: TObject);
begin
     ComboBox18.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox19DropDown(Sender: TObject);
begin
     ComboBox19.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox20DropDown(Sender: TObject);
begin
     ComboBox20.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox21DropDown(Sender: TObject);
begin
     ComboBox21.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox22DropDown(Sender: TObject);
begin
     ComboBox22.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox23DropDown(Sender: TObject);
begin
     ComboBox23.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox24DropDown(Sender: TObject);
begin
     ComboBox24.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox25DropDown(Sender: TObject);
begin
     ComboBox25.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox26DropDown(Sender: TObject);
begin
     ComboBox26.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox27DropDown(Sender: TObject);
begin
     ComboBox27.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox28DropDown(Sender: TObject);
begin
     ComboBox28.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox29DropDown(Sender: TObject);
begin
     ComboBox29.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox30DropDown(Sender: TObject);
begin
     ComboBox30.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox31DropDown(Sender: TObject);
begin
     ComboBox31.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox32DropDown(Sender: TObject);
begin
     ComboBox32.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox33DropDown(Sender: TObject);
begin
     ComboBox33.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox34DropDown(Sender: TObject);
begin
     ComboBox34.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox35DropDown(Sender: TObject);
begin
     ComboBox35.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox36DropDown(Sender: TObject);
begin
     ComboBox36.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox37DropDown(Sender: TObject);
begin
     ComboBox37.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox38DropDown(Sender: TObject);
begin
     ComboBox38.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox39DropDown(Sender: TObject);
begin
     ComboBox39.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox40DropDown(Sender: TObject);
begin
     ComboBox40.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox41DropDown(Sender: TObject);
begin
     ComboBox41.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox42DropDown(Sender: TObject);
begin
     ComboBox42.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox43Change(Sender: TObject);
begin
     StringGrid3.Cells[1,13] := ComboBox43.Text;
end;

procedure TFr_Main.ComboBox43DropDown(Sender: TObject);
begin
     ComboBox43.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox44Change(Sender: TObject);
begin
     StringGrid3.Cells[1,14] := ComboBox44.Text;
end;

procedure TFr_Main.ComboBox44DropDown(Sender: TObject);
begin
     ComboBox44.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox45Change(Sender: TObject);
begin
     StringGrid3.Cells[1,15] := ComboBox45.Text;
end;

procedure TFr_Main.ComboBox45DropDown(Sender: TObject);
begin
     ComboBox45.ItemIndex := -1;
end;

procedure TFr_Main.ComboBox31Change(Sender: TObject);
begin
     StringGrid3.Cells[1,1] := ComboBox31.Text;
end;

procedure TFr_Main.ComboBox32Change(Sender: TObject);
begin
     StringGrid3.Cells[1,2] := ComboBox32.Text;
end;

procedure TFr_Main.ComboBox33Change(Sender: TObject);
begin
     StringGrid3.Cells[1,3] := ComboBox33.Text;
end;

procedure TFr_Main.ComboBox34Change(Sender: TObject);
begin
     StringGrid3.Cells[1,4] := ComboBox34.Text;
end;

procedure TFr_Main.ComboBox35Change(Sender: TObject);
begin
     StringGrid3.Cells[1,5] := ComboBox35.Text;
end;

procedure TFr_Main.ComboBox36Change(Sender: TObject);
begin
     StringGrid3.Cells[1,6] := ComboBox36.Text;
end;

procedure TFr_Main.ComboBox37Change(Sender: TObject);
begin
     StringGrid3.Cells[1,7] := ComboBox37.Text;
end;

procedure TFr_Main.ComboBox38Change(Sender: TObject);
begin
     StringGrid3.Cells[1,8] := ComboBox38.Text;
end;

procedure TFr_Main.ComboBox39Change(Sender: TObject);
begin
     StringGrid3.Cells[1,9] := ComboBox39.Text;
end;

procedure TFr_Main.ComboBox40Change(Sender: TObject);
begin
     StringGrid3.Cells[1,10] := ComboBox40.Text;
end;

procedure TFr_Main.ComboBox41Change(Sender: TObject);
begin
     StringGrid3.Cells[1,11] := ComboBox41.Text;
end;

procedure TFr_Main.ComboBox42Change(Sender: TObject);
begin
     StringGrid3.Cells[1,12] := ComboBox42.Text;
end;

procedure TFr_Main.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #9 then
     begin
          if StringGrid1.Col = 2 then
          begin
               if StringGrid1.Row = 1 then Combobox1.SetFocus else
               if StringGrid1.Row = 2 then Combobox2.SetFocus else
               if StringGrid1.Row = 3 then Combobox3.SetFocus else
               if StringGrid1.Row = 4 then Combobox4.SetFocus else
               if StringGrid1.Row = 5 then Combobox5.SetFocus else
               if StringGrid1.Row = 6 then Combobox6.SetFocus else
               if StringGrid1.Row = 7 then Combobox7.SetFocus else
               if StringGrid1.Row = 8 then Combobox8.SetFocus else
               if StringGrid1.Row = 9 then Combobox9.SetFocus else
               if StringGrid1.Row = 10 then Combobox10.SetFocus else
               if StringGrid1.Row = 11 then Combobox11.SetFocus else
               if StringGrid1.Row = 12 then Combobox12.SetFocus else
               if StringGrid1.Row = 13 then Combobox13.SetFocus else
               if StringGrid1.Row = 14 then Combobox14.SetFocus else
               if StringGrid1.Row = 15 then Combobox15.SetFocus;
          end;

     end
     else if Key = #13 then
     begin
          BitBtn10.SetFocus;
     end;
end;

procedure TFr_Main.ComboBox1Exit(Sender: TObject);
begin
     StringGrid1.Row := 1;
     StringGrid1.Col := 3;
     StringGrid1.SetFocus;
end;

procedure TFr_Main.ComboBox2Exit(Sender: TObject);
begin
     StringGrid1.Row := 2;
     StringGrid1.Col := 3;
     StringGrid1.SetFocus;
end;

procedure TFr_Main.ComboBox3Exit(Sender: TObject);
begin
     StringGrid1.Row := 3;
     StringGrid1.Col := 3;
     StringGrid1.SetFocus;
end;

procedure TFr_Main.ComboBox4Exit(Sender: TObject);
begin
     StringGrid1.Row := 4;
     StringGrid1.Col := 3;
     StringGrid1.SetFocus;
end;

procedure TFr_Main.ComboBox5Exit(Sender: TObject);
begin
     StringGrid1.Row := 5;
     StringGrid1.Col := 3;
     StringGrid1.SetFocus;
end;

procedure TFr_Main.ComboBox6Exit(Sender: TObject);
begin
     StringGrid1.Row := 6;
     StringGrid1.Col := 3;
     StringGrid1.SetFocus;
end;

procedure TFr_Main.ComboBox7Exit(Sender: TObject);
begin
     StringGrid1.Row := 7;
     StringGrid1.Col := 3;
     StringGrid1.SetFocus;
end;

procedure TFr_Main.ComboBox8Exit(Sender: TObject);
begin
     StringGrid1.Row := 8;
     StringGrid1.Col := 3;
     StringGrid1.SetFocus;
end;

procedure TFr_Main.ComboBox9Exit(Sender: TObject);
begin
     StringGrid1.Row := 9;
     StringGrid1.Col := 3;
     StringGrid1.SetFocus;
end;

procedure TFr_Main.ComboBox10Exit(Sender: TObject);
begin
     StringGrid1.Row := 10;
     StringGrid1.Col := 3;
     StringGrid1.SetFocus;
end;

procedure TFr_Main.ComboBox11Exit(Sender: TObject);
begin
     StringGrid1.Row := 11;
     StringGrid1.Col := 3;
     StringGrid1.SetFocus;
end;

procedure TFr_Main.ComboBox12Exit(Sender: TObject);
begin
     StringGrid1.Row := 12;
     StringGrid1.Col := 3;
     StringGrid1.SetFocus;
end;

procedure TFr_Main.ComboBox13Exit(Sender: TObject);
begin
     StringGrid1.Row := 13;
     StringGrid1.Col := 3;
     StringGrid1.SetFocus;
end;

procedure TFr_Main.ComboBox14Exit(Sender: TObject);
begin
     StringGrid1.Row := 14;
     StringGrid1.Col := 3;
     StringGrid1.SetFocus;
end;

procedure TFr_Main.ComboBox15Exit(Sender: TObject);
begin
     StringGrid1.Row := 15;
     StringGrid1.Col := 3;
     StringGrid1.SetFocus;
end;

procedure TFr_Main.ComboBox16Exit(Sender: TObject);
begin
     StringGrid2.Row := 1;
     StringGrid2.Col := 2;
     StringGrid2.SetFocus;
end;

procedure TFr_Main.ComboBox17Exit(Sender: TObject);
begin
     StringGrid2.Row := 2;
     StringGrid2.Col := 2;
     StringGrid2.SetFocus;
end;

procedure TFr_Main.ComboBox18Exit(Sender: TObject);
begin
     StringGrid2.Row := 3;
     StringGrid2.Col := 2;
     StringGrid2.SetFocus;
end;

procedure TFr_Main.ComboBox19Exit(Sender: TObject);
begin
     StringGrid2.Row := 4;
     StringGrid2.Col := 2;
     StringGrid2.SetFocus;
end;

procedure TFr_Main.ComboBox20Exit(Sender: TObject);
begin
     StringGrid2.Row := 5;
     StringGrid2.Col := 2;
     StringGrid2.SetFocus;
end;

procedure TFr_Main.ComboBox21Exit(Sender: TObject);
begin
     StringGrid2.Row := 6;
     StringGrid2.Col := 2;
     StringGrid2.SetFocus;
end;

procedure TFr_Main.ComboBox22Exit(Sender: TObject);
begin
     StringGrid2.Row := 7;
     StringGrid2.Col := 2;
     StringGrid2.SetFocus;
end;

procedure TFr_Main.ComboBox23Exit(Sender: TObject);
begin
     StringGrid2.Row := 8;
     StringGrid2.Col := 2;
     StringGrid2.SetFocus;
end;

procedure TFr_Main.ComboBox24Exit(Sender: TObject);
begin
     StringGrid2.Row := 9;
     StringGrid2.Col := 2;
     StringGrid2.SetFocus;
end;

procedure TFr_Main.ComboBox25Exit(Sender: TObject);
begin
     StringGrid2.Row := 10;
     StringGrid2.Col := 2;
     StringGrid2.SetFocus;
end;

procedure TFr_Main.ComboBox26Exit(Sender: TObject);
begin
     StringGrid2.Row := 11;
     StringGrid2.Col := 2;
     StringGrid2.SetFocus;
end;

procedure TFr_Main.ComboBox27Exit(Sender: TObject);
begin
     StringGrid2.Row := 12;
     StringGrid2.Col := 2;
     StringGrid2.SetFocus;
end;

procedure TFr_Main.ComboBox28Exit(Sender: TObject);
begin
     StringGrid2.Row := 13;
     StringGrid2.Col := 2;
     StringGrid2.SetFocus;
end;

procedure TFr_Main.ComboBox29Exit(Sender: TObject);
begin
     StringGrid2.Row := 14;
     StringGrid2.Col := 2;
     StringGrid2.SetFocus;
end;

procedure TFr_Main.ComboBox30Exit(Sender: TObject);
begin
     StringGrid2.Row := 15;
     StringGrid2.Col := 2;
     StringGrid2.SetFocus;
end;

procedure TFr_Main.ComboBox31Exit(Sender: TObject);
begin
     StringGrid3.Row := 1;
     StringGrid3.Col := 2;
     StringGrid3.SetFocus;
end;

procedure TFr_Main.ComboBox32Exit(Sender: TObject);
begin
     StringGrid3.Row := 2;
     StringGrid3.Col := 2;
     StringGrid3.SetFocus;
end;

procedure TFr_Main.ComboBox33Exit(Sender: TObject);
begin
     StringGrid3.Row := 3;
     StringGrid3.Col := 2;
     StringGrid3.SetFocus;
end;

procedure TFr_Main.ComboBox34Exit(Sender: TObject);
begin
     StringGrid3.Row := 4;
     StringGrid3.Col := 2;
     StringGrid3.SetFocus;
end;

procedure TFr_Main.ComboBox35Exit(Sender: TObject);
begin
     StringGrid3.Row := 5;
     StringGrid3.Col := 2;
     StringGrid3.SetFocus;
end;

procedure TFr_Main.ComboBox36Exit(Sender: TObject);
begin
     StringGrid3.Row := 6;
     StringGrid3.Col := 2;
     StringGrid3.SetFocus;
end;

procedure TFr_Main.ComboBox37Exit(Sender: TObject);
begin
     StringGrid3.Row := 7;
     StringGrid3.Col := 2;
     StringGrid3.SetFocus;
end;

procedure TFr_Main.ComboBox38Exit(Sender: TObject);
begin
     StringGrid3.Row := 8;
     StringGrid3.Col := 2;
     StringGrid3.SetFocus;
end;

procedure TFr_Main.ComboBox39Exit(Sender: TObject);
begin
     StringGrid3.Row := 9;
     StringGrid3.Col := 2;
     StringGrid3.SetFocus;
end;

procedure TFr_Main.ComboBox40Exit(Sender: TObject);
begin
     StringGrid3.Row := 10;
     StringGrid3.Col := 2;
     StringGrid3.SetFocus;
end;

procedure TFr_Main.ComboBox41Exit(Sender: TObject);
begin
     StringGrid3.Row := 11;
     StringGrid3.Col := 2;
     StringGrid3.SetFocus;
end;

procedure TFr_Main.ComboBox42Exit(Sender: TObject);
begin
     StringGrid3.Row := 12;
     StringGrid3.Col := 2;
     StringGrid3.SetFocus;
end;

procedure TFr_Main.ComboBox43Exit(Sender: TObject);
begin
     StringGrid3.Row := 13;
     StringGrid3.Col := 2;
     StringGrid3.SetFocus;
end;

procedure TFr_Main.ComboBox44Exit(Sender: TObject);
begin
     StringGrid3.Row := 14;
     StringGrid3.Col := 2;
     StringGrid3.SetFocus;
end;

procedure TFr_Main.ComboBox45Exit(Sender: TObject);
begin
     StringGrid3.Row := 15;
     StringGrid3.Col := 2;
     StringGrid3.SetFocus;
end;

procedure TFr_Main.StringGrid3KeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #9 then
     begin
          if StringGrid3.Col = 1 then
          begin
               if StringGrid3.Row = 1 then Combobox31.SetFocus else
               if StringGrid3.Row = 2 then Combobox32.SetFocus else
               if StringGrid3.Row = 3 then Combobox33.SetFocus else
               if StringGrid3.Row = 4 then Combobox34.SetFocus else
               if StringGrid3.Row = 5 then Combobox35.SetFocus else
               if StringGrid3.Row = 6 then Combobox36.SetFocus else
               if StringGrid3.Row = 7 then Combobox37.SetFocus else
               if StringGrid3.Row = 8 then Combobox38.SetFocus else
               if StringGrid3.Row = 9 then Combobox39.SetFocus else
               if StringGrid3.Row = 10 then Combobox40.SetFocus else
               if StringGrid3.Row = 11 then Combobox41.SetFocus else
               if StringGrid3.Row = 12 then Combobox42.SetFocus else
               if StringGrid3.Row = 13 then Combobox43.SetFocus else
               if StringGrid3.Row = 14 then Combobox44.SetFocus else
               if StringGrid3.Row = 15 then Combobox45.SetFocus;
          end;

     end
     else if Key = #13 then
     begin
          BitBtn11.SetFocus;
     end;
end;

procedure TFr_Main.CkL_CatClickCheck(Sender: TObject);
var i : integer;
begin
     CkL_Type.Clear;
     with DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          Params.Clear;
          SQL.Add('Select Inventory_Name');
          SQL.Add('From Inventory');
          SQL.Add('where Inventory_Name is not null ');
          for i :=0 to CkL_Cat.items.Count-1 do
          begin
               if CkL_Cat.Checked[i] = False then
               SQL.Add('and Category <> '+Char(39) +CkL_Cat.Items.Strings[i] +Char(39));
          end;
          Open;
          DM.Qr_Transaction.First;
          while not DM.Qr_Transaction.Eof do
          begin
               with DM.Qr_Transaction do
               begin
               CkL_Type.Items.Add(FieldValues['Inventory_Name']);
               DM.Qr_Transaction.Next;
               end;
          end;
          DM.Qr_Transaction.close;
     end;
     for i:=0 to CkL_Type.Items.Count-1 do
     begin
          CkL_Type.Checked[i] := True;
     end;
     BitBtn16.OnClick(Sender);
end;

procedure TFr_Main.CkL_TypeClickCheck(Sender: TObject);
begin
          BitBtn16.OnClick(Sender);
end;

procedure TFr_Main.BitBtn16Click(Sender: TObject);
Var i : Integer;
begin
     With DM.Qr_Show_Inven do
     Begin
          Close;
          SQL.Clear;
          Params.Clear;
          SQL.Add('Select Inventory_Name,Category,Sum(Have_No)[Have_No],Numerative,Min_Have,AVG(PPE)[PPE]');
          SQL.Add('From Inventory I,Lot L');
          SQL.Add('where Inventory_Name is not null and I.Inventory_ID = L.Inventory_ID');
          for i:=0 to CkL_Type.Items.Count-1 do
          begin
               if CkL_Type.Checked[i] = False then
               SQL.Add('and Inventory_Name <> '+ char(39)+CkL_Type.Items.Strings[i]+char(39));
          end;
          for i :=0 to CkL_Cat.items.Count-1 do
          begin
               if CkL_Cat.Checked[i] = False then
               SQL.Add('and Category <> '+Char(39) +CkL_Cat.Items.Strings[i] +Char(39));
          end;
          SQL.Add('Group By I.Category,I.Inventory_Name,I.Numerative,I.Min_Have');
          SQL.Add('Order By I.Category,Inventory_Name');
     Open;
     End;
end;

procedure TFr_Main.CkL_DepartClickCheck(Sender: TObject);
begin
     Bring_ShowClick(Sender);
end;

procedure TFr_Main.Ckl_Cat2ClickCheck(Sender: TObject);
var i : integer;
begin
     CkL_Type2.Clear;
     with DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          Params.Clear;
          SQL.Add('Select Inventory_Name');
          SQL.Add('From Inventory');
          SQL.Add('where Inventory_Name is not null ');
          for i :=0 to CkL_Cat2.items.Count-1 do
          begin
               if CkL_Cat2.Checked[i] = False then
               SQL.Add('and Category <> '+Char(39) +CkL_Cat2.Items.Strings[i] +Char(39));
          end;
          Open;
          DM.Qr_Transaction.First;
          while not DM.Qr_Transaction.Eof do
          begin
               with DM.Qr_Transaction do
               begin
               CkL_Type2.Items.Add(FieldValues['Inventory_Name']);
               DM.Qr_Transaction.Next;
               end;
          end;
          DM.Qr_Transaction.close;
     end;
     for i:=0 to CkL_Type2.Items.Count-1 do
     begin
          CkL_Type2.Checked[i] := True;
     end;
     Bring_ShowClick(Sender);
end;

procedure TFr_Main.Ckl_Type2ClickCheck(Sender: TObject);
begin
          Bring_ShowClick(Sender);
end;

procedure TFr_Main.Bring_ShowClick(Sender: TObject);
Var i : Integer;
begin
     With DM.Qr_Show_Bring do
     Begin
          Close;
          SQL.Clear;
          Params.Clear;
          SQL.Add('Select  Department_Name,Category,Inventory_Name,Sum(Bring_No)');
          SQL.Add('From Transaction_ T,Inventory I,DepartMent DP');
          SQL.Add('Where (T.Inventory_ID =  I.Inventory_ID)and (T.Department_ID =  DP.Department_ID) and Bring_No is not Null');
          for i:=0 to CkL_Depart.Items.Count-1 do
          begin
               if CkL_Depart.Checked[i] = False then
               SQL.Add('and Department_Name <> '+ char(39)+CkL_Depart.Items.Strings[i]+char(39));
          end;
          for i:=0 to CkL_Type2.Items.Count-1 do
          begin
               if CkL_Type2.Checked[i] = False then
               SQL.Add('and Inventory_Name <> '+ char(39)+CkL_Type.Items.Strings[i]+char(39));
          end;
          for i :=0 to CkL_Cat2.items.Count-1 do
          begin
               if CkL_Cat2.Checked[i] = False then
               SQL.Add('and Category <> '+Char(39) +CkL_Cat.Items.Strings[i] +Char(39));
          end;
          SQL.Add('and T.Date_ >= :D1 and T.Date_ <= :D2');
          SQL.Add('Group By Department_Name,Category,Inventory_Name');
          ParamByName('D1').AsDateTime := Bring_D1.DateTime;
          Temp_Date.Date := Bring_D2.Date +1;
          ParamByName('D2').AsDateTime := Temp_Date.DateTime;
          ExecSQL;
     End;
     DM.Qr_Show_Bring.Close;
     DM.Qr_Show_Bring.Open;
end;

procedure TFr_Main.TabSheet9Show(Sender: TObject);
var i : Integer;
begin
     DM.Qr_Year.Close;
     DM.Qr_Year.Open;
     CkL_Type.Clear;
     DM.Tb_Type.Refresh;
     DM.Tb_Type.First;
     While not DM.Tb_Type.Eof do
     begin
          CkL_Type.Items.Add(DM.Tb_Type.FieldValues['Inventory_Name']);
          DM.Tb_Type.Next;
     end;
     CkL_Cat.Clear;
     with DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          Params.Clear;
          SQL.text := 'Select Distinct Category From Inventory';
          Open;
     end;
     DM.Qr_Transaction.First;
     while not DM.Qr_Transaction.Eof do
     begin
          with DM.Qr_Transaction do
          CkL_Cat.Items.Add(FieldValues['Category']);
          DM.Qr_Transaction.Next;
     end;
     DM.Qr_Transaction.close;
     CkL_Depart.Clear;
     with DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          Params.Clear;
          SQL.text := 'Select Department_Name From Department';
          Open;
     end;
     DM.Qr_Transaction.First;
     i := -1;
     while not DM.Qr_Transaction.Eof do
     begin
          i:=i+1;
          with DM.Qr_Transaction do
          CkL_Depart.Items.Add(FieldValues['Department_Name']);
          CkL_Depart.Checked[i] := True;
          DM.Qr_Transaction.Next;
     end;
     DM.Qr_Transaction.close;

     CkL_Cat2.Items :=  CkL_Cat.Items;
     CkL_Type2.Items := CkL_Type.Items;
     for i:=0 to CkL_Type.Items.Count-1 do
     begin
          CkL_Type.Checked[i] := True;
          CkL_Type2.Checked[i] := True;
//          CkL_Room3.Checked[i] := True;
     end;
     for i:=0 to CkL_Cat.Items.Count-1 do
     begin
          CkL_Cat.Checked[i] := True;
          CkL_Cat2.Checked[i] := True;
//          CkL_Department3.Checked[i] := True;
     end;
     DM.Qr_Show_Inven.Close;
     DM.Qr_Show_Inven.Open;
     BitBtn16.OnClick(Sender);
     Bring_Show.Click;
     
end;

procedure TFr_Main.TabSheet2Show(Sender: TObject);
begin
     if not (Inven_Change3) then exit;
     with DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          Params.Clear;
          SQL.text := 'Select Distinct Inventory_Name From Inventory';
          Open;
     end;
     ComboBox31.Items.Clear;
     while not DM.Qr_Transaction.Eof do
     begin
          with DM.Qr_Transaction do
          begin
               Combobox31.Items.Add(FieldValues['Inventory_Name']);
               DM.Qr_Transaction.Next;
          end;
          ComboBox32.Items := ComboBox31.Items;
          ComboBox33.Items := ComboBox31.Items;
          ComboBox34.Items := ComboBox31.Items;
          ComboBox35.Items := ComboBox31.Items;
          ComboBox36.Items := ComboBox31.Items;
          ComboBox37.Items := ComboBox31.Items;
          ComboBox38.Items := ComboBox31.Items;
          ComboBox39.Items := ComboBox31.Items;
          ComboBox40.Items := ComboBox31.Items;
          ComboBox41.Items := ComboBox31.Items;
          ComboBox42.Items := ComboBox31.Items;
          ComboBox43.Items := ComboBox31.Items;
          ComboBox44.Items := ComboBox31.Items;
          ComboBox45.Items := ComboBox31.Items;
          Inven_Change3 := False;
     end;
end;

procedure TFr_Main.Bring_D1Change(Sender: TObject);
begin
     If Bring_D1.Date > Bring_D2.Date then
     Begin
          ShowMessage ('วันที่เริ่มต้นมากกว่าวันที่สิ้นสุด');
          Bring_D2.Date := Bring_D1.Date;
     end;
     Bring_Show.Click;
end;

procedure TFr_Main.Bring_D2Change(Sender: TObject);
begin
    If Bring_D1.Date > Bring_D2.Date then
     Begin
          ShowMessage ('วันที่สิ้นสุดน้อยกว่าวันที่เร้มต้น');
          Bring_D1.Date := Bring_D2.Date;
     end;
     Bring_Show.Click;
end;

procedure TFr_Main.TabSheet11Show(Sender: TObject);
begin
     Bring_D1.Date := Date-30;
     Bring_D2.Date := Date;
     //Bring_D1.MaxDate := Date+1;
     //Bring_D2.MaxDate := Date+1;
     Bring_Show.Click;
end;


procedure TFr_Main.Bring_PrintClick(Sender: TObject);
Var i : Integer;
    S1,s2 : string;
    Year_buy,Date_Buy,Month_Buy : word;
begin
     With DM.Qr_Show_Bring do
     Begin
          Close;
          SQL.Clear;
          Params.Clear;
          SQL.Add('Select  Department_Name,Category,Inventory_Name,Sum(Bring_No)');
          SQL.Add('From Transaction_ T,Inventory I,DepartMent DP');
          SQL.Add('Where (T.Inventory_ID =  I.Inventory_ID)and (T.Department_ID =  DP.Department_ID) and Bring_No is not Null');
          for i:=0 to CkL_Depart.Items.Count-1 do
          begin
               if CkL_Depart.Checked[i] = False then
               SQL.Add('and Department_Name <> '+ char(39)+CkL_Depart.Items.Strings[i]+char(39));
          end;
          for i:=0 to CkL_Type2.Items.Count-1 do
          begin
               if CkL_Type2.Checked[i] = False then
               SQL.Add('and Inventory_Name <> '+ char(39)+CkL_Type.Items.Strings[i]+char(39));
          end;
          for i :=0 to CkL_Cat2.items.Count-1 do
          begin
               if CkL_Cat2.Checked[i] = False then
               SQL.Add('and Category <> '+Char(39) +CkL_Cat.Items.Strings[i] +Char(39));
          end;
          SQL.Add('and T.Date_ >= :D1 and T.Date_ <= :D2');
          SQL.Add('Group By Department_Name,Category,Inventory_Name');
          ParamByName('D1').AsDateTime := Bring_D1.DateTime;
          Temp_Date.Date := Bring_D2.Date +1;
          ParamByName('D2').AsDateTime := Temp_Date.DateTime;
          ExecSQL;
     End;
     DM.Qr_Show_Bring.Close;
     DM.Qr_Show_Bring.Open;

     DecodeDate(Bring_D1.Date,Year_Buy,Month_Buy,Date_Buy);
     Year_buy := Year_Buy + 543;
     S1 := IntToStr(Date_Buy)+'/'+IntToStr(Month_buy)+'/'+IntToStr(Year_Buy);

     DecodeDate(Bring_D2.Date,Year_Buy,Month_Buy,Date_Buy);
     Year_buy := Year_Buy + 543;
     S2 := IntToStr(Date_Buy)+'/'+IntToStr(Month_buy)+'/'+IntToStr(Year_Buy);

     Fr_Bring_Print.QR_L1.Caption := 'รายงานการเบิก ตั้งแต่ '+S1+' ถึง '+S2;
     Fr_Bring_Print.QuickRep1.Preview;
end;

procedure TFr_Main.N4Click(Sender: TObject);
begin
   if Lv_Voucher_Detail.SelCount = 0 then
     begin
          exit;
     end;
     Clear_Voucher;
     ShowVoucherDetail(Lv_Voucher_Detail.Selected.Caption);
     Fr_EditVoucher.Button3.Caption := 'พิมพ์';
     Fr_EditVoucher.ShowModal;
end;




procedure TFr_Main.TabSheet1Show(Sender: TObject);
var  D : TDateTime;
     Year,Month,Day : Word;
begin
     d := Now;
     DecodeDate(D,Year,Month,Day);
     if Month < 10 Then
     Begin
          Money.Items.Text := 'เงินงบประมาณประจำปี '+ Inttostr(Year+543) +Char(13) +'เงินรายได้ประจำปี '+ Inttostr(Year+543);
     End
     Else Money.Items.Text := 'เงินงบประมาณประจำปี '+ Inttostr(Year+544) + #13 +'เงินรายได้ประจำปี '+ Inttostr(Year+544);
end;

procedure TFr_Main.PopupMenu1Popup(Sender: TObject);
begin
     PopupMenu1.Items[1].Visible := True;
     PopupMenu1.Items[2].Visible := True;
     PopupMenu1.Items[3].Visible := True;
     with DM.Qr_Transaction do
     begin
          Close;
          SQL.Clear;
          SQL.Text := 'select * from transaction_ where voice_ID = '+ #39 + Lv_Voucher_Detail.Selected.Caption+ #39 ;
          Open;
          If FieldValues['Transaction_ID'] <> Null Then
          begin
          PopupMenu1.Items[1].Visible := False;
          PopupMenu1.Items[2].Visible := False;
          PopupMenu1.Items[3].Visible := False;
          //ShowMessage ('ใบสั่งซื้อ'+Lv_Voucher_Detail.Selected.Caption+'มีการรับของแล้วไม่สามารถแก้ไขได้');
          exit;
          end;
     end;
end;

procedure TFr_Main.Type_PrintClick(Sender: TObject);
begin
     Fr_InVen_CAT.QuickRep1.Preview;     
end;

procedure TFr_Main.Year_PrintClick(Sender: TObject);
begin
     Fr_Print_Year.QuickRep1.Preview;
end;

procedure TFr_Main.TabSheet12Show(Sender: TObject);
begin
     DM.Qr_Year.Close;
     DM.Qr_Year.Open;
end;

end.

