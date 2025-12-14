package myutil;
import myutil.thaiLanguage;

public class htmlTemplate{

	private static String htmlListStart;
	private static String htmlListEnd="</center>\n"+
													"<br>\n"+		
											"</td><!--end Insert data -->\n"+
											"<!-- Right -->\n"+
											"<td width=\"1\" background=\"../image/verdotshort.gif\" valign=\"top\" ></td>\n"+
										"</tr>\n"+
										"</table>\n"+
										"</tr>\n"+
									"</table></td><!-- Cover Main Page-->\n"+
								"</tr>\n"+
								"</table>\n"+
								"</center>\n"+
								"</body>\n"+
								"</html>\n";

	private static String htmlStart;
	private static String htmlEnd ="</center>\n"+
													"<br>\n"+		
											"</td><!--end Insert data -->\n"+
											"<!-- Right -->\n"+
											"<td width=\"1\" background=\"../image/verdotshort.gif\" valign=\"top\" ></td>\n"+
										"</tr>\n"+
										"</table>\n"+
										"</tr>\n"+
									"</table></td><!-- Cover Main Page-->\n"+
								"</tr>\n"+
								"</table>\n"+
								"</center>\n"+
								"</body>\n"+
								"</html>\n";

	public static String getStart(String title,String link,String header){
				  htmlStart="	<%@ page contentType=\"text/html; charset=windows-874\"%>\n"+
									"<html>\n"+
									"<head>\n"+
										"<title>"+thaiLanguage.UnicodeToMS874(title)+"</title>\n"+					
										"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">\n"+
										"<link href=\"../stylesheet/insert.css\" rel=\"stylesheet\" type=\"text/css\">\n"+
										"<script language=javascript SRC=\"../javascript/scriptUtil.js\">\n"+
										"</script>\n"+
									"</head>\n"+
									"<body leftmargin=\"0\" rightmargin=\"0\" topmargin=\"0\" bottommargin=\"0\">\n"+
									"<center>\n"+
									"<table width=\"780\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" background=\"../image/background.gif\" height=\"100%\">\n"+
									"<tr>\n"+
											"<td valign=\"top\"><br></td>\n"+
									"</tr>\n"+
  									"<tr>\n"+
		  									"<td valign=\"top\" background=\"../image/band.gif\" height=\"113\">\n"+
		  									"</td>\n"+
	  								"</tr>\n"+
  									"<tr>\n"+
		  									"<td valign=\"bottom\" height=\"28\">\n"+
			  								"<table width=\"780\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n"+
											"<tr>\n"+
											"		<td width=\"670\" align=\"left\" valign=\"bottom\"><font class=\"pathfont\">&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874(link)+"</font></td>\n"+
		  									"		<td width=\"110\" align=\"right\" valign=\"bottom\"><a class=\"pathlink2\" href=\"login?logout=logout\">Logout</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>\n"+
											"</tr>\n"+
											"</table>\n"+
											"</td>\n"+
									"</tr>\n"+
									"<tr>\n"+
											"<td valign=\"top\" background=\"../image/hordotshort.gif\" height=\"1\">	\n"+
											"</td>\n"+
									"</tr>\n"+
									"<tr>\n"+
										"<td  valign=\"top\">\n"+
											"<!-- Cover Main Page-->\n"+
											"<table width=\"780\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" height=\"100%\">\n"+
											"<tr>\n"+
												"<td width=\"1\" height=\"100%\" align=\"left\" valign=\"top\" background=\"../image/verdotshort.gif\"></td>\n"+
												"<td width=\"778\"  valign=\"top\"> \n"+
													"<!-- Insert data -->\n"+
													"<br>\n"+
													"<center>\n"+
													"<table width=\"400\" height=\"50\" bgcolor=\"#671691\" border=\"1\" bordercolor=\"#9900FF\" >\n"+
													"<tr>\n"+
														"<td valign=\"middle\" align=\"center\" class=\"topic\">"+thaiLanguage.UnicodeToMS874(header)+"</td>\n"+
													"</tr>\n"+
													"</table>\n"+
													"</center>\n"+		
													"<center>\n";
		return  htmlStart;
	}
	public static String getEnd(){
		return htmlEnd;
	}

	/// ----------------------------- ส่วนของทำเนียบ -----------------------------------------------------------------------------------
		public static String getListStart(String filename,String title){
				  htmlListStart="	<%@ page contentType=\"text/html; charset=windows-874\"%>\n"+
									"<html>\n"+
									"<head>\n"+
										"<title>"+thaiLanguage.UnicodeToMS874(title)+"</title>\n"+					
										"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">\n"+
										"<link href=\"../stylesheet/lecturer.css\" rel=\"stylesheet\" type=\"text/css\">\n"+
										"<script language=javascript SRC=\"../javascript/scriptUtil.js\">\n"+
										"</script>\n"+
									"</head>\n"+
									"<body leftmargin=\"0\" rightmargin=\"0\" topmargin=\"0\" bottommargin=\"0\">\n"+
									"<center>\n"+
									"<table width=\"780\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" background=\"../image/background.gif\" height=\"100%\">\n"+
									"<tr>\n"+
											"<td valign=\"top\" height=\"30\"></td>\n"+
									"</tr>\n"+
									"<tr>\n"+
		  									"<td valign=\"top\" background=\"../image/"+filename+"\" height=\"113\">\n"+
		  							"</td>\n"+
	  								"</tr>\n"+
  									"<tr>\n"+
		  									"<td valign=\"bottom\" height=\"28\">\n</td>\n"+
									"</tr>\n"+
									"<tr>\n"+
											"<td valign=\"top\" background=\"../image/hordotshort.gif\" height=\"1\">	\n"+
											"</td>\n"+
									"</tr>\n"+
									"<tr>\n"+
										"<td  valign=\"top\">\n"+
											"<!-- Cover Main Page-->\n"+
											"<table width=\"780\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" height=\"100%\">\n"+
											"<tr>\n"+
												"<td width=\"1\" height=\"100%\" align=\"left\" valign=\"top\" background=\"../image/verdotshort.gif\"></td>\n"+
												"<td width=\"778\"  valign=\"top\"> \n"+													
													"<br>\n"+
													"<center>\n";
		return  htmlListStart;
	}

	public static String getListEnd(){
		return htmlListEnd;
	}



		
} // end .class htmlTemplate

