import java.io.*;
import javax.crypto.*;
import javax.crypto.spec.*;
import java.security.SignatureException;
import java.security.NoSuchAlgorithmException;
import java.security.InvalidKeyException;
import java.security.InvalidAlgorithmParameterException;
public class MyCipher{
  static String algorithm="AES";
  public static void out(String x){System.out.print(x);}

  public String decrypt(byte[] data,SecretKey key){
    try{
      String output="";
      Cipher cipher = Cipher.getInstance(algorithm);
      cipher.init(Cipher.DECRYPT_MODE,key);
      byte[] DECRYPT=cipher.doFinal(data);
      for(int i=0;i<DECRYPT.length;i++)
        output+=(char)(DECRYPT[i]);
      return output;
    }catch(Exception e){out(""+e);}
    return null;
  }
  public byte[] encrypt(String data,SecretKey key){
    try{
      Cipher cipher = Cipher.getInstance(algorithm);
      cipher.init(Cipher.ENCRYPT_MODE,key);
      return cipher.doFinal(data.getBytes());
    }catch(Exception e){out(""+e);}
    return null;
  }
  public static void main(String[] args) throws Exception {
    String data="BUT ONLY LOVE CAN SAY TRY AGAIN OR WALK AWAY BUT I BELIEVE FOR YOU AND ME THE SUN WILL SHINE ONE DAY";
    KeyGenerator keygen=KeyGenerator.getInstance(algorithm);
    SecretKey key=keygen.generateKey();

    ObjectOutputStream oos=new ObjectOutputStream(new FileOutputStream(new File("c:/temp-oos.txt")));
    oos.writeObject(key);
    oos.close();

    MyCipher myCipher=new MyCipher();
    byte[] ENCRYPT=myCipher.encrypt(data,key);
    out("\n**********\n");
    System.out.write(ENCRYPT);
    out("\nSIZE: "+ENCRYPT.length+" bytes");
    out("\n**********\n");

    ObjectInputStream ois=new ObjectInputStream(new FileInputStream(new File("c:/temp-oos.txt")));
    key=(SecretKey)ois.readObject();

    String DECRYPT=myCipher.decrypt(ENCRYPT,key);
    out(DECRYPT);
    out("\nSIZE: "+DECRYPT.length()+" bytes");
    out("\n**********\n");
  }
}