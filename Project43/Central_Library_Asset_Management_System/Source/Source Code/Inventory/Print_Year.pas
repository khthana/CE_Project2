unit Print_Year;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  TFr_Print_Year = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    TitleBand1: TQRBand;
    QRLabel6: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel1: TQRLabel;
    QRGroup2: TQRGroup;
    ChildBand1: TQRChildBand;
    ChildBand2: TQRChildBand;
    QRGroup3: TQRGroup;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr2: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_Print_Year: TFr_Print_Year;

implementation

{$R *.DFM}

end.
