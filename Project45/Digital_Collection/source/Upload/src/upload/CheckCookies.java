package upload;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */

public class CheckCookies {

  public CheckCookies() {
  }

  public boolean IsCookies(HttpServletRequest req){
    try{
    Cookie[] cookies = req.getCookies();
    Cookie cookie = cookies[0];
    return true;
    }
    catch(NullPointerException e){
    return false;
    }
  }

  public String getCookieValue(Cookie[] cookies,String cookieName){
    for(int i=0; i<cookies.length; i++){
      Cookie cookie = cookies[i];
      if(cookieName.compareTo(cookie.getName())==0){
        return(cookie.getValue());
      }
    }
    return("null");
  }
}

