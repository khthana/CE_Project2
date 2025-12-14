<%@ page language="java" contentType="text/html;charset=UTF-8"
import = "java.io.IOException"
import = "java.io.FileInputStream"
import = "java.security.KeyStore"
import = "java.security.PrivateKey"
import = "java.security.KeyStoreException"
import = "java.security.NoSuchAlgorithmException"
import = "java.security.cert.X509Certificate"
import = "java.security.cert.CertificateException"
import = "java.util.List"
import = "java.util.ArrayList"
import = "java.security.KeyStore"
import = "java.security.PrivateKey"
import = "java.security.cert.X509Certificate"
import = "javax.xml.rpc.ServiceException"
import = "javax.xml.namespace.QName"
import = "javax.xml.rpc.handler.HandlerInfo"
import = "javax.xml.rpc.handler.HandlerRegistry"
import = "weblogic.webservice.context.WebServiceSession"
import = "weblogic.webservice.context.WebServiceContext"
import = "weblogic.webservice.core.handler.WSSEClientHandler"
import = "weblogic.webservice.WLMessageContext"
import = "weblogic.xml.security.wsse.Security"
import = "weblogic.xml.security.wsse.Token"
import = "weblogic.xml.security.wsse.BinarySecurityToken"
import = "weblogic.xml.security.wsse.SecurityElementFactory"
import = "weblogic.xml.security.specs.EncryptionSpec"
import = "weblogic.xml.security.specs.SignatureSpec"
import = "weblogic.jws.proxies.*"
%>
<%!
public static class KeyUtil {
    
    public static KeyStore loadKeystore(String filename, String password)
    throws KeyStoreException, IOException, NoSuchAlgorithmException, CertificateException
    {
        final KeyStore ks = KeyStore.getInstance("JKS");
        ks.load(new FileInputStream(filename), password.toCharArray());
        return ks;
    }
  
    public static PrivateKey getPrivateKey(String alias, String password, KeyStore keystore)
    throws Exception 
    {
        PrivateKey result =(PrivateKey) keystore.getKey(alias, password.toCharArray());
        return result;
    }
  
    public static X509Certificate getCertificate(String alias, KeyStore keystore)
    throws Exception 
    {
        X509Certificate result = (X509Certificate) keystore.getCertificate(alias);
        return result;
    }  

}
%>
<%  
//service's variable
final String sfname="test";
final String slname="test";
final String spackage="box - meduim";
final String s_add="test";
final String dfname="test";
final String dlname="test";
final String d_add="test";
final int dphone=1112;
final int sphone=1113;
//key  
final String CLIENT_KEYSTORE = "C:\\samples_client.jks";
final String KEYSTORE_PASS = "password";
final String KEY_ALIAS = "client1";
final String SERVER_KEY_ALIAS = "mycompany";
final String KEY_PASSWORD = "password";
try
{
    final KeyStore keystore = KeyUtil.loadKeystore(CLIENT_KEYSTORE, KEYSTORE_PASS);           
               
    Service myservice = new Service_Impl("http://localhost:7001/projectWeb/orderservice/service.jws?WSDL=");

    WebServiceContext context = myservice.context();
    WebServiceSession WSsession = context.getSession();
   
    PrivateKey clientprivate   = KeyUtil.getPrivateKey(KEY_ALIAS, KEY_PASSWORD, keystore);
    X509Certificate clientcert = KeyUtil.getCertificate(KEY_ALIAS, keystore);
    X509Certificate servercert = KeyUtil.getCertificate(SERVER_KEY_ALIAS, keystore);

    SecurityElementFactory factory = SecurityElementFactory.getDefaultFactory();
    
    Token client_x509token = factory.createToken(clientcert, clientprivate);
    Token x509token = factory.createToken(clientcert, clientprivate);

    EncryptionSpec encSpec = EncryptionSpec.getDefaultSpec();
    SignatureSpec sigSpec = SignatureSpec.getDefaultSpec();

    Token serverToken = factory.createToken(servercert, null);

    Security security = factory.createSecurity(null);

    //encryption client to server
    security.addEncryption(serverToken, encSpec);
    
    //signature 2 ways
    security.addSignature(x509token, sigSpec);
    security.addToken(x509token);
        
    ServiceSoap msg = myservice.getserviceSoap();

    context.getSession().setAttribute(WSSEClientHandler.REQUEST_SECURITY, security);
       
    WSsession.setAttribute(WSSEClientHandler.KEY_ATTRIBUTE, clientprivate);

    int i=msg.addorder(sfname,slname,spackage,s_add,dfname,dlname,d_add,sphone,dphone);

    System.out.println(i);
}
catch(Exception e)
{
    System.out.println("-------------------------------");
    e.printStackTrace();
}
%>
