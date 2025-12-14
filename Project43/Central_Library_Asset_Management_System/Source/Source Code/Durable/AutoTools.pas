unit AutoTools;

interface

uses
	Windows, SysUtils, Classes, ActiveX;

const

// Class IDs
	{$EXTERNALSYM CLSID_AutoComplete}
	CLSID_AutoComplete: TGUID = (
	D1:$00BB2763; D2:$6A77; D3:$11D0;
	D4:($A5,$35,$00,$C0,$4F,$D7,$D0,$62));
// Interface IDs
	{$EXTERNALSYM IID_IAutoComplete}
	IID_IAutoComplete: TGUID = (
	D1:$00BB2762; D2:$6A77; D3:$11D0;
	D4:($A5,$35,$00,$C0,$4F,$D7,$D0,$62));
	{$EXTERNALSYM IID_IAutoComplete2}
	IID_IAutoComplete2: TGUID = (
	D1:$EAC04BC0; D2:$3791; D3:$11D2;
	D4:($BB,$95,$00,$60,$97,$7B,$46,$4C));

// String constants for Interface IDs
	SID_IAutoComplete = '{00BB2762-6A77-11D0-A535-00C04FD7D062}';
	SID_IAutoComplete2 = '{EAC04BC0-3791-11D2-BB95-0060977B464C}';
	SID_IACList = '{77A130B0-94FD-11D0-A544-00C04FD7d062}';
	SID_IACList2 = '{470141A0-5186-11D2-BBB6-0060977B464C}';

type
	{EXTERNALSYM IAutoComplete}
	IAutoComplete = interface(IUnknown)
	[SID_IAutoComplete]
	function Init(hwndEdit: HWND; punkACL: IUnknown; pwszRegKeyPath: PWideChar; pwszQuickComplete: PWideChar): HResult; stdcall;
	function Enable(fEnable: Boolean): HResult; stdcall;
	end;

const
	{$EXTERNALSYM ACO_NONE}
	ACO_NONE = $0000;
	{$EXTERNALSYM ACO_AUTOSUGGEST}
	ACO_AUTOSUGGEST = $0001;
	{$EXTERNALSYM ACO_AUTOAPPEND}
	ACO_AUTOAPPEND = $0002;
	{$EXTERNALSYM ACO_SEARCH}
	ACO_SEARCH = $0004;
	{EXTERNALSYM ACO_FILTERPREFIXS}
	ACO_FILTERPREFIXS = $0008;
	{EXTERNALSYM ACO_USETAB}
	ACO_USETAB = $0010;
	{$EXTERNALSYM ACO_UPDOWNKEYDROPSLIST}
	ACO_UPDOWNKEYDROPSLIST = $0020;
	{$EXTERNALSYM ACO_RTLREADING}
	ACO_RTLREADING = $0040;

type
	{EXTERNALSYM IAutoComplete2}
	IAutoComplete2 = interface(IAutoComplete)
	[SID_IautoComplete2]
	function SetOptions(dwFlag: DWORD): HResult; stdcall;
	end;

	{$EXTERNALSYM IACList}
	IACList = interface(IUnknown)
	[SID_IACList]
	function Expand(pszExpand: PWideChar): HResult; stdcall;
	end;

type
	{EXTERNALSYM IACList2}
	IACList2 = interface(IACList)
	[SID_IACList2]
	function SetOption(dwFlag: DWORD): HResult; stdcall;
	end;

{ TEnumString class }

type
	TEnumString = class(TInterfacedObject, IEnumString)
	private
	FStrings: TStrings;
	FIndex: Integer;
	protected
	{ IEnumString }
	function Next(celt: Longint; out elt; pceltFetched: PLongint): HResult; stdcall;
	function Skip(celt: Longint): HResult; stdcall;
	function Reset: HResult; stdcall;
	function Clone(out enm: IEnumString): HResult; stdcall;
	public
	constructor Create(Strings: TStrings);
	end;

implementation

{ TEnumString }

constructor TEnumString.Create(Strings:TStrings);
begin
	inherited Create;
	FStrings := Strings;
end;

{ TEnumString.IEnumString }

function TEnumString.Next(celt: Longint; out elt; pceltFetched: Plongint): HResult;
var
	I: Integer;
begin
	I := 0;
	while (I < celt) and (FIndex < FStrings.Count) do
	begin
		TPointerList(elt)[I] := PWideChar(WideString(FStrings[FIndex]));
		Inc(I);
		Inc(Findex);
	end;
	if pceltFetched <> nil then pceltFetched^ := I;
	if I = celt then Result := S_OK else Result := S_FALSE;
end;

function TEnumString.Skip(celt: Longint): HResult;
begin
	if (FIndex + celt) <= FStrings.Count then
	begin
		Inc(FIndex,celt);
		Result := S_OK;
	end
	else
	begin
		FIndex := FStrings.Count;
		Result := S_FALSE;
	end;
end;

function TEnumString.Reset: HResult;
begin
	FIndex := 0;
	Result := S_OK;
end;

{function TEnumSring.Reset: HResult;
begin
	FIndex := 0;
	Result := S_OK;
end; }

function TEnumString.Clone(out enm: IEnumString): HResult;
begin
	try
		enm := TEnumString.Create(FStrings);
		Result := S_OK;
	except
		Result := E_UNEXPECTED;
	end;
end;

end.



