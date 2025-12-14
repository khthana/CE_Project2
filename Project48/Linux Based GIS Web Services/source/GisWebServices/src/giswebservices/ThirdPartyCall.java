package giswebservices;

import org.apache.axis.client.Call;
import javax.xml.namespace.QName;

public class ThirdPartyCall {

    public ThirdPartyCall() {
    }

    public String tryToCallThirdParty(int layerID, String geomtype,
                              double posX, double posY, double heigh, double width,
                              String fill, String stroke,
                              String label, String color, String size){
        try{
            String tbname="";
            int mapClass=0;
            GisDBConnect gdb=new GisDBConnect() ;
            String sqlstr="SELECT class,tbname FROM alliance WHERE lid="+layerID;
            gdb.query(sqlstr);
            gdb.getReturn().next();
            mapClass=gdb.getReturn().getInt("class");
            tbname=gdb.getReturn().getString("tbname");

            String res="";
            if(mapClass==1)
                res=callClass1( tbname,  geomtype, posX,  posY,  heigh,  width, fill,  stroke, label,  color,  size);
            return res;
        }catch(Exception e){
            return "";
        }
    }


    private String callClass1(String tbname, String geomtype,
                              double posX, double posY, double heigh, double width,
                              String fill, String stroke,
                              String label, String color, String size){
        try{
           Call call = new Call ("http://161.246.6.211:8080/MapSite/services/GetSvgMap");
           call.setOperationName ( new QName("getSvgElement") ) ;
           String res = (String)call.invoke(new Object[]{tbname, geomtype
                                            ,posX, posY ,heigh, width
                                            ,fill,stroke
                                            ,label,color,size} );
           return res;
       }catch (Exception e){
           return "";
       }
    }
}
