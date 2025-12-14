unit dialog;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, ComCtrls, XPMenu;

type
  TEditDialog = class(TForm)
    mOKBtn: TButton;
    mCancelBtn: TButton;
    ControlPanel: TPanel;
    ButtonPanel: TPanel;
    GrBtn: TPanel;
    OKBtn: TSpeedButton;
    CancelBtn: TSpeedButton;
    procedure _OKBtnClick(Sender: TObject);
    procedure _CancelBtnClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  protected
    FModified : boolean;
    procedure SyncObjectToScreen;virtual;
    procedure SyncScreenToObject;virtual;
    procedure ClearScreen;virtual;
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
  end;

var
  EditDialog: TEditDialog;

implementation

uses MyUnits, constant;

{$R *.DFM}
{$DEFINE __WINXP}
{ TEditDailog }

procedure TEditDialog._OKBtnClick(Sender: TObject);
begin
  mOKBtn.Click;
end;

procedure TEditDialog._CancelBtnClick(Sender: TObject);
begin
  mCancelBtn.Click;
end;

procedure TEditDialog.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then mOKBtn.Click
  else if Key = #27 then mCancelBtn.Click;
end;

constructor TEditDialog.Create(AOwner: TComponent);
var i : smallint;
  t : TObject;
begin
  inherited;
  CancelBtn.Left := 85;
  OKBtn.Left := 15;
  CancelBtn.Top := 6;
  OKBtn.Top := 6;
  if DEFAULTINTERFACE then
  begin
    Font.Name := _FONTNAME;
    Font.Size := _FONTSIZE;
    Font.Charset := THAI_CHARSET;
    //Self.Color := clSkyBlue;
    for i := 0 to ComponentCount -1 do
    begin
      t := Components[i];
      if (t is TSpeedButton) then
      begin
        TSpeedButton(t).Flat := true;
        TSpeedButton(t).Height := 25;
        //TSpeedButton(t).Glyph := Image1.Picture.Bitmap;
      end
      else if(t is TComboBox) then
      begin
        TComboBox(t).BevelKind := bkSoft;
      end
      else if(t is TListBox) then
      begin
        TListBox(t).BevelKind := bkSoft;
        TListBox(t).BorderStyle := bsNone;
      end
      else if(t is TEdit) then
      begin
        TEdit(t).BevelKind := bkSoft;
        TEdit(t).BorderStyle := bsNone;
      end
      else if(t is TStaticText) then
      begin
        TStaticText(t).BevelKind := bkSoft;
        TStaticText(t).BorderStyle := sbsNone;
        TStaticText(t).ParentColor := true;
      end
      else if(t is TLabeledEdit) then
      begin
        TLabeledEdit(t).BevelKind := bkSoft;
        TLabeledEdit(t).BorderStyle := bsNone;
      end
      else if(t is TListView) then
      begin
        TListView(t).BevelKind := bkSoft;
        TListView(t).BorderStyle := bsNone;
        TListView(t).FlatScrollBars := true;
        TListView(t).Ctl3D := false;
      end
      else if(t is TTreeView) then
      begin
        TTreeView(t).BevelKind := bkSoft;
        TTreeView(t).BorderStyle := bsNone;
        TTreeView(t).ParentColor := true;
        TTreeView(t).Ctl3D := false;
      end
    end;
  end;
end;

procedure TEditDialog.SyncObjectToScreen;
begin

end;

procedure TEditDialog.SyncScreenToObject;
begin

end;

procedure TEditDialog.ClearScreen;
var i : integer;
begin
  for i := 0 to ComponentCount -1 do
  if Components[i] is TEdit then
    TEdit(Components[i]).Text := '';
end;

end.
