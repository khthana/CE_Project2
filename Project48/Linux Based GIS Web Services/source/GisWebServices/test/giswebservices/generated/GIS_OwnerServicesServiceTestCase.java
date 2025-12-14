/**
 * GIS_OwnerServicesServiceTestCase.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.2.1 Aug 08, 2005 (11:49:10 PDT) WSDL2Java emitter.
 */

package giswebservices.generated;

public class GIS_OwnerServicesServiceTestCase extends junit.framework.TestCase {
    public GIS_OwnerServicesServiceTestCase(java.lang.String name) {
        super(name);
    }

    public void testGIS_OwnerServicesWSDL() throws Exception {
        javax.xml.rpc.ServiceFactory serviceFactory = javax.xml.rpc.ServiceFactory.newInstance();
        java.net.URL url = new java.net.URL(new giswebservices.generated.GIS_OwnerServicesServiceLocator().getGIS_OwnerServicesAddress() + "?WSDL");
        javax.xml.rpc.Service service = serviceFactory.createService(url, new giswebservices.generated.GIS_OwnerServicesServiceLocator().getServiceName());
        assertTrue(service != null);
    }

    public void test1GIS_OwnerServicesInsertOwner() throws Exception {
        giswebservices.generated.GIS_OwnerServicesSoapBindingStub binding;
        try {
            binding = (giswebservices.generated.GIS_OwnerServicesSoapBindingStub)
                          new giswebservices.generated.GIS_OwnerServicesServiceLocator().getGIS_OwnerServices();
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
        value = binding.insertOwner(new java.lang.String(), new java.lang.String(), new java.lang.String(), new java.lang.String(), new java.lang.String(), new java.lang.String(), new java.lang.String());
        // TBD - validate results
    }

    public void test2GIS_OwnerServicesListOwner() throws Exception {
        giswebservices.generated.GIS_OwnerServicesSoapBindingStub binding;
        try {
            binding = (giswebservices.generated.GIS_OwnerServicesSoapBindingStub)
                          new giswebservices.generated.GIS_OwnerServicesServiceLocator().getGIS_OwnerServices();
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
        value = binding.listOwner();
        // TBD - validate results
    }

    public void test3GIS_OwnerServicesSearchOwner() throws Exception {
        giswebservices.generated.GIS_OwnerServicesSoapBindingStub binding;
        try {
            binding = (giswebservices.generated.GIS_OwnerServicesSoapBindingStub)
                          new giswebservices.generated.GIS_OwnerServicesServiceLocator().getGIS_OwnerServices();
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
        value = binding.searchOwner(new java.lang.String(), new java.lang.String(), new java.lang.String(), new java.lang.String(), new java.lang.String());
        // TBD - validate results
    }

    public void test4GIS_OwnerServicesDetailOwner() throws Exception {
        giswebservices.generated.GIS_OwnerServicesSoapBindingStub binding;
        try {
            binding = (giswebservices.generated.GIS_OwnerServicesSoapBindingStub)
                          new giswebservices.generated.GIS_OwnerServicesServiceLocator().getGIS_OwnerServices();
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
        value = binding.detailOwner(0);
        // TBD - validate results
    }

    public void test5GIS_OwnerServicesUpdateOwner() throws Exception {
        giswebservices.generated.GIS_OwnerServicesSoapBindingStub binding;
        try {
            binding = (giswebservices.generated.GIS_OwnerServicesSoapBindingStub)
                          new giswebservices.generated.GIS_OwnerServicesServiceLocator().getGIS_OwnerServices();
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
        value = binding.updateOwner(new java.lang.String(), new java.lang.String(), new java.lang.String(), new java.lang.String(), new java.lang.String(), new java.lang.String());
        // TBD - validate results
    }

    public void test6GIS_OwnerServicesDeleteOwner() throws Exception {
        giswebservices.generated.GIS_OwnerServicesSoapBindingStub binding;
        try {
            binding = (giswebservices.generated.GIS_OwnerServicesSoapBindingStub)
                          new giswebservices.generated.GIS_OwnerServicesServiceLocator().getGIS_OwnerServices();
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
        value = binding.deleteOwner(new java.lang.String(), 0);
        // TBD - validate results
    }

    public void test7GIS_OwnerServicesListNewOwner() throws Exception {
        giswebservices.generated.GIS_OwnerServicesSoapBindingStub binding;
        try {
            binding = (giswebservices.generated.GIS_OwnerServicesSoapBindingStub)
                          new giswebservices.generated.GIS_OwnerServicesServiceLocator().getGIS_OwnerServices();
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
        value = binding.listNewOwner(new java.lang.String());
        // TBD - validate results
    }

    public void test8GIS_OwnerServicesActivateOwner() throws Exception {
        giswebservices.generated.GIS_OwnerServicesSoapBindingStub binding;
        try {
            binding = (giswebservices.generated.GIS_OwnerServicesSoapBindingStub)
                          new giswebservices.generated.GIS_OwnerServicesServiceLocator().getGIS_OwnerServices();
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
        value = binding.activateOwner(new java.lang.String(), 0, true);
        // TBD - validate results
    }

}
