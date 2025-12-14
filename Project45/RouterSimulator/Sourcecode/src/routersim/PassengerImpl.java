package routersim;

import javax.crypto.*;
import javax.crypto.spec.*;
import java.security.spec.*;
import java.security.*;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */

public class PassengerImpl extends java.rmi.server.UnicastRemoteObject
          implements PassengerInt{
  Verifier v = new Verifier();
  public PassengerImpl() throws java.rmi.RemoteException
  {
    super();
  }
  public void SendPublicKey(PublicKey pub_key) throws java.rmi.RemoteException
  {
     v.SetPublicKey(pub_key);
     v.GenerateSecretkey();

  }
  public PublicKey ReceivePublicKey(String params) throws java.rmi.RemoteException
  {
    v.init(params);
    return v.GetPublicKey();
  }
  public void SendCiphertext(String ciphertext) throws java.rmi.RemoteException
  {

    String cleartext = v.Decryption(ciphertext);
    v.Buffer(cleartext);
  }
  public boolean VerifiePassword(String ciphertext) throws java.rmi.RemoteException
  {
    String cleartext = v.Decryption(ciphertext);
    return v.CheckPassword(cleartext);
  }
  public void Generatekey() throws java.rmi.RemoteException
  {
    //v.init();
  }

}