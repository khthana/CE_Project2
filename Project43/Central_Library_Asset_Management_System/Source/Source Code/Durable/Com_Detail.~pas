unit Com_Detail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons ,ComObj ,AutoTools;

type
  TFr_Com_Detail = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Ed_CPU: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Ed_Monitor: TEdit;
    Ed_Harddisk: TEdit;
    Ed_Ram: TEdit;
    Ed_Mouse: TEdit;
    Ed_Keyboard: TEdit;
    Ed_Lancard: TEdit;
    Ed_CDROM: TEdit;
    Ed_Speaker: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Ed_Soundcard: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    ComboBox10: TComboBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    AutoComplete2 : IAutoComplete2;
    Strs : IUnknown;
  public
    { Public declarations }
  end;

var
  Fr_Com_Detail: TFr_Com_Detail;

implementation

uses Main_Durable, DataModule;

{$R *.DFM}

procedure TFr_Com_Detail.BitBtn2Click(Sender: TObject);
begin
     Ed_CPU.Text := '';
     Ed_Monitor.Text := '';
     Ed_Harddisk.Text := '';
     Ed_Ram.Text := '';
     Ed_Mouse.Text := '';
     Ed_Keyboard.Text := '';
     Ed_Lancard.Text := '';
     Ed_CDROM.Text := '';
     Ed_SoundCard.Text := '';
     Ed_Speaker.Text := '';
end;

procedure TFr_Com_Detail.FormShow(Sender: TObject);
begin
     with DataModule1.Qr_Transaction do
     begin
          Close;
          SQL.Text := 'select Distinct CPU from Computer_Detail';
          Open;
          if FieldValues['CPU'] <> Null then
          Begin
               ComboBox1.Items.Clear;
               First;
               while not(Eof) do
               begin
                    if FieldByName('CPU').AsString <> '' then
                    ComboBox1.Items.Add(FieldByName('CPU').AsString);
                    Next;
               end;
               Try
                    Strs := TEnumString.Create(ComboBox1.Items) as IUnknown;
                    AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
                    OleCheck(AutoComplete2.SetOptions(ACO_AUTOAPPEND or ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
                    OleCheck(AutoComplete2.Init(Ed_CPU.Handle,Strs,nil,nil));
               Except
               End;
          end;
          Close;
          SQL.Text := 'select Distinct Monitor from Computer_Detail';
          Open;
          if FieldValues['Monitor'] <> Null then
          Begin
               ComboBox2.Items.Clear;
               First;
               while not(Eof) do
               begin
                    if FieldByName('Monitor').AsString <> '' then
                    ComboBox2.Items.Add(FieldByName('Monitor').AsString);
                    Next;
               end;
               Try
                    Strs := TEnumString.Create(ComboBox2.Items) as IUnknown;
                    AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
                    OleCheck(AutoComplete2.SetOptions(ACO_AUTOAPPEND or ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
                    OleCheck(AutoComplete2.Init(Ed_Monitor.Handle,Strs,nil,nil));
               Except
               End;
          end;
          Close;
          SQL.Text := 'select Distinct HardDisk from Computer_Detail';
          Open;
          if FieldValues['HardDisk'] <> Null then
          Begin
               ComboBox3.Items.Clear;
               First;
               while not(Eof) do
               begin
                    if FieldByName('HardDisk').AsString <> '' then
                    ComboBox3.Items.Add(FieldByName('HardDisk').AsString);
                    Next;
               end;
               Try
                    Strs := TEnumString.Create(ComboBox3.Items) as IUnknown;
                    AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
                    OleCheck(AutoComplete2.SetOptions(ACO_AUTOAPPEND or ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
                    OleCheck(AutoComplete2.Init(Ed_HardDisk.Handle,Strs,nil,nil));
               Except
               End;
          end;
          Close;
          SQL.Text := 'select Distinct RAM from Computer_Detail';
          Open;
          if FieldValues['RAM'] <> Null then
          Begin
               ComboBox4.Items.Clear;
               First;
               while not(Eof) do
               begin
                    if FieldByName('RAM').AsString <> '' then
                    ComboBox4.Items.Add(FieldByName('RAM').AsString);
                    Next;
               end;
               Try
                    Strs := TEnumString.Create(ComboBox4.Items) as IUnknown;
                    AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
                    OleCheck(AutoComplete2.SetOptions(ACO_AUTOAPPEND or ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
                    OleCheck(AutoComplete2.Init(Ed_RAM.Handle,Strs,nil,nil));
               Except
               End;
          end;
          Close;
          SQL.Text := 'select Distinct Mouse from Computer_Detail';
          Open;
          if FieldValues['Mouse'] <> Null then
          Begin
               ComboBox5.Items.Clear;
               First;
               while not(Eof) do
               begin
                    if FieldByName('Mouse').AsString <> '' then
                    ComboBox5.Items.Add(FieldByName('Mouse').AsString);
                    Next;
               end;
               Try
                    Strs := TEnumString.Create(ComboBox5.Items) as IUnknown;
                    AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
                    OleCheck(AutoComplete2.SetOptions(ACO_AUTOAPPEND or ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
                    OleCheck(AutoComplete2.Init(Ed_Mouse.Handle,Strs,nil,nil));
               Except
               End;
          end;
          Close;
          SQL.Text := 'select Distinct KeyBoard from Computer_Detail';
          Open;
          if FieldValues['KeyBoard'] <> Null then
          Begin
               ComboBox6.Items.Clear;
               First;
               while not(Eof) do
               begin
                    if FieldByName('KeyBoard').AsString <> '' then
                    ComboBox6.Items.Add(FieldByName('KeyBoard').AsString);
                    Next;
               end;
               Try
                    Strs := TEnumString.Create(ComboBox6.Items) as IUnknown;
                    AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
                    OleCheck(AutoComplete2.SetOptions(ACO_AUTOAPPEND or ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
                    OleCheck(AutoComplete2.Init(Ed_KeyBoard.Handle,Strs,nil,nil));
               Except
               End;
          end;
          Close;
          SQL.Text := 'select Distinct LanCard from Computer_Detail';
          Open;
          if FieldValues['LanCard'] <> Null then
          Begin
               ComboBox7.Items.Clear;
               First;
               while not(Eof) do
               begin
                    if FieldByName('LanCard').AsString <> '' then
                    ComboBox7.Items.Add(FieldByName('LanCard').AsString);
                    Next;
               end;
               Try
                    Strs := TEnumString.Create(ComboBox7.Items) as IUnknown;
                    AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
                    OleCheck(AutoComplete2.SetOptions(ACO_AUTOAPPEND or ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
                    OleCheck(AutoComplete2.Init(Ed_LanCard.Handle,Strs,nil,nil));
               Except
               End;
          end;
          Close;
          SQL.Text := 'select Distinct CD_ROM from Computer_Detail';
          Open;
          if FieldValues['CD_ROM'] <> Null then
          Begin
               ComboBox8.Items.Clear;
               First;
               while not(Eof) do
               begin
                    if FieldByName('CD_ROM').AsString <> '' then
                    ComboBox8.Items.Add(FieldByName('CD_ROM').AsString);
                    Next;
               end;
               Try
                    Strs := TEnumString.Create(ComboBox8.Items) as IUnknown;
                    AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
                    OleCheck(AutoComplete2.SetOptions(ACO_AUTOAPPEND or ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
                    OleCheck(AutoComplete2.Init(Ed_CDROM.Handle,Strs,nil,nil));
               Except
               End;
          end;
          Close;
          SQL.Text := 'select Distinct SoundCard from Computer_Detail';
          Open;
          if FieldValues['SoundCard'] <> Null then
          Begin
               ComboBox9.Items.Clear;
               First;
               while not(Eof) do
               begin
                    if FieldByName('SoundCard').AsString <> '' then
                    ComboBox9.Items.Add(FieldByName('SoundCard').AsString);
                    Next;
               end;
               Try
                    Strs := TEnumString.Create(ComboBox9.Items) as IUnknown;
                    AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
                    OleCheck(AutoComplete2.SetOptions(ACO_AUTOAPPEND or ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
                    OleCheck(AutoComplete2.Init(Ed_SoundCard.Handle,Strs,nil,nil));
               Except
               End;
          end;
          Close;
          SQL.Text := 'select Distinct Speaker from Computer_Detail';
          Open;
          if FieldValues['Speaker'] <> Null then
          Begin
               ComboBox10.Items.Clear;
               First;
               while not(Eof) do
               begin
                    if FieldByName('Speaker').AsString <> '' then
                    ComboBox10.Items.Add(FieldByName('Speaker').AsString);
                    Next;
               end;
               Try
                    Strs := TEnumString.Create(ComboBox10.Items) as IUnknown;
                    AutoComplete2 := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
                    OleCheck(AutoComplete2.SetOptions(ACO_AUTOAPPEND or ACO_AUTOSUGGEST or ACO_UPDOWNKEYDROPSLIST));
                    OleCheck(AutoComplete2.Init(Ed_Speaker.Handle,Strs,nil,nil));
               Except
               End;
          end;
     end;
end;

end.
