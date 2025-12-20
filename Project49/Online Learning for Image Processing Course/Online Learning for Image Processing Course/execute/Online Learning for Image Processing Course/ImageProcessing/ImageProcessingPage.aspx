<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ImageProcessingPage.aspx.vb" Inherits="ImageProcessing" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Image Processing</title>
    <style>
    	a:link {COLOR: #000080; TEXT-DECORATION: none}
    	a:visited {	COLOR: #000080; TEXT-DECORATION: none}
    	a:hover {COLOR: blue; TEXT-DECORATION: none}
    </style>
</head>
<frameset cols="25%,75%">

  <frame noresize="noresize" src="ImageProcessingLink.aspx?sub_id=10000001" />
  <frame noresize="noresize" src="ImageProcessingIntro.aspx?sub_id=10000001" name="showframe" />
      
</frameset>
</html>
