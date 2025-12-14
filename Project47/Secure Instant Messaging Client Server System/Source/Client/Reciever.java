import java.io.*;
import java.net.*;
import java.security.*;
import java.util.*;
import javax.net.*;
import javax.net.ssl.*;
import javax.security.cert.X509Certificate;

public class Reciever extends Thread {
  //private int port;
  // private Set connections = new HashSet();
  // private Set postings = new HashSet();
  private KeyStore clientKeyStore;
  private KeyStore serverKeyStore;
  private SSLContext sslContext;
  static private SecureRandom secureRandom;
  private String certname;
  private String passphrase;
  private X509Certificate[] certs;
  SSLServerSocketFactory sf;
  InputStream inputstream;
  OutputStream outputstream;

  int packet_size = 1024;
  byte[] temp;
  File file;
  long file_size;
  FileOutputStream fileout;
  boolean finished = false;
  String ip;
  int port_get ;
  ChatPanel chat;

  public Reciever(String Cert, String Passwd, String file_name,
                  String ip_connected ,ChatPanel panel ,int port_open) {
    certname = Cert;
    passphrase = Passwd;
    ip = ip_connected;
    file = new File(file_name);
    temp = new byte[packet_size];
    chat = panel;
    port_get = port_open;
    new Thread(this).start();
  }

  private void setupClientKeyStore() throws GeneralSecurityException,
      IOException {
    clientKeyStore = KeyStore.getInstance("JKS");
    clientKeyStore.load(new FileInputStream(certname),
                        passphrase.toCharArray());
  }

  private void setupServerKeystore() throws GeneralSecurityException,
      IOException {
    serverKeyStore = KeyStore.getInstance("JKS");
    serverKeyStore.load(new FileInputStream(certname),
                        passphrase.toCharArray());
  }

  private void setupSSLContext() throws GeneralSecurityException, IOException {
    TrustManagerFactory tmf = TrustManagerFactory.getInstance("SunX509");
    tmf.init(clientKeyStore);

    KeyManagerFactory kmf = KeyManagerFactory.getInstance("SunX509");
    kmf.init(serverKeyStore, passphrase.toCharArray());

    sslContext = SSLContext.getInstance("TLS");
    sslContext.init(kmf.getKeyManagers(),
                    tmf.getTrustManagers(),
                    secureRandom);
  }

  private void SetupFileStream() {
    file_size = file.length();
    try
    {
      fileout = new FileOutputStream(file);
    }
    catch (IOException e)
    {
      System.out.println("Error get file stream");
    }
  }


  public void run() {
    try {
      setupClientKeyStore();
      setupServerKeystore();
      setupSSLContext();
      SetupFileStream();

      sf = sslContext.getServerSocketFactory();
      SSLServerSocket ss = (SSLServerSocket) sf.createServerSocket(port_get);
      System.out.println("Recieving Port on : " + port_get );

      // Require client authorization
      ss.setNeedClientAuth(true);


      boolean z = true;
      String incoming_ip;
      SSLSocket socket = (SSLSocket) ss.accept();;

      while (z)
      {
        incoming_ip = socket.getInetAddress().getHostAddress();
        //ip = socket.getInetAddress().toString();
        // ip = ip.substring(1, ip.length());
        System.out.println("Got connection from " + incoming_ip);
        inputstream = socket.getInputStream();
        outputstream = socket.getOutputStream();
        do_recieve();
        inputstream.close();
        outputstream.close();
        socket.close();
        System.out.println("Closing socket");
        System.out.println("----------------------------------------");

      }

      //z = false;
    }
    catch (GeneralSecurityException gse) {
      gse.printStackTrace();
      chat.SendFailedFile();
    }
    catch (EOFException ie) {
      ie.printStackTrace();
      chat.SendFailedFile();
    }
    catch (IOException ie) {
      ie.printStackTrace();
      //chat.SendFailedFile();

    }
  }

  private void do_recieve() {
    int readsize=0;
    int read = 0;
    System.out.println("-----------------Recieving Process----------------------");

    try {
      while (!finished) {
        int len = inputstream.read(temp);
        read++;
        //System.out.println("temp len :" + len);

        if (len < packet_size && len >0) {
          System.out.println("Last packet");
          byte[] a = new byte[len];

          for (int i = 0; i < len; i++)
            a[i] = temp[i];
          //String y = new String(a);
          //System.out.println(y.length());
          fileout.write(a);
          finished = true;
          readsize +=len;

        }
        else if(len == packet_size){
          readsize +=len;
          //String y = new String(temp);
          //System.out.println(y.length());
          fileout.write(temp);
        }
        else finished = true;


      }
      chat.SendCompleteFile();
      fileout.close();
      System.out.println("Recieving Completed!");
      System.out.println("-----------------Finished Recieving Process----------------------");

    }
    catch (IOException e) {
      System.out.println("sending error");
      chat.SendFailedFile();
    }
  }

  public int get_Port()
  {
    return port_get;
  }
}