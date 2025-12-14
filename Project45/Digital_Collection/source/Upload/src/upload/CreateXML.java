package upload;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;
import java.io.*;
import java.lang.String;
import java.util.*;
import java.text.*;

public class CreateXML {

  CreateXML() {
  }

 public void WriteXML(MultipartRequest multi,String cate,String fileName,String realpath) throws IOException
  {
    //  contenttype author email  description

    int i;
    //File f1 = new File("C:/Documents and Settings/Por/Desktop/ly/temp/"+fileName);
    File f1 = new File(realpath+"temp/"+fileName);
    long size = f1.length();


    Date today = new Date();
    DateFormat dateFmt;
    String dateText;
    String timeText;
    dateFmt = DateFormat.getDateInstance(DateFormat.LONG,new Locale("en","US"));
    dateText = dateFmt.format(today);
    dateFmt = DateFormat.getTimeInstance(DateFormat.LONG,new Locale("en","US"));
    timeText = dateFmt.format(today);

    String str = new String();
    byte buffer[] =  new byte[500];

    //FileOutputStream outFile = new FileOutputStream("C:/Documents and Settings/Por/Desktop/ly/save/"+fileName.substring(0,fileName.indexOf(".")) +".xml",true);
    FileOutputStream outFile = new FileOutputStream(realpath+"save/"+cate+"/"+fileName.substring(0,fileName.indexOf(".")) +".xml");

    str = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n"+
          "<!DOCTYPE Multimedia  SYSTEM \"E:\\Project\\Upload\\webapp\\save\\Multimedia.dtd\">\n"+
          "<Multimedia>\n<Title> "+multi.getParameter("title")+"</Title>\n"+
          "<FileName> "+fileName+"</FileName>\n"+
          "<FileType> "+multi.getContentType("filename")+"</FileType>\n"+
          "<Category> "+cate+"</Category>\n"+
          "<Size> "+Long.toString(size)+"</Size>\n"+
          "<Date> "+dateText+"</Date>\n"+
          "<Time> "+timeText+"</Time>\n";
    for (i=0;i<str.length();i++) buffer[i] = (byte)str.charAt(i);
    outFile.write(buffer,0,str.length());

    str = "<Description>"+multi.getParameter("description")+"</Description>\n";
    int j = str.length();
    byte buff2[] = new byte[j];
    for (i=0;i<j;i++) buff2[i] = (byte)str.charAt(i);
    outFile.write(buff2,0,j);

    str = "<Author>"+multi.getParameter("author")+"</Author>\n"+
          "<Email>"+multi.getParameter("email")+"</Email>\n</Multimedia>";
    for (i=0;i<str.length();i++) buffer[i] = (byte)str.charAt(i);
    outFile.write(buffer,0,str.length());

    outFile.close();
  }
}