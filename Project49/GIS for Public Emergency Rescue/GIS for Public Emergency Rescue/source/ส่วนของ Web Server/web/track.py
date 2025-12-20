#!/usr/bin/env python
# -*- coding: cp874 -*-

import sys,time
from Numeric import *
from mod_python import apache
import pg

def htmlTracking( req, serv_id ): #, serv_id ) :
    
    db = pg.DB( dbname='virtualbkk_db', host='localhost', user='ictuser', passwd='mflv[' )    
    
    carForServ = db.query("SELECT camera.camera_ip,serv.state,serv.x_pos,serv.y_pos,car.type_id FROM car,serv,camera WHERE serv_id='"+serv_id+"' and serv.car_id=car.car_id and car.camera_id=camera.camera_id;")
    lstCarForServ = carForServ.getresult()
    
    if len(lstCarForServ) >= 1:
        camera_ip = lstCarForServ[0][0]
	serv_state = lstCarForServ[0][1]
        rrx = lstCarForServ[0][2]
        rry = lstCarForServ[0][3]
        rrtype = lstCarForServ[0][4]
        if rrtype == '00000001':
            txttype = "รถพยาบาล"
        elif rrtype == '00000002':
            txttype = "รถตำรวจ"
        elif rrtype == '00000003':
            txttype = "รถดับเพลิง"
        
        if serv_state == '11':
            itag = """<html>
	<head>
		<title> emergency rescue </title>
		<script type="text/javascript">
			function bhout()
			{
				document.getElementById("homer").setAttribute("src","./../picture/ibutton/nihome.png");
			}
			function bhover()
			{
				document.getElementById("homer").setAttribute("src","./../picture/ibutton/oihome.png");
			}
			function bcout()
			{
				document.getElementById("callcenter").setAttribute("src","./../picture/ibutton/nicallcenter.png");
			}
			function bcover()
			{
				document.getElementById("callcenter").setAttribute("src","./../picture/ibutton/oicallcenter.png");
			}
			function btout()
			{
				document.getElementById("tracking").setAttribute("src","./../picture/ibutton/nitracking.png");
			}
			function btover()
			{
				document.getElementById("tracking").setAttribute("src","./../picture/ibutton/oitracking.png");
			}
			function baout()
			{
				document.getElementById("aboutus").setAttribute("src","./../picture/ibutton/niabout.png");
			}
			function baover()
			{
				document.getElementById("aboutus").setAttribute("src","./../picture/ibutton/oiabout.png");
			}
			function bheout()
			{
				document.getElementById("help").setAttribute("src","./../picture/ibutton/nihelp.png");
			}
			function bheover()
			{
				document.getElementById("help").setAttribute("src","./../picture/ibutton/oihelp.png");
			}

			function onclicktracking()
			{
				document.getElementById("pagebody").innerHTML = '<table width="560" border="0" cellpadding="0" cellspacing="0"><tr><td><center>กรุณากรอก รหัสการเรียกขอความช่วยเหลือ</center></td></tr><tr><td><center>									<form method="POST" action="http://www.natur.in.th/track.py/htmlTracking?">										<input type="text" name="serv_id"/>										<input type="submit" name="submit" value="Submit"/>									</form>									</center>								</td>							</tr>					</table>';
			}
			function onclickhome()
			{
				document.getElementById("pagebody").innerHTML = '<table width="560" border="0" cellpadding="0" cellspacing="0"><tr>								<td><center><h2 color="#8f8f8f">ยินดีต้อนรับ เข้าสู่เว็บไซต์<br/>							"ระบบเรียกรถฉุกเฉิน"</h2>ท่านสามารถเรียก รถพยาบาล, รถดับเพลิง และเรียกตำรวจ   ผ่านทางโทรศัพท์เคลื่อนที่ ที่รองรับระบบ A-GPS  และสามารถติดตามการเดินทางได้ผ่านทางเว็บไซต์นี้</center>								</td>							</tr>													</table>';
			}
			function onclickhelp()
			{
				document.getElementById("pagebody").innerHTML = '<table width="560" border="0" cellpadding="0" cellspacing="0"><tr>								<td><center><h2 color="#8f8f8f">ยินดีต้อนรับ เข้าสู่เว็บไซต์<br/>							"ระบบเรียกรถฉุกเฉิน"</h2>ท่านสามารถเรียก รถพยาบาล, รถดับเพลิง และเรียกตำรวจ   ผ่านทางโทรศัพท์เคลื่อนที่ ที่รองรับระบบ A-GPS  และสามารถติดตามการเดินทางได้ผ่านทางเว็บไซต์นี้</center>								</td>							</tr>													</table>';
			}
			function onclickabout()
			{
				document.getElementById("pagebody").innerHTML = '<table width="560" border="0" cellpadding="0" cellspacing="0">	<tr>								<td><center><h2 color="#8f8f8f">ยินดีต้อนรับ เข้าสู่เว็บไซต์<br/>							"ระบบเรียกรถฉุกเฉิน"</h2>ท่านสามารถเรียก รถพยาบาล, รถดับเพลิง และเรียกตำรวจ   ผ่านทางโทรศัพท์เคลื่อนที่ ที่รองรับระบบ A-GPS  และสามารถติดตามการเดินทางได้ผ่านทางเว็บไซต์นี้</center>								</td>							</tr>													</table>';
			}

		</script>
	</head>
	<body style="margin-top: 0cm; margin-left: 0cm">
		<table width="990px" height="580px" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td style="width: 990; height: 100;" colspan="3" valign="top">					
					<img src="./../picture/main/elogosx.png" width="990px" height="100px" alt="ICT Lab of Computer Engineering Department (KMITL)"/>
				</td>
				
			</tr>
			<tr style="height: 38">
				<td valign="top" style="width: 125; height: 480;">
			
			<table>
				<tr>
					<td>
					<table width="200px" height="200px" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td align="right">
								<!--<a href="./index.html">-->
									<img id="homer" src="./../picture/ibutton/nihome.png" onmousemove="bhover()" onmouseout="bhout()" onclick="onclickhome()" border="0"/>
								<!--</a>-->
							</td>
						</tr>
						<tr>
							<td align="right">
								<a href="./../callcenter.html?">
									<img id="callcenter" src="./../picture/ibutton/nicallcenter.png" onmousemove="bcover()" onmouseout="bcout()" border="0"/>
								</a>
							</td>
						</tr>
						<tr>
							<td align="right">
								<!--<a href="./trackinglogin.html?">-->
									<img id="tracking" src="./../picture/ibutton/nitracking.png" onmousemove="btover()" onmouseout="btout()" onclick="onclicktracking()" border="0"/>
								<!--</a>-->
							</td>
						</tr>
						<tr>
							<td align="right">
								<!-- <a href="./index.html"> -->
									<img id="aboutus" src="./../picture/ibutton/niabout.png" onmouseover="baover()" onmouseout="baout()" onclick="onclickabout()" border="0"/>
								<!--</a>-->
							</td>
						</tr>
						<tr>
							<td align="right">
								<!--<a href="./index.html">-->
									<img id="help" src="./../picture/ibutton/nihelp.png" onmouseover="bheover()" onmouseout="bheout()" onclick="onclickhelp()" border="0"/>
								<!--</a>-->
							</td>
						</tr>
					</table>
					</td>
					<td id="pagebody">
						<table width="560" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									<center>ให้ความช่วยเหลือเรียบร้อยแล้ว</center>
								</td>
							</tr>
																					
						</table>
					</td>
					</tr>
					<tr>
						<td>
						</td>
						<td>
							<center>
								<hr/>
							</center>
						</td>
					</tr>
					<tr>
						<td>
						</td>
						<td>
							<center>
								<font size="1">
								<br/>
								 " ห้องปฎิบัติการวิจัยการสื่อสารและการคมนาคมขนส่งชาญฉลาด "<br/>
								 ภาควิชาวิศวกรรมคอมพิวเตอร์<br/>
								 คณะวิศวกรรมศาสตร์<br/>
								 สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง<br/>
								 </font>
							</center>
						</td>
					</tr>
					</table>
				</td>
			</tr>
		</table>

	</body>
</html>
"""
        if serv_state == '00':            
            itag = """<html>
	<head>
		<title> emergency rescue </title>
		<script type="text/javascript">
            var eservice = '"""+serv_id+"""';
            var rrrx = """+str(rrx)+""";
            var rrry = """+str(rry)+""";
            var texttype = '"""+txttype+"""';
            var rrrtype = '"""+rrtype+"""';
            var titles1 = ' รหัสการเรียกขอความช่วยเหลือ : """+serv_id+"""';
            var titles2 = ' ประเภทรถ : """+txttype+"""';
        </script>
		<script type="text/javascript" src="./../script/loaddatatrack.js"></script>
		<script type="text/javascript" src="./../script/bkkbtntrack.js"></script>
		<script type="text/javascript" src="./../script/searchtrack.js"></script>		

		<link href="./../css/mapstyle.css" type="text/css" rel="stylesheet"/>
		
	</head>
	<body onload="init()" style="margin-top: 0cm; margin-left: 0cm">
		<table width="990px" height="580px" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td style="width: 990; height: 100;" colspan="3" valign="top">					
					<img src="./../picture/main/elogo.png" width="990px" height="100px" alt="ICT Lab of Computer Engineering Department (KMITL)"/>
				</td>				
			</tr>
			<tr style="height: 38">
				<td valign="top" style="width: 125; height: 480;">
					<table width="125px" height="480px" border="1" cellspacing="0" cellpadding="0">
						</tr>
							<td style="width: 125; height: 38;" valign="top">
								<img id="waiting" src="./../picture/gui/virtual.gif" alt="No comment."/>	
							</td>							
						</tr>
						<tr>
							<td style="width: 125; height: 322;" colspan="0" valign="top">
					<table style="width: 125; height: 322;" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td style="width: 125; height: 20;" bgcolor="#091CAD" colspan="4" align="center" valign="middle">
								<font size="1" color="white" style="font-weight: bold; font-family: MS Sans Serif;">
									ชั้นข้อมูลแผนที่
								</font>
							</td>
						</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 18;" valign="top">
		<img id="mainroad" onclick="mainRoad()" src="./../picture/gui/blueun.gif" value="unchecked" onmousemove="overToggle('mainroad')" onmouseout="outToggle('mainroad')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1">  ถนนสายหลัก</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="subroad" onclick="mainroad1234()" src="./../picture/gui/blueun.gif" value="unchecked" onmousemove="overToggle('subroad')" onmouseout="outToggle('subroad')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1">ถนนสายรอง</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="river1" onclick="river1()" src="./../picture/gui/blueun.gif" value="unchecked" onmousemove="overToggle('river1')" onmouseout="outToggle('river1')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1"> คลอง</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="chhospital" src="./../picture/gui/blueun.gif" value="unchecked" onclick="hospital()" onmousemove="overToggle('chhospital')" onmouseout="outToggle('chhospital')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1"> โรงพยาบาล</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="chschool" src="./../picture/gui/blueun.gif"  value="unchecked" onclick="school()" onmousemove="overToggle('chschool')" onmouseout="outToggle('chschool')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1"> โรงเรียน</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="chstpolice" src="./../picture/gui/blueun.gif" value="unchecked" onclick="police()" onmousemove="overToggle('chstpolice')" onmouseout="outToggle('chstpolice')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1"> สถานีตำรวจ</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="chsthospital" src="./../picture/gui/blueun.gif" value="unchecked" onclick="stHospital()" onmousemove="overToggle('chsthospital')" onmouseout="outToggle('chsthospital')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1"> สถานีอนามัย</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="chhouse" src="./../picture/gui/blueun.gif" value="unchecked" onclick="lhouse()" onmousemove="overToggle('chhouse')" onmouseout="outToggle('chhouse')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1"> บ้าน</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="chghouse" src="./../picture/gui/blueun.gif" value="unchecked" onclick="ghouse()" onmousemove="overToggle('chghouse')" onmouseout="outToggle('chghouse')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1"> หมู่บ้าน</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="complex" src="./../picture/gui/blueun.gif" value="unchecked" onclick="complex()" onmousemove="overToggle('complex')" onmouseout="outToggle('complex')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1">กรม</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="market" src="./../picture/gui/blueun.gif" value="unchecked" onclick="market()" onmousemove="overToggle('market')" onmouseout="outToggle('market')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1"> ตลาด</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="train" src="./../picture/gui/blueun.gif" value="unchecked" onclick="train()" onmousemove="overToggle('train')" onmouseout="outToggle('train')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1"> สถานีรถไฟ</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="univer" src="./../picture/gui/blueun.gif" value="unchecked" onclick="univer()" onmousemove="overToggle('univer')" onmouseout="outToggle('univer')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1"> มหาวิทยาลัย</font>
	</td>
</tr>
	</table>
				</td>			
				</tr>
				<tr>
				<td style="width: 125; height: 100;" colspan="0" valign="top" align="left">
					<table style="width: 125; height: 60;" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td style="width: 125; height: 20;" bgcolor="#091CAD" valign="middle" align="center">
								<font size="1" color="white" style="font-weight: bold; font-family: MS Sans Serif;">
									บริการอื่น
								</font>								
							</td>
						</tr>
						<tr>
							<td style="width: 125; height: 20;" valign="top">
								 - 
								<a href="http://www.intelligenttaxi.com" target="target_bank">
									<font size="1">Intelligent Taxi.</font>
								</a>
							</td>
						</tr>
						<tr>
							<td style="width: 125; height: 20;" valign="top">
								 - 
								<a href="http://www.natur.in.th" target="target_bank">
									<font size="1">Emergency Rescue.</font>
								</a>
							</td>
						</tr>
						<tr>
							<td style="width: 125; height: 1;" valign="top">
								<iframe name="Temp" frameborder="0" src="" width="125" scrolling="no" height="1"> 
								</iframe>
							</td>
						</tr>
					</table>
				</td>
			</tr>
							
					</table>
				</td>
				
				<td align="left" valign="top" style="width: 665; height: 480;" border="1">
					<embed id="map" width="665" height="480" align="left" type="image/svg+xml" name="map"  PLUGINSPAGE="http://www.adobe.com/svg/viewer/install/" src="./../mapstracking.svg"/>
				</td>
				
				<td valign="top" style="width: 200; height: 480;">
					<table width="200px" height="144px" border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td style="width: 200; height: 144;" colspan="2" valign="top" align="center"> 
								<iframe id="dis_video" name="video" frameborder="0" src='http://www.natur.in.th/xml/serv.py/camera?camera_ip="""+camera_ip+"""' width="200" scrolling="no" height="144"> 
								</iframe>
							</td>
						</tr>
						<tr>
							<td style="width: 200; height: 30;" valign="middle" align="left"> 
								<table width="200px" height="30" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											<a href='http://"""+camera_ip+"""/axis-cgi/com/ptz.cgi?camera=1&move=up' target="Temp">
												<img src="./../picture/pzt/pzt_up.png" alt="Move UP" border="0"/>
											</a>											
										</td>
										<td>
											<a href='http://"""+camera_ip+"""/axis-cgi/com/ptz.cgi?camera=1&move=down' target="Temp">
												<img src="./../picture/pzt/pzt_down.png" alt="Move Down" border="0"/>
											</a>
										</td>
										<td>
											<a href='http://"""+camera_ip+"""/axis-cgi/com/ptz.cgi?camera=1&move=left' target="Temp">
												<img src="./../picture/pzt/pzt_left.png" alt="Move Left" border="0"/>
											</a>
										</td>
										<td>
											<a href='http://"""+camera_ip+"""/axis-cgi/com/ptz.cgi?camera=1&move=right' target="Temp">
												<img src="./../picture/pzt/pzt_right.png" alt="Move Right" border="0"/>
											</a>
										</td>
										<td>
											<a href='http://"""+camera_ip+"""/axis-cgi/com/ptz.cgi?camera=1&rzoom=1000' target="Temp">
												<img src="./../picture/pzt/pzt_zoomin.png" alt="Zoom In" border="0"/>
											</a>
										</td>
										<td>
											<a href='http://"""+camera_ip+"""/axis-cgi/com/ptz.cgi?camera=1&rzoom=-1000' target="Temp">
												<img src="./../picture/pzt/pzt_zoomout.png" alt="Zoom Out" border="0"/>
											</a>
										</td>
										<td>
											<a href='http://"""+camera_ip+"""/axis-cgi/com/ptz.cgi?camera=1&zoom=0' target="Temp">
												<img src="./../picture/pzt/pzt_tofit.png" alt="Zoom to Fit" border="0"/>
											</a>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>	

					<table width="200px" height="280px" border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td style="width: 200; height: 20;" colspan="2" valign="top"> 
								<img id="textsearch" src="./../picture/gui/search.gif" height="20"/>
							</td>
						</tr>
						<tr>
							<td style="width: 170; height: 30;" valign="middle" align="left"> 
								<input id="txtsearch" type='text'/>
							</td>
							<td style="width: 30; height: 30;" valign="top"> 
								<img id="gosearch" onmousemove="overSearch('gosearch')" onmouseout="outSearch('gosearch')" onclick="imapsearch()" src="./../../../picture/gui/bluego.png" alt="เฉพาะชื่อสถานที่"/>
							</td>
						</tr>
						<tr>
							<td id="result1" valign="top" style="width: 200; height: 230;">
							</td>
						</tr>
					</table>							
				</td>
				</tr>
		</table>

	</body>
</html>"""

    else :
	
        itag = """<html>
	<head>
		<title> emergency rescue </title>
		<script type="text/javascript">
			function bhout()
			{
				document.getElementById("homer").setAttribute("src","./../picture/ibutton/nihome.png");
			}
			function bhover()
			{
				document.getElementById("homer").setAttribute("src","./../picture/ibutton/oihome.png");
			}
			function bcout()
			{
				document.getElementById("callcenter").setAttribute("src","./../picture/ibutton/nicallcenter.png");
			}
			function bcover()
			{
				document.getElementById("callcenter").setAttribute("src","./../picture/ibutton/oicallcenter.png");
			}
			function btout()
			{
				document.getElementById("tracking").setAttribute("src","./../picture/ibutton/nitracking.png");
			}
			function btover()
			{
				document.getElementById("tracking").setAttribute("src","./../picture/ibutton/oitracking.png");
			}
			function baout()
			{
				document.getElementById("aboutus").setAttribute("src","./../picture/ibutton/niabout.png");
			}
			function baover()
			{
				document.getElementById("aboutus").setAttribute("src","./../picture/ibutton/oiabout.png");
			}
			function bheout()
			{
				document.getElementById("help").setAttribute("src","./../picture/ibutton/nihelp.png");
			}
			function bheover()
			{
				document.getElementById("help").setAttribute("src","./../picture/ibutton/oihelp.png");
			}

			function onclicktracking()
			{
				document.getElementById("pagebody").innerHTML = '<table width="560" border="0" cellpadding="0" cellspacing="0"><tr><td><center>กรุณากรอก รหัสการเรียกขอความช่วยเหลือ</center></td></tr><tr><td><center>									<form method="POST" action="http://www.natur.in.th/track.py/htmlTracking?">										<input type="text" name="serv_id"/>										<input type="submit" name="submit" value="Submit"/>									</form>									</center>								</td>							</tr>					</table>';
			}
			function onclickhome()
			{
				document.getElementById("pagebody").innerHTML = '<table width="560" border="0" cellpadding="0" cellspacing="0"><tr>								<td><center><h2 color="#8f8f8f">ยินดีต้อนรับ เข้าสู่เว็บไซต์<br/>							"ระบบเรียกรถฉุกเฉิน"</h2>ท่านสามารถเรียก รถพยาบาล, รถดับเพลิง และเรียกตำรวจ   ผ่านทางโทรศัพท์เคลื่อนที่ ที่รองรับระบบ A-GPS  และสามารถติดตามการเดินทางได้ผ่านทางเว็บไซต์นี้</center>								</td>							</tr>													</table>';
			}
			function onclickhelp()
			{
				document.getElementById("pagebody").innerHTML = '<table width="560" border="0" cellpadding="0" cellspacing="0"><tr>								<td><center><h2 color="#8f8f8f">ยินดีต้อนรับ เข้าสู่เว็บไซต์<br/>							"ระบบเรียกรถฉุกเฉิน"</h2>ท่านสามารถเรียก รถพยาบาล, รถดับเพลิง และเรียกตำรวจ   ผ่านทางโทรศัพท์เคลื่อนที่ ที่รองรับระบบ A-GPS  และสามารถติดตามการเดินทางได้ผ่านทางเว็บไซต์นี้</center>								</td>							</tr>													</table>';
			}
			function onclickabout()
			{
				document.getElementById("pagebody").innerHTML = '<table width="560" border="0" cellpadding="0" cellspacing="0">	<tr>								<td><center><h2 color="#8f8f8f">ยินดีต้อนรับ เข้าสู่เว็บไซต์<br/>							"ระบบเรียกรถฉุกเฉิน"</h2>ท่านสามารถเรียก รถพยาบาล, รถดับเพลิง และเรียกตำรวจ   ผ่านทางโทรศัพท์เคลื่อนที่ ที่รองรับระบบ A-GPS  และสามารถติดตามการเดินทางได้ผ่านทางเว็บไซต์นี้</center>								</td>							</tr>													</table>';
			}

		</script>
	</head>
	<body style="margin-top: 0cm; margin-left: 0cm">
		<table width="990px" height="580px" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td style="width: 990; height: 100;" colspan="3" valign="top">					
					<img src="./../picture/main/elogosx.png" width="990px" height="100px" alt="ICT Lab of Computer Engineering Department (KMITL)"/>
				</td>
				
			</tr>
			<tr style="height: 38">
				<td valign="top" style="width: 125; height: 480;">
			
			<table>
				<tr>
					<td>
					<table width="200px" height="200px" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td align="right">
								<!--<a href="./index.html">-->
									<img id="homer" src="./../picture/ibutton/nihome.png" onmousemove="bhover()" onmouseout="bhout()" onclick="onclickhome()" border="0"/>
								<!--</a>-->
							</td>
						</tr>
						<tr>
							<td align="right">
								<a href="./../callcenter.html?">
									<img id="callcenter" src="./../picture/ibutton/nicallcenter.png" onmousemove="bcover()" onmouseout="bcout()" border="0"/>
								</a>
							</td>
						</tr>
						<tr>
							<td align="right">
								<!--<a href="./trackinglogin.html?">-->
									<img id="tracking" src="./../picture/ibutton/nitracking.png" onmousemove="btover()" onmouseout="btout()" onclick="onclicktracking()" border="0"/>
								<!--</a>-->
							</td>
						</tr>
						<tr>
							<td align="right">
								<!-- <a href="./index.html"> -->
									<img id="aboutus" src="./../picture/ibutton/niabout.png" onmouseover="baover()" onmouseout="baout()" onclick="onclickabout()" border="0"/>
								<!--</a>-->
							</td>
						</tr>
						<tr>
							<td align="right">
								<!--<a href="./index.html">-->
									<img id="help" src="./../picture/ibutton/nihelp.png" onmouseover="bheover()" onmouseout="bheout()" onclick="onclickhelp()" border="0"/>
								<!--</a>-->
							</td>
						</tr>
					</table>
					</td>
					<td id="pagebody">
						<table width="560" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									<center>กรุณากรอก รหัสการเรียกขอความช่วยเหลือ</center>
								</td>
							</tr>
							<tr>
								<td>
									<center>
									<form method="POST" action="http://www.natur.in.th/track.py/htmlTracking?">
										<input type="text" name="serv_id"/>
										<input type="submit" name="submit" value="Submit"/>
									</form>
									</center>
								</td>
							</tr>
                            <tr>
								<td>
									<center><font color="red">ไม่พบรหัสการเรียกขอความช่วยเหลือ <br/>
                                                                                        กรุณากรอก รหัสการเรียกขอความช่วยเหลือ ใหม่อีกครั้ง</font></center>
								</td>
							</tr>
														
						</table>
					</td>
					</tr>
					<tr>
						<td>
						</td>
						<td>
							<center>
								<hr/>
							</center>
						</td>
					</tr>
					<tr>
						<td>
						</td>
						<td>
							<center>
								<font size="1">
								<br/>
								 " ห้องปฎิบัติการวิจัยการสื่อสารและการคมนาคมขนส่งชาญฉลาด "<br/>
								 ภาควิชาวิศวกรรมคอมพิวเตอร์<br/>
								 คณะวิศวกรรมศาสตร์<br/>
								 สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง<br/>
								 </font>
							</center>
						</td>
					</tr>
					</table>
				</td>
			</tr>
		</table>

	</body>
</html>
"""
    
    tag = itag.decode('cp874').encode('cp874')
        
    req.content_type = "text/html" 
    req.cache_control = "no-cache" 
    req.encoding='cp874' 
    req.write(tag)  
    return 