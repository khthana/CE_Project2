<%msg = Request.QueryString("msg")	'	ตัวแปรบอกข้อผิดพลาดที่่เกิดขึ้้น		%>
<title> ข้อมูลลูกค้า  </title>
<div align= "center">
<table border="1" width="500">
<tr>
	<td width="500">	 
	<h3>	Customer	</h3>
	<% if msg ="" then %>	<b> กรุณากรอกข้อมูลส่วนตัวของท่าน	</b>
	<br>
	<%else%>
	<b>	เกิดความผิดพลาด</b><br>
	<b><%	 = msg %> </b>
	<%end if%>
	</td>
	</tr>

	<tr>
	<td width="500">
	
	<form method="post"	action ="addcustomer.asp" >
	<table border="1" width="500">
	<tr>
			<td bgcolor="gray" ><b> ชื่อ : </b></td>
			<td><input name="fname" size="32" ></td>
	</tr>
	<tr>
			<td bgcolor="gray" ><b> อีเมล : </b></td>
			<td><input name="email" size="32" ></td>
	</tr>
	<tr>
			<td bgcolor="gray" ><b> ที่อยู่ : </b></td>
			<td><input name="address" size="32" ></td>
	</tr>
	<tr>
			<td bgcolor="gray" ><b> เบอร์โทร : </b></td>
			<td><input name="phone" size="32" ></td>
	</tr>
	</table>
	<div align="center">
			<input type="submit" name="submit" value="ตกลง">
			<input type="reset" name="submit2" value="ยกเลิก">
	</div>
	</form>
	</td>
	</tr>
	</table>
	</div>