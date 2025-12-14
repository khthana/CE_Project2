package WS;

public class JiaProxy implements WS.Jia {
  private boolean _useJNDI = true;
  private String _endpoint = null;
  private WS.Jia jia = null;
  
  public JiaProxy() {
    _initJiaProxy();
  }
  
  private void _initJiaProxy() {
  
  if (_useJNDI) {
    try{
      javax.naming.InitialContext ctx = new javax.naming.InitialContext();
      jia = ((WS.JiaService)ctx.lookup("java:comp/env/service/JiaService")).getJia();
      }
    catch (javax.naming.NamingException namingException) {}
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  if (jia == null) {
    try{
      jia = (new WS.JiaServiceLocator()).getJia();
      }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  if (jia != null) {
    if (_endpoint != null)
      ((javax.xml.rpc.Stub)jia)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    else
      _endpoint = (String)((javax.xml.rpc.Stub)jia)._getProperty("javax.xml.rpc.service.endpoint.address");
  }
  
}


public void useJNDI(boolean useJNDI) {
  _useJNDI = useJNDI;
  jia = null;
  
}

public String getEndpoint() {
  return _endpoint;
}

public void setEndpoint(String endpoint) {
  _endpoint = endpoint;
  if (jia != null)
    ((javax.xml.rpc.Stub)jia)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
  
}

public WS.Jia getJia() {
  if (jia == null)
    _initJiaProxy();
  return jia;
}

public java.lang.String getCourseAll() throws java.rmi.RemoteException{
  if (jia == null)
    _initJiaProxy();
  return jia.getCourseAll();
}

public boolean buyClass(int classID, java.lang.String email, java.lang.String receiveID) throws java.rmi.RemoteException{
  if (jia == null)
    _initJiaProxy();
  return jia.buyClass(classID, email, receiveID);
}

public boolean reservation(int classID, java.lang.String email, java.lang.String name, java.lang.String surname, java.lang.String phoneNo) throws java.rmi.RemoteException{
  if (jia == null)
    _initJiaProxy();
  return jia.reservation(classID, email, name, surname, phoneNo);
}

public java.lang.String getCourse(java.lang.String subject, int period) throws java.rmi.RemoteException{
  if (jia == null)
    _initJiaProxy();
  return jia.getCourse(subject, period);
}

public java.lang.String getCourseFromEmail(java.lang.String email) throws java.rmi.RemoteException{
  if (jia == null)
    _initJiaProxy();
  return jia.getCourseFromEmail(email);
}

public boolean cancel(int classID, java.lang.String email) throws java.rmi.RemoteException{
  if (jia == null)
    _initJiaProxy();
  return jia.cancel(classID, email);
}


}