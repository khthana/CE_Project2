/**
 * InformationServicesServiceTestCase.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.2.1 Aug 08, 2005 (11:49:10 PDT) WSDL2Java emitter.
 */

package gisoncampusservices.generated;

public class InformationServicesServiceTestCase extends junit.framework.TestCase {
    public InformationServicesServiceTestCase(java.lang.String name) {
        super(name);
    }

    public void testInformationServicesWSDL() throws Exception {
        javax.xml.rpc.ServiceFactory serviceFactory = javax.xml.rpc.ServiceFactory.newInstance();
        java.net.URL url = new java.net.URL(new gisoncampusservices.generated.InformationServicesServiceLocator().getInformationServicesAddress() + "?WSDL");
        javax.xml.rpc.Service service = serviceFactory.createService(url, new gisoncampusservices.generated.InformationServicesServiceLocator().getServiceName());
        assertTrue(service != null);
    }

    public void test1InformationServicesGetInformationFromID() throws Exception {
        gisoncampusservices.generated.InformationServicesSoapBindingStub binding;
        try {
            binding = (gisoncampusservices.generated.InformationServicesSoapBindingStub)
                          new gisoncampusservices.generated.InformationServicesServiceLocator().getInformationServices();
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
        value = binding.getInformationFromID(new java.lang.String(), new java.lang.String(), new java.lang.String());
        // TBD - validate results
    }

}
