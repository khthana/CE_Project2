import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.net.*;
import java.security.*;
import java.util.*;
import javax.net.*;
import javax.net.ssl.*;
import javax.swing.*;
import javax.security.cert.X509Certificate;


//public class Client extends JFrame implements Runnable
public class Client
{
  /**
   * KeyStore for storing our public/private key pair
   */
  private KeyStore clientKeyStore;

  /**
   * KeyStore for storing the server's public key
   */
  private KeyStore serverKeyStore;

  /**
   * Used to generate a SocketFactory
   */
  private SSLContext sslContext;

  /**
   * Passphrase for accessing our authentication keystore
   */
  private String certname = "isagq";

  /**
   * Passphrase for accessing our authentication keystore
   */
  private String passphrase = "secure!";
  /**
   * A source of secure random numbers
   */
  static private SecureRandom secureRandom;
  ChatPanel chat;
  String connectTo;
  int portTo;
  SSLSocketFactory sf;
  SSLSocket socket;
  private SSLSession sess;
  private X509Certificate[] certs ;
  private String dn ;
  private String host;
  private String userID;

  private InputStream inputstream;
  private OutputStream outputstream;

   public Client(String host, int port,String Cert , String Passwd)
   {
     connectTo = host;
     portTo = port;
     certname = Cert;
     passphrase = Passwd;
     connect(connectTo, portTo);
     //chat = new ChatPanel(connectTo, (Socket) socket,userID);
   }

  private void setupServerKeystore() throws GeneralSecurityException, IOException {
    serverKeyStore = KeyStore.getInstance( "JKS" );
    serverKeyStore.load( new FileInputStream( certname ),
                        passphrase.toCharArray() );
  }

  private void setupClientKeyStore() throws GeneralSecurityException, IOException {
    clientKeyStore = KeyStore.getInstance( "JKS" );
    clientKeyStore.load( new FileInputStream( certname ),
                       passphrase.toCharArray() );
  }

  private void setupSSLContext() throws GeneralSecurityException, IOException {
    TrustManagerFactory tmf = TrustManagerFactory.getInstance( "SunX509" );
    tmf.init( serverKeyStore );

    KeyManagerFactory kmf = KeyManagerFactory.getInstance( "SunX509" );
    kmf.init( clientKeyStore, passphrase.toCharArray() );

    sslContext = SSLContext.getInstance( "TLS" );
    sslContext.init( kmf.getKeyManagers(),
                     tmf.getTrustManagers(),
                     secureRandom );

  }

  private void connect(String host, int port) {
    try
    {
      setupServerKeystore();
      setupClientKeyStore();
      setupSSLContext();

      sf = sslContext.getSocketFactory();
      socket = (SSLSocket) sf.createSocket(host, port);
      sess = socket.getSession();
      host = sess.getPeerHost();
      certs = sess.getPeerCertificateChain();
      dn = certs[0].getSubjectDN().getName();
      userID = dn.substring(dn.indexOf("=") + 1, dn.indexOf(","));

      inputstream = socket.getInputStream();
      outputstream = socket.getOutputStream();

    }
    catch (GeneralSecurityException gse)
    {
      gse.printStackTrace();
    }
    catch (IOException ie)
    {
      ie.printStackTrace();
    }
  }
  public String getUserIDConnected()
  {
    return userID;
  }
  public InputStream getInputStream()
  {
    return inputstream;
  }
  public OutputStream getOutputStream()
  {
    return outputstream;
  }
  public SSLSocket getSocket()
  {
    return socket;
  }
  public SSLSocketFactory getSocketFactory()
  {
    return sf;
  }
  public String get_Cert()
  {
    return certname;
  }
  public String get_Passwd()
  {
    return passphrase;
  }
/*
  public boolean ssl_write(byte[] input)
  {
    try
    {
      System.out.println("Try writing");
      outputstream.write(input);
      outputstream.flush();
      return true;
    }
    catch(IOException e)
    {
      System.out.println("Can't write");
      return false;
    }
  }

  public String ssl_read(byte[] head)
  {
    byte[] temp = new byte[512];
    byte[] header = new byte[7];
    int len;
    String msg;
    try
    {
      inputstream.read(temp);
      System.out.println(new String(temp));
      for(int i = 0 ; i < 7 ; i++)
      {
        header[i] = temp[i];
      }
      len = checkDataLength(header[3] , header[4]);
      byte[] data = new byte[len];

      for(int i= 0 ; i < 7 ; i++)
      {
        data[i] = temp[i+7];
      }

      msg = new String(data);
      return msg;
    }
    catch(IOException e)
    {
      System.out.println("Can't read");
      return "Can't read";
    }

  }

  private int checkDataLength(byte high , byte low)
  {
    int ms = (high & 0xff);
    int ls = (low & 0xff);
    if(ms <= 0) return ls;
    else if (ms >2) return (512-7);
    else return ms*ls;
  }
      */
}