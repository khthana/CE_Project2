package routersim;

import javax.crypto.*;
import javax.crypto.spec.*;
import java.security.spec.*;
import java.security.*;
import java.math.*;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */

public class KeyManager {
  private PrivateKey privatekey;
  private PublicKey publickey;
  private SecretKey secretkey;

  public KeyManager() {
    privatekey=null;
    publickey=null;
    secretkey=null;
    //GenerateKey();
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
  public static String genDhParams() {
    try {
      // Create the parameter generator for a 1024-bit DH key pair
      AlgorithmParameterGenerator paramGen = AlgorithmParameterGenerator.getInstance("DH");
      paramGen.init(512);

      // Generate the parameters
      AlgorithmParameters params = paramGen.generateParameters();
      DHParameterSpec dhSpec  = (DHParameterSpec)params.getParameterSpec(DHParameterSpec.class);

      // Return the three values in a string
      return ""+dhSpec.getP()+","+dhSpec.getG()+","+dhSpec.getL();
    } catch (NoSuchAlgorithmException e) {
    } catch (InvalidParameterSpecException e) {
    }
    return null;
  }
  public void GenerateKey(String str)
  {
    System.out.print("Generate key\n");
    String valuesInStr = str;
    String[] values = valuesInStr.split(",");
    System.out.print("param:  "+values);
    BigInteger p = new BigInteger(values[0]);
    BigInteger g = new BigInteger(values[1]);
    int l = Integer.parseInt(values[2]);

    try {
      // Use the values to generate a key pair
      KeyPairGenerator keyGen = KeyPairGenerator.getInstance("DH");
      DHParameterSpec dhSpec = new DHParameterSpec(p, g, l);
      keyGen.initialize(dhSpec);
      KeyPair keypair = keyGen.generateKeyPair();

      // Get the generated public and private keys
      SetPrivatekey(keypair.getPrivate());
      SetPublickey(keypair.getPublic());
    }
    catch (java.security.InvalidAlgorithmParameterException e) {
    } catch (java.security.NoSuchAlgorithmException e) {
    }
  }
  public void GenerateSecretKey(PublicKey pub_key,PrivateKey pri_key)
 {
   try {
     // Send the public key bytes to the other party...
     byte[] publicKeyBytes = pub_key.getEncoded();
     X509EncodedKeySpec x509KeySpec = new X509EncodedKeySpec(publicKeyBytes);
     KeyFactory keyFact = KeyFactory.getInstance("DH");
     pub_key = keyFact.generatePublic(x509KeySpec);

     // Prepare to generate the secret key with the private key and public key of the other party
     KeyAgreement ka = KeyAgreement.getInstance("DH");
     ka.init(pri_key);
     ka.doPhase(pub_key, true);

     // Specify the type of key to generate;
     // see e458 Listing All Available Symmetric Key Generators
     String algorithm = "DES";

     // Generate the secret key
     SecretKey secretKey1 = ka.generateSecret(algorithm);
     System.out.print("Secretkey:  "+secretKey1.getFormat());
     SetSecretKey(secretKey1);

   } catch (java.security.InvalidKeyException e) {
   } catch (java.security.spec.InvalidKeySpecException e) {
   } //catch (java.security.InvalidAlgorithmParameterException e) {
   //}
   catch (java.security.NoSuchAlgorithmException e) {
   }
   }// end try
 }