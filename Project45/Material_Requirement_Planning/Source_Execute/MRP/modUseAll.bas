Attribute VB_Name = "modUseAll"
Public Declare Function GetSystemMenu Lib "user32" (ByVal hwnd As Long, ByVal bRevert As Long) As Long
Public Declare Function RemoveMenu Lib "user32" (ByVal hMenu As Long, ByVal nPosition As Long, ByVal wFlags As Long) As Long

Public Const MF_REMOVE = &H1000&    'ต้องการถอนเมนู
Public Const MF_BYPOSITION = &H400& 'โดยใช้การอ้างอิงตำแหน่งของเมนู

Public Const strConn = "Provider=Microsoft.Jet.OLEDB.4.0;Persist Security Info=False"
Public tmpItemModel As String              'รหัสสินค้า
Public tmpSupplierCode As String       'รหัสบริษัทตัวแทนจำหน่ายสินค้า
Public tmpSupplierName As String      'ชื่อบริษัทตัวแทนจำหน่าย
Public tmpShortName As String            'ชื่อสินค้า
Public tmpBrandName As String           'ยี่ห้อ
Public tmpCost As String                         'ต้นทุน
Public tmpSellPrice As String                   'ราคาขาย
Public tmpItemTypeCode As String     'ประเภทสินค้า

Public tmpSaleItemID As String              'รหัสสินค้าที่ขาย
Public tmpSaleItemName As String        'ชื่อสินค้าที่ขาย


Public Function DateThaiFormat(EngDate As DTPicker) As String
Dim tmpYear As String
Dim tmpDate As String
    tmpYear = DatePart("yyyy", EngDate.Value)
    tmpDate = CStr(Format(EngDate.Value, "mm/dd/yyyy"))
    DateThaiFormat = Left(tmpDate, Len(tmpDate) - 4) & tmpYear
End Function

Public Sub MFGRowColor(TargetGrid As MSHFlexGrid, RedColor As Integer, GreenColor As Integer, BlueColor As Integer)
Dim i As Integer
Dim j As Integer

    For i = 1 To TargetGrid.Rows - 1
        For j = 0 To TargetGrid.Cols - 1
            If i / 2 <> Int(i / 2) Then
                TargetGrid.Col = j
                TargetGrid.Row = i
                TargetGrid.CellBackColor = RGB(RedColor, GreenColor, BlueColor)
            Else
                TargetGrid.Col = j
                TargetGrid.Row = i
                TargetGrid.CellBackColor = RGB(255, 255, 255)
            End If
        Next j
    Next i
End Sub
