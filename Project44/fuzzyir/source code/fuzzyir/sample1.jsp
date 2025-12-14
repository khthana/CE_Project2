<%@ page language="java" import="com.jspsmart.upload.*"%>
<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload" />

<HTML>
<BODY BGCOLOR="white">
<H1>jspSmartUpload : Sample 1</H1>
<HR>

<%

	// Variables
	int count=0;        

	// Initialization
	mySmartUpload.initialize(pageContext);

	mySmartUpload.setTotalMaxFileSize(10000000);

	// Upload	
	mySmartUpload.upload();

	try {

		// Save the files with their original names in the virtual path "/upload"
		// if it doesn't exist try to save in the physical path "/upload"
		count = mySmartUpload.save("/upload");
		
		// Save the files with their original names in the virtual path "/upload"
		// count = mySmartUpload.save("/upload", mySmartUpload.SAVE_VIRTUAL);

		// Display the number of files uploaded 
		out.println(count + " file(s) uploaded.");

	} catch (Exception e) { 
		out.println(e.toString());
	}
	
%>

</BODY>
</HTML>
