Attribute VB_Name = "modSecureHash"
'
'  modSecureHash   A VB Implementation of the Secure Hash Algorithm SHA-1
'
'  The function SecureHash generates a 160-bit (20-hex-digit) message digest
'  for a given message (String) of any length.  The digest is unique to the
'  message.  It is not possible to recover the message from the digest.  The
'  only way to find the source message for a digest is by the brute force
'  hashing of all possible messages and comparison of their digests.  For a
'  complete description see FIPS Publication 180-1:
'
'     http://www.itl.nist.gov/fipspubs/fip180-1.htm  (HTML version)
'     http://csrc.nist.gov/fips/fip180-1.txt         (plain text version)
'
'  The SecureHash function successfully hashes the three sample messages given
'  in the appendices to this publication.
'
'  Note: this is non-conforming implementation of SHA-1.  A conforming
'  implementation must handle messages up to 2^64 bytes; this one
'  theoretically handles only up to 2^32 bytes.  However, processing time will
'  effectively limit its use to messages of less than one megabyte.  For large
'  messages, use the Internet Explorer implementation of SHA-1 (advapi32.dll,
'  CryptCreateHash and CryptHashData using ALG_SID_SHA).
'
'------------------------------------------------------------------------------

Option Explicit

' -- type for handling unsigned 32-bit words

Public Type Word
  B0 As Byte
  B1 As Byte
  B2 As Byte
  B3 As Byte
End Type

' =====  Bitwise Operators on Words  =====

Public Function AndW(w1 As Word, w2 As Word) As Word
  Dim w As Word
  
  w.B0 = w1.B0 And w2.B0
  w.B1 = w1.B1 And w2.B1
  w.B2 = w1.B2 And w2.B2
  w.B3 = w1.B3 And w2.B3
  
  AndW = w
End Function

Public Function OrW(w1 As Word, w2 As Word) As Word
  Dim w As Word
  
  w.B0 = w1.B0 Or w2.B0
  w.B1 = w1.B1 Or w2.B1
  w.B2 = w1.B2 Or w2.B2
  w.B3 = w1.B3 Or w2.B3
  
  OrW = w
End Function

Public Function XorW(w1 As Word, w2 As Word) As Word
  Dim w As Word
  
  w.B0 = w1.B0 Xor w2.B0
  w.B1 = w1.B1 Xor w2.B1
  w.B2 = w1.B2 Xor w2.B2
  w.B3 = w1.B3 Xor w2.B3
  
  XorW = w
End Function

Public Function NotW(w As Word) As Word
  Dim w0 As Word
  
  w0.B0 = Not w.B0
  w0.B1 = Not w.B1
  w0.B2 = Not w.B2
  w0.B3 = Not w.B3
  
  NotW = w0
End Function

Public Function AddW(w1 As Word, w2 As Word) As Word
  Dim i As Integer, w As Word
  
  i = CInt(w1.B3) + w2.B3
  w.B3 = i Mod 256
  i = CInt(w1.B2) + w2.B2 + (i \ 256)
  w.B2 = i Mod 256
  i = CInt(w1.B1) + w2.B1 + (i \ 256)
  w.B1 = i Mod 256
  i = CInt(w1.B0) + w2.B0 + (i \ 256)
  w.B0 = i Mod 256
  
  AddW = w
End Function

Public Function CircShiftLeftW(w As Word, n As Integer) As Word
  Dim d1 As Double, d2 As Double
  
  d1 = WordToDouble(w)
  d2 = d1
  
  d1 = d1 * (2 ^ n)
  d2 = d2 / (2 ^ (32 - n))
  
  CircShiftLeftW = OrW(DoubleToWord(d1), DoubleToWord(d2))
End Function

' =====  Word Conversion Functions  =====

Public Function WordToHex(w As Word) As String
  WordToHex = Right("0" & Hex(w.B0), 2) & Right("0" & Hex(w.B1), 2) & _
              Right("0" & Hex(w.B2), 2) & Right("0" & Hex(w.B3), 2)
End Function

Public Function HexToWord(h As String) As Word
  HexToWord = DoubleToWord(Val("&H" & h & "#"))
End Function

Public Function DoubleToWord(n As Double) As Word
  Dim w As Word
  
  w.B0 = Int(DMod(n, 2 ^ 32) / (2 ^ 24))
  w.B1 = Int(DMod(n, 2 ^ 24) / (2 ^ 16))
  w.B2 = Int(DMod(n, 2 ^ 16) / (2 ^ 8))
  w.B3 = Int(DMod(n, 2 ^ 8))

  DoubleToWord = w
End Function

Public Function WordToDouble(w As Word) As Double
  WordToDouble = (w.B0 * (2 ^ 24)) + (w.B1 * (2 ^ 16)) + (w.B2 * (2 ^ 8)) + w.B3
End Function

' =====  Real modulus  =====

Public Function DMod(value As Double, divisor As Double) As Double
  Dim n As Double
  
  n = value - (Int(value / divisor) * divisor)
  If (n < 0) Then
    n = n + divisor
  End If
  
  DMod = n
End Function

' =====  SHA-1 Functions  =====

Public Function F(t As Integer, B As Word, C As Word, D As Word) As Word
  Select Case t
    Case Is <= 19
      F = OrW(AndW(B, C), AndW((NotW(B)), D))
    Case Is <= 39
      F = XorW(XorW(B, C), D)
    Case Is <= 59
      F = OrW(OrW(AndW(B, C), AndW(B, D)), AndW(C, D))
    Case Else
      F = XorW(XorW(B, C), D)
  End Select
End Function

Public Function SecureHash(inMessage As String) As String
  Dim inLen As Long, inLenW As Word, padMessage As String
  Dim numBlocks As Long, w(0 To 79) As Word
  Dim blockText As String, wordText As String
  Dim i As Long, t As Integer, temp As Word
  
  Dim K(0 To 3) As Word
  Dim H0 As Word, H1 As Word, H2 As Word, H3 As Word, H4 As Word
  Dim A As Word, B As Word, C As Word, D As Word, E As Word
  
  ' -- pad the message
  
  inLen = Len(inMessage)
  inLenW = DoubleToWord(CDbl(inLen) * 8)
  padMessage = inMessage & Chr(128) & String((128 - (inLen Mod 64) - 9) Mod 64, Chr(0)) & _
      String(4, Chr(0)) & Chr(inLenW.B0) & Chr(inLenW.B1) & Chr(inLenW.B2) & Chr(inLenW.B3)
  numBlocks = Len(padMessage) / 64
  
  ' -- initialize the buffers
  
  K(0) = HexToWord("5A827999")
  K(1) = HexToWord("6ED9EBA1")
  K(2) = HexToWord("8F1BBCDC")
  K(3) = HexToWord("CA62C1D6")
  
  H0 = HexToWord("67452301")
  H1 = HexToWord("EFCDAB89")
  H2 = HexToWord("98BADCFE")
  H3 = HexToWord("10325476")
  H4 = HexToWord("C3D2E1F0")

  ' -- hash the message
  
  For i = 0 To numBlocks - 1
    blockText = Mid(padMessage, (i * 64) + 1, 64)
    For t = 0 To 15
      wordText = Mid(blockText, (t * 4) + 1, 4)
      w(t).B0 = Asc(Mid(wordText, 1, 1))
      w(t).B1 = Asc(Mid(wordText, 2, 1))
      w(t).B2 = Asc(Mid(wordText, 3, 1))
      w(t).B3 = Asc(Mid(wordText, 4, 1))
    Next t
    
    For t = 16 To 79
      w(t) = CircShiftLeftW(XorW(XorW(XorW(w(t - 3), w(t - 8)), w(t - 14)), w(t - 16)), 1)
    Next t
    
    A = H0
    B = H1
    C = H2
    D = H3
    E = H4
    
    For t = 0 To 79
      temp = AddW(AddW(AddW(AddW(CircShiftLeftW(A, 5), F(t, B, C, D)), E), w(t)), K(t \ 20))
      E = D
      D = C
      C = CircShiftLeftW(B, 30)
      B = A
      A = temp
    Next t
    
    H0 = AddW(H0, A)
    H1 = AddW(H1, B)
    H2 = AddW(H2, C)
    H3 = AddW(H3, D)
    H4 = AddW(H4, E)
  Next i
  
  SecureHash = WordToHex(H0) & WordToHex(H1) & WordToHex(H2) & WordToHex(H3) & WordToHex(H4)
End Function

