<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date"%> <!-- import  เพื่อใช้ session -->
<%@page session="true"%><!-- default -->
<%@include file="th-db.jsp"%>
<%

int all=Integer.parseInt(request.getParameter("all"));
int check=Integer.parseInt(request.getParameter("check"));
boolean found=false;
int i=0;
int ponum=0;
while ((i<all)&&(!found))
{
	 if (check==i) {   
		 
            String date=request.getParameter("po_date"+i);
			ponum=Integer.parseInt(request.getParameter("ponum"+i));
			String venname=request.getParameter("venname"+i);
			
			found=true;
			}
      i+=1;
}

		if(found){
					
				XMLUtil(ponum);
		}
%>