package WS;

public class ApplyPhysicProxy implements WS.ApplyPhysic {
  private boolean _useJNDI = true;
  private String _endpoint = null;
  private WS.ApplyPhysic applyPhysic = null;
  
  public ApplyPhysicProxy() {
    _initApplyPhysicProxy();
  }
  
  private void _initApplyPhysicProxy() {
  
  if (_useJNDI) {
    try{
      javax.naming.InitialContext ctx = new javax.naming.InitialContext();
      applyPhysic = ((WS.ApplyPhysicService)ctx.lookup("java:comp/env/service/ApplyPhysicService")).getApplyPhysic();
      }
    catch (javax.naming.NamingException namingException) {}
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  if (applyPhysic == null) {
    try{
      applyPhysic = (new WS.ApplyPhysicServiceLocator()).getApplyPhysic();
      }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  if (applyPhysic != null) {
    if (_endpoint != null)
      ((javax.xml.rpc.Stub)applyPhysic)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    else
      _endpoint = (String)((javax.xml.rpc.Stub)applyPhysic)._getProperty("javax.xml.rpc.service.endpoint.address");
  }
  
}


public void useJNDI(boolean useJNDI) {
  _useJNDI = useJNDI;
  applyPhysic = null;
  
}

public String getEndpoint() {
  return _endpoint;
}

public void setEndpoint(String endpoint) {
  _endpoint = endpoint;
  if (applyPhysic != null)
    ((javax.xml.rpc.Stub)applyPhysic)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
  
}

public WS.ApplyPhysic getApplyPhysic() {
  if (applyPhysic == null)
    _initApplyPhysicProxy();
  return applyPhysic;
}

public java.lang.String getCourseAll() throws java.rmi.RemoteException{
  if (applyPhysic == null)
    _initApplyPhysicProxy();
  return applyPhysic.getCourseAll();
}

public boolean buyClass(int classID, java.lang.String email, java.lang.String receiveID) throws java.rmi.RemoteException{
  if (applyPhysic == null)
    _initApplyPhysicProxy();
  return applyPhysic.buyClass(classID, email, receiveID);
}

public boolean reservation(int classID, java.lang.String email, java.lang.String name, java.lang.String surname, java.lang.String phoneNo) throws java.rmi.RemoteException{
  if (applyPhysic == null)
    _initApplyPhysicProxy();
  return applyPhysic.reservation(classID, email, name, surname, phoneNo);
}

public java.lang.String getCourse(java.lang.String subject, int period) throws java.rmi.RemoteException{
  if (applyPhysic == null)
    _initApplyPhysicProxy();
  return applyPhysic.getCourse(subject, period);
}

public java.lang.String getCourseFromEmail(java.lang.String email) throws java.rmi.RemoteException{
  if (applyPhysic == null)
    _initApplyPhysicProxy();
  return applyPhysic.getCourseFromEmail(email);
}

public boolean cancel(int classID, java.lang.String email) throws java.rmi.RemoteException{
  if (applyPhysic == null)
    _initApplyPhysicProxy();
  return applyPhysic.cancel(classID, email);
}


}