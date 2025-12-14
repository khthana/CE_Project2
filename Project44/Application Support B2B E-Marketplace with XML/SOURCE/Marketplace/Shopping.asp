<%
Set Conn = Server.CreateObject("ADODB.Connection")
conn.Open="Driver={sql server}; server=market; database=marketplace;"
%>

<html>
<head>
<title>Shopping </title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
body {  margin: 0px  0px; padding: 0px  0px}
a:link { color: #005CA2; text-decoration: none}
a:visited { color: #005CA2; text-decoration: none}
a:active { color: #0099FF; text-decoration: underline}
a:hover { color: #0099FF; text-decoration: underline}
-->
</style>
<script language="JavaScript">
<!--

function MM_initTimelines() { //v4.0
    //MM_initTimelines() Copyright 1997 Macromedia, Inc. All rights reserved.
    var ns = navigator.appName == "Netscape";
    var ns4 = (ns && parseInt(navigator.appVersion) == 4);
    var ns5 = (ns && parseInt(navigator.appVersion) > 4);
    document.MM_Time = new Array(2);
    document.MM_Time[0] = new Array(2);
    document.MM_Time["Timeline1"] = document.MM_Time[0];
    document.MM_Time[0].MM_Name = "Timeline1";
    document.MM_Time[0].fps = 10;
    document.MM_Time[0][0] = new String("behavior");
    document.MM_Time[0][0].frame = 301;
    document.MM_Time[0][0].value = "MM_timelineGoto('Timeline1','1')";
    document.MM_Time[0][1] = new String("sprite");
    document.MM_Time[0][1].slot = 1;
    if (ns4)
        document.MM_Time[0][1].obj = document["Layer1"];
    else if (ns5)
        document.MM_Time[0][1].obj = document.getElementById("Layer1");
    else
        document.MM_Time[0][1].obj = document.all ? document.all["Layer1"] : null;
    document.MM_Time[0][1].keyFrames = new Array(1, 150, 300);
    document.MM_Time[0][1].values = new Array(2);
    if (ns5)
        document.MM_Time[0][1].values[0] = new Array("535px", "531px", "528px", "524px", "521px", "517px", "514px", "510px", "506px", "503px", "499px", "496px", "492px", "488px", "485px", "481px", "478px", "474px", "471px", "467px", "463px", "460px", "456px", "453px", "449px", "446px", "442px", "438px", "435px", "431px", "428px", "424px", "421px", "417px", "413px", "410px", "406px", "403px", "399px", "395px", "392px", "388px", "385px", "381px", "378px", "374px", "370px", "367px", "363px", "360px", "356px", "353px", "349px", "345px", "342px", "338px", "335px", "331px", "328px", "324px", "320px", "317px", "313px", "310px", "306px", "302px", "299px", "295px", "292px", "288px", "285px", "281px", "277px", "274px", "270px", "267px", "263px", "260px", "256px", "252px", "249px", "245px", "242px", "238px", "235px", "231px", "227px", "224px", "220px", "217px", "213px", "209px", "206px", "202px", "199px", "195px", "192px", "188px", "184px", "181px", "177px", "174px", "170px", "167px", "163px", "159px", "156px", "152px", "149px", "145px", "142px", "138px", "134px", "131px", "127px", "124px", "120px", "116px", "113px", "109px", "106px", "102px", "99px", "95px", "91px", "88px", "84px", "81px", "77px", "74px", "70px", "66px", "63px", "59px", "56px", "52px", "49px", "45px", "41px", "38px", "34px", "31px", "27px", "23px", "20px", "16px", "13px", "9px", "6px", "2px", "6px", "9px", "13px", "16px", "20px", "23px", "27px", "30px", "34px", "38px", "41px", "45px", "48px", "52px", "55px", "59px", "62px", "66px", "70px", "73px", "77px", "80px", "84px", "87px", "91px", "94px", "98px", "101px", "105px", "109px", "112px", "116px", "119px", "123px", "126px", "130px", "133px", "137px", "141px", "144px", "148px", "151px", "155px", "158px", "162px", "165px", "169px", "173px", "176px", "180px", "183px", "187px", "190px", "194px", "197px", "201px", "205px", "208px", "212px", "215px", "219px", "222px", "226px", "229px", "233px", "237px", "240px", "244px", "247px", "251px", "254px", "258px", "261px", "265px", "269px", "272px", "276px", "279px", "283px", "286px", "290px", "293px", "297px", "300px", "304px", "308px", "311px", "315px", "318px", "322px", "325px", "329px", "332px", "336px", "340px", "343px", "347px", "350px", "354px", "357px", "361px", "364px", "368px", "372px", "375px", "379px", "382px", "386px", "389px", "393px", "396px", "400px", "404px", "407px", "411px", "414px", "418px", "421px", "425px", "428px", "432px", "436px", "439px", "443px", "446px", "450px", "453px", "457px", "460px", "464px", "467px", "471px", "475px", "478px", "482px", "485px", "489px", "492px", "496px", "499px", "503px", "507px", "510px", "514px", "517px", "521px", "524px", "528px", "531px", "535px");
    else
        document.MM_Time[0][1].values[0] = new Array(535,531,528,524,521,517,514,510,506,503,499,496,492,488,485,481,478,474,471,467,463,460,456,453,449,446,442,438,435,431,428,424,421,417,413,410,406,403,399,395,392,388,385,381,378,374,370,367,363,360,356,353,349,345,342,338,335,331,328,324,320,317,313,310,306,302,299,295,292,288,285,281,277,274,270,267,263,260,256,252,249,245,242,238,235,231,227,224,220,217,213,209,206,202,199,195,192,188,184,181,177,174,170,167,163,159,156,152,149,145,142,138,134,131,127,124,120,116,113,109,106,102,99,95,91,88,84,81,77,74,70,66,63,59,56,52,49,45,41,38,34,31,27,23,20,16,13,9,6,2,6,9,13,16,20,23,27,30,34,38,41,45,48,52,55,59,62,66,70,73,77,80,84,87,91,94,98,101,105,109,112,116,119,123,126,130,133,137,141,144,148,151,155,158,162,165,169,173,176,180,183,187,190,194,197,201,205,208,212,215,219,222,226,229,233,237,240,244,247,251,254,258,261,265,269,272,276,279,283,286,290,293,297,300,304,308,311,315,318,322,325,329,332,336,340,343,347,350,354,357,361,364,368,372,375,379,382,386,389,393,396,400,404,407,411,414,418,421,425,428,432,436,439,443,446,450,453,457,460,464,467,471,475,478,482,485,489,492,496,499,503,507,510,514,517,521,524,528,531,535);
    document.MM_Time[0][1].values[0].prop = "left";
    if (ns5)
        document.MM_Time[0][1].values[1] = new Array("150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px", "150px");
    else
        document.MM_Time[0][1].values[1] = new Array(150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150);
    document.MM_Time[0][1].values[1].prop = "top";
    if (!ns4) {
        document.MM_Time[0][1].values[0].prop2 = "style";
        document.MM_Time[0][1].values[1].prop2 = "style";
    }
    document.MM_Time[0].lastFrame = 301;
    document.MM_Time[1] = new Array(0);
    document.MM_Time["Timeline2"] = document.MM_Time[1];
    document.MM_Time[1].MM_Name = "Timeline2";
    document.MM_Time[1].fps = 15;
    document.MM_Time[1].lastFrame = 0;
    for (i=0; i<document.MM_Time.length; i++) {
        document.MM_Time[i].ID = null;
        document.MM_Time[i].curFrame = 0;
        document.MM_Time[i].delay = 1000/document.MM_Time[i].fps;
    }
}
//-->
</script>
<script language="JavaScript">
<!--
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
// -->

function MM_timelinePlay(tmLnName, myID) { //v1.2
  //Copyright 1997 Macromedia, Inc. All rights reserved.
  var i,j,tmLn,props,keyFrm,sprite,numKeyFr,firstKeyFr,propNum,theObj,firstTime=false;
  if (document.MM_Time == null) MM_initTimelines(); //if *very* 1st time
  tmLn = document.MM_Time[tmLnName];
  if (myID == null) { myID = ++tmLn.ID; firstTime=true;}//if new call, incr ID
  if (myID == tmLn.ID) { //if Im newest
    setTimeout('MM_timelinePlay("'+tmLnName+'",'+myID+')',tmLn.delay);
    fNew = ++tmLn.curFrame;
    for (i=0; i<tmLn.length; i++) {
      sprite = tmLn[i];
      if (sprite.charAt(0) == 's') {
        if (sprite.obj) {
          numKeyFr = sprite.keyFrames.length; firstKeyFr = sprite.keyFrames[0];
          if (fNew >= firstKeyFr && fNew <= sprite.keyFrames[numKeyFr-1]) {//in range
            keyFrm=1;
            for (j=0; j<sprite.values.length; j++) {
              props = sprite.values[j]; 
              if (numKeyFr != props.length) {
                if (props.prop2 == null) sprite.obj[props.prop] = props[fNew-firstKeyFr];
                else        sprite.obj[props.prop2][props.prop] = props[fNew-firstKeyFr];
              } else {
                while (keyFrm<numKeyFr && fNew>=sprite.keyFrames[keyFrm]) keyFrm++;
                if (firstTime || fNew==sprite.keyFrames[keyFrm-1]) {
                  if (props.prop2 == null) sprite.obj[props.prop] = props[keyFrm-1];
                  else        sprite.obj[props.prop2][props.prop] = props[keyFrm-1];
        } } } } }
      } else if (sprite.charAt(0)=='b' && fNew == sprite.frame) eval(sprite.value);
      if (fNew > tmLn.lastFrame) tmLn.ID = 0;
  } }
}

function MM_timelineGoto(tmLnName, fNew, numGotos) { //v2.0
  //Copyright 1997 Macromedia, Inc. All rights reserved.
  var i,j,tmLn,props,keyFrm,sprite,numKeyFr,firstKeyFr,lastKeyFr,propNum,theObj;
  if (document.MM_Time == null) MM_initTimelines(); //if *very* 1st time
  tmLn = document.MM_Time[tmLnName];
  if (numGotos != null)
    if (tmLn.gotoCount == null) tmLn.gotoCount = 1;
    else if (tmLn.gotoCount++ >= numGotos) {tmLn.gotoCount=0; return}
  jmpFwd = (fNew > tmLn.curFrame);
  for (i = 0; i < tmLn.length; i++) {
    sprite = (jmpFwd)? tmLn[i] : tmLn[(tmLn.length-1)-i]; //count bkwds if jumping back
    if (sprite.charAt(0) == "s") {
      numKeyFr = sprite.keyFrames.length;
      firstKeyFr = sprite.keyFrames[0];
      lastKeyFr = sprite.keyFrames[numKeyFr - 1];
      if ((jmpFwd && fNew<firstKeyFr) || (!jmpFwd && lastKeyFr<fNew)) continue; //skip if untouchd
      for (keyFrm=1; keyFrm<numKeyFr && fNew>=sprite.keyFrames[keyFrm]; keyFrm++);
      for (j=0; j<sprite.values.length; j++) {
        props = sprite.values[j];
        if (numKeyFr == props.length) propNum = keyFrm-1 //keyframes only
        else propNum = Math.min(Math.max(0,fNew-firstKeyFr),props.length-1); //or keep in legal range
        if (sprite.obj != null) {
          if (props.prop2 == null) sprite.obj[props.prop] = props[propNum];
          else        sprite.obj[props.prop2][props.prop] = props[propNum];
      } }
    } else if (sprite.charAt(0)=='b' && fNew == sprite.frame) eval(sprite.value);
  }
  tmLn.curFrame = fNew;
  if (tmLn.ID == 0) eval('MM_timelinePlay(tmLnName)');
}
//-->
</script>
</head>

<body bgcolor="#FFFFFF" background="images/bg17.jpg" link="#000000" onLoad="MM_timelinePlay('Timeline1')">
<div id="Layer1" style="position:absolute; left:535px; top:150px; width:465px; height:15px; z-index:1"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font face="MS Sans Serif, Microsoft Sans Serif"><b>ปัจจุบันมีสินค้าใน 
  Catalog ทั้งสิ้น&nbsp; 
  <%
			sql = "Select  Count(ItemID)  From Catalog  "
			Set rs=conn.Execute(sql,,CmdText)
								
			response.write  rs(0)
							
			rs.close
		  %>
  รายการ &nbsp;จาก Supplier 
  <%
			sql = "Select SellerID  From Catalog Group by SellerID "
			Set rs = Server.CreateObject("ADODB.Recordset") 
			rs.Open sql,conn,1,1
							
								
			response.write  rs.recordCount
							
			rs.close
		  %>
  ราย</b></font></b></font> </div>
<br>
<br>
<img src="images/Shopping1.gif" width="1003" height="110" usemap="#Map" border="0"> 
<map name="Map">
  <area shape="rect" coords="664,94,714,111" href="home.asp">
  <area shape="rect" coords="749,93,834,110" href="MainMenu.asp">
  <area shape="rect" coords="863,93,929,109" href="SignOut.asp">
</map>
<br>
<form name="form1" method="post" action="ShowCatalog.asp">
  <table width="890" border="0" height="193">
    <tr> 
      <td width="79" height="221"> </td>
      <td height="221"> 
        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="left" height="204">
          <tr> 
            <td height="15">&nbsp;</td>
          </tr>
          <tr> 
            <td height="10"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="4" color="993366"><%=session("BizName")%></font></b></td>
          </tr>
          <tr> 
            <td height="11"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="4" color="993366"><%=session("BizAddress")%></font></b></td>
          </tr>
          <tr> 
            <td height="38"><a href="createpr.asp"><img src="images/cart1.gif" width="28" height="22" border="0"> 
              <font color="#0000CC"><b>View Basket</b></font></a></td>
          </tr>
          <tr> 
            <td height="20"><font face="MS Sans Serif, Microsoft Sans Serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              <%'--------------------------------------  แสดง  สถานะของการสั่งซื้อของ   
 
   '-------------------------------------------  1.จำนวนสินค้าที่อยู่ในตะกร้า						
							sql = "Select  Count(*)  From  Basket  WHERE UserSessionID='" &session.sessionID&"'"
							Set rs = Server.CreateObject("ADODB.Recordset") 
							rs.Open sql,conn
							
							if not rs.EOF then%>
              &nbsp;&nbsp;&nbsp;<img src="images/next.gif" width="11" height="11">จำนวนสินค้าในตระกร้า&nbsp;&nbsp;<%=rs(0)%> รายการ
              <%
							else
				%>
              &nbsp;&nbsp;&nbsp;<img src="images/next.gif" width="11" height="11">จำนวนสินค้าในตระกร้า&nbsp;&nbsp;0 &nbsp;รายการ
              <%
			  end if			
			rs.close
			%>
              </font></td>
          </tr>
          <tr> 
            <td height="20"><font face="MS Sans Serif, Microsoft Sans Serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              <% '------------------------------------------- 	2.จำนวน Supplier ที่ถูกสั่งซื้อใน Basket  ของ Buyer
 
   						sql = "Select  Distinct Catalog.SellerID  From Catalog ,Basket  Where Basket.ItemID=Catalog.ItemID AND Basket.UserSessionID='"&Session.SessionID&"' "
							Set rs = Server.CreateObject("ADODB.Recordset") 
							rs.Open sql,conn,1,1
							
							if not rs.EOF then%>
              &nbsp;&nbsp;&nbsp;<img src="images/next.gif" width="11" height="11">จากผู้ขาย&nbsp;<%=rs.recordCount%>&nbsp;ราย 
              <%
						else
						%>
              &nbsp;&nbsp;&nbsp;<img src="images/next.gif" width="11" height="11">จากผู้ขาย&nbsp;0&nbsp;ราย 
              <%
						 end if			
						rs.close
						%>
              </font></td>
          </tr>
          <tr> 
            <td height="20"><font face="MS Sans Serif, Microsoft Sans Serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              <%
		'------------------------------------------- 	3.ราคาสินค้าที่อยู่ในตระก้า	
		
							sql = "Select  QTY,Catalog.ItemPrice,Catalog.ShipPrice  From Basket,Catalog  Where Basket.ItemID=Catalog.ItemID AND UserSessionID='"&Session.SessionID&"' "

							Set rs = Server.CreateObject("ADODB.Recordset") 
							rs.Open sql,conn,1,1
							
							if not rs.EOF then ' กรณีมีสินค้าในตระกร้า คิดเงินรวมออกมา
										sumPrice=0
										rs.movefirst
										Do while not rs.eof
										sumPrice=sumPrice+(rs(0)*(rs(1)+rs(2)))
										rs.movenext
										Loop%>
              &nbsp;&nbsp;&nbsp;<img src="images/next.gif" width="11" height="11">ราคาสินค้าทั้งหมด 
              <%=sumPrice%> บาท 
              <%else%>
              &nbsp;&nbsp;&nbsp;<img src="images/next.gif" width="11" height="11">ราคาสินค้าทั้งหมด 
              0 บาท&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
              </font></td>
            <%end if%>
          </tr>
        </table>
      </td>
      <td width="364" height="221"> <br>
        <table width="87%" border="1" bordercolor="#FFF7E1" height="70%">
          <tr> 
            <td height="28" width="323"> <font face="MS Sans Serif, Microsoft Sans Serif"><font color="#CC3399"><b><font face="Microsoft Sans Serif" size="3" color="#DF0070">Product 
              Search</font></b></font></font></td>
          </tr>
          <tr> 
            <td height="157" bgcolor="#D5ECFD" bordercolor="#0066cc" nowrap width="323"> 
              <table width="314" border="0" height="100%" bordercolor="#CCCCCC">
                <tr> 
                  <td width="12%" height="33">&nbsp;</td>
                  <td width="30%" height="33"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#00007d">Key 
                    word</font></b></font></td>
                  <td width="58%" height="33"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                    <input style=" FONT-SIZE: 11pt;  WIDTH: 120px; FONT-FAMILY: MS Sans Serif"  name="fKeyWord" 	>
                    </font></td>
                </tr>
                <tr> 
                  <td width="12%">&nbsp;</td>
                  <td width="30%"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="00007d">Category</font></b></font></td>
                  <td width="58%" height="33"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                    <select name="fCategory" style="  FONT-SIZE: 9pt; WIDTH: 120px;  FONT-FAMILY: MS Sans Serif" >
                      <option value="0">ทั้งหมด</option>
                      <%' แสดง List  ของ Category
					  sql = "Select  *  From Category "
					  Set rsCategory=conn.Execute(sql,,CmdText)
					  Do Until  rsCategory.EOF  
                      response.write "<option value='"&rsCategory("CatID")&"'>"&rsCategory("CatName")&"</option>"
                      rsCategory.movenext
					  Loop
					  %>
                    </select>
                    </font></td>
                </tr>
                <tr> 
                  <td width="12%">&nbsp;</td>
                  <td width="30%"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="00007d">Supplier 
                    in</font></b> </font></td>
                  <td width="58%" height="33"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                    <select name="fSupplier" style="  FONT-SIZE: 9pt; WIDTH: 120px;  FONT-FAMILY: MS Sans Serif" >
                      <option value="0">ทั้งหมด</option>
                      <option value="N">ภาคเหนือ</option>
                      <option value="C">ภาคกลาง</option>
                      <option value="S">ภาคใต้</option>
                      <option value="A">ภาคอีสาน</option>
                      <option value="W">ภาคตะวันตก</option>
                      <option value="E">ภาคตะวันออก</option>
                      <%' แสดง List ชื่อจังหวัด
					  		sql = "Select  ProvinceID,ProvinceName  From Province  order by ProvinceName"
							Set rs=conn.Execute(sql,,CmdText)
								Do While not rs.EOF
										response.write  "<option value='"&rs("ProvinceID")&"'>"&rs("ProvinceName")&"</option>"
										rs.moveNext
								Loop
							rs.close
						%>
                    </select>
                    </font></td>
                </tr>
                <tr> 
                  <td width="12%" height="2">&nbsp;</td>
                  <td width="30%" height="2">&nbsp;</td>
                  <td width="58%" height="33"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                    <input style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 11pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 22px"type="Submit" value="search" 
        name="Submit" >
                    </font></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
<table width="891" border="0">
  <tr> 
    <td width="80" height="33">&nbsp;</td>
    <td height="33" width="801"> 
      <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font face="MS Sans Serif, Microsoft Sans Serif"></font></b></font></div>
      <font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#9A2775" size="+1">• 
      ดูสินค้าตามประเภท</font></b></font><font face="MS Sans Serif, Microsoft Sans Serif" color="#9A2775" size="+1"><b> 
      </b></font> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif"><a href="Topten.asp"><b></b></a></font><font face="MS Sans Serif, Microsoft Sans Serif"><a href="topten.asp"><img src="images/topten1.gif" border="0"></a></font><br>
      <hr>
    </td>
  </tr>
</table>
<%  ' ------------------------------------------------- แสดงตารางสำหรับ ให้เลือกเข้าไปดูสินค้าแต่ละประเภทของสินค้า 
rsCategory.movefirst 'rsCategory กำหนดไว้แล้วตอนแสดง ListBox
%>
<table width="870" border="0">
  <tr>
    <td width="88">&nbsp;</td>
    <td width="752"> 
      <table width="100%" border="1" align="center" cellspacing="0" cellpadding="1">
        <tr bgcolor="#6601C8"> 
          <td height="30" width="21%"> 
            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF"><b>ประเภทสินค้า</b></font></div>
          </td>
          <td height="30" width="12%"> 
            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF"><b>จำนวน<br>
              สินค้า</b></font></div>
          </td>
          <td height="30" width="22%" bgcolor="#6601C8"> 
            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF"><b>ประเภทสินค้า</b></font></div>
          </td>
          <td height="30" width="12%"> 
            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF"><b>จำนวน<br>
              สินค้า</b></font></div>
          </td>
          <td height="30" width="21%" bgcolor="#6601C8"> 
            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF"><b>ประเภทสินค้า</b></font></div>
          </td>
          <td height="30" width="12%"> 
            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF"><b>จำนวน<br>
              สินค้า</b></font></div>
          </td>
        </tr>
        <%Do While not  rsCategory.EOF  %>
        <tr> 
          <td height="26" width="21%"><font face="MS Sans Serif, Microsoft Sans Serif" color="#000000"><b>&nbsp;&nbsp;•&nbsp;</b><a href="ShowCatalog.asp?CatID=<%=rsCategory("CatID")%>"> 
            <font face="MS Sans Serif, Microsoft Sans Serif" color="#000000"><%=rsCategory("CatName")%></font></a></font></td>
          <td width="12%" height="26"> 
            <div align="center"> 
              <%
		  	sql = "Select  Count(*)  From Catalog Where CatID="&rsCategory("CatID")
							Set rs=conn.Execute(sql,,CmdText)
								
										response.write  rs(0)
							
							rs.close
		  rsCategory.movenext
		  %>
            </div>
          </td>
          <td height="26" width="22%"><font face="MS Sans Serif, Microsoft Sans Serif" color="#000000"><b>&nbsp;&nbsp;•&nbsp;</b><a href="ShowCatalog.asp?CatID=<%=rsCategory("CatID")%>"> 
            <font face="MS Sans Serif, Microsoft Sans Serif" color="#000000"><%=rsCategory("CatName")%></font></a></font></td>
          <td width="12%" height="26"> 
            <div align="center"><%
		  	sql = "Select  Count(*)  From Catalog Where CatID="&rsCategory("CatID")
							Set rs=conn.Execute(sql,,CmdText)
								
										response.write  rs(0)
							
							rs.close
							  rsCategory.movenext
		  %>
           </div>
          </td>
          <td width="21%" height="26"><font face="MS Sans Serif, Microsoft Sans Serif" color="#000000"><b>&nbsp;&nbsp;•&nbsp;</b><a href="ShowCatalog.asp?CatID=<%=rsCategory("CatID")%>"> 
            <font face="MS Sans Serif, Microsoft Sans Serif" color="#000000"><%=rsCategory("CatName")%></font></a></font></td>
          <td width="12%" height="26"> 
            <div align="center"> 
              <%sql = "Select  Count(*)  From Catalog Where CatID="&rsCategory("CatID")
							Set rs=conn.Execute(sql,,CmdText)
								
										response.write  rs(0)
							
							rs.close
							  
							  %>
            </div>
          </td>
        </tr>
        <%
		rsCategory.moveNext
		Loop%>
      </table>
    </td>
    <td width="16">&nbsp;</td>
  </tr>
</table>

<br>
<table width="890" border="0">
  <tr> 
    <td width="80">&nbsp;</td>
    <td width="757"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#9A2775" size="+1">• 
      ดูสินค้าตาม Supplier</font></b></font><br>
      <hr>
    </td>
  </tr>
</table>

<table width="850" border="0">
  <tr> 
    <td width="87">&nbsp;</td>
    <td width="748"> 
      <table width="100%" border="1" cellpadding="1" cellspacing="0">
        <tr bgcolor="#6600CC"> 
          <td width="100" height="26"> 
            <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">ภาค</font></b></div>
          </td>
          <td height="30" width="479"> 
            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#FFFFFF">จังหวัด</font></b></font></div>
          </td>
          <td width="79" height="26"> 
            <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF"> 
              จำนวน Supplier</font></b></div>
          </td>
          <td width="72" height="26"> 
            <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">จำนวนสินค้า</font></b></div>
          </td>
        </tr>
        <tr> 
          <td width="100" height="20"><font face="MS Sans Serif, Microsoft Sans Serif">&nbsp;&nbsp;&nbsp;<a href="ShowCatalog.asp?Province=N"><font color="#000000">ภาคเหนือ</font></a> 
            </font></td>
          <td height="20" width="479"> <font face="MS Sans Serif, Microsoft Sans Serif"> 
            <%
	sql = "Select  *  From Province Where ProvinceRegion='N' "
	Set rsNort=conn.Execute(sql,,CmdText)
	

	  			Do Until rsNort.EOF 
					  		response.write  "  •<a href='ShowCatalog.asp?Province="&rsNort("ProvinceID")&"'><font color='#000000'>"&rsNort("ProvinceName")&" </font></a>&nbsp;"
					  		rsNort.movenext
			  Loop
			
	rsNort.close
	%>
            </font></td>
          <td width="79" height="20"> 
            <div align="center"> 
              <%
			sql = "Select SellerID  From Catalog,Member,Province Where SellerID=ID AND Member.ProvinceID=Province.ProvinceID AND ProvinceRegion = 'N' Group by SellerID "
			Set rs = Server.CreateObject("ADODB.Recordset") 
			rs.Open sql,conn,1,1
			response.write  rs.recordCount
			rs.close
		  %>
            </div>
          </td>
          <td width="72" height="20"> 
            <div align="center">
              <%
			sql = "Select  Count(*)  From Catalog,Member,Province Where SellerID=ID AND ProvinceRegion='N' AND Member.ProvinceID=Province.ProvinceID "
			Set rs=conn.Execute(sql,,CmdText)
								
			response.write  rs(0)
							
			rs.close
		  %>
            </div>
          </td>
        </tr>
        <tr> 
          <td width="100" height="15"><font face="MS Sans Serif, Microsoft Sans Serif">&nbsp;&nbsp;&nbsp;<a href="ShowCatalog.asp?Province=A"><font color="#000000">ภาคอีสาน 
            </font> </a> </font></td>
          <td height="15" width="479"> <font face="MS Sans Serif, Microsoft Sans Serif"> 
            <%
	sql = "Select  *  From Province Where ProvinceRegion='A' "
	Set rsNortEast=conn.Execute(sql,,CmdText)
	

	  			Do Until rsNortEast.EOF 
					  		response.write  "  •<a href='ShowCatalog.asp?Province="&rsNortEast("ProvinceID")&"'><font color='#000000'>"&rsNortEast("ProvinceName")&" </a>&nbsp;"
					  		rsNortEast.movenext
			  Loop
			
	rsNortEast.close
	%>
            </font></td>
          <td width="79" height="15"> 
            <div align="center"> 
              <%
			sql = "Select SellerID  From Catalog,Member,Province Where SellerID=ID AND Member.ProvinceID=Province.ProvinceID AND ProvinceRegion = 'A' Group by SellerID "
			Set rs = Server.CreateObject("ADODB.Recordset") 
			rs.Open sql,conn,1,1
			response.write  rs.recordCount
			rs.close
		  %>
            </div>
          </td>
          <td width="72" height="15"> 
            <div align="center">
              <%
			sql = "Select  Count(*)  From Catalog,Member,Province Where SellerID=ID AND ProvinceRegion='A' AND Member.ProvinceID=Province.ProvinceID "
			Set rs=conn.Execute(sql,,CmdText)
								
			response.write  rs(0)
							
			rs.close
		  %>
            </div>
          </td>
        </tr>
        <tr> 
          <td width="100" height="8"><font face="MS Sans Serif, Microsoft Sans Serif">&nbsp;&nbsp;&nbsp;<a href="ShowCatalog.asp?Province=E"><font color="#000000">ภาคตะวันออก</font></a></font></td>
          <td height="8" width="479"> <font face="MS Sans Serif, Microsoft Sans Serif"> 
            <%
	sql = "Select  *  From Province Where ProvinceRegion='E' "
	Set rsEast=conn.Execute(sql,,CmdText)
	

	  			Do Until rsEast.EOF 
					  		response.write  "  •<a href='ShowCatalog.asp?Province="&rsEast("ProvinceID")&"'><font color='#000000'>"&rsEast("ProvinceName")&" </a>&nbsp;"
					  		rsEast.movenext
			  Loop
			
	rsEast.close
	%>
            </font></td>
          <td width="79" height="8"> 
            <div align="center"> 
              <%
			sql = "Select SellerID  From Catalog,Member,Province Where SellerID=ID AND Member.ProvinceID=Province.ProvinceID AND ProvinceRegion = 'E' Group by SellerID "
			Set rs = Server.CreateObject("ADODB.Recordset") 
			rs.Open sql,conn,1,1
			response.write  rs.recordCount
			rs.close
		  %>
            </div>
          </td>
          <td width="72" height="8"> 
            <div align="center">
              <%
			sql = "Select  Count(*)  From Catalog,Member,Province Where SellerID=ID AND ProvinceRegion='E' AND Member.ProvinceID=Province.ProvinceID "
			Set rs=conn.Execute(sql,,CmdText)
								
			response.write  rs(0)
							
			rs.close
		  %>
            </div>
          </td>
        </tr>
        <tr> 
          <td width="100" height="2"><font face="MS Sans Serif, Microsoft Sans Serif">&nbsp;&nbsp;&nbsp;<a href="ShowCatalog.asp?Province=W"><font color="#000000">ภาคตะวันตก</font></a></font></td>
          <td height="2" width="479"> <font face="MS Sans Serif, Microsoft Sans Serif"> 
            <%
	sql = "Select  *  From Province Where ProvinceRegion='W' "
	Set rsWest=conn.Execute(sql,,CmdText)
	

	  			Do Until rsWest.EOF 
					  		response.write  "  •<a href='ShowCatalog.asp?Province="&rsWest("ProvinceID")&"'><font color='#000000'>"&rsWest("ProvinceName")&" </a>&nbsp;"
					  		rsWest.movenext
			  Loop
			
	rsWest.close
	%>
            </font></td>
          <td width="79" height="2"> 
            <div align="center"> 
              <%
			sql = "Select SellerID  From Catalog,Member,Province Where SellerID=ID AND Member.ProvinceID=Province.ProvinceID AND ProvinceRegion = 'W' Group by SellerID "
			Set rs = Server.CreateObject("ADODB.Recordset") 
			rs.Open sql,conn,1,1
			response.write  rs.recordCount
			rs.close
		  %>
            </div>
          </td>
          <td width="72" height="2"> 
            <div align="center">
              <%
			sql = "Select  Count(*)  From Catalog,Member,Province Where SellerID=ID AND ProvinceRegion='W' AND Member.ProvinceID=Province.ProvinceID "
			Set rs=conn.Execute(sql,,CmdText)
								
			response.write  rs(0)
							
			rs.close
		  %>
            </div>
          </td>
        </tr>
        <tr> 
          <td width="100" height="20"><font face="MS Sans Serif, Microsoft Sans Serif">&nbsp;&nbsp;&nbsp;<a href="ShowCatalog.asp?Province=C"><font color="#000000">ภาคกลาง</font></a></font></td>
          <td height="20" width="479"> <font face="MS Sans Serif, Microsoft Sans Serif"> 
            <%
	sql = "Select  *  From Province Where ProvinceRegion='C' "
	Set rsCenter=conn.Execute(sql,,CmdText)
	

	  			Do Until rsCenter.EOF 
					  		response.write  "  •<a href='ShowCatalog.asp?Province="&rsCenter("ProvinceID")&"'><font color='#000000'>"&rsCenter("ProvinceName")&" </a>&nbsp;"
					  		rsCenter.movenext
			  Loop
			
	rsCenter.close
	%>
            </font></td>
          <td width="79" height="20"> 
            <div align="center">
              <%
			sql = "Select SellerID  From Catalog,Member,Province Where SellerID=ID AND Member.ProvinceID=Province.ProvinceID AND ProvinceRegion = 'C' Group by SellerID "
			Set rs = Server.CreateObject("ADODB.Recordset") 
			rs.Open sql,conn,1,1
			response.write  rs.recordCount
			rs.close
		  %>
            </div>
          </td>
          <td width="72" height="20"> 
            <div align="center">
              <%
			sql = "Select  Count(*)  From Catalog,Member,Province Where SellerID=ID AND ProvinceRegion='C' AND Member.ProvinceID=Province.ProvinceID "
			Set rs=conn.Execute(sql,,CmdText)
								
			response.write  rs(0)
							
			rs.close
		  %>
            </div>
          </td>
        </tr>
        <tr> 
          <td width="100" height="16"><font face="MS Sans Serif, Microsoft Sans Serif">&nbsp;&nbsp;&nbsp;<a href="ShowCatalog.asp?Province=S"><font color="#000000">ภาคใต้</font></a></font></td>
          <td height="16" width="479"> <font face="MS Sans Serif, Microsoft Sans Serif"> 
            <%
	sql = "Select  *  From Province Where ProvinceRegion='S' "
	Set rsSouth=conn.Execute(sql,,CmdText)
	

	  			Do Until rsSouth.EOF 
					  		response.write  "  •<a href='ShowCatalog.asp?Province="&rsSouth("ProvinceID")&"'><font color='#000000'>"&rsSouth("ProvinceName")&" </a>&nbsp;"
					  		rsSouth.movenext
			  Loop
			
	rsSouth.close
	%>
            </font></td>
          <td width="79" height="16"> 
            <div align="center">       
			<%
			sql = "Select SellerID  From Catalog,Member,Province Where SellerID=ID AND Member.ProvinceID=Province.ProvinceID AND ProvinceRegion = 'S' Group by SellerID "
			Set rs = Server.CreateObject("ADODB.Recordset") 
			rs.Open sql,conn,1,1
			response.write  rs.recordCount
			rs.close
		  %>
		  </div>
          </td>
          <td width="72" height="16"> 
            <div align="center">
              <%
			sql = "Select  Count(*)  From Catalog,Member,Province Where SellerID=ID AND ProvinceRegion='S' AND Member.ProvinceID=Province.ProvinceID "
			Set rs=conn.Execute(sql,,CmdText)
								
			response.write  rs(0)
							
			rs.close
		  %>
            </div>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<br>
<hr>
<br>
<p>&nbsp; </p>
</body>
</html>
<%
rsCategory.close
conn.close
%>
