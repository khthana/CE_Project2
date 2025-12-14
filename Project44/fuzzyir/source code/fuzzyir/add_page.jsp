<html>
<head>
<title>Untitled Document</title>
<%
	String pass_authen= new String(); 
	if(session.getValue("pass_authen")!=null){
		pass_authen=(String)session.getValue("pass_authen");
	}
	if (!(pass_authen.equals("yes"))){
		response.sendRedirect("librarian.html");
	}
%>
<meta http-equiv="Content-Type" content="text/html; charset=">
</head>

<%@ page language="java" import="java.sql.*,java.util.*,Text.TextOp,NN.*,com.jspsmart.upload.*"%>
<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload" />
<%!
  public NWord CollectData(String data){
    String temp,temp2;
    Connection con;
    Vector r;
    Vector tmp=new Vector();
    Vector ps=new Vector();

    int i=0;
	int wc=0;

	TextOp op1=new TextOp();

    if ((con=op1.Connect("sun.jdbc.odbc.JdbcOdbcDriver","jdbc:odbc:FUZZYIR","Administrator","fuzzyir"))==null){
      return null;
    }
    if ((r=op1.SSW(con))==null){
      return null;
    }

     while ((temp=op1.GWord(data,i))!=null) {
          i=op1.getNxt();
          if (op1.ChkSW(temp,r)==false) {
              tmp.addElement(temp);
              ps.addElement(new Integer(wc));
	      }
           wc=wc+1;
    }

    NWord nw=new NWord();
    int b1,b2,pp;
    Integer k;
    b1=wc/5; b2=b1*4;

    i=0;
    while(i<tmp.size()){
       temp=(String)tmp.elementAt(i);
       temp2=op1.Porter(temp);
       k=(Integer) ps.elementAt(i);
       pp=k.intValue();
       if (pp<b1) {pp=1;}
       else if (pp>=b1 && pp<=b2) {pp=2;}
       else {pp=3;}
       nw.AddData(temp2,temp,pp);
       i++;
    }
	nw.SetWC(wc);

   return nw;
  }

  //quick sort
		public void vectorQuicksort(Vector v,Vector s){
			recursive_quick_sort(0,v.size()-1,v,s);
		}
		private void recursive_quick_sort(int low,int high,Vector v,Vector s){
			int pivot_position;
			if(low<high){
				pivot_position = partition(low,high,v,s);
				recursive_quick_sort(low,pivot_position-1,v,s);
				recursive_quick_sort(pivot_position+1,high,v,s);
			}
		}

		private int partition(int low,int high,Vector v,Vector s){
			Double pivot;
			int i,last_small;
			swap(low,(low+high)/2,v,s);
			pivot = (Double)v.elementAt(low);
			last_small = low;
			for (i=low+1;i<=high;i++){
				Double tmp=(Double)v.elementAt(i);
				if(tmp.doubleValue()>pivot.doubleValue()){
					last_small = last_small +1;
					swap(last_small,i,v,s);
				}
			}
			swap(low,last_small,v,s);
			return last_small;
		}

		private void swap(int low,int high,Vector v,Vector s){
			Double tmp1;
			String tmp2;
			tmp1 = (Double)v.elementAt(low);
			tmp2=(String)s.elementAt(low);
			v.setElementAt((Double)v.elementAt(high),low);
			v.setElementAt(tmp1,high);
			s.setElementAt((String)s.elementAt(high),low);
			s.setElementAt(tmp2,high);
	}
%>

<body bgcolor="#FFFFFF">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr valign="bottom"> 
    <td height="62"> 
      <div align="center"><img src="pic/Add%20Paper.jpg" width="397" height="55"></div>
    </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="377" valign="top"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0" height="315">
        <tr valign="top"> 
          <td height="10">&nbsp; </td>
        </tr>
        <tr> 
          <td height="327" valign="middle" bgcolor="#009999"> 
            <form action="add_paper.jsp" method="post" ENCTYPE="multipart/form-data">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="2%" height="245" valign="center">&nbsp;</td>
                <td width="96%" height="245" valign="top" bgcolor="#99FFFF"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="107" valign="top" colspan="2"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="25%">&nbsp;</td>
                              <td width="75%">&nbsp;</td>
                            </tr>
                            <tr> 
                              <td width="25%"> 
                                <div align="right"><font size="-1">Title :</font> 
                                </div>
                              </td>
                              <td width="75%"> 
                                <input type="text" name="title"  size="60">
                              </td>
                            </tr>
                            <tr> 
                              <td width="25%"> 
                                <div align="right"><font size="-1">Author : </font></div>
                              </td>
                              <td width="75%"> 
                                <input type="text" name="author"  size="60">
                              </td>
                            </tr>
                            <tr>
                              <td width="25%" valign="top"> 
                                <div align="right"><font size="-1">Abstract : 
                                  </font></div>
                              </td>
                              <td width="75%">
                                <textarea name="description" cols="60" rows="5"></textarea>
                              </td>
                            </tr>
                            <tr> 
                              <td width="25%"> 
                                <div align="right"><font size="-1">File PDF : 
                                  </font></div>
                              </td>
                              <td width="75%"> 
                               <input type="file" name="pdf_file" size="30">
                              </td>
                            </tr>
                          </table>
                      </td>
                    </tr>
                    <tr> 
                      <td width="25%" rowspan="2" valign="top"> 
                        <div align="right"><font size="-1">Index Terms : </font></div>
                      </td>
                      <td width="75%"> 

			<%	// Variables
				int count; 
				NWord nw;
				// Initialization
				mySmartUpload.initialize(pageContext);
				mySmartUpload.setTotalMaxFileSize(1000000);

				// Upload
				String str=new String();
				try {
					mySmartUpload.upload();
					count=0;
					String b;
					double x;
					Vector sum=new Vector();
					Vector sref=new Vector();
					//f (mySmartUpload.getFiles().getFile(0).isMissing()==false) {
					b=mySmartUpload.getFiles().getFile(0).getContentString();
					nw=CollectData(b);
					int cpt;
					while (count<nw.GetSize()) {
						if (nw.GetWord(count).length()>2) {
							x=nw.GetUFR(count)*3;
							x=x+nw.GetUMR(count)*(1/3);
							x=x+nw.GetULR(count)*2;
							sum.addElement(new Double(x));
							sref.addElement(nw.GetRef(count));
						}
						count++;
					}
					vectorQuicksort(sum,sref);
					count=0;
					cpt=sum.size()/50;
					while(count<sum.size()){
						if (count<=cpt){
							str=str.concat((String)sref.elementAt(count)+"\n");
							//str=str.concat(String.valueOf((Double)sum.elementAt(count))+"\n");
						}
						count++;
					}
					//}
				}catch(Exception e) {
				}
			%>
                        <textarea name="index" cols="60" rows="5" ><%=str%></textarea>
                        </td>
                    </tr>
                    <tr>
                      <td width="75%">
                        <input type="submit" name="Submit" value="Add Paper">
                        <input type="reset" name="Reset" value="Reset">
                      </td>
                    </tr>
                  </table>
                </td>
                <td width="2%" height="245">&nbsp;</td>
              </tr>
            </table></form>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
<form action="add_page.jsp" method="post" ENCTYPE="multipart/form-data">      
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td bgcolor="#009999" colspan="3">
              <div align="center"><font size="-1" color="#FFFF00"><b>Automatic 
                Indexing</b></font><font size="-1" color="#FFFF00"></font></div>
            </td>
          </tr>
          <tr> 
            <td width="26%" bgcolor="#99FFFF"> 
              <div align="right"><font size="-1">Text File : </font></div>
            </td>
            <td width="28%" bgcolor="#99FFFF"> 
              <input type="file" name="autoindex">
            </td>
            <td width="46%" bgcolor="#99FFFF"> 
              <div align="center">
                <input type="submit" name="Submit3" value="Automatic Indexing">
              </div>
            </td>
          </tr>
        </table>
</form>
    </td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
