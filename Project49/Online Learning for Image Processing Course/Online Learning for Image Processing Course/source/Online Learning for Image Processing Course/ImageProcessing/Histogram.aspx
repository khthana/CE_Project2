<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Histogram.aspx.vb" Inherits="Histogram" %>

<%@ Register Assembly="WebChart" Namespace="WebChart" TagPrefix="Web" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Histogram</title>
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
                    <font style="font-family:Arial;font-weight:bolder;font-size:medium">Histogram and Histogram Equalization</font></td>
            </tr>
            <tr align="center" height="30">
                <td colspan="3"><asp:FileUpload ID="ImageFile" runat="server" EnableTheming="True" Width="450px" />
                    <asp:Button ID="OK" runat="server" Text="ตกลง" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                </td>
            </tr>
            <tr>
                <td colspan="3"><asp:Label ID="Warning" runat="server" ForeColor="red"></asp:Label></td>
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
            <tr align="center" height="30">
                <td><asp:Button ID="GetHistogram" runat="server" Text="Histogram" Width="200px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" /></td>
                <td></td>
                <td><asp:Button ID="HistogramEqualization" runat="server" Text="Histogram Equalization" Width="200px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" /></td>
            </tr>
            <tr height="10"><td colspan="3"></td></tr>
            <tr align="center">
                <td colspan="3" style="border-color:#ff9933;border-width:thin;border-style:double"><Web:ChartControl ID="RedHistogramChart" Visible="false" runat="server" BorderStyle="Outset" 
                            BorderWidth="5px" ChartFormat="Jpg" Height="250px" ShowXValues="False" 
                            ShowYValues="False" Width="550px" XTicksInterval="200" ChartPadding="10" 
                            LeftChartPadding="0" Padding="20" GridLines="None">
                        <YAxisFont StringFormat="Far,Near,Character,LineLimit" />
                        <XTitle StringFormat="Center,Near,Character,LineLimit" ForeColor="White" Text="Input" />
                        <PlotBackground CenterPoint="100, 100" EndPoint="0, 0" ForeColor="Red" LinearGradientMode="Vertical" />
                        <ChartTitle StringFormat="Center,Near,Character,LineLimit" />
                        <XAxisFont StringFormat="Center,Near,Character,LineLimit" />
                        <Background Color="LightSteelBlue" ForeColor="Red" />
                        <Legend Width="0"></Legend>
                        <YTitle StringFormat="Center,Near,Character,LineLimit" ForeColor="White" Text="Output" />
                    </Web:ChartControl>
                </td>
           </tr>
           <tr align="center">
                <td colspan="3" style="border-color:#ff9933;border-width:thin;border-style:double"><Web:ChartControl ID="GreenHistogramChart" Visible="false" runat="server" BorderStyle="Outset" 
                            BorderWidth="5px" ChartFormat="Jpg" Height="250px" ShowXValues="False" 
                            ShowYValues="False" Width="550px" XTicksInterval="200" ChartPadding="10" 
                            LeftChartPadding="0" Padding="20" GridLines="None">
                        <YAxisFont StringFormat="Far,Near,Character,LineLimit" />
                        <XTitle StringFormat="Center,Near,Character,LineLimit" ForeColor="White" Text="Input" />
                        <PlotBackground CenterPoint="100, 100" EndPoint="0, 0" ForeColor="Red" LinearGradientMode="Vertical" />
                        <ChartTitle StringFormat="Center,Near,Character,LineLimit" />
                        <XAxisFont StringFormat="Center,Near,Character,LineLimit" />
                        <Background Color="LightSteelBlue" ForeColor="Red" />
                        <Legend Width="0"></Legend>
                        <YTitle StringFormat="Center,Near,Character,LineLimit" ForeColor="White" Text="Output" />
                    </Web:ChartControl>
                </td>
           </tr>
           <tr align="center">
                <td colspan="3" style="border-color:#ff9933;border-width:thin;border-style:double"><Web:ChartControl ID="BlueHistogramChart" Visible="false" runat="server" BorderStyle="Outset" 
                            BorderWidth="5px" ChartFormat="Jpg" Height="250px" ShowXValues="False" 
                            ShowYValues="False" Width="550px" XTicksInterval="200" ChartPadding="10" 
                            LeftChartPadding="0" Padding="20" GridLines="None">
                        <YAxisFont StringFormat="Far,Near,Character,LineLimit" />
                        <XTitle StringFormat="Center,Near,Character,LineLimit" ForeColor="White" Text="Input" />
                        <PlotBackground CenterPoint="100, 100" EndPoint="0, 0" ForeColor="Red" LinearGradientMode="Vertical" />
                        <ChartTitle StringFormat="Center,Near,Character,LineLimit" />
                        <XAxisFont StringFormat="Center,Near,Character,LineLimit" />
                        <Background Color="LightSteelBlue" ForeColor="Red" />
                        <Legend Width="0"></Legend>
                        <YTitle StringFormat="Center,Near,Character,LineLimit" ForeColor="White" Text="Output" />
                    </Web:ChartControl>
                </td>
           </tr>
        </table>
    </div>
    </form>
</body>
</html>
