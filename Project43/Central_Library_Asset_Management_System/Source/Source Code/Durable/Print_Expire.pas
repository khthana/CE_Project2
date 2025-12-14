unit Print_Expire;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFr_Print_Expire = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    TitleBand1: TQRBand;
    QRLabel6: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    ChildBand1: TQRChildBand;
    ColumnHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_Print_Expire: TFr_Print_Expire;

implementation

{$R *.DFM}

end.
