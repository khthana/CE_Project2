import java.io.*;
import java.net.*;
import java.security.*;
import java.util.*;
import javax.net.*;
import javax.net.ssl.*;
import javax.security.cert.X509Certificate;

public class Sender extends Thread{

  private KeyStore clientKeyStore;
  private KeyStore serverKeyStore;
  private SSLContext sslContext;
  static private SecureRandom secureRandom;
  private String certname;
  private String passphrase;
  private X509Certificate[] certs;
  SSLSocketFactory sf;
  SSLSocket socket;
  private InputStream inputstream;
  private OutputStream outputstream;

  File file;
  FileInputStream file_stream;
  String ip;
  byte[] temp;
  int port ;
  long file_size;
  int packet_size = 1024;

  public Sender(String Cert, String Passwd, File file_name, String ip_des,int port_des) {
    certname = Cert;
    passphrase = Passwd;
    file = file_name;
    ip = ip_des;
    port = port_des;
    temp = new byte[packet_size];
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
    try {
      file_stream = new FileInputStream(file);
    }
    catch (IOException e) {
      System.out.println("Error get file stream");
      e.printStackTrace();
    }
  }

  public void run() {
    try
    {
      setupClientKeyStore();
      setupServerKeystore();
      setupSSLContext();
      SetupFileStream();

      sf = sslContext.getSocketFactory();

      System.out.println("Trying to connect to IP :"+ip + " Port :"+port);
      socket = (SSLSocket) sf.createSocket(ip, port);

      inputstream = socket.getInputStream();
      outputstream = socket.getOutputStream();
      boolean z = true;

      do_write();

      outputstream.close();
      inputstream.close();
      //socket.close();

    }
    catch (GeneralSecurityException gse) {
      gse.printStackTrace();
    }
    catch (EOFException ie) {
      ie.printStackTrace();
    }
    catch (IOException ie) {
      ie.printStackTrace();
    }
  }
  private void do_write() {
    int line;
    int read = 0;

    try
    {

      while ( (line = file_stream.read(temp)) != -1)
      {
        read++;
        System.out.println("Sending");
        if (line < packet_size)
        {
          System.out.println("Last packet : "+line);
          byte[] z = new byte[line];
          for (int i = 0; i < line; i++)
            z[i] = temp[i];

          outputstream.write(z);
          outputstream.flush();
        }
        else
        {
          //System.out.println("Length :" + line);
          outputstream.write(temp);
          outputstream.flush();
        }
      }

      file_stream.close();
      System.out.println("Number of write " + read);
      System.out.println("Sending Completed!");
    }
    catch (IOException e)
    {
      System.out.print("Problem occured while sending");
      e.printStackTrace();
    }
  }

}