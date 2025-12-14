/**
 * GIS_CapabilitiesServiceTestCase.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.2.1 Aug 08, 2005 (11:49:10 PDT) WSDL2Java emitter.
 */

package giswebservices.generated;

public class GIS_CapabilitiesServiceTestCase extends junit.framework.TestCase {
    public GIS_CapabilitiesServiceTestCase(java.lang.String name) {
        super(name);
    }

    public void testGIS_CapabilitiesWSDL() throws Exception {
        javax.xml.rpc.ServiceFactory serviceFactory = javax.xml.rpc.ServiceFactory.newInstance();
        java.net.URL url = new java.net.URL(new giswebservices.generated.GIS_CapabilitiesServiceLocator().getGIS_CapabilitiesAddress() + "?WSDL");
        javax.xml.rpc.Service service = serviceFactory.createService(url, new giswebservices.generated.GIS_CapabilitiesServiceLocator().getServiceName());
        assertTrue(service != null);
    }

    public void test1GIS_CapabilitiesGetCapabilities() throws Exception {
        giswebservices.generated.GIS_CapabilitiesSoapBindingStub binding;
        try {
            binding = (giswebservices.generated.GIS_CapabilitiesSoapBindingStub)
                          new giswebservices.generated.GIS_CapabilitiesServiceLocator().getGIS_Capabilities();
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
        value = binding.getCapabilities();
        // TBD - validate results
    }

}
