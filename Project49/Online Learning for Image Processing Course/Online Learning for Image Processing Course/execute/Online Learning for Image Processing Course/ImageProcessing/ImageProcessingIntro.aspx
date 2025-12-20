<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ImageProcessingIntro.aspx.vb" Inherits="ImageProcessingIntro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Image Processing Introduction</title>
    <style>
	    a:link {COLOR: #000080; TEXT-DECORATION: none}
	    a:visited {	COLOR: #000080; TEXT-DECORATION: none}
	    a:hover {COLOR: blue; TEXT-DECORATION: none}
    </style>
</head>
<body bottommargin="0" background="../Image/bg.jpg" style="font-family:MS Sans Serif;font-size:10pt">
    <form id="form1" runat="server">
    <div>
        <table align="center" width="600" bgcolor="white" border="1px" bordercolor="#ff9933">
            <tr align="center" height="30">
                <td colspan="3" style="font-size:16pt;font-weight:bold">Introduction</td>
            </tr>
            <tr align="center">
                <td width="170" valign="top" style="font-weight:bold">Image Arithmetic</td>
                <td width="430" align="left">
                    &nbsp; &nbsp; &nbsp; &nbsp; มีตัวอย่างการทดลองอยู่ 3 ส่วนดังนี้
                    <ul>
                        <li>Image Addition เป็นการนำภาพ 2 ภาพนั้น มารวมเป็นภาพเดียว</li>
                        <li>Image Subtraction เป็นการนำภาพ 2 ภาพนั้น มาหักลบออกจากกัน</li>
                        <li>Image Multiplication เป็นการนำภาพ 2 ภาพนั้น มาคูณกัน</li>
                    </ul>
                </td>
            </tr>
            <tr align="center">
                <td valign="top" style="font-weight:bold">Contrast/Brightness</td>
                <td align="left">
                    &nbsp; &nbsp; &nbsp; &nbsp; มีฟังก์ชันดังนี้
                    <ul>
                        <li>Linear Contrast เป็นการปรับความคมชัดของภาพ โดยใช้สมการเส้นตรง &nbsp; &nbsp; &nbsp;
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Y = AX + B โดยที่ B = 0</li>
                        <li>Logarithm Contrast เป็นการปรับความคมชัดของภาพ โดยใช้สมการล็อกการิธึมY = A(Log 1 + X) + B โดยที่ B = 0</li>
                        <li>Exponential Contrast เป็นการปรับความคมชัดของภาพ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            โดยใช้สมการเอ็กซ์โพเนนเชียล Y = Ae^x + B โดยที่ B = 0</li>
                        <li>Power Law Contrast เป็นการปรับความคมชัดของภาพ โดยใช้สมการ &nbsp; &nbsp; &nbsp; &nbsp;
                            การยกกำลัง Y = AX^y + B โดยที่ B = 0 และ y = Gamma Value</li>
                    </ul>
                    &nbsp; &nbsp; &nbsp; &nbsp; นอกจากการทำ Contrast แล้วก็ยังมีการทำ Brightness 
                    <br />
                    &nbsp; &nbsp; &nbsp; &nbsp; และContrast/Brightness
                    &nbsp;ด้วยดังนี้
                    <ul>
                        <li>Linear Brightness เป็นการทำปรับความสว่างของภาพโดยใช้สมการเส้นตรง &nbsp; &nbsp; Y = AX + B โดยที่ A = 1</li>
                        <li>Linear Contrast/Brightness เป็นการปรับความคมชัดและความสว่างของภาพ โดยใช้สมการเส้นตรง Y = AX + B</li>
                    </ul>
                </td>
            </tr>
            <tr align="center">
                <td valign="top" style="font-weight:bold">Color Balance</td>
                <td align="left">
                    &nbsp; &nbsp; &nbsp; &nbsp; เป็นการปรับ... ของภาพ โดยใช้สมการการยกกำลัง คือ Power Law : Y = AX^y 
                    <br />
                    &nbsp;โดยที่ y = Gamma Value
                    โดยสามารถปรับค่าของ RGB ได้
                </td>
            </tr>
            <tr align="center">
                <td valign="top" style="font-weight:bold">Histogram</td>
                <td align="left">
                    &nbsp; &nbsp; &nbsp; &nbsp; จะมี 2 ส่วน ดังนี้
                    <ul>
                        <li>Histogram เป็นการหาความถี่หรือสถิติของค่าสีที่มีในภาพนั้นๆ</li>
                        <li>Histogram Equalization เป็นการกระจายค่าความเข้มสีเทาให้เป็นการกระจายแบบปกติ คือให้จำนวนจุดภาพในแต่ละค่าความเข้มมีจำนวนใกล้เคียงกัน
</li>
                    </ul>
                </td>
            </tr>
            <tr align="center">
                <td valign="top" style="font-weight:bold">Spatial Domain Filtering</td>
                <td align="left">
                    &nbsp; &nbsp; &nbsp; &nbsp; มีฟังก์ชันดังนี้
                    <ul>
                        <li>Mean Filtering แบ่งออกเป็น Arithmetic, Geometric, Harmonic &nbsp; &nbsp; &nbsp;
                            &nbsp; &nbsp; &nbsp;&nbsp; และ Contra-Harmonic ซึ่งมีการคำนวณกับขนาดของ Window ที่ใช้ 2 วิธีคือ Convolution และ Corelation</li>
                        <li>Order Statistic Filtering แบ่งออกเป็น Median, Max, Min, MidPoint,&nbsp; Alpha Trimmed Mean</li>
                        <li>Adaptive Filtering แบ่งออกเป็น Adaptive MMSE, Adaptive Medain</li>
                    </ul>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
