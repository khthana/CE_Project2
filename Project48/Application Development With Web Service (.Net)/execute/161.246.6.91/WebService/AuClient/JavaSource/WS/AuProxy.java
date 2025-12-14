package WS;

public class AuProxy implements WS.Au {
  private boolean _useJNDI = true;
  private String _endpoint = null;
  private WS.Au au = null;
  
  public AuProxy() {
    _initAuProxy();
  }
  
  private void _initAuProxy() {
  
  if (_useJNDI) {
    try{
      javax.naming.InitialContext ctx = new javax.naming.InitialContext();
      au = ((WS.AuService)ctx.lookup("java:comp/env/service/AuService")).getAu();
      }
    catch (javax.naming.NamingException namingException) {}
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  if (au == null) {
    try{
      au = (new WS.AuServiceLocator()).getAu();
      }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  if (au != null) {
    if (_endpoint != null)
      ((javax.xml.rpc.Stub)au)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    else
      _endpoint = (String)((javax.xml.rpc.Stub)au)._getProperty("javax.xml.rpc.service.endpoint.address");
  }
  
}


public void useJNDI(boolean useJNDI) {
  _useJNDI = useJNDI;
  au = null;
  
}

public String getEndpoint() {
  return _endpoint;
}

public void setEndpoint(String endpoint) {
  _endpoint = endpoint;
  if (au != null)
    ((javax.xml.rpc.Stub)au)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
  
}

public WS.Au getAu() {
  if (au == null)
    _initAuProxy();
  return au;
}

public java.lang.String getCourseAll() throws java.rmi.RemoteException{
  if (au == null)
    _initAuProxy();
  return au.getCourseAll();
}

public boolean buyClass(int classID, java.lang.String email, java.lang.String receiveID) throws java.rmi.RemoteException{
  if (au == null)
    _initAuProxy();
  return au.buyClass(classID, email, receiveID);
}

public boolean reservation(int classID, java.lang.String email, java.lang.String name, java.lang.String surname, java.lang.String phoneNo) throws java.rmi.RemoteException{
  if (au == null)
    _initAuProxy();
  return au.reservation(classID, email, name, surname, phoneNo);
}

public java.lang.String getCourse(java.lang.String subject, int period) throws java.rmi.RemoteException{
  if (au == null)
    _initAuProxy();
  return au.getCourse(subject, period);
}

public java.lang.String getCourseFromEmail(java.lang.String email) throws java.rmi.RemoteException{
  if (au == null)
    _initAuProxy();
  return au.getCourseFromEmail(email);
}

public boolean cancel(int classID, java.lang.String email) throws java.rmi.RemoteException{
  if (au == null)
    _initAuProxy();
  return au.cancel(classID, email);
}


}