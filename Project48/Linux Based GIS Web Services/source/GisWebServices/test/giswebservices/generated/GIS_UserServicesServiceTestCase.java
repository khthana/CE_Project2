/**
 * GIS_UserServicesServiceTestCase.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.2.1 Aug 08, 2005 (11:49:10 PDT) WSDL2Java emitter.
 */

package giswebservices.generated;

public class GIS_UserServicesServiceTestCase extends junit.framework.TestCase {
    public GIS_UserServicesServiceTestCase(java.lang.String name) {
        super(name);
    }

    public void testGIS_UserServicesWSDL() throws Exception {
        javax.xml.rpc.ServiceFactory serviceFactory = javax.xml.rpc.ServiceFactory.newInstance();
        java.net.URL url = new java.net.URL(new giswebservices.generated.GIS_UserServicesServiceLocator().getGIS_UserServicesAddress() + "?WSDL");
        javax.xml.rpc.Service service = serviceFactory.createService(url, new giswebservices.generated.GIS_UserServicesServiceLocator().getServiceName());
        assertTrue(service != null);
    }

    public void test1GIS_UserServicesLogin() throws Exception {
        giswebservices.generated.GIS_UserServicesSoapBindingStub binding;
        try {
            binding = (giswebservices.generated.GIS_UserServicesSoapBindingStub)
                          new giswebservices.generated.GIS_UserServicesServiceLocator().getGIS_UserServices();
        }
        catch (javax.xml.rpc.ServiceException jre) {
            if(jre.getLinkedCause()!=null)
                jre.getLinkedCause().printStackTrace();
            throw new junit.framework.AssertionFailedError("JAX-RPC ServiceException caught: " + jre);
        }
        assertNotNull("binding is null", binding);

        // Time out after a minute
        binding.setTimeout(60000);

        // Test operation
        java.lang.String value = null;
        value = binding.login(new java.lang.String(), new java.lang.String());
        // TBD - validate results
    }

    public void test2GIS_UserServicesLogout() throws Exception {
        giswebservices.generated.GIS_UserServicesSoapBindingStub binding;
        try {
            binding = (giswebservices.generated.GIS_UserServicesSoapBindingStub)
                          new giswebservices.generated.GIS_UserServicesServiceLocator().getGIS_UserServices();
        }
        catch (javax.xml.rpc.ServiceException jre) {
            if(jre.getLinkedCause()!=null)
                jre.getLinkedCause().printStackTrace();
            throw new junit.framework.AssertionFailedError("JAX-RPC ServiceException caught: " + jre);
        }
        assertNotNull("binding is null", binding);

        // Time out after a minute
        binding.setTimeout(60000);

        // Test operation
        java.lang.String value = null;
        value = binding.logout(new java.lang.String());
        // TBD - validate results
    }

}
