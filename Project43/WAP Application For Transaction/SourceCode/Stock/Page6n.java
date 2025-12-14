import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Page6n extends HttpServlet {
static String u;
static String p;
public void doGet(HttpServletRequest req,HttpServletResponse res)
                        throws ServletException,IOException {
res.setContentType("text/html");
PrintWriter out = res.getWriter();
HttpSession session=req.getSession(true);
boolean knot = true;
String Spec1 = req.getParameter("Spec1");
String Spec2 = req.getParameter("Spec2");
String Spec3 = req.getParameter("Spec3");

String Dyna1 = req.getParameter("Dyna1");
String Dyna2 = req.getParameter("Dyna2");
String Dyna3 = req.getParameter("Dyna3");
String Dyna4 = req.getParameter("Dyna4");
String Dyna5 = req.getParameter("Dyna5");

String Cal1 = req.getParameter("Cal1");
String Cal2 = req.getParameter("Cal2");
String Cal3 = req.getParameter("Cal3");
String Cal4 = req.getParameter("Cal4");

String Mean1 = req.getParameter("Mean1");
String Mean2 = req.getParameter("Mean2");
String Mean3 = req.getParameter("Mean3");
String Mean4 = req.getParameter("Mean4");

String AlertS = req.getParameter("AlertS");
String AlertW = req.getParameter("AlertW");
String Comment2 = req.getParameter("Comment2");

String Ssql2 = "sdf";
String Ssql3 = "sdf";
String Ssql4 = "sdf";
int ccc2 = 5;
int cccc2 = 8;
int ccInt = 7;
int ccInt2 = 7;
int ccInt3 = 7;

String xyz = "sdf";
String pp = "sdf";
String cc = "sdf";
String pp2 = "sdf";
String cc2 = "sdf";
String pp3 = "sdf";
String cc3 = "sdf";
int ccc = 8;
int cccc = 8;
int ccc3 = 8;
int cccc3 = 8;

String Ssql = "create table ";


String Username=(String)session.getValue("Username");
String CreateTable="create table " + Username + "_Spec(Spec text)";
         try {performQuery(CreateTable);}
            catch (Exception ex3) {}
CreateTable="create table " + Username + "_Dyna(Dyna text)";
         try {performQuery(CreateTable);}
            catch (Exception ex3) {}

               if (Spec1.equals(""))
                  {}
               else 
               {
               try {performQuery("insert into " + Username + "_Spec values('" + Spec1 +"')");}
                 catch (Exception ex4) {}
               }

               if (Spec2.equals(""))
                  {}
               else 
               {
               try {performQuery("insert into " + Username + "_Spec values('" + Spec2 +"')");}
                 catch (Exception ex4) {}
               }

               if (Spec3.equals(""))
                  {}
               else 
               {
               try {performQuery("insert into " + Username + "_Spec values('" + Spec3 +"')");}
                 catch (Exception ex4) {}
               }


               if (Dyna1.equals(""))
                  {}
               else 
               {
               try {performQuery("insert into " + Username + "_Dyna values('" + Dyna1 +"')");}
                 catch (Exception ex4) {}
               }

               if (Dyna2.equals(""))
                  {}
               else 
               {
               try {performQuery("insert into " + Username + "_Dyna values('" + Dyna2 +"')");}
                 catch (Exception ex4) {}
               }

               if (Dyna3.equals(""))
                  {}
               else 
               {
               try {performQuery("insert into " + Username + "_Dyna values('" + Dyna3 +"')");}
                 catch (Exception ex4) {}
               }

               if (Dyna4.equals(""))
                  {}
               else 
               {
               try {performQuery("insert into " + Username + "_Dyna values('" + Dyna4 +"')");}
                 catch (Exception ex4) {}
               }

               if (Dyna5.equals(""))
                  {}
               else 
               {
               try {performQuery("insert into " + Username + "_Dyna values('" + Dyna5 +"')");}
                 catch (Exception ex4) {}
               }








Ssql = Ssql + Username;
String Goods=(String)session.getValue("Goods");
int GoodsInt = (new Integer(Goods)).intValue();
        String SsqlExtra = Ssql;
        for (int tableCount = 0; tableCount < GoodsInt; tableCount++){
        int parameterCount = tableCount + 1;
        String Goodsname=(String)session.getValue("Goodsname" + parameterCount);

        Ssql = Ssql + "_" + Goodsname;
        
        String Parameter=(String)session.getValue("Parameter" + parameterCount);
        int ParameterInt = (new Integer(Parameter)).intValue();
                                                 
         
         if (ParameterInt == 1)
         {
         pp=(String)session.getValue("Goodsname" + parameterCount + "_1");
         cc=(String)session.getValue("N_Goodsname" + parameterCount + "_1");
         ccInt = (new Integer(cc)).intValue();

         for (ccc = 0; ccc < ccInt; ccc++){
         cccc = ccc + 1;
         xyz = (String)session.getValue("Goodsname" + parameterCount + "_N1_T" + cccc);
         Ssql2 = Ssql;
         Ssql = Ssql + "_" + xyz;
         Ssql = Ssql + "(TransactionDateTime Text";

         if (Spec1.equals(""))
         { Ssql = Ssql + ",InOut text";

                 if (Dyna1.equals(""))
                 { Ssql = Ssql + ",Available text,Total text,Rank text";

                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                       	{ Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }            
                 else if (Dyna2.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
		              
                 else if (Dyna3.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna4.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna5.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text," + Dyna5 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
         }//if spec1
         else if (Spec2.equals(""))
         { Ssql = Ssql + "," + Spec1 + " text,InOut text";
                 if (Dyna1.equals(""))
                 { Ssql = Ssql + ",Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }            
                 else if (Dyna2.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna3.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna4.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna5.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text," + Dyna5 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
		 }
         } //spec2
         else if (Spec3.equals(""))
         { Ssql = Ssql + "," + Spec1 + " text," + Spec2 + " text,InOut text";
                 if (Dyna1.equals(""))
                 { Ssql = Ssql + ",Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }            
                 else if (Dyna2.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna3.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna4.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna5.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text," + Dyna5 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
		 }
         }//spec3
         else 
         { Ssql = Ssql + "," + Spec1 + " text," + Spec2 + " text," + Spec3 + " text,InOut text";
                 if (Dyna1.equals(""))
                 { Ssql = Ssql + ",Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }            
                 else if (Dyna2.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna3.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna4.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna5.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text," + Dyna5 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
		 }
         }//spec none

        
         try {performQuery(Ssql);}
            catch (Exception ex2) {}
         System.out.println(Ssql);
        Ssql = Ssql2;
        }//close for parameter
         }// close if parameterInt =1

		 

				  
				  
				  
         else if (ParameterInt == 2)
         {
         pp=(String)session.getValue("Goodsname" + parameterCount + "_1");
         cc=(String)session.getValue("N_Goodsname" + parameterCount + "_1");
          ccInt = (new Integer(cc)).intValue();
         for ( ccc = 0; ccc < ccInt; ccc++){
          cccc = ccc + 1;
         xyz = (String)session.getValue("Goodsname" + parameterCount + "_N1_T" + cccc);
         Ssql2 = Ssql;
         Ssql = Ssql + "_" + xyz;
         
         pp2=(String)session.getValue("Goodsname" + parameterCount + "_2");
         cc2=(String)session.getValue("N_Goodsname" + parameterCount + "_2");

          ccInt2 = (new Integer(cc2)).intValue();
         for ( ccc2 = 0; ccc2 < ccInt2; ccc2++){
          cccc2 = ccc2 + 1;
         xyz = (String)session.getValue("Goodsname" + parameterCount + "_N2_T" + cccc2);
         Ssql3 = Ssql;
         Ssql = Ssql + "_" + xyz;

          Ssql = Ssql + "(TransactionDateTime Text";

         if (Spec1.equals(""))
         { Ssql = Ssql + ",InOut text";

                 if (Dyna1.equals(""))
                 { Ssql = Ssql + ",Available text,Total text,Rank text";

                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                       	{ Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }            
                 else if (Dyna2.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
		              
                 else if (Dyna3.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna4.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna5.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text," + Dyna5 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
         }//if spec1
         else if (Spec2.equals(""))
         { Ssql = Ssql + "," + Spec1 + " text,InOut text";
                 if (Dyna1.equals(""))
                 { Ssql = Ssql + ",Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }            
                 else if (Dyna2.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna3.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna4.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna5.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text," + Dyna5 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
		 }
         } //spec2
         else if (Spec3.equals(""))
         { Ssql = Ssql + "," + Spec1 + " text," + Spec2 + " text,InOut text";
                 if (Dyna1.equals(""))
                 { Ssql = Ssql + ",Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }            
                 else if (Dyna2.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna3.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna4.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna5.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text," + Dyna5 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
		 }
         }//spec3
         else 
         { Ssql = Ssql + "," + Spec1 + " text," + Spec2 + " text," + Spec3 + " text,InOut text";
                 if (Dyna1.equals(""))
                 { Ssql = Ssql + ",Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }            
                 else if (Dyna2.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna3.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna4.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna5.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text," + Dyna5 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
		 }
         }//spec none

        
         try {performQuery(Ssql);}
            catch (Exception ex2) {}
         System.out.println(Ssql);
                 Ssql = Ssql3;
         }Ssql = Ssql2;
         }
         }

         else if (ParameterInt == 3)
         {
         pp=(String)session.getValue("Goodsname" + parameterCount + "_1");
         cc=(String)session.getValue("N_Goodsname" + parameterCount + "_1");
          ccInt = (new Integer(cc)).intValue();
         for ( ccc = 0; ccc < ccInt; ccc++){
          cccc = ccc + 1;
         xyz = (String)session.getValue("Goodsname" + parameterCount + "_N1_T" + cccc);
         Ssql2 = Ssql;
         Ssql = Ssql + "_" + xyz;
         
         pp2=(String)session.getValue("Goodsname" + parameterCount + "_2");
         cc2=(String)session.getValue("N_Goodsname" + parameterCount + "_2");

          ccInt2 = (new Integer(cc2)).intValue();
         for ( ccc2 = 0; ccc2 < ccInt2; ccc2++){
          cccc2 = ccc2 + 1;
         xyz = (String)session.getValue("Goodsname" + parameterCount + "_N2_T" + cccc2);
         Ssql3 = Ssql;
         Ssql = Ssql + "_" + xyz;

         pp3=(String)session.getValue("Goodsname" + parameterCount + "_3");
         cc3=(String)session.getValue("N_Goodsname" + parameterCount + "_3");
          ccInt3 = (new Integer(cc3)).intValue();
         for ( ccc3 = 0; ccc3 < ccInt3; ccc3++){
          cccc3 = ccc3 + 1;
         xyz = (String)session.getValue("Goodsname" + parameterCount + "_N3_T" + cccc3);
         Ssql4 = Ssql;
         Ssql = Ssql + "_" + xyz;

          Ssql = Ssql + "(TransactionDateTime Text";

         if (Spec1.equals(""))
         { Ssql = Ssql + ",InOut text";

                 if (Dyna1.equals(""))
                 { Ssql = Ssql + ",Available text,Total text,Rank text";

                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                       	{ Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }            
                 else if (Dyna2.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
		              
                 else if (Dyna3.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna4.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna5.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text," + Dyna5 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
         }//if spec1
         else if (Spec2.equals(""))
         { Ssql = Ssql + "," + Spec1 + " text,InOut text";
                 if (Dyna1.equals(""))
                 { Ssql = Ssql + ",Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }            
                 else if (Dyna2.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna3.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna4.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna5.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text," + Dyna5 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
		 }
         } //spec2
         else if (Spec3.equals(""))
         { Ssql = Ssql + "," + Spec1 + " text," + Spec2 + " text,InOut text";
                 if (Dyna1.equals(""))
                 { Ssql = Ssql + ",Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }            
                 else if (Dyna2.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna3.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna4.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna5.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text," + Dyna5 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
		 }
         }//spec3
         else 
         { Ssql = Ssql + "," + Spec1 + " text," + Spec2 + " text," + Spec3 + " text,InOut text";
                 if (Dyna1.equals(""))
                 { Ssql = Ssql + ",Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }            
                 else if (Dyna2.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna3.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna4.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else if (Dyna5.equals(""))
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
                 }
                 else
                 { Ssql = Ssql + "," + Dyna1 + " text," + Dyna2 + " text," + Dyna3 + " text," + Dyna4 + " text," + Dyna5 + " text,Available text,Total text,Rank text";
                        if (Cal1.equals(""))
                        { Ssql = Ssql + ")";}
                        else if (Cal2.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text)";}
                        else if (Cal3.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text)";}
                        else if (Cal4.equals(""))
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text)";}
                        else
                        { Ssql = Ssql + "," + Cal1 + " text," + Cal2 + " text," + Cal3 + " text," + Cal4 + " text)";}
		 }
         }//spec none

        
         try {performQuery(Ssql);}
            catch (Exception ex2) {}
         System.out.println(Ssql);
                 Ssql = Ssql4;
         }Ssql = Ssql3;
         }Ssql = Ssql2;
         }
         }

		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 Ssql = SsqlExtra;
         }//close for int table count
 
       
      }
public static void performQuery(String aa) throws Exception {
        String driverName = "sun.jdbc.odbc.JdbcOdbcDriver";
        String connectionURL = "jdbc:odbc:userp";
        Connection con = null;
        Statement stmt = null;
        String sqlStatement =aa;

        ResultSet rs = null;
        Class.forName(driverName).newInstance();

        con = DriverManager.getConnection(connectionURL);
        stmt = con.createStatement();
        rs = stmt.executeQuery(sqlStatement);

                 }
                 }















