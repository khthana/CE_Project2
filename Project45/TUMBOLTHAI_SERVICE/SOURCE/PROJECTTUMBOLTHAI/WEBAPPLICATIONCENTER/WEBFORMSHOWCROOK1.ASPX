<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WebFormShowCrook1.aspx.vb" Inherits="WebApplicationCenter.WebFormShowCrook1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebFormShowCrook1</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body bgColor="#ffffcc" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma"></FONT>
			<DIV style="Z-INDEX: 101; LEFT: 150px; WIDTH: 376px; POSITION: absolute; TOP: 20px; HEIGHT: 2298px" ms_positioning="FlowLayout">
				<P align="center"><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" color="navy" size="2"><B><FONT size="3">รูปแบบของการหลอกลวงทางอินเทอร์เน็ต</FONT></B></FONT>
				<P align="left"><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						รูปแบบของการหลอกลวงทางอินเทอร์เน็ต มีลักษณะและวิธีการป้องกันโดยสรุป ดังนี้</FONT>
				<P><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" color="navy" size="2"><B>1. 
							การประมูลสินค้าทางอินเทอร์เน็ตโดยหลอกลวง (Internet Auction Fraud)</B></FONT>
				<P align="left"><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						การโฆษณาขายสินค้าทางอินเทอร์เน็ตด้วยวิธีการประมูลสินค้า 
						ผู้ซื้อที่สนใจจะเข้าร่วมการประมูลมัก ต้องลงทะเบียนเป็นสมาชิกของเว็บไซต์นั้นๆ 
						ซึ่งโดยทั่วไปจะไม่เสียค่าใช้จ่ายใดๆ หลังจากนั้นจะได้รับ 
						หมายเลขสมาชิกและรหัสผ่าน (password) 
						ผู้ซื้อจะต้องเสนอราคาซื้อแข่งขันกับผู้ซื้อรายอื่น เมื่อเสร็จสิ้นการ 
						ประมูลถือว่ามีการทำสัญญาซื้อขายระหว่างผู้ประมูลและผู้เสนอขาย 
						โดยจะมีการส่งข้อความทางอีเมล์ (e-mail) แจ้งให้ผู้ซื้อและผู้ขายทราบผลการประมูล 
						และแจ้งรายละเอียดที่จะติดต่อกันได้ เพื่อให้ทั้งฝ่ายผู้ซื้อและ 
						ผู้ขายติดต่อกันในเรื่องการชำระเงินและการส่งมอบสินค้า </FONT>
				<P><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" color="red" size="2">ลักษณะการหลอกลวง:</FONT>
				<P align="left"><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						การประมูลสินค้าทางอินเทอร์เน็ต เป็นวิธีการซื้อขายสินค้าที่ได้รับความนิยม 
						และเป็นช่องทางการ ติดต่อซื้อขายสินค้าที่สะดวกรวดเร็ว 
						ในรายงานสำรวจที่กล่าวมาแล้วของบางประเทศพบว่า เป็นวิธีการ 
						หลอกลวงที่พบมากที่สุดเช่นกัน การหลอกลวงมีหลายรูปแบบ เช่น 
						ผู้ขายไม่ส่งมอบสินค้าที่ผู้ซื้อประมูลได้ เพราะไม่มีสินค้าอยู่จริง, 
						การหลอกลวงโดยการปั่นราคาซื้อขาย ผู้ขายหรือบุคคลที่เกี่ยวข้องกับผู้ขายจะ 
						เข้าเสนอราคาเพื่อประมูลสินค้าของตน เพื่อให้สินค้ามีราคาสูงขึ้น 
						ทำให้ผู้ซื้อต้องซื้อสินค้าในราคาที่สูงเกินจริง เป็นต้น</FONT>
				<P><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" color="red" size="2">ความเสียหายที่อาจเกิดขึ้นได้:</FONT>
				<P align="left"><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						ผู้ซื้อได้ชำระค่าสินค้าให้แก่ผู้ขายแล้ว แต่ยังไม่ได้รับสินค้า 
						หรือได้รับสินค้าที่ชำรุดเสียหาย หรือเป็นสินค้า 
						ที่มีลักษณะไม่ตรงกับที่มีการเสนอขายแต่แรก 
						ด้านผู้ให้บริการประมูลทางอินเทอร์เน็ตเองก็อาจได้รับความ เสียหาย 
						เพราะผู้ใช้บริการ (ผู้ซื้อและผู้ขาย) ไม่ให้ความไว้วางใจและไม่ใช้บริการ </FONT>
				<P><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" color="green" size="2">วิธีการป้องกัน:</FONT>
				<P align="left"><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						ผู้ซื้อควรตรวจสอบว่าเว็บไซต์ที่ทำหน้าที่เป็นผู้ให้บริการด้านการประมูลทางอินเทอร์เน็ต 
						(คนกลาง) มีวิธีการระบุตัวบุคคลที่เป็นผู้ขาย (หรือผู้ซื้อ) ดีพอหรือไม่ 
						กล่าวคือมีการเก็บประวัติ รายละเอียดของผู้ขาย ที่สามารถติดต่อได้ 
						หรือพิจารณาว่าผู้ให้บริการด้านการประมูลทางอินเทอร์เน็ต (คนกลาง) มีนโยบายการ 
						ประกันความเสียหายที่อาจเกิดขึ้นหรือไม่ 
						โดยเฉพาะอย่างยิ่งสำหรับสินค้าที่มีมูลค่าค่อนข้างสูง </FONT><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2">
					</FONT>
				<P><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" color="navy" size="2"><B>2. 
							การให้บริการอินเทอร์เน็ตโดยหลอกลวง (Internet Service Provider Scams) </B></FONT>
				<P align="left"><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						ผู้หลอกลวงจะส่งเช็คจำนวนหนึ่ง (เช่นราว 3.5 ดอลลาร์สหรัฐฯ) ให้แก่ผู้ใช้บริการ 
						เมื่อมีการเบิกเงินตาม 
						เช็คแล้วก็ถือว่าผู้บริโภคตกลงที่จะใช้บริการของผู้ให้บริการอินเทอร์เน็ต 
						(Internet Service Provider - ISP) ที่ได้รับแจ้ง 
						ในการนี้อาจจะไม่มีการแจ้งค่าธรรมเนียมหรือค่าใช้จ่ายใดๆ และมักเป็นการทำสัญญาให้ 
						บริการอินเทอร์เน็ตที่มีระยะเวลานาน 
						ผู้หลอกลวงจงใจให้ผู้บริโภคหรือผู้ใช้บริการเกิดความสับสน 
						และเข้าใจผิดในสาระสำคัญเกี่ยวกับการบริการนั้น กล่าวคือเมื่อผู้บริโภคเข้าทำสัญญา 
						ดังกล่าวแล้วจะถือว่า ยินยอมตามเงื่อนไขทุกประการที่ระบุไว้ 
						การหลอกลวงดังกล่าวนี้มักพบในประเทศที่มีผู้ให้บริการอินเทอร์เน็ต หลายราย 
						และมีบริการที่หลากหลาย</FONT>
				<P><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" color="red" size="2">ลักษณะการหลอกลวง:</FONT>
				<P align="left"><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						ผู้บริโภคถูกเรียกเก็บเงินค่าบริการต่างๆ จากผู้ให้บริการอินเทอร์เน็ต นอกจากนี้ 
						ยังอาจจะมีคำขู่ ที่กล่าวว่าถ้าหากผู้ใช้บริการ ต้องการเลิกสัญญาก่อนครบกำหนดสัญญา 
						จะถูกปรับเป็นจำนวนเงินที่สูง </FONT>
				<P><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" color="red" size="2">ความเสียหายที่อาจเกิดขึ้นได้:</FONT>
				<P align="left"><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						ผู้บริโภคถูกเรียกเก็บเงินค่าบริการต่างๆ จากผู้ให้บริการอินเทอร์เน็ต นอกจากนี้ 
						ยังอาจจะมีคำขู่ที่กล่าวว่า ถ้าหากผู้ใช้บริการต้องการเลิกสัญญาก่อนครบกำหนดสัญญา 
						จะถูกปรับเป็นจำนวนเงินที่สูง </FONT>
				<P><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" color="green" size="2">วิธีการป้องกัน:</FONT>
				<P align="left"><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						เมื่อผู้บริโภคได้รับเช็คโดยไม่ทราบสาเหตุที่ชัดเจนแล้ว ไม่ควรทำข้อตกลงใดๆ 
						กับบุคคลอื่น แต่ควรศึกษา รายละเอียดของเอกสารหรือข้อตกลงที่ส่งมาโดยถี่ถ้วน 
						ตรวจสอบค่าใช้จ่ายต่างๆ ที่จะถูกเรียกเก็บให้ครบถ้วน 
						และควรติดต่อผู้ให้บริการอินเทอร์เน็ตโดยตรง</FONT> <FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2">
					</FONT>
				<P>
				<P><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" color="navy" size="2"><B>3. 
							การใช้บัตรเครดิตโดยไม่ได้รับอนุญาต (Credit Card Fraud)</B></FONT>
				<P align="left"><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						การชำระค่าสินค้า ค่าบริการทางอินเทอร์เน็ตที่ได้รับความนิยมที่สุดวิธีหนึ่งคือ 
						การชำระเงินด้วยบัตร เครดิต เนื่องจากมีความสะดวกแก่ทั้งผู้ซื้อและผู้ขาย 
						ผู้ซื้อสามารถชำระเงินโดยการให้ข้อมูลบัตรเครดิตคือ หมายเลขบัตรเครดิต 
						ชื่อ-สกุลของ ผู้ถือบัตร และวันหมดอายุแก่ร้านค้า ร้านค้าสามารถตรวจสอบได้เพียงว่า 
						บัตรดังกล่าวเป็นบัตรที่ออกโดยผู้ออกบัตรจริง 
						แต่ไม่สามารถตรวจสอบตัวบุคคลผู้ใช้บัตรได้ว่าเป็นบุคคลใด</FONT>
				<P><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" color="red" size="2">ลักษณะการหลอกลวง:</FONT>
				<P align="left"><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						วิธีการหลอกลวงเกี่ยวกับการชำระเงินด้วยบัตรเครดิตทางอินเทอร์เน็ตมีหลายวิธี 
						ตัวอย่างเช่น การให้บริการดูภาพลามกอนาจารโดยไม่เสียค่าใช้จ่ายใดๆ 
						สำหรับผู้ที่มีอายุตั้งแต่ 18 ปีขึ้นไป (ตามกฎหมาย สหรัฐอเมริกา) 
						แต่ผู้บริโภคต้องแจ้งข้อมูลบัตรเครดิตให้ผู้ให้บริการทราบ 
						เพื่อตรวจสอบความถูกต้องของข้อมูล 
						แล้วผู้หลอกลวงจะใช้ข้อมูลนี้ไปกระทำผิดในที่อื่น </FONT>
				<P><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" color="red" size="2">ความเสียหายที่อาจเกิดขึ้นได้:</FONT>
				<P align="left"><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						ผู้ถือบัตรที่เป็นผู้บริโภคถูกเรียกเก็บเงินค่าสินค้าหรือบริการจากบริษัทหรือธนาคารผู้ออกบัตร 
						ทั้งที่ผู้ ถือบัตรไม่ได้ใช้บัตรเครดิตชำระรายการนั้นๆ เลย 
						ซึ่งกฎหมายบางประเทศจะให้ความคุ้มครองผู้ถือบัตร ในกรณีนี้ 
						หรือผู้ถือบัตรรับผิดไม่เกินจำนวนเงินที่กำหนดไว้ในข้อตกลงระหว่างผู้ออกบัตรและผู้ถือบัตร
					</FONT>
				<P><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" color="green" size="2">วิธีการป้องกัน:</FONT>
				<P align="left"><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						ผู้ถือบัตรเครดิตไม่ควรแจ้งข้อมูลบัตรเครดิตให้บุคคลอื่นทราบ 
						แต่หากต้องมีการชำระเงินด้วยบัตร เครดิต ทางอินเทอร์เน็ต 
						ก็ควรเลือกร้านค้าที่มีความน่าเชื่อถือ หรือมีหลักแหล่งที่แน่นอนสามารถติดต่อได้ 
						หรือผู้บริโภคอาจเลือกใช้บัตรที่มีวิธีการตรวจสอบตัวบุคคลผู้ใช้บัตรว่าเป็นผู้ถือบัตร 
						เช่น การใช้รหัสประจำ ตัว (PIN) หรือรหัสใดๆ ที่ไม่ปรากฎอยู่บนบัตร แต่ถือ 
						เป็นข้อมูลส่วนตัวของผู้ถือบัตรที่ไม่เปิดเผย ให้บุคคลอื่นทราบ นอกจากนี้ 
						ผู้ถือบัตรควรตรวจดูข้อตกลงที่ทำไว้กับผู้ออกบัตรด้วยว่ามีเงื่อนไข 
						ความรับผิดชอบอย่างไร </FONT><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2">
					</FONT>
				<P>
				<P><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" color="navy" size="2"><B>4. 
							การเข้าควบคุมการใช้โมเดมของบุคคลอื่น (International Modem Dialing/ Modem 
							Hijacking) </B></FONT>
				<P><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" color="red" size="2">ลักษณะการหลอกลวง:</FONT>
				<P align="left"><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						การโฆษณาการให้บริการสื่อลามกอนาจารโดยไม่เสียค่าใช้จ่ายใดๆ 
						ผู้ใช้บริการจะต้องติดตั้งโปรแกรม คอมพิวเตอร์เพื่อดูภาพดังกล่าวหรือเรียกว่า 
						‘viewer’ หรือ ‘dialer’ ของผู้ให้บริการ เมื่อผู้ใช้บริการเปิดดูภาพ 
						ด้วยโปรแกรมข้างต้นแล้ว 
						การทำงานของโปรแกรมดังกล่าวจะเริ่มเมื่อมีการใช้เครื่องโมเดม (modem) 
						ในขณะเดียวกันโปรแกรมฯ จะควบคุมการทำงานของโมเดม 
						และสั่งให้หยุดการทำงานโดยที่ผู้ใช้บริการไม่รู้ ตัว 
						แล้วจะสั่งให้มีการต่อเชื่อมผ่านโมเดมอีกครั้งหนึ่ง โดยเป็นการใช้โทรศัพท์ 
						ทางไกลจากที่ใดที่หนึ่ง แล้วมีการใช้อินเทอร์เน็ตอีกครั้งจากที่นั้น 
						เพื่อให้ผู้ใช้บริการสามารถดูเว็บไซต์ </FONT>
				<P><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" color="red" size="2">ความเสียหายที่อาจเกิดขึ้นได้:</FONT>
				<P align="left"><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						ผู้ใช้บริการจะถูกเรียกเก็บเงินค่าโทรศัพท์ทางไกลจำนวนมาก 
						ทั้งที่ผู้ใช้บริการอาจไม่รับรู้ ซึ่งเป็นเพราะ 
						มีบุคคลอื่นลักลอบใช้โทรศัพท์โดยอาศัยโปรแกรมคอมพิวเตอร์ดังกล่าว </FONT>
				<P><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" color="green" size="2">วิธีการป้องกัน:</FONT>
				<P align="left"><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						ผู้ใช้บริการหรือผู้บริโภคควรหลีกเลี่ยงไม่ติดตั้งโปรแกรมคอมพิวเตอร์ 
						สำหรับการให้บริการใดๆ โดยไม่เสียค่าใช้จ่าย 
						โดยเฉพาะอย่างยิ่งการดูเว็บไซต์ที่มีข้อมูลภาพลามกอนาจาร และควรตรวจสอบเงื่อนไข 
						และค่าใช้จ่ายต่างๆ ถ้าพบสิ่งผิดปกติ ต้องแจ้งระงับการใช้งานกับผู้ให้บริการทันที 
						นอกจากนั้น ผู้ใช้บริการควรตรวจสอบใบแจ้งหนี้ค่าบริการโทรศัพท์อย่างสม่ำเสมอ</FONT>
					<FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2"></FONT>
				<P><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" color="navy" size="2"><B>5. 
							การหลอกลวงให้ใช้บริการเกี่ยวกับเว็บไซต์ (Web Cramming)</B></FONT>
				<P><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" color="red" size="2">ลักษณะการหลอกลวง:</FONT>
				<P align="left"><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						การหลอกลวงว่ามีการให้บริการเปิดเว็บเพจ (web page) โดยไม่เสียค่าใช้จ่ายใดๆ 
						เช่นการเปิดเว็บเพจ เป็นเวลา 30 วัน และไม่มีข้อผูกพันใดๆ ถ้าไม่ใช้บริการต่อไป </FONT>
				<P><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" color="red" size="2">ความเสียหายที่อาจเกิดขึ้นได้:</FONT>
				<P align="left"><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						เมื่อมีการตกลงใช้บริการดังกล่าวแล้ว 
						ผู้ใช้บริการจะถูกเรียกเก็บเงินค่าใช้บริการโทรศัพท์ หรือค่าใช้ บริการในการมี 
						เว็บเพจ (ค่าธรรมเนียมการใช้พื้นที่) เป็นจำนวนมาก ทั้งๆ ที่ตนไม่เคยใช้บริการ 
						หรือไม่ได้สมัคร แต่อย่างใด ผู้ใช้บริการยังไม่ 
						สามารถแจ้งให้ผู้ให้บริการยกเลิกได้ทันทีอีกด้วย</FONT>
				<P><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" color="green" size="2">วิธีการป้องกัน:</FONT>
				<P align="left"><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						ผู้บริโภคควรตรวจสอบข้อมูลเกี่ยวกับผู้ให้บริการ 
						และเลือกใช้บริการที่มีความน่าเชื่อถือเท่านั้น (กรณีนี้มักพบใน 
						ประเทศที่มีผู้ให้บริการโทรศัพท์จำนวนมากเช่นในประเทศสหรัฐอเมริกา เป็นต้น) </FONT>
					<FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2"></FONT>
				<P></P>
				<P align="right"><FONT face="MS Sans Serif, AngsanaUPC, CordiaUPC, EucrosiaUPC" size="2"><A href="webformshowcrook2.aspx">&gt;&gt;&gt;หน้าถัดไป<BR>
						</A></FONT>
				</P>
			</DIV>
		</form>
	</body>
</HTML>
