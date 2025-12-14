unit SaveFile;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, Buttons, main, ComCtrls, Spin;

const
   MinTimer = 4;
type
  TForm4 = class(TForm)
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Bitn_Ok: TBitBtn;
    Label3: TLabel;
    Btn_NewFolder: TButton;
    SpinEdit1: TSpinEdit;
    Label4: TLabel;
    SpinEdit2: TSpinEdit;
    Label5: TLabel;
    Bitn_Cancel: TBitBtn;
    CheckBox1: TCheckBox;
    pathName: TDirectoryListBox;
    procedure DriveComboBox1Change(Sender: TObject);
    procedure DirectoryListBox1Change(Sender: TObject);
    procedure Bitn_OkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Btn_NewFolderClick(Sender: TObject);
    procedure Bitn_CancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    directory : string;
  end;

var
  FormSaveFile: TForm4;
  path : string;

implementation

uses NewFolder;

{$R *.DFM}

procedure TForm4.FormCreate(Sender: TObject);
var
   str : shortstring;
begin
   SpinEdit1.MinValue := MinTimer;
   Edit1.Text := DirectoryListBox1.Directory;
   fillchar(str,256,' ');
   Stream := TFileStream.Create('directory.txt',fmOpenRead+fmShareDenyNone);
   Stream.read(str,50);
   Stream.Free;
   DirectoryListBox1.Directory := str;
   directory := str;
   Edit1.Text := str;
   path := pathName.Directory;
end;

procedure TForm4.DriveComboBox1Change(Sender: TObject);
begin
   DirectoryListBox1.Drive := DriveComboBox1.Drive;

end;

procedure TForm4.DirectoryListBox1Change(Sender: TObject);
begin
   directory := DirectoryListBox1.Directory;
   Edit1.Text := directory;
end;

procedure TForm4.Bitn_OkClick(Sender: TObject);
var
   timer : integer;
   stw : shortstring;
   a : integer;
   Stream2 : Tfilestream;
begin
   timer := SpinEdit1.Value*1000;
   FormMain.Timer5.Interval := timer;
   if CheckBox1.Checked then
   begin
      Stream2 := TFileStream.Create(path+'/directory.txt',fmOpenWrite);//+fmShareDenyWrite);
      stw := DirectoryListBox1.Directory;
      Stream2.Write(stw,length(stw)+1);
      Stream2.Free;
   end;
   FormSaveFile.Close;
end;

procedure TForm4.Btn_NewFolderClick(Sender: TObject);
var
   directory : string;
   len_directory : byte;
begin
   FormNewFolder.ShowModal;
   directory := DirectoryListBox1.Directory;
   if FormNewFolder.click then
   begin
      len_directory := length(directory);
      if len_directory>3 then directory := directory+'\'+FormNewFolder.Edit1.Text
      else if len_directory=3 then directory := directory+FormNewFolder.Edit1.Text;
      if not CreateDir(directory) then
      raise Exception.Create('Cannot create '+directory);
      DirectoryListBox1.Update;
   end;
   DirectoryListBox1.Directory := directory;
end;

procedure TForm4.Bitn_CancelClick(Sender: TObject);
begin
   FormSaveFile.Close;
end;

end.
