package routersim;

import javax.crypto.*;
import javax.crypto.spec.*;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

class DESService {

  public DESService() {
  }

  public byte[] Encryption(byte[] key, byte[] cleartext) {
    byte[] ciphertext = null;
    if (key.length == 8) {
      try {
        DESKeySpec desKeySpec = new DESKeySpec(key);
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
        SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
        Cipher desCipher = Cipher.getInstance("DES/ECB/PKCS5Padding");          // Create the cipher
        desCipher.init(Cipher.ENCRYPT_MODE, secretKey);                         // Initialize the cipher for encryption
        ciphertext = desCipher.doFinal(cleartext);
          }
      catch (Exception e) {
        System.out.println("Exception from DESService (Encryption) : " + e);
      }
      return ciphertext;
    }
    else {
       return null;//throw new CANException("DESSerice Exception in Encryption Method : Key length is invalid");
    }
  }

  public byte[] Decryption(byte[] key, byte[] ciphertext) {
    byte[] cleartext = null;
    if (key.length == 8) {
      try {
        DESKeySpec desKeySpec = new DESKeySpec(key);
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
        SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
        Cipher desCipher = Cipher.getInstance("DES/ECB/PKCS5Padding");          // Create the cipher
        desCipher.init(Cipher.DECRYPT_MODE, secretKey);                         // Initialize the same cipher for decryption
        cleartext = desCipher.doFinal(ciphertext);                              // Decrypt the ciphertext
      }
      catch (Exception e) {
        System.out.println("Exception from DESService (Decryption) : " + e);
      }
      return cleartext;
    }
    else {
      return null;//throw new CANException("DESSerice Exception in Decryption Method : Key length is invalid");
    }
  }
}