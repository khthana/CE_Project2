unit Print_Voucher2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFr_PVoucher2 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand4: TQRBand;
    QRMemo2: TQRMemo;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText9: TQRDBText;
    QRMemo3: TQRMemo;
    QRMemo4: TQRMemo;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QROrder_N: TQRLabel;
    QRToTal_Money: TQRLabel;
    Str_Buy: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_PVoucher2: TFr_PVoucher2;

implementation

uses DataModule;

{$R *.DFM}

end.
