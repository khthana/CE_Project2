import java.io.*;
import java.util.*;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2000
 * Company:
 * @author
 * @version 1.0
 */

public class ConfigBean
{
  //=================================================================
  //    pineconfig pattern
  //    key : String[]
  //    if String[].length == 0 then not have any key in entry.
  //    To Use
  //    getValue(String key) return array of String (etc. smtp-server,nntp-server
  //    if array length of return value == 0 then no value to setted
  Hashtable pineconfig = new Hashtable();
  //=================================================================


  /*public ConfigBean(String filename)
  {
    try
    {
      FileReader fs = new FileReader(filename);
      StreamTokenizer st = new StreamTokenizer(fs);
      st.resetSyntax();
      st.eolIsSignificant(false);

      st.wordChars('!','!');
      st.wordChars('$','&');
      st.wordChars('(','+');
      st.wordChars('-','/');
      st.wordChars('0','9');
      st.wordChars(':',';');
      st.wordChars('<','<');
      st.wordChars('>','>');
      st.wordChars('?','@');
      st.wordChars('A','Z');
      st.wordChars('[',']');
      st.wordChars('_','_');
      st.wordChars('a','z');
      st.wordChars('{','~');
      st.wordChars(' ',' ');
      //st.wordChars(',',',');

      st.commentChar('#');
      String[] tmp;
      int count = 0;

      for (int ch = st.nextToken(); ch != st.TT_EOF ; ch = st.nextToken())
      {
        if (ch == '=')
        {
          count++;
        }
        if (ch == st.TT_WORD)
        {
          count++;
        }
      }
      tmp = new String[count];
      fs.close();

      fs = new FileReader(filename);
      st = new StreamTokenizer(fs);
      st.resetSyntax();
      st.eolIsSignificant(false);

      st.wordChars('!','!');
      st.wordChars('$','&');
      st.wordChars('(','+');
      st.wordChars('-','/');
      st.wordChars('0','9');
      st.wordChars(':',';');
      st.wordChars('<','<');
      st.wordChars('>','>');
      st.wordChars('?','@');
      st.wordChars('A','Z');
      st.wordChars('[',']');
      st.wordChars('_','_');
      st.wordChars('a','z');
      st.wordChars('{','~');
      st.wordChars(' ',' ');
      //st.wordChars(',',',');

      st.commentChar('#');
      count = 0;
      for (int ch = st.nextToken(); ch != st.TT_EOF ; ch = st.nextToken())
      {
        if (ch == '=')
        {
          tmp[count] =  "=";
          count++;
        }
        if (ch == st.TT_WORD)
        {
          tmp[count] = st.sval;
          count++;
        }
      }
      //====================================================
      //    Initialize for parse variable
      int tailptr = tmp.length - 1;
      int headptr = tmp.length - 1;
      String[] value;

      while (headptr > 0)
      {
        while (tmp[headptr] != "=")
        {
          headptr--;
        }
        headptr--;

        value = new String[tailptr - headptr - 1];
        for (int i = 0; i < value.length; i++)
        {
          value[i] = tmp[headptr + i + 2];
        }
        pineconfig.put(tmp[headptr],value);
        headptr--;
        tailptr = headptr;
      }
      //====================================================
    }
    catch (Exception ex)
    {
      System.out.println("Constructor Config Error!");
      ex.printStackTrace();
    }
  }*/

  public String[] getValue(String key)
  {
    String[] temp = (String[])pineconfig.get(key);
    if (temp.length == 0)
    {
      return null;
    }
    else
    {
      return temp;
    }
  }
  public ConfigBean(String dataStream)
  {
    try
    {
      //FileReader fs = new FileReader(filename);
      StringReader sr = new StringReader(dataStream);
      //StreamTokenizer st = new StreamTokenizer(fs);
      StreamTokenizer st = new StreamTokenizer(sr);
      st.resetSyntax();
      st.eolIsSignificant(false);

      st.wordChars('!','!');
      st.wordChars('$','&');
      st.wordChars('(','+');
      st.wordChars('-','/');
      st.wordChars('0','9');
      st.wordChars(':',';');
      st.wordChars('<','<');
      st.wordChars('>','>');
      st.wordChars('?','@');
      st.wordChars('A','Z');
      st.wordChars('[',']');
      st.wordChars('_','_');
      st.wordChars('a','z');
      st.wordChars('{','~');
      st.wordChars(' ',' ');
      //st.wordChars(',',',');

      st.commentChar('#');
      String[] tmp;
      int count = 0;

      for (int ch = st.nextToken(); ch != st.TT_EOF ; ch = st.nextToken())
      {
        if (ch == '=')
        {
          count++;
        }
        if (ch == st.TT_WORD)
        {
          count++;
        }
      }
      tmp = new String[count];
      //fs.close();
      sr.close();

      //fs = new FileReader(filename);
      sr = new StringReader(dataStream);
      //st = new StreamTokenizer(fs);
      st = new StreamTokenizer(sr);
      st.resetSyntax();
      st.eolIsSignificant(false);

      st.wordChars('!','!');
      st.wordChars('$','&');
      st.wordChars('(','+');
      st.wordChars('-','/');
      st.wordChars('0','9');
      st.wordChars(':',';');
      st.wordChars('<','<');
      st.wordChars('>','>');
      st.wordChars('?','@');
      st.wordChars('A','Z');
      st.wordChars('[',']');
      st.wordChars('_','_');
      st.wordChars('a','z');
      st.wordChars('{','~');
      st.wordChars(' ',' ');
      //st.wordChars(',',',');

      st.commentChar('#');
      count = 0;
      for (int ch = st.nextToken(); ch != st.TT_EOF ; ch = st.nextToken())
      {
        if (ch == '=')
        {
          tmp[count] =  "=";
          count++;
        }
        if (ch == st.TT_WORD)
        {
          tmp[count] = st.sval;
          count++;
        }
      }
      //====================================================
      //    Initialize for parse variable
      int tailptr = tmp.length - 1;
      int headptr = tmp.length - 1;
      String[] value;

      while (headptr > 0)
      {
        while (tmp[headptr] != "=")
        {
          headptr--;
        }
        headptr--;

        value = new String[tailptr - headptr - 1];
        for (int i = 0; i < value.length; i++)
        {
          value[i] = tmp[headptr + i + 2];
        }
        pineconfig.put(tmp[headptr],value);
        headptr--;
        tailptr = headptr;
      }
      //====================================================
    }
    catch (Exception ex)
    {
      System.out.println("Constructor Config Error!");
      ex.printStackTrace();
    }
  
  }
  public String[] getAllkeys()
  {
    String[] tmp = new String[pineconfig.size()];
    int i=0;
    for (Enumeration enum=pineconfig.keys();enum.hasMoreElements();i++) 
    {
      tmp[i]=(String)enum.nextElement();
    }
    return tmp;
  }
}