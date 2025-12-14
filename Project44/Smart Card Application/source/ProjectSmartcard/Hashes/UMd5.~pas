{******************************************************************************}
{* DCPcrypt v2.0 written by David Barton (davebarton@bigfoot.com) *************}
{******************************************************************************}
{* A binary compatible implementation of MD5 **********************************}
{******************************************************************************}
{* Copyright (c) 1999-2000 David Barton                                       *}
{* Permission is hereby granted, free of charge, to any person obtaining a    *}
{* copy of this software and associated documentation files (the "Software"), *}
{* to deal in the Software without restriction, including without limitation  *}
{* the rights to use, copy, modify, merge, publish, distribute, sublicense,   *}
{* and/or sell copies of the Software, and to permit persons to whom the      *}
{* Software is furnished to do so, subject to the following conditions:       *}
{*                                                                            *}
{* The above copyright notice and this permission notice shall be included in *}
{* all copies or substantial portions of the Software.                        *}
{*                                                                            *}
{* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR *}
{* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,   *}
{* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL    *}
{* THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER *}
{* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING    *}
{* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER        *}
{* DEALINGS IN THE SOFTWARE.                                                  *}
{******************************************************************************}
unit UMd5;

interface
uses
  Classes, Sysutils, DCPcrypt, DCPconst;

type
  TDCP_md5= class(TDCP_hash)
  protected
    LenHi: longint;
    LenLo2, LenLo1: word; { annoying fix for D1-3 users who don't have longword }
    Index: DWord;
    CurrentHash: array[0..3] of DWord;
    HashBuffer: array[0..31] of byte;
    procedure Compress;
  public
    class function GetId: longint; override;
    class function GetAlgorithm: string; override;
    class function GetHashSize: longint; override;
    class function SelfTest: boolean; override;
    procedure Init; override;
    procedure Burn; override;
    procedure Update(const Buffer; Size: longint); override;
    procedure Final(var Digest); override;
  end;



{******************************************************************************}
{******************************************************************************}
implementation
{$R-}{$Q-}

procedure TDCP_md5.Compress;
var
  Data: array[0..7] of dword;  tmp:byte;
  A, B, C, D: dword;
begin
  Move(HashBuffer,Data,Sizeof(Data));
  A:= CurrentHash[0];
  B:= CurrentHash[1];
  C:= CurrentHash[2];
  D:= CurrentHash[3];


  A:= B+ LRot32(A + (D xor (B and (C xor D))) + Data[ 0] + $d76aa478,7);
  D:= A + LRot32(D + (C xor (A and (B xor C))) + Data[ 1] + $e8c7b756,12);
  C:= D + LRot32(C + (B xor (D and (A xor B))) + Data[ 2] + $242070db,17);
  B:= C + LRot32(B + (A xor (C and (D xor A))) + Data[ 3] + $c1bdceee,22);





  CurrentHash[0]:=A;
  CurrentHash[1]:=B;
  CurrentHash[2]:=C;
  CurrentHash[3]:=D;
  Index:= 0;
  FillChar(HashBuffer,Sizeof(HashBuffer),0);
end;

class function TDCP_md5.GetHashSize: longint;
begin
  Result:= 128;
end;

class function TDCP_md5.GetId: longint;
begin
  Result:= DCP_md5;
end;

class function TDCP_md5.GetAlgorithm: string;
begin
  Result:= 'MD5';
end;

class function TDCP_md5.SelfTest: boolean;
const
  Test1Out: array[0..15] of byte=
    ($90,$01,$50,$98,$3c,$d2,$4f,$b0,$d6,$96,$3f,$7d,$28,$e1,$7f,$72);
  Test2Out: array[0..15] of byte=
    ($c3,$fc,$d3,$d7,$61,$92,$e4,$00,$7d,$fb,$49,$6c,$ca,$67,$e1,$3b);
var
  TestHash: TDCP_md5;
  TestOut: array[0..19] of byte;
begin
  TestHash:= TDCP_md5.Create(nil);
  TestHash.Init;
  TestHash.UpdateStr('abc');
  TestHash.Final(TestOut);
  Result:= CompareMemory(@TestOut,@Test1Out,Sizeof(Test1Out));
  TestHash.Init;
  TestHash.UpdateStr('abcdefghijklmnopqrstuvwxyz');
  TestHash.Final(TestOut);
  Result:= CompareMemory(@TestOut,@Test2Out,Sizeof(Test2Out)) and Result;
  TestHash.Free;
end;

procedure TDCP_md5.Init;
begin
  Burn;
  CurrentHash[0]:= $67452301;
  CurrentHash[1]:= $efcdab89;
  CurrentHash[2]:= $98badcfe;
  CurrentHash[3]:= $10325476;
  fInitialized:= true;
end;

procedure TDCP_md5.Burn;
begin
   LenLo1:= 0;
  Index:= 0;
  FillChar(HashBuffer,Sizeof(HashBuffer),0);
  FillChar(CurrentHash,Sizeof(CurrentHash),0);
  fInitialized:= false;
end;

procedure TDCP_md5.Update(const Buffer; Size: longint);
var
  PBuf: ^byte;
begin
  if not fInitialized then
    raise EDCP_hash.Create('Hash not initialized');

  { I wish Borland had included an unsigned 32bit from the start }

  PBuf:= @Buffer;

      Move(PBuf^,HashBuffer[Index],Size);
      Inc(Index,Size);
      Size:= 0;

end;

procedure TDCP_md5.Final(var Digest);
begin
  if not fInitialized then
    raise EDCP_hash.Create('Hash not initialized');

  Compress;
  Move(CurrentHash,Digest,Sizeof(CurrentHash));
  Burn;
end;

initialization
  RegisterClass(TDCP_md5);
  DCPreghash(TDCP_md5);

end.
