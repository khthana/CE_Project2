unit MDIFrame;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ToolWin, ComCtrls, StdActns, ActnList, ImgList;

type
  TFrameForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Window1: TMenuItem;
    Tile1: TMenuItem;
    Cascade1: TMenuItem;
    Arrangeicons1: TMenuItem;
    OpenFileDialog: TOpenDialog;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ActionList1: TActionList;
    FileNew1: TAction;
    FileOpen1: TAction;
    FileClose1: TWindowClose;
    FileSave1: TAction;
    FileSaveAs1: TAction;
    FileExit1: TAction;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    WindowMinimizeAll1: TWindowMinimizeAll;
    WindowArrangeAll1: TWindowArrange;
    HelpAbout1: TAction;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    Run1: TMenuItem;
    Compile1: TMenuItem;
    Download1: TMenuItem;
    ToolButton15: TToolButton;
    procedure Exit1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Tile1Click(Sender: TObject);
    procedure Cascade1Click(Sender: TObject);
    procedure Arrangeicons1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure Compile1Click(Sender: TObject);
    procedure Download1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrameForm: TFrameForm;

implementation

uses MDIEdit, Open_ASM, MnForm;

{$R *.dfm}

procedure TFrameForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrameForm.New1Click(Sender: TObject);
begin
  TEditForm.Create(Self);
end;

procedure TFrameForm.Tile1Click(Sender: TObject);
begin
  Tile;
end;

procedure TFrameForm.Cascade1Click(Sender: TObject);
begin
  Cascade;
end;

procedure TFrameForm.Arrangeicons1Click(Sender: TObject);
begin
  ArrangeIcons;
end;

procedure TFrameForm.Open1Click(Sender: TObject);
begin
  if OpenFileDialog.Execute then
  with TEditForm.Create(Self) do
    Open(OpenFileDialog.FileName);
end;

procedure TFrameForm.ToolButton13Click(Sender: TObject);
begin
        Form1.showmodal;
end;

procedure TFrameForm.ToolButton14Click(Sender: TObject);
begin
        Dlform.showmodal;
end;

procedure TFrameForm.Compile1Click(Sender: TObject);
begin
       form1.ShowModal;
end;

procedure TFrameForm.Download1Click(Sender: TObject);
begin
        dlform.ShowModal;
end;

end.
