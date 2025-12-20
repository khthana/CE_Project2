#!/usr/bin/env python
# -*- coding: cp874 -*-

import sys,time
from Numeric import *
from mod_python import apache
import pg

def htmlTracking( req, serv_id ): #, serv_id ) :
    
    db = pg.DB( dbname='virtualbkk_db', host='localhost', user='ictuser', passwd='mflv[' )    
    
    carForServ = db.query("SELECT camera.camera_ip,serv.state FROM car,serv,camera WHERE serv_id='"+serv_id+"' and serv.car_id=car.car_id and car.camera_id=camera.camera_id;")
    lstCarForServ = carForServ.getresult()
    
    if len(lstCarForServ) >= 1:
        camera_ip = lstCarForServ[0][0]
	serv_state = lstCarForServ[0][1]
    else :
	camera_ip = ""
	serv_state = ""
    itag = """<html>
	<head>
		<title> emergency rescue </title>
		
		<script type="text/javascript" src="./../script/loaddata.js"></script>
		<script type="text/javascript" src="./../script/bkkbtn.js"></script>
		<script type="text/javascript" src="./../script/search.js"></script>		

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
								<iframe id="dis_video" name="video" frameborder="0" src="" width="200" scrolling="no" height="144"> 
								</iframe>
							</td>
						</tr>
						<tr>
							<td style="width: 200; height: 30;" valign="middle" align="left"> 
								<table width="200px" height="30" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											<a href="" target="Temp">
												<img src="./../picture/pzt/pzt_up.png" alt="Move UP" border="0"/>
											</a>											
										</td>
										<td>
											<a href="" target="Temp">
												<img src="./../picture/pzt/pzt_down.png" alt="Move Down" border="0"/>
											</a>
										</td>
										<td>
											<a href="" target="Temp">
												<img src="./../picture/pzt/pzt_left.png" alt="Move Left" border="0"/>
											</a>
										</td>
										<td>
											<a href="" target="Temp">
												<img src="./../picture/pzt/pzt_right.png" alt="Move Right" border="0"/>
											</a>
										</td>
										<td>
											<a href="" target="Temp">
												<img src="./../picture/pzt/pzt_zoomin.png" alt="Zoom In" border="0"/>
											</a>
										</td>
										<td>
											<a href="" target="Temp">
												<img src="./../picture/pzt/pzt_zoomout.png" alt="Zoom Out" border="0"/>
											</a>
										</td>
										<td>
											<a href="" target="Temp">
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
</html>



    """
    tag = itag.decode('cp874').encode('cp874')
        
    req.content_type = "text/html" 
    req.cache_control = "no-cache" 
    req.encoding='cp874' 
    req.write(tag)  
    return 