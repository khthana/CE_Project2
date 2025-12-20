<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ImageProcessingLink.aspx.vb" Inherits="ImageProcessingLink" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Image Processing Link</title>
    <script src="../js/imageprocessingbtn.js" language="javascript" type="text/javascript"></script>
    <style>
    	a:link {COLOR: #000080; TEXT-DECORATION: none}
    	a:visited {	COLOR: #000080; TEXT-DECORATION: none}
    	a:hover {COLOR: blue; TEXT-DECORATION: none}
    </style>
</head>
<body bottommargin="0" background="../Image/bg.jpg" style="font-family:MS Sans Serif;font-size:10pt">
    <form id="form1" runat="server">
    <div>
        <table align="center" bgcolor="white" width="220" height="570" cellpadding="0" cellspacing="0" border="0">
            <tr align="center">
                <td style="font-weight:bold">ฟังก์ชันการประมวลผลภาพ</td>
            </tr>
            <tr>
                <td>
                    <a href = "ImageProcessingIntro.aspx?sub_id=10000001" target="showframe" onMouseOver="turnOn('intro');" onMouseOut="turnOff('intro');">
                        <img name="intro" class="imgTrans" src="../Image/Button/imageprocessing/imgintro1.jpg" border="0" align="middle" width="220" height="20">
                    </a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href = "colorbalance.aspx?sub_id=10000001" target="showframe" onMouseOver="turnOn('colorbalance');" onMouseOut="turnOff('colorbalance');">
                        <img name="colorbalance" class="imgTrans" src="../Image/Button/imageprocessing/imgcb1.jpg" border="0" align="middle" width="220" height="20">
                    </a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href = "Histogram.aspx?sub_id=10000001" target="showframe" onMouseOver="turnOn('histogram');" onMouseOut="turnOff('histogram');">
                        <img name="histogram" class="imgTrans" src="../Image/Button/imageprocessing/imghis1.jpg" border="0" align="middle" width="220" height="20">
                    </a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href = "ImageArithmetic.aspx?sub_id=10000001" target="showframe" onMouseOver="turnOn('arithmetic');" onMouseOut="turnOff('arithmetic');">
                        <img name="arithmetic" class="imgTrans" src="../Image/Button/imageprocessing/imgia1.jpg" border="0" align="middle" width="220" height="20">
                    </a>
                </td>
            </tr>
            <tr>
                <td>
                    <img src="../Image/Button/imageprocessing/imgc_b.jpg" align="middle" border="0" width="220" height="20" />
                </td>
            </tr>
            <tr>
                <td>
                    <a href = "LinearContrast.aspx?sub_id=10000001" target="showframe" onMouseOver="turnOn('linearcon');" onMouseOut="turnOff('linearcon');">
                        <img name="linearcon" class="imgTrans" src="../Image/Button/imageprocessing/imglc1.jpg" border="0" align="middle" width="220" height="20">
                    </a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href = "LogContrast.aspx?sub_id=10000001" target="showframe" onMouseOver="turnOn('logcon');" onMouseOut="turnOff('logcon');">
                        <img name="logcon" class="imgTrans" src="../Image/Button/imageprocessing/imgloc1.jpg" border="0" align="middle" width="220" height="20">
                    </a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href = "ExpoContrast.aspx?sub_id=10000001" target="showframe" onMouseOver="turnOn('expocon');" onMouseOut="turnOff('expocon');">
                        <img name="expocon" class="imgTrans" src="../Image/Button/imageprocessing/imgexc1.jpg" border="0" align="middle" width="220" height="20">
                    </a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href = "PowerLawContrast.aspx?sub_id=10000001" target="showframe" onMouseOver="turnOn('powercon');" onMouseOut="turnOff('powercon');">
                        <img name="powercon" class="imgTrans" src="../Image/Button/imageprocessing/imgplc1.jpg" border="0" align="middle" width="220" height="20">
                    </a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href = "LinearBrightness.aspx?sub_id=10000001" target="showframe" onMouseOver="turnOn('linearbright');" onMouseOut="turnOff('linearbright');">
                        <img name="linearbright" class="imgTrans" src="../Image/Button/imageprocessing/imglb1.jpg" border="0" align="middle" width="220" height="20">
                    </a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href = "LinearContrastBrightness.aspx?sub_id=10000001" target="showframe" onMouseOver="turnOn('conbright');" onMouseOut="turnOff('conbright');">
                        <img name="conbright" class="imgTrans" src="../Image/Button/imageprocessing/imglcb1.jpg" border="0" align="middle" width="220" height="20">
                    </a>
                </td>
            </tr>
           <tr>
                <td>
                    <img src="../Image/Button/imageprocessing/imgsdf.jpg" align="middle" border="0" width="220" height="20" />
                </td>
            </tr>
            <tr>
                <td>
                    <a href = "MeanFiltering.aspx?sub_id=10000001" target="showframe" onMouseOver="turnOn('meanfilter');" onMouseOut="turnOff('meanfilter');">
                        <img name="meanfilter" class="imgTrans" src="../Image/Button/imageprocessing/imgmf1.jpg" border="0" align="middle" width="220" height="20">
                    </a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href = "OrderStatisticFlitering.aspx?sub_id=10000001" target="showframe" onMouseOver="turnOn('orderfilter');" onMouseOut="turnOff('orderfilter');">
                        <img name="orderfilter" class="imgTrans" src="../Image/Button/imageprocessing/imgosf1.jpg" border="0" align="middle" width="220" height="20">
                    </a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href = "AdaptiveFiltering.aspx?sub_id=10000001" target="showframe" onMouseOver="turnOn('adaptfilter');" onMouseOut="turnOff('adaptfilter');">
                        <img name="adaptfilter" class="imgTrans" src="../Image/Button/imageprocessing/imgaf1.jpg" border="0" align="middle" width="220" height="20">
                    </a>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
