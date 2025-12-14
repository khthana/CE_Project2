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

public interface PassengerInt extends java.rmi.Remote
{
    public void SendPublicKey(PublicKey pub_key) throws java.rmi.RemoteException;
    public PublicKey ReceivePublicKey(String params) throws java.rmi.RemoteException;
    public void SendCiphertext(String ciphertext) throws java.rmi.RemoteException;
    public boolean VerifiePassword(String ciphertext) throws java.rmi.RemoteException;
    public void Generatekey() throws java.rmi.RemoteException;
}