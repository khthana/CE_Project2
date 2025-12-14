unit OlalaGuidCreator_Source;

interface

uses
  ActiveX, MtsObj, Mtx, ComObj, OlalaGuidCreator_TLB, StdVcl;

type
  TOlalaGuidCreator = class(TMtsAutoObject, IOlalaGuidCreator)
  protected
    function Create: WideString; safecall;
    { Protected declarations }
  end;

implementation

uses ComServ;

function TOlalaGuidCreator.Create: WideString;
var
  Guid : TGuid;
begin
  CoCreateGuid(Guid);
  Result := GUIDToString(Guid);
end;

initialization
  TAutoObjectFactory.Create(ComServer, TOlalaGuidCreator, Class_OlalaGuidCreator,
    ciMultiInstance, tmBoth);
end.
