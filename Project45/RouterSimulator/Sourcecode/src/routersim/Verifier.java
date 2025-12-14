package routersim;

import javax.crypto.*;
import javax.crypto.spec.*;
import java.security.spec.*;
import java.security.*;
import java.io.*;
import java.util.*;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribedarey
 * @version 1.0
 */

public class Verifier implements java.io.Serializable {
  final public String password = "password.dat"; //password file
  private PrivateKey privatekey;
  private PublicKey publickey;
  private SecretKey secretkey;
  static String file ="";
  static int count =0;
  static String admin="";
  static String user="";
  KeyManager k = new KeyManager();
  public Verifier() {  }
  public void init(String params)
  {
    k.GenerateKey(params);
    SetPublickey(k.GetPublicKey());
    SetPrivatekey(k.GetPrivatekey());
  }
  public void GenerateSecretkey()
  {
    k.GenerateSecretKey(GetPublicKey(),GetPrivatekey());
    SetSecretKey(k.GetSecretKey());
  }
  public void SetPrivatekey(PrivateKey pri_key)
  {
    privatekey = pri_key;
  }
  public PrivateKey GetPrivatekey()
  {
     return privatekey ;
  }
  public void SetPublickey(PublicKey pub_key)
  {
    publickey = pub_key;
  }
  public PublicKey GetPublicKey()
  {
    return publickey;
  }
  public void SetSecretKey(SecretKey sec_key)
  {
    secretkey = sec_key;
  }
  public SecretKey GetSecretKey()
  {
    return secretkey ;
  }
  public void SetPublicKey(PublicKey pub_key)
  {
    publickey = pub_key;
  }

  public String Encryption(String cleartext)
  {
    DesEncrypter des = new  DesEncrypter(GetSecretKey());
    String ciphertext = des.encrypt(cleartext);
    return ciphertext;
  }
  public String Decryption(String ciphertext)
  {
    DesEncrypter des = new  DesEncrypter(GetSecretKey());
    String cleartext = des.decrypt(ciphertext);
    return cleartext;
  }
  // save password to file
  public void SavePassword(String file)
  {
    try {

      FileWriter fout = new FileWriter( password );
      BufferedWriter bout = new BufferedWriter(fout);
      PrintWriter pout = new PrintWriter(bout);
      pout.print(file);
      pout.close();
    }
    catch(Exception e){
      e.printStackTrace();
    }
  }
  public void Buffer(String cleartext)
  {

    if(count==1)
    {
      user = cleartext;
    }
    if(count==0)
    {
      admin=cleartext;
    }
    count++;
    if(count==2)
    {
      count=0;
      file+="Admin  "+admin+"\n";
      file+="User   "+user+"\n";
      System.out.print("file :"+file+"\n");
      SavePassword(file);
      admin="";
      user="";
    }
  }
  // Check password, correct or incorrect
  public boolean CheckPassword(String pwd)
  {
    // open file to compare password between client and user
    boolean found = false;
    boolean empty = true;
    try{
      FileReader fin = new FileReader(password);
      BufferedReader bin = new BufferedReader(fin);
      String s;
      int linenum=0;

      //while not End of File
      while ((s = bin.readLine()) != null){
        empty = false;
        linenum++;
        StringTokenizer st = new StringTokenizer(s);
        // check admin's password
        if (s.startsWith("Admin")){
          if (st.hasMoreTokens()){
            String name = (String)st.nextToken();
            String old_pwd = (String)st.nextToken();
            if(pwd.equals(new String(old_pwd)))
            {
              found = true;
            } // end if
          }// end if
        } // end if
        // check user's password
        else if (s.startsWith("User")){
          if (st.hasMoreTokens()){
            String name = (String)st.nextToken();
            String old_pwd = (String)st.nextToken();
            if(pwd.equals(new String(old_pwd)))
            {
              found = true;
            } // end if
          }// end if
        } // end if
      } // end while
    } // end try
    catch (IOException exp){
      System.out.println("Error with File");
    }
    if(empty)
    {
    return true;
    }
    else
    {
      if(found)
      {
        return true;
      }
      else
        return false;
    }
  }
}