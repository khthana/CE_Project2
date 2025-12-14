/**
 * Gis_GetMapServicesServiceTestCase.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.2.1 Aug 08, 2005 (11:49:10 PDT) WSDL2Java emitter.
 */

package giswebservices.generated;

public class Gis_GetMapServicesServiceTestCase extends junit.framework.TestCase {
    public Gis_GetMapServicesServiceTestCase(java.lang.String name) {
        super(name);
    }

    public void testGis_GetMapServicesWSDL() throws Exception {
        javax.xml.rpc.ServiceFactory serviceFactory = javax.xml.rpc.ServiceFactory.newInstance();
        java.net.URL url = new java.net.URL(new giswebservices.generated.Gis_GetMapServicesServiceLocator().getGis_GetMapServicesAddress() + "?WSDL");
        javax.xml.rpc.Service service = serviceFactory.createService(url, new giswebservices.generated.Gis_GetMapServicesServiceLocator().getServiceName());
        assertTrue(service != null);
    }

    public void test1Gis_GetMapServicesRequestSVG() throws Exception {
        giswebservices.generated.Gis_GetMapServicesSoapBindingStub binding;
        try {
            binding = (giswebservices.generated.Gis_GetMapServicesSoapBindingStub)
                          new giswebservices.generated.Gis_GetMapServicesServiceLocator().getGis_GetMapServices();
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
        value = binding.requestSVG(new java.lang.String(), new java.lang.String(), 0, 0, 0, 0);
        // TBD - validate results
    }

}
