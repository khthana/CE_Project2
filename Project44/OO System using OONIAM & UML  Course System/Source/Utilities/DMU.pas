unit DMU;

interface
//{$DEFINE __WINNT}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Registry,ImgList,Variants,inifiles, CacheObject_TLB;

const
    ALIAS_RESUME  = 10000;
      TABLE_RESUME_MAIN = 10001;
      TABLE_RESUME_PROVINCE = 10002;
      SQL_RESUME_OLDSCHOOL = 10003;
    ALIAS_CLASS   = 11000;
    ALIAS_SUBJECT = 12000;
    ALIAS_PROGRAM = 13000;
    ALIAS_FINISHED= 14000;

    ALIAS_NEWREG  = 20000;
    ALIAS_OLDREG  = 21000;
    ALIAS_GROUPREG= 22000;
    ALIAS_ACTREG  = 23000;
    ALIAS_SEMESTER= 24000;
    ALIAS_REGRADE = 25000;

type
  TXDMU = class(TDataModule)
    OpenDLG: TOpenDialog;
    SaveDLG: TSaveDialog;
    FontDLG: TFontDialog;
    SetupDLG: TPrinterSetupDialog;
    MainImages: TImageList;
    BigImage: TImageList;
    Image16: TImageList;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  XDMU: TXDMU;
  DEV_MODE : boolean;
implementation

uses MyUnits, constant;

{$R *.DFM}

procedure TXDMU.DataModuleCreate(Sender: TObject);
begin
  SysUtils.SetCurrentDir('..');
end;

end.
