/**
 * GIS_LayerServicesServiceTestCase.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.2.1 Aug 08, 2005 (11:49:10 PDT) WSDL2Java emitter.
 */

package giswebservices.generated;

public class GIS_LayerServicesServiceTestCase extends junit.framework.TestCase {
    public GIS_LayerServicesServiceTestCase(java.lang.String name) {
        super(name);
    }

    public void testGIS_LayerServicesWSDL() throws Exception {
        javax.xml.rpc.ServiceFactory serviceFactory = javax.xml.rpc.ServiceFactory.newInstance();
        java.net.URL url = new java.net.URL(new giswebservices.generated.GIS_LayerServicesServiceLocator().getGIS_LayerServicesAddress() + "?WSDL");
        javax.xml.rpc.Service service = serviceFactory.createService(url, new giswebservices.generated.GIS_LayerServicesServiceLocator().getServiceName());
        assertTrue(service != null);
    }

    public void test1GIS_LayerServicesInsertLayer() throws Exception {
        giswebservices.generated.GIS_LayerServicesSoapBindingStub binding;
        try {
            binding = (giswebservices.generated.GIS_LayerServicesSoapBindingStub)
                          new giswebservices.generated.GIS_LayerServicesServiceLocator().getGIS_LayerServices();
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
        int value = -3;
        value = binding.insertLayer(new java.lang.String(), new java.lang.String(), true, new java.lang.String(), new java.lang.String());
        // TBD - validate results
    }

    public void test2GIS_LayerServicesListLayer() throws Exception {
        giswebservices.generated.GIS_LayerServicesSoapBindingStub binding;
        try {
            binding = (giswebservices.generated.GIS_LayerServicesSoapBindingStub)
                          new giswebservices.generated.GIS_LayerServicesServiceLocator().getGIS_LayerServices();
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
        value = binding.listLayer(new java.lang.String());
        // TBD - validate results
    }

}
