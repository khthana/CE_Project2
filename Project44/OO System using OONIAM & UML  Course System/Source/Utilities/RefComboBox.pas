unit RefComboBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, StdCtrls;

type
  TReferenceComboBox = class(TComboBox)
  private
    { Private declarations }
  protected
    fRef : TStrings;
    { Protected declarations }
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy;override;
    function intReference : integer;
    function strReference : string;
    function AddNew(refID : integer;str : string) : integer; overload;
    function AddNew(refID : string ;str : string) : integer; overload;
    procedure Delete(index : integer);
    procedure ClearItems;
    procedure CopyFrom(Src : TReferenceComboBox);
    function FindReference(refID : integer) : integer; overload;
    function FindReference(refID : string ) : integer; overload;
    { Public declarations }
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('A++', [TReferenceComboBox]);
end;

{ TReferenceComboBox }

function TReferenceComboBox.AddNew(refID, str: string): integer;
begin
  fRef.Add(refID);
  Result := Items.Add(str);
end;

function TReferenceComboBox.AddNew(refID: integer; str: string): integer;
begin
  fRef.Add(inttostr(refID));
  Result := Items.Add(str);
end;

procedure TReferenceComboBox.ClearItems;
begin
  fRef.Clear;
  Items.Clear;
end;

procedure TReferenceComboBox.CopyFrom(Src: TReferenceComboBox);
begin
  fRef.AddStrings(Src.fRef);
  Items.AddStrings(Src.Items);
end;

constructor TReferenceComboBox.Create(AOwner: TComponent);
begin
  inherited;
  fRef := TStringList.Create;
end;

procedure TReferenceComboBox.Delete(index: integer);
begin
  fRef.Delete(index);
  Items.Delete(index);
end;

destructor TReferenceComboBox.Destroy;
begin
  fRef.Free;
  inherited;
end;

function TReferenceComboBox.FindReference(refID: integer): integer;
begin
  ItemIndex := fRef.IndexOf(inttostr(refID));
  Result := fRef.IndexOf(inttostr(refID));
end;

function TReferenceComboBox.FindReference(refID: string): integer;
begin
  ItemIndex := fRef.IndexOf(refID);
  Result := fRef.IndexOf(refID);
end;

function TReferenceComboBox.intReference: integer;
begin
  Result := StrtoInt(fRef[Self.ItemIndex]);
end;

function TReferenceComboBox.strReference: string;
begin
  Result := fRef[Self.ItemIndex];
end;

end.
