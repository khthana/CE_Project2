package loadFile;

import java.rmi.*;
import javax.ejb.*;
import java.io.*;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public class LoadFileAdvertiseBean implements SessionBean {
  private SessionContext sessionContext;
  String head = "";
  String abstracts = "";
  String textfield = "";
  String rootPath = "/pic";
  public void ejbCreate() {
  }
  public void ejbRemove() {
  }
  public void ejbActivate() {
  }
  public void ejbPassivate() {
  }
  public void setSessionContext(SessionContext context) {
    sessionContext = context;
  }
  public void loadFileAdvertise(String productId) {
  System.out.println("in loadfileadvertise");
  head = "";
  abstracts = "";
  textfield = "";
      try {
        File f = new File("d:/j2sdkee1.2.1/public_html"+rootPath+"/"+productId+"/"+productId+".txt");
        FileReader fr = new FileReader(f);
        BufferedReader br = new BufferedReader(fr);
        String s;
        while (!(s=br.readLine()).equals("<abstract>") && s!=null) {
          if (head.equals("")) head = convertMoreToTag(s); else
          head = head+"\n"+convertMoreToTag(s);
        }
        while (!(s=br.readLine()).equals("<textfield>") && s!=null) {
          if (abstracts.equals("")) abstracts = convertMoreToTag(s); else
          abstracts = abstracts+"\n"+convertMoreToTag(s);
        }
        while ((s=br.readLine())!=null) {
          if (textfield.equals("")) textfield = convertMoreToTag(s); else
          textfield = textfield+"\n"+convertMoreToTag(s);
        }
      } catch (Exception ex) {
        ex.printStackTrace();
      }
  }
  public String convertMoreToTag(String s) {
    int b = 0;
    while (s.indexOf("$lt;",0)!=-1) {
      int a = s.indexOf("$lt;",b);
      b = a;
      s = s.substring(0,a)+"<"+s.substring(a+4);
    }
     b = 0;
    while (s.indexOf("$gt;",0)!=-1) {
      int a = s.indexOf("$gt;",b);
      b = a;
      s = s.substring(0,a)+">"+s.substring(a+4);
    }
    return s;
  }
  public String getHead() { return head; }
  public String getAbstracts() { return abstracts; }
  public String getTextfield() { return textfield; }
}