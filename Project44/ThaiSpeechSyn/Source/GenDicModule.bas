Attribute VB_Name = "GenDicModule"
'Option Explicit
Public Sub gendic(ByVal in_word As String, ByRef read_word, sign_word As String)
  
  len_word = Len(in_word)
  Dim cv_word As String
  cv_word = ""
  
  len_con = 1
  Do Until len_con > len_word
    cha = Mid(in_word, len_con, 1)
    Select Case cha
      Case "ผ", "ป", "อ", "ท", "ม", "ฝ", "ง", "ว", "ส", "ด", "ก", "ห", "ฟ", "พ", "ร", "น", "ย", "บ", "ล", "ฃ", "ช", "ข", "จ", "ต", "ค", "ถ", "ภ", "ฉ", "ฮ", "ฒ", "ฬ", "ฦ", "ซ", "ศ", "ษ", "ฌ", "ฏ", "ฆ", "ฤ", "ฎ", "ฑ", "ธ", "ณ", "ญ", "ฐ", "ฅ"
        cv_word = cv_word + "p"
      Case "่", "้", "๊", "๋"
        cv_word = cv_word + "t"
      Case "า"
        cv_word = cv_word + "s"
      Case "ิ", "ี", "ื", "ึ", "ุ", "ู"
        cv_word = cv_word + "e"
      Case "ั"
        cv_word = cv_word + "i"
      Case "ะ"
        cv_word = cv_word + "a"
      Case "ำ"
        cv_word = cv_word + "o"
      Case "์"
        cv_word = cv_word + "k"
      Case "ใ", "ไ"
        cv_word = cv_word + "b"
      Case "โ"
        cv_word = cv_word + "u"
      Case "เ"
        cv_word = cv_word + "n"
      Case "แ"
        cv_word = cv_word + "m"
      Case "็"
        cv_word = cv_word + "q"
      Case Else
        cv_word = cv_word + "z"
    End Select
    len_con = len_con + 1
  Loop
    
  len_con = 1
  Do Until len_con > len_word
    If Mid(cv_word, len_con, 1) = "k" Then
      Dim t_in, t_cv As String
      t_in = Right(in_word, len_word - len_con)
      t_cv = Right(cv_word, len_word - len_con)
      Do Until (len_con = 0) Or (Mid(cv_word, len_con, 1) = "p")
        len_con = len_con - 1
      Loop
      If len_con = 0 Then len_con = 1
      Dim h_in, h_cv As String
      h_in = Left(in_word, len_con - 1)
      h_cv = Left(cv_word, len_con - 1)
      cv_word = h_cv + t_cv
      in_word = h_in + t_in
      len_word = Len(in_word)
      len_con = len_con - 1
    End If
    len_con = len_con + 1
  Loop
         
  'sign_word = cv_word
  Dim s_word As String
  Dim temp_w As String
   
  Dim pot_e, pot_p, pot_t As Integer
  Dim find_word As Integer
  find_word = 0
  chk_word = len_word
  
  Do Until chk_word = 0
    For i = 7 To 1 Step -1
      If (chk_word - i >= 0) And (find_word = 0) Then
        cha = Mid(cv_word, chk_word - i + 1, i)
        chz = Mid(in_word, chk_word - i + 1, i)
        
        Select Case cha
          
          '1111111111111111111111111111111111111111111111111111111111111111
          
          Case "pa", "ps", "pe", "ppa", "pps", "ppe", "pta", "pts", "pet", "ppta", "ppts", "ppet", "psp", "pep", "pip", "ppip", "ppsp", "ppep", "ptsp", "pptsp", "pitp", "ppitp", "petp", "ppetp"
            If Left(cha, 2) = "pp" Then
              Select Case Left(chz, 2)
                Case "หย", "หญ", "หน", "หม", "หร", "หล", "หว", "กล", "กร", "กว", "คร", "คล", "คว", "ขร", "ขล", "ขว", "พร", "พล", "ปร", "ปล", "ฟร", "ฟล", "บร", "บล", "ตร", "ดร", "ทร"
                  find_word = i
                Case Else
                  find_word = 0
              End Select
            Else
              find_word = i
            End If
             
            If (Right(chz, 1) = ";") Or (Right(chz, 1) = "ห") Or (Right(chz, 1) = "อ") Or (Right(chz, 1) = "อ") Then
                  find_word = 0
            End If
            
                      
            Select Case Right(chz, 2)
              Case "ือ"
               find_word = find_word
            End Select
            Select Case Right(chz, 3)
              Case "ื่อ", "ื้อ", "ื๊อ", "ื๋อ"
               find_word = find_word
            End Select
            
            If find_word <> 0 Then
              read_word = chz + " " + read_word
              Select Case cha
                Case "pa", "ps", "pe"
                  Call c_frist(Left(chz, 1), s_word)
                  Call sara(Right(chz, 1), s_word)
                  Call sakot("", "", s_word)
                Case "ppa", "pps", "ppe"
                  Call c_frist(Left(chz, 2), s_word)
                  Call sara(Right(chz, 1), s_word)
                  Call sakot("", "", s_word)
                Case "pta", "pts"
                  Call c_frist(Left(chz, 1), s_word)
                  Call sara(Right(chz, 1), s_word)
                  Call sakot("", Mid(chz, 2, 1), s_word)
                Case "ppta", "ppts"
                  Call c_frist(Left(chz, 2), s_word)
                  Call sara(Right(chz, 1), s_word)
                  Call sakot("", Mid(chz, 3, 1), s_word)
                Case "ppet"
                  Call c_frist(Left(chz, 2), s_word)
                  Call sara(Mid(chz, 3, 1), s_word)
                  Call sakot("", Right(chz, 1), s_word)
                Case "pet"
                  Call c_frist(Left(chz, 1), s_word)
                  Call sara(Mid(chz, 2, 1), s_word)
                  Call sakot("", Right(chz, 1), s_word)
                Case "ppsp", "ppep"
                  Call c_frist(Left(chz, 2), s_word)
                  Call sara(Mid(chz, 3, 1), s_word)
                  Call sakot(Right(chz, 1), "", s_word)
                Case "ppip"
                  If Right(chz, 1) = "ว" Then
                    Call c_frist(Left(chz, 2), s_word)
                    Call sara("iv", s_word)
                    Call sakot("", Right(chz, 1), s_word)
                  Else
                    Call c_frist(Left(chz, 2), s_word)
                    Call sara(Mid(chz, 3, 1), s_word)
                    Call sakot(Right(chz, 1), "", s_word)
                  End If
                Case "psp", "pep", "pip"
                  If (Right(chz, 1) = "ว") And (Right(cha, 2) = "ip") Then
                    Call c_frist(Left(chz, 1), s_word)
                    Call sara("iv", s_word)
                    Call sakot(Right(chz, 1), "", s_word)
                  Else
                    Call c_frist(Left(chz, 1), s_word)
                    Call sara(Mid(chz, 2, 1), s_word)
                    Call sakot(Right(chz, 1), "", s_word)
                  End If
                Case "ptsp"
                  Call c_frist(Left(chz, 1), s_word)
                  Call sara(Mid(chz, 3, 1), s_word)
                  Call sakot(Right(chz, 1), Mid(chz, 2, 1), s_word)
                Case "pptsp"
                  Call c_frist(Left(chz, 2), s_word)
                  Call sara(Mid(chz, 4, 1), s_word)
                  Call sakot(Right(chz, 1), Mid(chz, 3, 1), s_word)
                Case "ppetp"
                  Call c_frist(Left(chz, 2), s_word)
                  Call sara(Mid(chz, 3, 1), s_word)
                  Call sakot(Right(chz, 1), Mid(chz, 4, 1), s_word)
                Case "ppitp"
                  If Right(chz, 1) = "ว" Then
                    Call c_frist(Left(chz, 2), s_word)
                    Call sara("iv", s_word)
                    Call sakot(Right(chz, 1), Mid(chz, 4, 1), s_word)
                  Else
                    Call c_frist(Left(chz, 2), s_word)
                    Call sara(Mid(chz, 3, 1), s_word)
                    Call sakot(Right(chz, 1), Mid(chz, 4, 1), s_word)
                  End If
                Case "pitp", "petp"
                  If (Right(chz, 1) = "ว") And (Right(cha, 3) = "itp") Then
                    Call c_frist(Left(chz, 1), s_word)
                    Call sara("iv", s_word)
                    Call sakot("", Mid(chz, i - 1, 1), s_word)
                  Else
                    Call c_frist(Left(chz, 1), s_word)
                    Call sara(Mid(chz, 2, 1), s_word)
                    Call sakot(Right(chz, 1), Mid(chz, 3, 1), s_word)
                  End If
                End Select
              sign_word = s_word + sign_word
            
            End If
            
          '222222222222222222222222222222222222222222222222222222222222
          
          Case "np", "npt", "nptp", "nppt", "nppp", "npptp", "nps", "npts", "npps", "nppts", "npa", "npta", "npqp", "nppa", "nppta", "nppqp", "mp", "mpt", "mptp", "mppt", "mppp", "mpptp", "up", "upt", "uptp", "uppt", "uppp", "upptp", "upa", "upta", "uppa", "uppta", "mpa", "mpta", "mpqp", "mppa", "mppta", "mppqp"
            find_word = i
           
            If (Mid(cha, 2, 2) = "pp") And (find_word = i) Then
              Select Case Mid(chz, 2, 2)
                Case "หย", "หญ", "หน", "หม", "หร", "หล", "หว", "กล", "กร", "กว", "คร", "คล", "คว", "ขร", "ขล", "ขว", "พร", "พล", "ปร", "ปล", "ฟร", "ฟล", "บร", "บล", "ตร", "ดร", "ทร"
                  find_word = i
                  Call c_frist(Mid(chz, 2, 2), s_word)
                Case Else
                  find_word = 0
              End Select
            Else
              find_word = i
              Call c_frist(Mid(chz, 2, 1), s_word)
            End If
            
            Select Case Right(chz, 1)
              Case "ห", "ฮ"
                find_word = 0
              Case "อ"
                If (Left(cha, 1) = "n") Then
                  find_word = find_word
                Else
                  find_word = 0
                End If
            End Select
            
            If find_word <> 0 Then
              read_word = chz + " " + read_word
              Select Case Left(cha, 1)
                
                Case "n"
                  Select Case Right(cha, 2)
                    Case "s", "ts"
                      Call sara("n_s", s_word)
                    Case "pa", "ta", "qp"
                      Call sara("n_a", s_word)
                    Case "ps"
                        Call sara("n_s", s_word)
                    Case Else
                      If (Right(chz, 1) = "อ") Then
                        Call sara("n_p", s_word)
                      Else
                        Call sara(Left(chz, 1), s_word)
                      End If
                  End Select
                    
                Case "m"
                  Select Case Right(cha, 2)
                    Case "pa", "ta", "qp"
                      Call sara("m_a", s_word)
                    Case Else
                      Call sara(Left(chz, 1), s_word)
                  End Select
                  
                Case "u"
                  Select Case Right(cha, 2)
                    Case "ta"
                      Call sara("u_a", s_word)
                    Case "pa"
                      Call sara("โะ", s_word)
                    Case Else
                      Call sara(Left(chz, 1), s_word)
                  End Select
                  
              End Select
              temp_w = ""
              pot_t = InStr(cha, "t")
              If pot_t <> 0 Then
                temp_w = Mid(chz, pot_t, 1)
              End If
              If (Right(cha, 1) = "p") And (i > 2) Then
                Call sakot(Right(chz, 1), temp_w, s_word)
              Else
                Call sakot("", temp_w, s_word)
              End If
              sign_word = s_word + sign_word
                
            End If
            If (cha = "nppa") And (Right(chz, 2) = "อะ") Then
              find_word = i
              Call c_frist(Mid(chz, 2, 1), s_word)
              Call sara("n_pa", s_word)
              Call sakot("", "", s_word)
              
              sign_word = s_word + sign_word
            End If
            
            s_word = ""
          
          '2.111111111111111111111111111111111111111111111111111111111
          
          Case "npp", "mpp", "upp"
            find_word = i
            
            If (Right(chz, 1) = "ห") Or (Right(chz, 1) = "อ") Or (Right(chz, 1) = "ฮ") Then
              find_word = 0
            End If
            
            If find_word <> 0 Then
            
              read_word = chz + " " + read_word
            
              Call c_frist(Mid(chz, 2, 1), s_word)
              Call sara(Left(chz, 1), s_word)
              Call sakot(Right(chz, 1), "", s_word)
                         
            
            End If
            If (Right(chz, 1) = "อ") And (Left(cha, 1) = "n") Then
              Call c_frist(Mid(chz, 2, 1), s_word)
              Call sara("n_p", s_word)
              Call sakot("", "", s_word)
              find_word = i
              read_word = chz + " " + read_word
               
            End If
            
            sign_word = s_word + sign_word
            s_word = ""

          '3333333333333333333333333333333333333333333333333333333333
          
          Case "pp", "ptp", "ppp", "ptpp", "pptp", "pppp", "pptpp"
            
            Select Case cha
              Case "pp", "ptp"
                If Right(chz, 1) = "อ" Then
                  find_word = i
                  read_word = chz + " " + read_word
                  Call c_frist(Left(chz, 1), s_word)
                  Call sara("oo", s_word)
                  Call sakot("", Mid(chz, 2, 1), s_word)
                Else
                  find_word = i
                  read_word = chz + " " + read_word
                  Call c_frist(Left(chz, 1), s_word)
                  Call sara("u_a", s_word)
                  Call sakot(Right(chz, 1), Mid(chz, 2, 1), s_word)
                End If
              Case "ppp", "pptp", "ptpp"
                Select Case Left(chz, 2)
                  Case "หย", "หญ", "หน", "หม", "หร", "หล", "กล", "กร", "คร", "คล", "ขร", "ขล", "พร", "พล", "ปร", "ปล", "ฟร", "ฟล", "บร", "บล", "ตร", "ดร", "ทร"
                    temp_w = "u_a"
                    If Right(chz, 1) = "อ" Then
                      temp_w = "oo"
                    End If
                    find_word = i
                    read_word = chz + " " + read_word
                    Call c_frist(Left(chz, 2), s_word)
                    Call sara(temp_w, s_word)
                    Call sakot(Right(chz, 1), Mid(chz, 3, 1), s_word)
                  Case Else
                    pot_p = InStr(2, cha, "p")
                    pot_t = InStr(cha, "t")
                    If pot_t <> 0 Then
                      temp_w = Mid(chz, pot_t, 1)
                    End If
            
                    Select Case Mid(chz, pot_p, 1)
                      Case "ว"
                        read_word = chz + " " + read_word
                        find_word = i
                        Call c_frist(Left(chz, 1), s_word)
                        Call sara("iv", s_word)
                        Call sakot(Right(chz, 1), temp_w, s_word)
                      Case "อ"
                        read_word = chz + " " + read_word
                        find_word = i
                        Call c_frist(Left(chz, 1), s_word)
                        Call sara("oo", s_word)
                        Call sakot(Right(chz, 1), temp_w, s_word)
                      Case Else
                        find_word = 0
                    End Select
                End Select
                  
              Case "pppp", "pptpp"
                If Left(cha, 2) = "pp" Then
                  Select Case Left(chz, 2)
                    Case "หย", "หญ", "หน", "หม", "หร", "หล", "หว", "กล", "กร", "กว", "คร", "คล", "คว", "ขร", "ขล", "ขว", "พร", "พล", "ปร", "ปล", "ฟร", "ฟล", "บร", "บล", "ตร", "ดร", "ทร"
                      find_word = i
                    Case Else
                      find_word = 0
                  End Select
                  Select Case Mid(chz, i - 1, 1)
                    Case "อ"
                      temp_w = "oo"
                      find_word = find_word
                    Case "ว"
                      temp_w = "iv"
                      find_word = find_word
                    Case Else
                      find_word = 0
                  End Select
                  If find_word <> 0 Then
                    read_word = chz + " " + read_word
                    Call c_frist(Left(chz, 2), s_word)
                    Call sara(temp_w, s_word)
                    Call sakot(Right(chz, 1), Mid(chz, 3, 1), s_word)
                  End If
                End If
                temp_w = ""
              Case Else
            End Select
            sign_word = s_word + sign_word
            s_word = ""
            
           
          '44444444444444444444444444444444444444444444444444444444444444
          
          Case "npsa", "nptsa", "nptpa", "nppsa", "npptsa", "npppa", "npptpa"
            If Left(cha, 3) = "npp" Then
              Select Case Mid(in_word, chk_word - i + 2, 2)
                Case "หย", "หญ", "หน", "หม", "หร", "หล", "หว", "กล", "กร", "กว", "คร", "คล", "คว", "ขร", "ขล", "ขว", "พร", "พล", "ปร", "ปล", "ฟร", "ฟล", "บร", "บล", "ตร", "ดร", "ทร"
                  find_word = i
                  Call c_frist(Mid(chz, 2, 2), s_word)
                Case Else
                  find_word = 0
              End Select
            Else
              Call c_frist(Mid(chz, 2, 1), s_word)
              find_word = i
            End If
            pot_t = InStr(cha, "t")
            If pot_t <> 0 Then
              temp_w = Mid(chz, pot_t, 1)
            End If
             
            If find_word <> 0 Then
             
              Select Case Right(chz, 2)
                Case "อะ"
                  Call sara("n_pa", s_word)
                  Call sakot("", temp_w, s_word)
                Case "าะ"
                  Call sara("n_sa", s_word)
                  Call sakot("", temp_w, s_word)
                Case Else
              End Select
              read_word = chz + " " + read_word
            
            sign_word = s_word + sign_word
            End If
            
            s_word = ""
 
          '5555555555555555555555555555555555
          
          Case "bp", "bpt", "po", "pot", "pipa", "pitpa", "bpp", "bppt", "ppo", "ppot", "ppipa", "ppitpa"
            If (Left(cha, 2) = "pp") Then
              Select Case Mid(in_word, chk_word - i + 1, 2)
                Case "หย", "หญ", "หน", "หม", "หร", "หล", "หว", "กล", "กร", "กว", "คร", "คล", "คว", "ขร", "ขล", "ขว", "พร", "พล", "ปร", "ปล", "ฟร", "ฟล", "บร", "บล", "ตร", "ดร", "ทร"
                  find_word = i
                  Call c_frist(Left(chz, 2), s_word)
                Case Else
                  find_word = 0
              End Select
            Else
              find_word = i
            End If
            
            If (Left(cha, 2) = "po") Then
              Call c_frist(Left(chz, 1), s_word)
            End If
            
            If (Right(cha, 2) = "ot") Or (Right(cha, 1) = "o") Then
              Call sara("os", s_word)
              Call sakot("", Right(chz, 1), s_word)
            End If
            
            
            If (Left(cha, 2) = "bp") And (i = 2) Then
              find_word = i
              Call c_frist(Mid(chz, 2, 1), s_word)
            End If
            If (Left(cha, 3) = "bpt") Then
              find_word = i
              Call c_frist(Mid(chz, 2, 1), s_word)
            End If
            If (Left(cha, 3) = "bpp") Then
              Select Case Mid(in_word, chk_word - i + 2, 2)
                Case "หย", "หญ", "หน", "หม", "หร", "หล", "หว", "กล", "กร", "กว", "คร", "คล", "คว", "ขร", "ขล", "ขว", "พร", "พล", "ปร", "ปล", "ฟร", "ฟล", "บร", "บล", "ตร", "ดร", "ทร"
                  find_word = i
                  Call c_frist(Mid(chz, 2, 2), s_word)
                Case Else
                  find_word = 0
              End Select
            End If
            If (Left(cha, 1) = "b") Then
              Call sara("b", s_word)
              Call sakot("", Right(chz, 1), s_word)
            End If
            
            
            If find_word <> 0 Then
              Select Case cha
                Case "pipa", "pitpa", "ppipa", "ppitpa"
                  If Right(chz, 2) = "วะ" Then
                    Select Case Left(cha, 2)
                      Case "pi"
                        Call c_frist(Left(chz, 1), s_word)
                      Case Else
                        Call c_frist(Left(chz, 2), s_word)
                    End Select
                    Call sara("iva", s_word)
                    Call sakot("", Mid(chz, i - 2, 1), s_word)
                  End If
              End Select
              
              read_word = chz + " " + read_word
              sign_word = s_word + sign_word
              
            End If
            s_word = ""

                  
            
          '6666666666666666666666666666666666666666666666666666666666
          
          Case "npepa", "npetpa", "npep", "npepp", "npetpp", "npetp", "nppepa", "nppetpa", "nppep", "nppepp", "nppetpp", "nppetp"
           If (Left(cha, 3) = "npp") Then
              Select Case Mid(chz, 2, 2)
                Case "หย", "หญ", "หน", "หม", "หร", "หล", "หว", "กล", "กร", "กว", "คร", "คล", "คว", "ขร", "ขล", "ขว", "พร", "พล", "ปร", "ปล", "ฟร", "ฟล", "บร", "บล", "ตร", "ดร", "ทร"
                  find_word = i
                  Call c_frist(Mid(chz, 2, 2), s_word)
                Case Else
                  find_word = 0
              End Select
            Else
              find_word = i
              Call c_frist(Mid(chz, 2, 1), s_word)
            End If
            
            pot_e = InStr(cha, "e")
            pot_p = InStr(pot_e, cha, "p")
            
            If ((Mid(chz, pot_e, 1) = "ิ") And ((cha = "npep") Or (cha = "npetp") Or (cha = "nppep") Or (cha = "nppetp"))) Then
              find_word = find_word
              Call sara("n_p", s_word)
            End If
            
            If ((Mid(chz, pot_e, 1) = "ื") And (Mid(chz, pot_p, 1) = "อ")) Then
              find_word = find_word
              If Right(cha, 1) = "a" Then
                Call sara("n15", s_word)
              Else
                Call sara("n18", s_word)
              End If
            End If
            If ((Mid(chz, pot_e, 1) = "ี") And (Mid(chz, pot_p, 1) = "ย")) Then
              find_word = find_word
              If Right(cha, 1) = "a" Then
                Call sara("n16", s_word)
              Else
                Call sara("n19", s_word)
              End If
            End If
            
            Select Case cha
              Case "npepp", "npetpp", "nppepp", "nppetpp"
                If Mid(in_word, chk_word - 1, 2) = "ออ" Then
                  find_word = 0
                End If
                If Mid(in_word, chk_word - 1, 2) = "ยย" Then
                  find_word = 0
                End If
              Case Else
            End Select
            If Len(s_word) < 3 Then find_word = 0
            pot_t = InStr(cha, "t")
            If pot_t <> 0 Then
              temp_w = Mid(chz, pot_t, 1)
            End If
            
            If find_word <> 0 Then
              read_word = chz + " " + read_word
              If Right(cha, 1) = "p" Then
                Call sakot(Right(chz, 1), temp_w, s_word)
              Else
                Call sakot("", temp_w, s_word)
              End If
              sign_word = s_word + sign_word
            End If
            s_word = ""
           
          '7777777777777777777777777777777777777777777777777777777
          
          Case "p"
            read_word = chz + " " + read_word
            find_word = 1
            Call c_frist(chz, s_word)
            Call sara("ะ", s_word)
            Call sakot("", "", s_word)
            sign_word = s_word + sign_word
            s_word = ""
    
          Case Else
            If i = 1 Then
              chk_word = chk_word - 1
            End If
          
        End Select
      End If
      temp_w = ""
      s_word = ""
      pot_p = 0
      pot_t = 0
      pot_e = 0
   
    Next i
    chk_word = chk_word - find_word
    find_word = 0
    
  Loop
End Sub
 
 
Private Sub c_frist(ByVal c1 As String, ByRef s_word As String)
  Select Case c1
   Case "ก"
      s_word = s_word + "k"
    Case "ค", "ข", "ฃ", "ฆ", "ฅ"
      s_word = s_word + "kh"
    Case "ง"
      s_word = s_word + "ng"
    Case "ฉ", "ช", "ฌ"
      s_word = s_word + "ch"
    Case "จ"
      s_word = s_word + "j"
    Case "ซ", "ษ", "ศ", "ส", "ทร"
      s_word = s_word + "s"
    Case "ญ", "ย", "หย", "หญ"
      s_word = s_word + "y"
    Case "ฎ", "ด"
      s_word = s_word + "d"
    Case "ฏ", "ต"
      s_word = s_word + "t"
    Case "ฒ", "ฐ", "ถ", "ท", "ธ", "ฑ"
      s_word = s_word + "th"
    Case "น", "ณ", "หน"
      s_word = s_word + "n"
    Case "บ"
      s_word = s_word + "b"
    Case "ป"
      s_word = s_word + "p"
    Case "ผ", "พ"
      s_word = s_word + "ph"
    Case "ฟ", "ฝ"
      s_word = s_word + "f"
    Case "ม", "หม"
      s_word = s_word + "m"
    Case "ร", "หร"
      s_word = s_word + "r"
    Case "ล", "ฬ", "หล"
      s_word = s_word + "l"
    Case "ว", "หว"
      s_word = s_word + "w"
    Case "อ"
      s_word = s_word + "oo"
    Case "ฮ", "ห"
      s_word = s_word + "h"
      
      
    Case "กร"
      s_word = s_word + "kr"
    Case "กล"
      s_word = s_word + "kl"
    Case "กว"
      s_word = s_word + "kw"
    Case "คร", "ขร"
      s_word = s_word + "khr"
    Case "คล", "ขล"
      s_word = s_word + "khl"
    Case "คว", "ขว"
      s_word = s_word + "khw"
    Case "พร"
      s_word = s_word + "phr"
    Case "พล"
      s_word = s_word + "phl"
    Case "ปร"
      s_word = s_word + "pr"
    Case "ปล"
      s_word = s_word + "pl"
    Case "ฟร"
      s_word = s_word + "fr"
    Case "ฟล"
      s_word = s_word + "fl"
    Case "บร"
      s_word = s_word + "br"
    Case "บล"
      s_word = s_word + "bl"
    Case "ตร"
      s_word = s_word + "tr"
    Case "ดร"
      s_word = s_word + "dr"
    Case Else
      
  End Select
  
End Sub
Private Sub sara(ByVal c1 As String, ByRef s_word As String)
  Select Case c1
    Case "ะ", "ั"                                ' สระอะ
      s_word = s_word + "a a"
    Case "า"                                      ' สระอา
      s_word = s_word + "a a_"
    Case "ิ"                                        ' สระอิ
      s_word = s_word + "i i"
    Case "ี"                                        ' สระอี
      s_word = s_word + "i i_"
    Case "ึ"                                        ' สระอึ
      s_word = s_word + "ue ue"
    Case "ื"                                        ' สระอือ
      s_word = s_word + "ue ue_"
    Case "ุ"                                        ' สระอุ
      s_word = s_word + "u u"
    Case "ู"                                        ' สระอู
      s_word = s_word + "u u_"
    
    Case "n_a"                                ' สระเอะ
      s_word = s_word + "e e"
    Case "เ"                                      ' สระเอ
      s_word = s_word + "e e_"
    Case "m_a"                              ' สระแอะ
      s_word = s_word + "ae ae"
    Case "แ"                                    ' สระแอ
      s_word = s_word + "ae ae_"
    Case "u_a"                              'มน,กรน
      s_word = s_word + "o o"
    Case "โะ"
        s_word = s_word + "o o"
    Case "โ"                         '7
      s_word = s_word + "o o_"
  
    Case "n_pa"                             'สระเออะ
      s_word = s_word + "er er"
    Case "n_p"                              'สระเออ
      s_word = s_word + "er er_"
    Case "n_sa"                             'สระเอาะ
      s_word = s_word + "oa oa"
    Case "oo"                                 'สระออ
      s_word = s_word + "oa oa_"
    Case "iva"                                  'สระอัวะ
      s_word = s_word + "u ua"
    Case "iv"                                   'สระอัว
      s_word = s_word + "u ua_"
    Case "n15"                              'สระเอือะ
      s_word = s_word + "ue uae"
    Case "n18"                              'สระเอือ
      s_word = s_word + "ue uae_"
    Case "n16"                              'สระเอียะ
      s_word = s_word + "i ia"
    Case "n19"                              'สระเอีย
      s_word = s_word + "i ia_"
    Case "n_s"                              ' สระเอา
      s_word = s_word + "a aw"
    Case "b"                                    ' สระไอ ใอ
      s_word = s_word + "a ay"
    Case "os"                                   ' สระอำ
      s_word = s_word + "a am"
  
  End Select
  
End Sub
Private Sub sakot(ByVal c1, c2 As String, ByRef s_word As String)
  Select Case c1
    Case "ก", "ข", "ค", "ฆ", "ฃ", "ฅ"
      s_word = s_word + "k"
    Case "จ", "ช", "ซ", "ฏ", "ฎ", "ฐ", "ฑ", "ฒ", "ด", "ต", "ถ", "ท", "ธ", "ศ", "ษ", "ส", "ฉ", "ฌ", "ซ"
      s_word = s_word + "d"
    Case "บ", "ป", "พ", "ฟ", "ภ", "ผ", "ฝ"
      s_word = s_word + "b"
    Case "ง"
      s_word = s_word + "ng"
    Case "น", "ญ", "ณ", "ล", "ฬ", "ร"
      s_word = s_word + "n"
    Case "ม"
      s_word = s_word + "m"
    Case "ย"
      s_word = s_word + "y"
    Case "ว"
      s_word = s_word + "w"
    Case Else
      
  End Select
  Select Case c2
    Case "่"
      s_word = s_word + "1 "
    Case "้"
      s_word = s_word + "2 "
    Case "๊"
      s_word = s_word + "3 "
    Case "๋"
      s_word = s_word + "4 "
    Case Else
      s_word = s_word + "0 "
    
  End Select
  
End Sub
