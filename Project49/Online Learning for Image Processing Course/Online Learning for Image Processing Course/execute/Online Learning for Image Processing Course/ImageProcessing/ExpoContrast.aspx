<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ExpoContrast.aspx.vb" Inherits="ExpoContrast" %>
<%@ Register Assembly="AtlasControlToolkit" Namespace="AtlasControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="WebChart" Namespace="WebChart" TagPrefix="Web" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Exponential Contrast</title>
<style>
	    a:link {COLOR: #000080; TEXT-DECORATION: none}
	    a:visited {	COLOR: #000080; TEXT-DECORATION: none}
	    a:hover {COLOR: blue; TEXT-DECORATION: none}
    </style>
</head>
<body bottommargin="0" background="../Image/bg.jpg" style="font-family:MS Sans Serif;font-size:10pt">
    <form id="form1" runat="server">
    <div>
        <table align="center" width="600" bgcolor="white" border="0">
            <tr align="center" height="50">
                <td colspan="3" style="border-color:#ff9933;border-width:thin;border-style:double">
                    <font style="font-family:Arial;font-weight:bolder;font-size:medium">Exponential Contrast</font>
                    <br />Y = e^AX + B : B = 0
                </td>
            </tr>
            <tr align="center" height="30">
                <td colspan="3"><asp:FileUpload ID="ImageFile" runat="server" EnableTheming="True" Width="450px" />
                    <asp:Button ID="OK" runat="server" Text="ตกลง" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center"><asp:Label ID="Warning" runat="server" ForeColor="red"></asp:Label></td>
            </tr>
            <tr align="center" height="30">
                <td style="border-color:#ff9933;border-width:thin;border-style:double">Before</td>
                <td></td>
                <td style="border-color:#ff9933;border-width:thin;border-style:double">After</td>
            </tr>
            <tr align="center">
                <td style="border-color:#ff9933;border-width:thin;border-style:double"><asp:Image ID="ImageBefore" runat="server" AlternateText="Please browse image file" 
                    ToolTip="Image Before" Height="256px" Width="256px" />
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td style="border-color:#ff9933;border-width:thin;border-style:double"><asp:Image ID="ImageAfter" runat="server" AlternateText="Please browse image file"
                    ToolTip="Image After" Height="256px" Width="256px" ImageUrl="~/ImageProcessing/ImageDefaultAfter/DefaultImageAfter.bmp" />
                </td>
            </tr>
            <tr height="10"><td colspan="3"></td></tr>
           <%--<tr align="center" height="30">
                <td colspan="3">เลือกค่าเลขจำนวนเต็มและค่าเลขยกกำลัง จะได้ผลลัพธ์ เช่น 2 x 10^(-30)</td>
           </tr>
           <tr align="center">
                <td style="border-color:#ff9933;border-width:thin;border-style:double">
                    เลขจำนวนเต็ม<atlas:ScriptManager ID="sm1" runat="server" />
                    <asp:TextBox ID="txtValue1" runat="server" />
                    <cc1:SliderExtender ID="SliderExtender1" runat="server">
                    <cc1:SliderProperties TargetControlID="txtValue1" EnableHandleAnimation="true" BoundControlID="lblValue1" Minimum="0" Maximum="9" />
                    </cc1:SliderExtender>
                    <asp:Label ID="lblValue1" runat="server" />
                </td>
                <td></td>
                <td style="border-color:#ff9933;border-width:thin;border-style:double">
                    เลขยกกำลัง<asp:TextBox ID="txtValue2" runat="server" />
                    <cc1:SliderExtender ID="SliderExtender2" runat="server">
                    <cc1:SliderProperties TargetControlID="txtValue2" EnableHandleAnimation="true" BoundControlID="lblValue2" Minimum="-75" Maximum="-25" />
                    </cc1:SliderExtender>
                    <asp:Label ID="lblValue2" runat="server" />
                </td>
           </tr>--%>
           <tr align="center">
                <td colspan="3" style="border-color:#ff9933;border-width:thin;border-style:double">
                    Value A (x0.001)<atlas:ScriptManager ID="sm1" runat="server" />
                    <asp:TextBox ID="txtValue1" runat="server" />
                    <cc1:SliderExtender ID="SliderExtender1" runat="server">
                    <cc1:SliderProperties TargetControlID="txtValue1" EnableHandleAnimation="true" BoundControlID="lblValue1" Minimum="20" Maximum="70" />
                    </cc1:SliderExtender>
                    <asp:Label ID="lblValue1" runat="server" />
                </td>
           </tr>
           <tr align="center" height="30">
                <td colspan="3"><asp:Button ID="Expo_Contrast" runat="server" Text="ประมวลผล" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" /></td>
           </tr>
           <tr align="center">
                <td colspan="3" style="border-color:#ff9933;border-width:thin;border-style:double"><Web:ChartControl ID="ExpoContrastChart" Visible="false" runat="server" BorderStyle="Outset" 
                            BorderWidth="5px" ChartFormat="Jpg" Height="250px" ShowXValues="False" 
                            ShowYValues="False" Width="550px" XTicksInterval="200" ChartPadding="10" 
                            LeftChartPadding="0" Padding="20" GridLines="None">
                        <YAxisFont StringFormat="Far,Near,Character,LineLimit" />
                        <XTitle StringFormat="Center,Near,Character,LineLimit" ForeColor="Purple" Text="Input" />
                        <PlotBackground CenterPoint="100, 100" EndPoint="0, 0" ForeColor="Red" LinearGradientMode="Vertical" />
                        <ChartTitle StringFormat="Center,Near,Character,LineLimit" />
                        <XAxisFont StringFormat="Center,Near,Character,LineLimit" />
                        <Background Color="LightSteelBlue" ForeColor="Red" />
                        <Legend Width="0"></Legend>
                        <YTitle StringFormat="Center,Near,Character,LineLimit" ForeColor="Green" Text="Output" />
                    </Web:ChartControl>
                </td>
           </tr>
        </table>
    </div>
    </form>
</body>
</html>
