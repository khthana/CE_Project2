unit Print_Check;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  TFr_Print_Check = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    TitleBand1: TQRBand;
    QRLabel6: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRGroup2: TQRGroup;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    ChildBand1: TQRChildBand;
    ChildBand2: TQRChildBand;
    QRGroup3: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRBand2: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel14: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_Print_Check: TFr_Print_Check;

implementation

uses DataModule;

{$R *.DFM}

end.
