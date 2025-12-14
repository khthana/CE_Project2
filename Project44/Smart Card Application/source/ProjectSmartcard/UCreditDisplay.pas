unit UCreditDisplay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TCreditDisplay = class(TForm)
    CreditLabel: TLabel;
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CreditDisplay: TCreditDisplay;

implementation
uses UMain;
{$R *.dfm}



end.
