import java.io.*;
import java.util.*;

/**
 * Title:        Address Book
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:      KMITL
 * @author Peerapong Charoenpong
 * @version 1.0
 * To Use
 * Invoke getValue(String key) method
 * Return value is String[]
 * if Return value == null because it haven't data
 */

public class AddressBookBean
{
  Hashtable addressbook = new Hashtable();
  //public AddressBookBean(String filename)
  public AddressBookBean(String stringdata)
  {
    try
    {
      //FileReader fr = new FileReader(filename);
      StringReader fr = new StringReader(stringdata);
      StreamTokenizer st = new StreamTokenizer(fr);
      st.resetSyntax();
      st.eolIsSignificant(true);

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

      st.commentChar('#');
      st.wordChars(',',',');

      int token = st.nextToken();
      String temp = "";
      while (token != StreamTokenizer.TT_EOF)
      {
        if ((st.ttype == StreamTokenizer.TT_WORD)
             && (!temp.equals(""))&& (st.sval.startsWith("   ")))
        {
          temp = temp + st.sval.trim();
          if ((token = st.nextToken()) == StreamTokenizer.TT_EOF)
          {
            break;
          }
        }
        else
        {
          //process String
          if (!temp.equals(""))
          {
            // actual process parse String
            parse2Hashtable(temp);
          }
          temp = "";
        }
        while (token != StreamTokenizer.TT_EOL && token != StreamTokenizer.TT_EOF)
        {
          switch (token)
          {
            case StreamTokenizer.TT_WORD :
              if (!st.sval.startsWith("   "))
              {
                temp = temp + st.sval;
              }
              break;
            case '\t' :
              temp = temp + "\t";
              break;
          }
          token = st.nextToken();
        }
        token = st.nextToken();
      }
      if (!temp.equals(""))
      {
        //process String again
        //catch survive data
        parse2Hashtable(temp);
      }
      fr.close();
    }
    catch (Exception ex)
    {
      System.out.println("Catch Exception in Constructor AddressBook");
    }
  }
  public void parse2Hashtable(String temp)
  {
    int index = 0;
    String[] data = new String[5];
    while (temp.length() != 0)
    {
      if (temp.indexOf("\t") != -1)
      {
        data[index] = temp.substring(0,temp.indexOf("\t"));
        if ((index == 2) && (data[index].startsWith("(")) && (data[index].endsWith(")"))
              && (data[index].indexOf("@") != -1))
        {
          data[index] = data[index].substring(1,data[index].length()-1);
        }
         temp = temp.substring(temp.indexOf("\t") + 1 ,temp.length());
        index++;
      }
      else
      {
        data[index] = temp.substring(0,temp.length());
        if ((index == 2) && (data[index].startsWith("(")) && (data[index].endsWith(")"))
              && (data[index].indexOf("@") != -1))
        {
          data[index] = data[index].substring(1,data[index].length()-1);
        }

        temp = "";
      }
    }
    if (!data[0].equals(""))
    {
      putValue(data[0],data);
    }
  }
  public String[] getValue(String key)
  {
    return (String[])addressbook.get(key);
  }
  public void putValue(String key,Object obj)
  {
    addressbook.put(key,obj);
  }
  public String getFullname(String key)
  {
    String[] temp = (String[])addressbook.get(key);
    if (temp[1] == null)
    {
      return "";
    }
    else
    {
      return temp[1];
    }
  }
  public String getFCC(String key)
  {
    String[] temp = (String[])addressbook.get(key);
    if (temp[3] == null)
    {
      return "";
    }
    else
    {
      return temp[3];
    }
  }
  public String getComment(String key)
  {
    String[] temp = (String[])addressbook.get(key);
    if (temp[4] == null)
    {
      return "";
    }
    else
    {
      return temp[4];
    }
  }
  public String getEmailAddress(String key)
  {
    String[] temp = (String[])addressbook.get(key);
    if (temp[2] == null)
    {
      return "";
    }
    else
    {
      return temp[2];
    }
  }
  public Enumeration getAllkey()
  {
    return addressbook.keys();
  }
  public String[] listNicknames()
  {
    String[] nicks=new String[getAddressBookSize()];
    int i=0;
    for (Enumeration enum=addressbook.keys();enum.hasMoreElements();i++) 
    {
      nicks[i]=(String)enum.nextElement();
    }
    return nicks;
  }//listNicknames

  public boolean isAvailable(String key)
  {
    return addressbook.containsKey(key);
  }
  public int getAddressBookSize()
  {
    return addressbook.size();
  }
  public void setFullname(String key,String fullname)
  {
  }
  public void setFCC(String key,String fcc)
  {
  }
  public void setEmailAddress(String key,String address)
  {
  }
  public void setComment(String key,String comment)
  {
  }
  public String ToRightPattern(String nickname,String fullname,String email,String fcc,String comment)
  {
    String tmp;
    tmp = nickname.trim() + "t";         //nickname<TAB>
    if (fullname.trim().equals("")) 
    {
      tmp = tmp + "\t";
    }
    else
    {
      tmp = tmp + fullname.trim() + "\t";
    }//end of nickname<TAB>fullname<TAB>
    //==================================================================================
    //    Special Case for E-mail Address
    if (email.trim().equals("")) 
    {
      tmp = tmp + "\t";
    }
    else 
    {
      if (email.indexOf(",") == -1) 
      {
        tmp = tmp + email.trim() + "\t";
      }
      else 
      {
        tmp = tmp + "(" + email.trim() + ")\t";
      }
    }//end of nickname<TAB>fullname<TAB>email<TAB>
    //==================================================================================
    if (fcc.trim().equals("")) 
    {
      tmp = tmp + "\t";
    }
    else 
    {
      tmp = tmp + fcc.trim() + "\t";
    }//end of nickname<TAB>fullname<TAB>email<TAB>
    if (comment.trim().equals("")) 
    {
      tmp = tmp + "\t";
    }
    else 
    {
      tmp = tmp + comment.trim() + "\t";
    }//end of nickname<TAB>fullname<TAB>email<TAB>
    return tmp;
  }
}
