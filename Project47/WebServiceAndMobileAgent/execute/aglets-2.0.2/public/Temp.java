import java.io.*;
import javax.crypto.*;
import javax.crypto.spec.*;
import java.io.*;
import java.net.*;
import java.util.*;
import com.ibm.aglet.*;

public class Temp extends Aglet{
  static String algorithm="AES";
  public void out(String x){System.out.println(x);}
  public void run(){
    try{

    String data="BUT ONLY LOVE CAN SAY TRY AGAIN OR WALK AWAY BUT I BELIEVE FOR YOU AND ME THE SUN WILL SHINE ONE DAY";
    
    KeyGenerator keygen=KeyGenerator.getInstance(algorithm);
    SecretKey key=keygen.generateKey();
    MyCipher myCipher=new MyCipher();
//    out("PASSWORD:"+key);
    byte[] ENCRYPT=myCipher.encrypt(data,key);
    out("\n**********\n");
    System.out.write(ENCRYPT);
    out("\nSIZE: "+ENCRYPT.length+" bytes");
    out("\n**********\n");
    String DECRYPT=myCipher.decrypt(ENCRYPT,key);
    out(DECRYPT);
    out("\nSIZE: "+DECRYPT.length()+" bytes");
    out("\n**********\n");
    
    }catch(Exception e){out(""+e);}
  }
}