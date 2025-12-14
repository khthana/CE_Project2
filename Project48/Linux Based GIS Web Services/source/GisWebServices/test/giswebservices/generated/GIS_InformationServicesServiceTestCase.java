/**
 * GIS_InformationServicesServiceTestCase.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.2.1 Aug 08, 2005 (11:49:10 PDT) WSDL2Java emitter.
 */

package giswebservices.generated;

public class GIS_InformationServicesServiceTestCase extends junit.framework.TestCase {
    public GIS_InformationServicesServiceTestCase(java.lang.String name) {
        super(name);
    }

    public void testGIS_InformationServicesWSDL() throws Exception {
        javax.xml.rpc.ServiceFactory serviceFactory = javax.xml.rpc.ServiceFactory.newInstance();
        java.net.URL url = new java.net.URL(new giswebservices.generated.GIS_InformationServicesServiceLocator().getGIS_InformationServicesAddress() + "?WSDL");
        javax.xml.rpc.Service service = serviceFactory.createService(url, new giswebservices.generated.GIS_InformationServicesServiceLocator().getServiceName());
        assertTrue(service != null);
    }

    public void test1GIS_InformationServicesDetailInformation() throws Exception {
        giswebservices.generated.GIS_InformationServicesSoapBindingStub binding;
        try {
            binding = (giswebservices.generated.GIS_InformationServicesSoapBindingStub)
                          new giswebservices.generated.GIS_InformationServicesServiceLocator().getGIS_InformationServices();
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
        value = binding.detailInformation(new java.lang.String(), 0);
        // TBD - validate results
    }

}
