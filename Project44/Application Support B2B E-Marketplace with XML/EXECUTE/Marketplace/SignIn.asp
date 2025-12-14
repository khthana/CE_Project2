
<%response.Buffer = true ' เพราะจะใช้ Response.redirect

			Set Conn = Server.CreateObject("ADODB.Connection")
			

			conn.Open="Driver={sql server}; server=market; database=marketplace;"

			sql="select Password,MemberType,ID,Lastlogin,LoginCounter from member where UserName='"&request.form("fUser")&"'"
			Set rs = Server.CreateObject("ADODB.Recordset") 
			rs.Open sql,conn,1,3
			
			if  not rs.EOF then  ' มี user name ใน DB
						if rs("Password")=request.form("fPassword") then 'Password ถูก
							
								rs("LoginCounter")=rs("LoginCounter")+1
								rs.update
							
							
								if rs("Membertype")="s" then  ' เป็นผู้ขาย login
										session("SellerID")=rs("ID")
										session("BuyerID")=rs("ID")
										session("LastLog")=rs("Lastlogin")  'เก็บค่า LastLogin เอาไว้Show หน้าถัดไป
										session("type")="seller"
										rs("LastLogin")=now
										rs.update
										session("login")="login"
										response.redirect("MainMenu.asp")
						
								else 'ผู้ซื้อ login
										session("BuyerID")=rs("ID")
										session("LastLog")=rs("Lastlogin") 'เก็บค่า LastLogin เอาไว้Show หน้าถัดไป
										rs("LastLogin")=now
										rs.update
										session("type")="buyer"
										session("login")="login"
										response.redirect("MainMenu.asp")
							end if
					else 'password ผิด
						
									response.redirect("home.asp?st=1")
							
					end if
		else
					response.redirect("home.asp?st=1")
		end if
		
%>