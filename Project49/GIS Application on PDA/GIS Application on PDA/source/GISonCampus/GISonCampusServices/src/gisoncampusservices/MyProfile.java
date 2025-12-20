package gisoncampusservices;

public class MyProfile {
   private static String sessionkey="null";
   private static int memid=0;
   private static int ownid=0;
   private static String name="null";
   private static String address="null";
   private static String phone="null";
   private static String email="null";
   private static String ownername="null";
   private static String playroll="null";

  public MyProfile() {
  }

  public MyProfile(String sessionKey){
    setSessionkey(sessionKey);
  }

  public void setSessionkey(String sessionKey) {
    sessionkey=sessionKey;
    String mydetail="";
    try{
      CallServices cs = new CallServices("GIS_UserServices","detailUser");
      mydetail=cs.strInvoke(new Object[]{sessionkey}) ;
      GisXmlReader gxr=new GisXmlReader(mydetail);

      name=gxr.child("member").child("name").value();
      address=gxr.child("member").child("address").value();
      phone=gxr.child("member").child("phone").value();
      email=gxr.child("member").child("email").value();
      ownername=gxr.child("member").child("ownername").value();
      playroll=gxr.child("member").child("playroll").value();

      memid=Integer.parseInt(gxr.child("member").attribute("id") );
      ownid=Integer.parseInt(gxr.child("member").attribute("ownid"));

    }catch(Exception e){
      sessionkey="null";
      memid=0;
      ownid=0;
      name="null";
      address="null";
      phone="null";
      email="null";
      ownername="null";
      playroll="null";
    }
  }

  public void resetProfile(){
    sessionkey="null";
    memid=0;
    ownid=0;
    name="null";
    address="null";
    phone="null";
    email="null";
    ownername="null";
    playroll="null";



  }

  public int getMemberID(){ return memid;}
  public int getOwnerID(){ return ownid;}

  public String getSessionkey(){ return sessionkey;}
  public String getName(){ return name;}
  public String getAddress(){ return address;}
  public String getPhone(){ return phone;}
  public String getEmail(){ return email;}
  public String getOwnername(){ return ownername;}
  public String getPlayroll(){ return playroll;}
}
