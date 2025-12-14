
import java.awt.*;
import java.awt.event.*;
import java.applet.*;
import java.io.*;
import java.net.*;
import java.security.*;
import java.util.*;
import javax.net.*;
import javax.net.ssl.*;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import javax.security.cert.X509Certificate;


public class SSLConnection
{
        private	OutputStream outputstream;
        private	OutputStreamWriter outputstreamwriter;
        private	BufferedWriter bufferedwriter;

        private InputStream inputstream ;
        private InputStreamReader inputstreamreader ;
        private BufferedReader bufferedreader;

        private byte[] input ;

        private	SSLSession sess;
        private String	host;
        private int	port;
        private X509Certificate[] certs ;
        private String dn ;

        private String client_ip;

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
        private	SSLSocketFactory sf ;
        private	SSLSocket socket ;

  /**
   * A list of visible postings
   */
        private Set postings = new HashSet();

  /**
   * The font used for all postings
   */
        private Font font = new Font( "TimesRoman", Font.PLAIN, 18 );


  /**
   * Passphrase for accessing our authentication keystore
   */
        private String certname /*= "isagq"*/;

  /**
   * Passphrase for accessing our authentication keystore
   */
        private String passphrase /*= "secure!"*/;

  /**
   * A source of secure random numbers
   */
        static private SecureRandom secureRandom;
        boolean isConnected = false;

        public SSLConnection( String host, int port ,String cert_name,String pass_phrase)  throws Exception
        {
          input = new byte[512];
          certname = cert_name;
          passphrase = pass_phrase;
          System.out.println("Wait while secure random numbers are initialized....");
          secureRandom = new SecureRandom();
          secureRandom.nextInt();
          System.out.println("Done.");

          InetAddress local = InetAddress.getLocalHost();
          client_ip = local.getHostAddress();

          System.out.println("Connecting....");
          connect(host, port);
        }

        private void setupServerKeystore() throws GeneralSecurityException, IOException
        {
          serverKeyStore = KeyStore.getInstance("JKS");
          // serverKeyStore.load( new FileInputStream( "isagq" ),
          //                 "secure!".toCharArray() );
          serverKeyStore.load(new FileInputStream(certname),
                              passphrase.toCharArray());

        }

        private void setupClientKeyStore() throws GeneralSecurityException, IOException
        {
          clientKeyStore = KeyStore.getInstance("JKS");
          //  clientKeyStore.load( new FileInputStream( "isagq" ),
          //                 passphrase.toCharArray() );
          clientKeyStore.load(new FileInputStream(certname),
                              passphrase.toCharArray());

        }

        private void setupSSLContext() throws GeneralSecurityException, IOException
        {
          TrustManagerFactory tmf = TrustManagerFactory.getInstance("SunX509");
          tmf.init(serverKeyStore);

          KeyManagerFactory kmf = KeyManagerFactory.getInstance("SunX509");
          kmf.init(clientKeyStore, passphrase.toCharArray());

          sslContext = SSLContext.getInstance("TLS");
          sslContext.init(kmf.getKeyManagers(), tmf.getTrustManagers(), secureRandom);
        }

        private void connect( String host, int port )
        {
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

            inputstream = socket.getInputStream();
            inputstreamreader = new InputStreamReader(inputstream);
            bufferedreader = new BufferedReader(inputstreamreader);

            outputstream = socket.getOutputStream();
            isConnected = true;
            //outputstreamwriter = new OutputStreamWriter(outputstream);
            //bufferedwriter = new BufferedWriter(outputstreamwriter);
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

        public void ssl_write(byte[] output) throws IOException
        {
          outputstream.write(output);
          outputstream.flush();
        }

        public String ssl_read(byte[] header) throws IOException
        {
          byte[] temp;
          int i, j;
          int len = inputstream.read(input);
          //header = input;
          /*
          for(i = 0 ;i < 20 ; i++)
          System.out.println("input["+i+"]"+ header[i] + "\n" );
           */
          for (i = 0; i < 7; i++)
          {
            header[i] = input[i];
            //System.out.println("input["+i+"]"+ header[i] + "\n" );
          }

          for (i = 0; i < 512 - 7; i++)
          {
            //System.out.println("start "+input[i+7] + "\n");
            if (input[i + 7] == 0)
              break;
          }
          //System.out.println("index ; "+i);
          if (i != 0)
          {
            temp = new byte[i];

            for (j = 0; j < i; j++)
            {
              temp[j] = input[j + 7];
            }

            String msg;
            if (temp[0] == (byte) '$')
              msg = "Not Found";
            else
              msg = new String(temp);

            //System.out.println("len of string :" + msg);
            return msg;
          }
          else
          {
            return "Finish";
          }

        }

        public String get_client_ip()
        {
          return client_ip;
        }
        public void disconnect() throws IOException
        {
          socket.close();
        }
        public boolean isConnected()
        {
          return isConnected;
        }
}
