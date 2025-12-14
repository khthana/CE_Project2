<%@ page language="java" import="java.sql.*,java.util.*,Text.TextOp,NN.*,com.jspsmart.upload.*"%>
<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload" />

<HTML>
<BODY BGCOLOR="white">
<H1>Automatic Indexing</H1>
<HR>
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

    if ((con=op1.Connect("sun.jdbc.odbc.JdbcOdbcDriver","jdbc:odbc:Fuzzy_Test","",""))==null){
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
%>
<%	// Variables
	int count=0; 
	NWord nw;

	// Initialization
	mySmartUpload.initialize(pageContext);

	mySmartUpload.setTotalMaxFileSize(100000);

	// Upload	
	mySmartUpload.upload();

	String b;
	b=mySmartUpload.getFiles().getFile(0).getContentString();
	nw=CollectData(b);
	while (count<nw.GetSize()) {
%>
		<%=nw.GetWord(count)%>
		<%=nw.GetRef(count)%>
		<%=nw.GetFR(count)%>
		<%=nw.GetMR(count)%>
		<%=nw.GetLR(count)%>
		<BR>
<%
		count++;
	}
%>
</BODY>
</HTML>
