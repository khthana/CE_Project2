unit History;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons;

type
  TFr_History = class(TForm)
    Lv_History: TListView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_History: TFr_History;

implementation

uses DataModule, Durable;

{$R *.DFM}

end.
