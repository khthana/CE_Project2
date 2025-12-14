Attribute VB_Name = "mdlSign"
Option Explicit

Private Const SIDnamespace = "http://www.b2bmarketplace.com/doc/2002/02/xmldsig#"
Private Const Smethod = "http://www.b2bmarketplace.com/doc/2002/02/xmldsig#rsa-sha1"
Private Const TransformAlg = "http://b2bmarketplace.com/doc/2002/02/xmldsig#rsa-enc"
Private Const DigestMethod = "http://b2bmarketplace.com/doc/2002/02/xmldsig#sha1"

Private Const SmethodMD5 = "http://www.b2bmarketplace.com/doc/2002/02/xmldsig#rsa-MD5"
Private Const DigestMethodMD5 = "http://b2bmarketplace.com/doc/2002/02/xmldsig#MD5"

Public Function Sha1SignFile(ByVal SID As String, ByVal KeyID As String, ByVal keyDate As String, _
                                ByVal FileName As String, ByVal destFile As String, ByVal KEY As Double, _
                                ByVal N As Double) As Boolean
        '------------- Sign -----------------
        Dim fso As FileSystemObject
        Dim txt As TextStream
        Dim Digest As String
        Dim DigestEnc As String
        '-------------- XML ----------------
        Dim objDocument As IXMLDOMNode
        Dim objXmldoc As DOMDocument30
        Dim objSignedInfo As IXMLDOMNode
        Dim objRoot As IXMLDOMNode
        Dim objAttr As IXMLDOMAttribute
        Dim Snmethod As IXMLDOMNode
        Dim Svalue As IXMLDOMNode
        Dim Referances As IXMLDOMNode
        Dim Transforms As IXMLDOMNode
        Dim Transform As IXMLDOMNode
        Dim Dmethod As IXMLDOMNode
        Dim KeyInfo As IXMLDOMNode
        Dim KeyUserID As IXMLDOMNode
        Dim KeyCreateDate As IXMLDOMNode
      
        On Error GoTo msgerr:
        '--------- Sign ---------------
        Set fso = New FileSystemObject
        Set txt = fso.OpenTextFile(FileName, ForReading)
        Digest = SecureHash(txt.ReadAll)
        DigestEnc = enc(Digest, UseKey, N)
        txt.Close
        Set fso = Nothing
        
        Set objXmldoc = New DOMDocument30
        '------------- Original File ----------------
        Set objDocument = objXmldoc.createNode(1, "Document", "")
        objXmldoc.async = False
        objXmldoc.validateOnParse = False
        objXmldoc.Load FileName
        objDocument.appendChild objXmldoc.createTextNode(vbCrLf & vbTab) 'newline
        objDocument.appendChild objXmldoc.documentElement
        objDocument.appendChild objXmldoc.createTextNode(vbCrLf & vbCrLf & vbTab) 'newline
        
        '------------ Create Sign XML ----------------
        Set objRoot = objXmldoc.createNode(1, "SignatureID", SIDnamespace)
        Set objAttr = objXmldoc.createAttribute("ID")
        objAttr.value = SID
        objRoot.Attributes.setNamedItem objAttr
        Set objSignedInfo = objXmldoc.createNode(1, "SignedInfo", "")
        Set Snmethod = objXmldoc.createNode(1, "SignatureMethod", "")
        Set objAttr = objXmldoc.createAttribute("Algorithm")
        objAttr.value = Smethod
        Snmethod.Attributes.setNamedItem objAttr
        Set Referances = objXmldoc.createNode(1, "Referances", "")
        Set Transforms = objXmldoc.createNode(1, "Transforms", "")
        Set Transform = objXmldoc.createNode(1, "Transform", "")
        Set objAttr = objXmldoc.createAttribute("Algorithm")
        objAttr.value = TransformAlg
        Transform.Attributes.setNamedItem objAttr
        Transforms.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab & vtab & vtab & vtab) 'newline
        Transforms.appendChild Transform
        Transforms.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab & vtab & vtab) 'newline
        Set Dmethod = objXmldoc.createNode(1, "DigestMethod", "")
        Set objAttr = objXmldoc.createAttribute("Algorithm")
        objAttr.value = DigestMethod
        Dmethod.Attributes.setNamedItem objAttr
        Referances.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab & vtab & vtab) 'newline
        Referances.appendChild Transforms
        Referances.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab & vtab & vtab) 'newline
        Referances.appendChild Dmethod
        Referances.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab & vtab) 'newline
        objSignedInfo.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab & vtab) 'newline
        objSignedInfo.appendChild Snmethod
        objSignedInfo.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab & vtab) 'newline
        objSignedInfo.appendChild Referances
        objSignedInfo.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab)  'newline
        
        Set Svalue = objXmldoc.createNode(1, "SignatureValue", "")
        Svalue.Text = DigestEnc
        
        Set KeyInfo = objXmldoc.createNode(1, "KeyInfo", "")
        Set KeyUserID = objXmldoc.createNode(1, "KeyUserID", "")
        KeyUserID.Text = KeyID
        Set KeyCreateDate = objXmldoc.createNode(1, "CreateDate", "")
        KeyCreateDate.Text = keyDate
        KeyInfo.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab & vtab) 'newline
        KeyInfo.appendChild KeyUserID
        KeyInfo.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab & vtab) 'newline
        KeyInfo.appendChild KeyCreateDate
        KeyInfo.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab) 'newline
        
        objRoot.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab) 'newline
        objRoot.appendChild objSignedInfo
        objRoot.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab)  'newline
        objRoot.appendChild Svalue
        objRoot.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab) 'newline
        objRoot.appendChild KeyInfo
        objRoot.appendChild objXmldoc.createTextNode(vbCrLf & vtab) 'newline
        
        objDocument.appendChild objRoot
        objDocument.appendChild objXmldoc.createTextNode(vbCrLf) 'newline
        Set objXmldoc.documentElement = objDocument
        objXmldoc.Save destFile
        
        
        'Release memory
        Set objSignedInfo = Nothing
        Set objRoot = Nothing
        Set Snmethod = Nothing
        Set Svalue = Nothing
        Set Referances = Nothing
        Set Transforms = Nothing
        Set Transform = Nothing
        Set Dmethod = Nothing
        Set KeyInfo = Nothing
        Set KeyUserID = Nothing
        Set KeyCreateDate = Nothing
        Set objXmldoc = Nothing
        
        Sha1SignFile = True
        Message "Sign File Complete At : " & GetFileName(destFile)
Exit Function
msgerr:
        Message "Error !!! Sign File Not Complete"
        Sha1SignFile = False
End Function

Private Function vtab() As String
        vtab = vbTab
End Function

Public Function MD5SignFile(ByVal SID As String, ByVal KeyID As String, ByVal keyDate As String, _
                                ByVal FileName As String, ByVal destFile As String, ByVal KEY As Double, _
                                ByVal N As Double) As Boolean
         '------------- Sign -----------------
        Dim fso As FileSystemObject
        Dim txt As TextStream
        Dim Digest As String
        Dim DigestEnc As String
        '-------------- XML ----------------
        Dim objDocument As IXMLDOMNode
        Dim objXmldoc As DOMDocument30
        Dim objSignedInfo As IXMLDOMNode
        Dim objRoot As IXMLDOMNode
        Dim objAttr As IXMLDOMAttribute
        Dim Snmethod As IXMLDOMNode
        Dim Svalue As IXMLDOMNode
        Dim Referances As IXMLDOMNode
        Dim Transforms As IXMLDOMNode
        Dim Transform As IXMLDOMNode
        Dim Dmethod As IXMLDOMNode
        Dim KeyInfo As IXMLDOMNode
        Dim KeyUserID As IXMLDOMNode
        Dim KeyCreateDate As IXMLDOMNode
      
        '--------- Sign ---------------
        Set fso = New FileSystemObject
        Set txt = fso.OpenTextFile(FileName, ForReading)
        Dim md5obj As MD5
        Set md5obj = New MD5
        Digest = md5obj.DigestStrToHexStr(txt.ReadAll)
        DigestEnc = enc(Digest, UseKey, N)
        txt.Close
        Set fso = Nothing
        Set md5obj = Nothing
        
        Set objXmldoc = New DOMDocument30
        '------------- Original File ----------------
        Set objDocument = objXmldoc.createNode(1, "Document", "")
        objXmldoc.async = False
        objXmldoc.validateOnParse = False
        objXmldoc.Load FileName
        objDocument.appendChild objXmldoc.createTextNode(vbCrLf & vbTab) 'newline
        objDocument.appendChild objXmldoc.documentElement
        objDocument.appendChild objXmldoc.createTextNode(vbCrLf & vbCrLf & vbTab) 'newline
        
        '------------ Create Sign XML ----------------
        Set objRoot = objXmldoc.createNode(1, "SignatureID", SIDnamespace)
        Set objAttr = objXmldoc.createAttribute("ID")
        objAttr.value = SID
        objRoot.Attributes.setNamedItem objAttr
        Set objSignedInfo = objXmldoc.createNode(1, "SignedInfo", "")
        Set Snmethod = objXmldoc.createNode(1, "SignatureMethod", "")
        Set objAttr = objXmldoc.createAttribute("Algorithm")
        objAttr.value = SmethodMD5
        Snmethod.Attributes.setNamedItem objAttr
        Set Referances = objXmldoc.createNode(1, "Referances", "")
        Set Transforms = objXmldoc.createNode(1, "Transforms", "")
        Set Transform = objXmldoc.createNode(1, "Transform", "")
        Set objAttr = objXmldoc.createAttribute("Algorithm")
        objAttr.value = TransformAlg
        Transform.Attributes.setNamedItem objAttr
        Transforms.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab & vtab & vtab & vtab) 'newline
        Transforms.appendChild Transform
        Transforms.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab & vtab & vtab) 'newline
        Set Dmethod = objXmldoc.createNode(1, "DigestMethod", "")
        Set objAttr = objXmldoc.createAttribute("Algorithm")
        objAttr.value = DigestMethodMD5
        Dmethod.Attributes.setNamedItem objAttr
        Referances.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab & vtab & vtab) 'newline
        Referances.appendChild Transforms
        Referances.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab & vtab & vtab) 'newline
        Referances.appendChild Dmethod
        Referances.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab & vtab) 'newline
        objSignedInfo.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab & vtab) 'newline
        objSignedInfo.appendChild Snmethod
        objSignedInfo.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab & vtab) 'newline
        objSignedInfo.appendChild Referances
        objSignedInfo.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab)  'newline
        
        Set Svalue = objXmldoc.createNode(1, "SignatureValue", "")
        Svalue.Text = DigestEnc
        
        Set KeyInfo = objXmldoc.createNode(1, "KeyInfo", "")
        Set KeyUserID = objXmldoc.createNode(1, "KeyUserID", "")
        KeyUserID.Text = KeyID
        Set KeyCreateDate = objXmldoc.createNode(1, "CreateDate", "")
        KeyCreateDate.Text = keyDate
        KeyInfo.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab & vtab) 'newline
        KeyInfo.appendChild KeyUserID
        KeyInfo.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab & vtab) 'newline
        KeyInfo.appendChild KeyCreateDate
        KeyInfo.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab) 'newline
        
        objRoot.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab) 'newline
        objRoot.appendChild objSignedInfo
        objRoot.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab)  'newline
        objRoot.appendChild Svalue
        objRoot.appendChild objXmldoc.createTextNode(vbCrLf & vtab & vtab) 'newline
        objRoot.appendChild KeyInfo
        objRoot.appendChild objXmldoc.createTextNode(vbCrLf & vtab) 'newline
        
        objDocument.appendChild objRoot
        objDocument.appendChild objXmldoc.createTextNode(vbCrLf) 'newline
        Set objXmldoc.documentElement = objDocument
        objXmldoc.Save destFile
        
        
        'Release memory
        Set objSignedInfo = Nothing
        Set objRoot = Nothing
        Set Snmethod = Nothing
        Set Svalue = Nothing
        Set Referances = Nothing
        Set Transforms = Nothing
        Set Transform = Nothing
        Set Dmethod = Nothing
        Set KeyInfo = Nothing
        Set KeyUserID = Nothing
        Set KeyCreateDate = Nothing
        Set objXmldoc = Nothing
End Function


Public Function ValidateFile(ByVal FileName As String, ByVal destFile As String) As Boolean
        Dim SID As String
        Dim Digest As String
        Dim DigestDec As String
        Dim KeyID As String
        Dim keyDate As String
        Dim DigestOrg As String
        
        Dim fso As FileSystemObject
        Dim txt As TextStream
        
        Dim getDmethod As String
        Dim objXmldoc As DOMDocument30
        Dim objSign As IXMLDOMElement
        Dim objNameNodeMap As IXMLDOMNamedNodeMap
        Dim objNode As IXMLDOMNode
        Dim objNodeList As IXMLDOMNodeList
        Set objXmldoc = New DOMDocument30
   
        On Error GoTo msgerr:
        objXmldoc.async = False
        objXmldoc.validateOnParse = False
        If objXmldoc.Load(FileName) Then
     
                Set objSign = objXmldoc.documentElement.lastChild
                Set objNameNodeMap = objSign.Attributes
                Set objNode = objNameNodeMap.getNamedItem("ID")
                SID = objNode.Text
        
                Set objNodeList = objSign.getElementsByTagName("DigestMethod")
                Set objNameNodeMap = objNodeList.Item(0).Attributes
                Set objNode = objNameNodeMap.getNamedItem("Algorithm")
                getDmethod = objNode.Text
        
                Set objNodeList = objSign.getElementsByTagName("SignatureValue")
                Digest = objNodeList.Item(0).Text
        
                Set objNodeList = objSign.getElementsByTagName("KeyUserID")
                KeyID = objNodeList.Item(0).Text
        
                Set objNodeList = objSign.getElementsByTagName("CreateDate")
                keyDate = objNodeList.Item(0).Text
        
               SearchPublicKey KeyID
               DigestDec = dec(Digest, UseKey, N)
               If getDmethod = DigestMethodMD5 Then     'MD5
                        Dim md5obj As MD5
                        Set md5obj = New MD5
                        Set fso = New FileSystemObject
                        Set txt = fso.OpenTextFile(FragmentDocument(FileName, destFile), ForReading)
                        DigestOrg = md5obj.DigestStrToHexStr(txt.ReadAll)
                        If DigestDec = DigestOrg Then
                                Message "Valid Document"
                                ValidateFile = True
                        Else
                                Message "Invalid Document"
                                ValidateFile = False
                        End If
               Else                                                                             'Sha1
                        Set fso = New FileSystemObject
                        Set txt = fso.OpenTextFile(FragmentDocument(FileName, destFile), ForReading)
                        DigestOrg = SecureHash(txt.ReadAll)
                        If DigestDec = DigestOrg Then
                                Message "Valid Document"
                                ValidateFile = True
                        Else
                                Message "Invalid Document"
                                ValidateFile = False
                        End If
               End If
        Else
                Message "Can not read SIGN 's Xml file"
         End If
Exit Function
msgerr:
        Message Error$
End Function

'return file name of fragmentation is a original file name before sign
Private Function FragmentDocument(ByVal FileName As String, ByVal destFile As String) As String
         Dim objXmldoc As DOMDocument30
         Dim NewFile As DOMDocument30
         Dim objRoot As IXMLDOMNode
         
         Set objXmldoc = New DOMDocument30
         objXmldoc.validateOnParse = False
         objXmldoc.async = False
         If objXmldoc.Load(FileName) Then
                'Set newFile = New DOMDocument30
                'newFile.dataType = objXmldoc.doctype
                Set objRoot = objXmldoc.documentElement.firstChild
                Set objXmldoc.documentElement = objRoot
                objXmldoc.Save destFile
                FragmentDocument = destFile
                'Message "Create Valid file success in " & destFile
        Else
                FragmentDocument = ""
                Message "Create Valid file not success"
        End If
        Set objXmldoc = Nothing
        Set objRoot = Nothing
End Function
