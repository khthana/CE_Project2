package myutil;
import java.io.*;

public class myDate{

	public myDate(){}
	public static String getThaiMonth(String d){
		String thaiMonth1=new String("มกราคม");
		String thaiMonth2=new String("กุมภาพันธ์");
		String thaiMonth3=new String("มีนาคม");
		String thaiMonth4=new String("เมษายน");
		String thaiMonth5=new String("พฤษภาคม");
		String thaiMonth6=new String("มิถุนายน");
		String thaiMonth7=new String("กรกฎาคม");
		String thaiMonth8=new String("สิงหาคม");
		String thaiMonth9=new String("กันยายน");
		String thaiMonth10=new String("ตุลาคม");
		String thaiMonth11=new String("พฤษจิกายน");
		String thaiMonth12=new String("ธันวาคม");
		int tmonth = Integer.parseInt(d.substring(5,7));
		if(tmonth==1){
			return thaiMonth1;
		}
		else if(tmonth==2){
			return thaiMonth2;
		}
		else if(tmonth==3){
			return thaiMonth3;
		}
		else if(tmonth==4){
			return thaiMonth4;
		}
		else if(tmonth==5){
			return thaiMonth5;
		}
		else if(tmonth==6){
			return thaiMonth6;
		}
		else if(tmonth==7){
			return thaiMonth7;
		}
		else if(tmonth==8){
			return thaiMonth8;
		}
		else if(tmonth==9){
			return thaiMonth9;
		}
		else if(tmonth==10){
			return thaiMonth10;
		}
		else if(tmonth==11){
			return thaiMonth2;
		}
		else if(tmonth==12){
			return thaiMonth12;
		}
		return "error";
	}

	public static String getThaiDate(String d)throws Exception{	// param form 2003-02-25
	
		int tmonth = Integer.parseInt(d.substring(5,7));
		int tyear = Integer.parseInt(d.substring(0,4));
		int tdate= Integer.parseInt(d.substring(8));
		tyear = tyear+543;
		
		String thaiDate = new String(""+tdate+" "+getThaiMonth(d)+" "+tyear);
		return thaiDate;
	}
	
	public static String getDBDate(String d)throws Exception{	// param form 25/02/2545
		String date = d.substring(0,2);
		String month = d.substring(3,5);
		int year = Integer.parseInt(d.substring(6));
		year = year-543;
		String DBDate = year+"-"+month+"-"+date;
		return DBDate;
	}
} // end class myDate
