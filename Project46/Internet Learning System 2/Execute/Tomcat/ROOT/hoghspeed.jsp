//**************************************
//     
// Name: _string replace - high speed .j
//     sp format
// Description:Replace junk withing stri
//     ng. High performance - High speed 3line 
//     code. adaptable to .jsp, .java any versi
//     on.
// By: sudheer a fernandes
//
// Inputs:String stuffWithNBSP = replace
//     ("Friends' day", "'", "& rsquo ;");
//
// Returns:stuffWithNBSP = "friends& rsq
//     uo ; day";
//
//This code is copyrighted and has// limited warranties.Please see http://
//     www.1JavaStreet.com/vb/scripts/ShowCode.
//     asp?txtCodeId=3302&lngWId=2//for details.//**************************************
//     

<%!
private String replace(String str, String problemStr, String replace)


    {	for(int i=str.lastIndexOf(problemStr); i>=0; i=str.lastIndexOf(problemStr, i-1))
    		if(i==0) str = replace+str.substring(i+1, str.length());
    			else str = str.substring(0, i)+replace+str.substring(i+1, str.length());
    				return str;}
    %>
