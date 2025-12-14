unit GuidCreator_Source;

interface

uses
  ComObj, ActiveX, GuidCreator_TLB, StdVcl;

type
  TGuidCreator = class(TAutoObject, IGuidCreator)
  protected
    function CreateGuid: WideString; safecall;
    { Protected declarations }
  end;

implementation

uses ComServ;

function TGuidCreator.CreateGuid: WideString;
var
  Guid : TGuid;
begin
  CoCreateGuid(Guid);
  Result := GUIDToString(Guid);
end;

initialization
  TAutoObjectFactory.Create(ComServer, TGuidCreator, Class_GuidCreator,
    ciMultiInstance, tmBoth);
end.
