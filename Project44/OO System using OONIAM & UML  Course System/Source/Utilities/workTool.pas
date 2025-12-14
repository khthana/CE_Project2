unit worktool;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls;

type
  TMyTool = class(TToolBar)
  private
    FChild : TList;
    FCaptions : TStrings;
    FHints : TStrings;
    { Private declarations }
  protected
    { Protected declarations }
    procedure CloseApp(Sender : TObject);
    procedure OnMyButtonClick(Sender : TObject);
  public
    Constructor Create(AOwner : TComponent);override;
    Destructor Destroy;override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetCaption(frm : TForm);
    procedure Update(frm : TObject);
    procedure UpdateState(frm: TForm; s: boolean);
    procedure Next;
    procedure Pior;
    { Public declarations }
  published
    property Captions : TStrings read FCaptions write FCaptions;
    property Hints : TStrings read FHints write FHints;
    { Published declarations }
  end;

procedure Register;

implementation

uses FormX,Command;

procedure TMyTool.CloseApp(Sender: TObject);
begin
  Application.MainForm.ActiveMDIChild.Close;
end;

constructor TMyTool.Create(AOwner: TComponent);
var t : TTabSheet;
begin
  inherited Create(AOwner);
  ButtonWidth := 200;
  FChild := TList.Create;
  FCaptions := TStringList.Create;
  FHints := TStringList.Create;
end;

destructor TMyTool.Destroy;
var t : TToolButton;
    i : integer;
begin
  FChild.Free;
  FCaptions.Free;
  FHints.Free;
  inherited Destroy;
end;


procedure TMyTool.Next;
var i,idx : smallint;
begin
  i := 0;
  idx := 0;
  for i := 0 to ButtonCount -1 do
  begin
    if Buttons[i].Down then idx := i;
  end;
  if idx < (ButtonCount-1) then inc(idx)
  else idx := 0;
  Buttons[idx].Click;
end;

procedure TMyTool.Notification(AComponent: TComponent;
  Operation: TOperation);
var t : TToolButton;
    i : integer;
begin
  inherited Notification(AComponent,Operation);
  
  if (AComponent is TFormX) then
  begin
    if Operation = opInsert then
    begin
      if AComponent is TForm then
      begin
        FCaptions.Append('Loading...');
        FHints.Append('Y');
        t := TToolButton.Create(Self);
        t.Parent := Self;
        t.Grouped := true;
        t.Down := true;
        t.Style := tbsCheck;
        t.ImageIndex := 12;
        t.ShowHint := true;
        t.OnClick := OnMyButtonClick;
        FChild.Add(AComponent);
        TWinControl(Parent).Visible := True;
      end;
    end
    else
    begin
      if AComponent is TForm then
      begin
        i := FChild.IndexOf(AComponent);
        if i > -1 then
        begin
          try
            t := Self.Buttons[i];
            t.Destroy;
            FChild.Delete(i);
            FCaptions.Delete(i);
            FHints.Delete(i);
          except

          end;
        end;
        TWinControl(Parent).Visible := FChild.Count > 0;
      end;
    end;
  end;
end;

procedure TMyTool.OnMyButtonClick(Sender: TObject);
var i : integer;
begin
  if Self.ButtonCount = 0 then exit;
  i := TToolButton(Sender).Index;
  Update(TObject(FChild[i]));
  TToolButton(Sender).Caption := FCaptions[TToolButton(Sender).InDex];
  TForm(FChild.Items[i]).WindowState := wsMaximized;
  TForm(FChild.Items[i]).Show;
end;

procedure TMyTool.Pior;
var i,idx : smallint;
begin
  i := 0;
  idx := 0;
  for i := 0 to ButtonCount -1 do
  begin
    if Buttons[i].Down then idx := i;
  end;
  if idx > 0 then dec(idx)
  else idx := ButtonCount-1;
  Buttons[idx].Click;
end;

procedure TMyTool.SetCaption(frm: TForm);
var t : TToolButton;
    i : integer;
    s : string;
begin
    i := FChild.IndexOf(frm);
    t := Buttons[i];
    s := TCommandForm(frm).Caption;

    if Canvas.TextWidth(s) < ButtonWidth - 30 then
    t.Caption := s
    else
    begin
      while Canvas.TextWidth(s) > ButtonWidth - 40 do Delete(s,length(s),1);
      s := s + '...';
      t.Caption := s;
    end;
    FCaptions[i] := s;
    FHints[i] := TCommandForm(frm).Caption;
    TCommandForm(frm).SpClose.OnClick := CloseApp;
    Update(frm);
    if assigned(OnCustomDrawButton) then Self.Repaint;
end;



procedure TMyTool.Update(frm: TObject);
var i : smallint;
begin
  i := 0;
  while(i < FChild.Count)do
  begin
    if FChild[i] = frm then
    begin
      Buttons[i].Down := true;
      exit;
    end
    else Buttons[i].Down := false;
    inc(i);
  end;
end;

procedure Register;
begin
  RegisterComponents('A++', [TMyTool]);
end;

procedure TMyTool.UpdateState(frm: TForm; s: boolean);
var i : smallint;
begin
  i := FChild.IndexOf(frm);
  if s 
  then Buttons[i].ImageIndex := 13
  else Buttons[i].ImageIndex := 12
end;

end.
