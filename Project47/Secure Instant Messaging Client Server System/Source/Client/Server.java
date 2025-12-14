import java.io.*;
import java.net.*;
import java.security.*;
import java.util.*;
import javax.net.*;
import javax.net.ssl.*;
import javax.security.cert.X509Certificate;

public class Server /*implements Runnable*/extends Thread
{

  private KeyStore clientKeyStore;
  private KeyStore serverKeyStore;
  private SSLContext sslContext;
  static private SecureRandom secureRandom;
  String connectTo ;
  int portTo = 16002;
  private String certname ;
  private String passphrase;
  String ip;
  private SSLSession sess;
  private X509Certificate[] certs ;
  private String dn ;
  private String host;
  private String userID;
  private contact user_contact;
  SSLServerSocketFactory sf ;
  SSLServerSocket ss;
  public Server(String Cert,String Passwd,contact list)
  {
    certname = Cert;
    passphrase = Passwd ;
    user_contact = list;
    new Thread( this ).start();
  }

  private void setupClientKeyStore() throws GeneralSecurityException, IOException
  {
    clientKeyStore = KeyStore.getInstance( "JKS" );
    clientKeyStore.load( new FileInputStream( certname ),
                       passphrase.toCharArray() );
  }

  private void setupServerKeystore() throws GeneralSecurityException, IOException
  {
    serverKeyStore = KeyStore.getInstance( "JKS" );
    serverKeyStore.load( new FileInputStream( certname ),
                        passphrase.toCharArray() );
  }

  private void setupSSLContext() throws GeneralSecurityException, IOException
  {
    TrustManagerFactory tmf = TrustManagerFactory.getInstance( "SunX509" );
    tmf.init( clientKeyStore );

    KeyManagerFactory kmf = KeyManagerFactory.getInstance( "SunX509" );
    kmf.init( serverKeyStore, passphrase.toCharArray() );

    sslContext = SSLContext.getInstance( "TLS" );
    sslContext.init( kmf.getKeyManagers(),
                     tmf.getTrustManagers(),
                     secureRandom );
  }

  public void run() {
    try
    {
      setupClientKeyStore();
      setupServerKeystore();
      setupSSLContext();

      sf = sslContext.getServerSocketFactory();
      ss = (SSLServerSocket) sf.createServerSocket(portTo);

      // Require client authorization
      ss.setNeedClientAuth(true);

      System.out.println("Listening on port " + portTo + "...");

      while (true)
      {
        SSLSocket socket = (SSLSocket)ss.accept();
        ip = socket.getInetAddress().toString();
        ip = ip.substring(1, ip.length());
        System.out.println("Got connection from " + ip);

        sess = socket.getSession();
        host = sess.getPeerHost();
        certs = sess.getPeerCertificateChain();
        dn = certs[0].getSubjectDN().getName();
        userID = dn.substring(dn.indexOf("=") + 1, dn.indexOf(","));

        if(user_contact.find(Integer.parseInt(userID))>0)
        {
          System.out.println("Connecting to :" +userID);
          ChatPanel panel = new ChatPanel(certname,passphrase,ip, socket,userID);
        }
        else
        {
          System.out.println("This userID :" + userID + " isn't in contactlist");
          socket.close();
        }
        //ChatPanel panel = new ChatPanel(certname,passphrase,ip, socket,userID);

      }

    }
    catch (GeneralSecurityException gse) {
      gse.printStackTrace();
    }
    catch (EOFException ie) {
      System.out.println("Closingggggg");
    }
    catch (IOException ie) {
      ie.printStackTrace();
      System.out.println("Hello");
    }
    System.out.println("Server EXIT");
  }
  public void Close()
  {
    try
    {
      ss.close();
    }
    catch(IOException e)
    {
      e.printStackTrace();
    }
  }
}
