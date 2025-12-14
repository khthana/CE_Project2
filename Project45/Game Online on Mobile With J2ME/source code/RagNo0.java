/*
 * RagNo0.java
 *
 * Created on 26 มีนาคม 2003, 23:11 น.
 */

import javax.microedition.midlet.*;
import javax.microedition.lcdui.*;
import javax.microedition.io.*;
import javax.microedition.rms.*;
import java.io.*;
import java.lang.*;
import java.util.Random;

/**
 *
 * @author  Jo & Wich
 * @version
 */
public class RagNo0 extends MIDlet {
    RecordStore rs = null;
    RecordEnumeration re = null;
    static final String REC_STORE = "db_1";
    RecordStore online = null;
    static final String REC_STORE2 = "db_2";
    private StreamConnectionNotifier streamConnectionNotifier;
    private StreamConnection streamConnection;
    private OutputStream outputStream = null;
    private DataOutputStream dataOutputStream = null;
    private InputStream inputStream = null;
    private DataInputStream dataInputStream = null;
    private String connectString = "serversocket://:9000";
    private StringBuffer result;
    private Display myDisplay = null;
    private Form resultScreen;
    private StringItem resultField;
    public String stringpoint = null;
    public String point[] = new String[10];
    public String stringsend = null;
    public Integer ia;
    public Integer idi;
    String idstr = null;
    String s = null;
    String sb = null;
    int ab;
    int id;
    int id_del;
    int i = 0;
    int pos_x[] = new int[20];
    int pos_y[] = new int[20];
    char Map[][] = new char[100][80];
    String point_mon_kill = null;
    int item[] = new int[20];
    int create_id = 0;
    int create_x = 7;
    int create_y = 8;
    int create_ac = 100;
    String strgive;
    String score[] = new String[10];
    String actgen = null;

/////////////////////Constructor////////////////////////////////////////
    public RagNo0() {
        deleteRecStore();
        deleteRecStore2();
        myDisplay = Display.getDisplay(this);
        resultScreen = new Form("Test");
        gen_perm();
        for(int j=0;j<20;j++)
            item[j] = 0;
    }//close constructor
    
//////////////////////Record/////////////////////////////////////////////
    public void openRecStore()
    {
        try
        {
            rs = RecordStore.openRecordStore(REC_STORE,true);
        }
        catch(Exception e)
        {
            db(e.toString());
        }
    }

    public void closeRecStore()
    {
        try
        {
            rs.closeRecordStore();
        }
        catch(Exception e)
        {
            db(e.toString());
        }
    }

    public void deleteRecStore()
    {
        if(RecordStore.listRecordStores() != null)
        {
            try
            {
                RecordStore.deleteRecordStore(REC_STORE);
            }
            catch(Exception e)
            {
                db(e.toString());
            }
        }
    }

    public void writeRecord(String str)
    {
        byte[] rec = str.getBytes();
        try
        {
            rs.addRecord(rec,0,rec.length);
        }
        catch(Exception e)
        {
            db(e.toString());
        }
    }

    public void readRecords()
    {
        try
        {
            byte[] recData = new byte[50];
            int len;

            for(int i=1;i<=rs.getNumRecords();i++)
            {
                len = rs.getRecord(i,recData,0);
                System.out.println("Record #" +i+ ": " + new String(recData,0,len));
                System.out.println("------------------------------");
            }
        }
        catch(Exception e)
        {
            db(e.toString());
        }
    }

    private void db(String str)
    {
        System.out.println("Msg: " + str);
    }
//////////////////////////record2/////////////////////////////////////
    public void openRecStore2()
    {
        try
        {
            online = RecordStore.openRecordStore(REC_STORE2,true);
        }
        catch(Exception e)
        {
            db2(e.toString());
        }
    }

    public void closeRecStore2()
    {
        try
        {
            online.closeRecordStore();
        }
        catch(Exception e)
        {
            db2(e.toString());
        }
    }

    public void deleteRecStore2()
    {
        if(RecordStore.listRecordStores() != null)
        {
            try
            {
                RecordStore.deleteRecordStore(REC_STORE2);
            }
            catch(Exception e)
            {
                db2(e.toString());
            }
        }
    }

    public void writeRecord2(String str)
    {
        byte[] rec = str.getBytes();
        try
        {
            online.addRecord(rec,0,rec.length);
            System.out.println("writeRecord2"+rec);
        }
        catch(Exception e)
        {
            db2(e.toString());
        }
    }

    public void readRecords2()
    {
        try
        {
            byte[] recData = new byte[50];
            int len;
            re = online.enumerateRecords(null,null,false);
            for(int i=1;i<=re.numRecords();i++)
            {
                try{
                    int j = re.nextRecordId();
                    len = online.getRecord(j,recData,0);
                    System.out.println("Record ##" +j+ ": " + new String(recData,0,len));
                    System.out.println("------------------------------");
                } catch(Exception e){}
            }
        }
        catch(Exception e)
        {
            db2(e.toString());
        }
    }

    private void db2(String str)
    {
        System.out.println("Msg: " + str);
    }
/////////////////////////////////////////////////////////////////////
    public void startApp() {
        while(true){
            receive();
            receive();
        }
    }//close startApp

    public void pauseApp() {

    }//close pauseApp

    public void destroyApp(boolean unconditional) {
        result = null;
        myDisplay = null;
        resultScreen = null;
        resultField = null;
    }//close destroyApp
    
///////////////function///////////////////////////////////////
    public void receive()
    {
        try {
            streamConnectionNotifier = (StreamConnectionNotifier) Connector.open(connectString);
            streamConnection = streamConnectionNotifier.acceptAndOpen();

            inputStream = streamConnection.openInputStream();
            dataInputStream = new DataInputStream(inputStream);
            int inputChar;
            result = new StringBuffer();
            while ((inputChar = dataInputStream.read()) != -1) {
                if (inputChar != 0)
                    result.append((char) inputChar);
            }//end while
            stringpoint = result.toString();
            System.out.println("receive "+stringpoint);
            if (stringpoint.length()==8) {
                System.out.println("receive = 8 : "+stringpoint);
                StringToInt();
                keeppoint();
                sendbroad();
            } else if(stringpoint.length()==9){
                //manage kill
                System.out.println("receive stringpoint == 9 : "+stringpoint);
                StringToInt();
                if (stringpoint.substring(0,1).compareTo("1") == 0)
                    ManageKill();
                else if (stringpoint.substring(0,1).compareTo("2") == 0)
                    ManageItem();
                else if (stringpoint.substring(0,1).compareTo("3") == 0)
                    ManageKillActor();
            }
            else if(stringpoint.length()==5)
            {
                String tell,tell_id,strscore;
                tell = stringpoint.substring(0,1);
                tell_id = stringpoint.substring(1,2);
                strscore = stringpoint.substring(2);
                score[Integer.parseInt(tell_id)] = strscore;
                openRecStore2();
                ////////////////////delete//////////////
                try
                {
                    byte[] recData = new byte[50];
                    int len;
                    re = online.enumerateRecords(null,null,false);
                    for(int i=1;i<=re.numRecords();i++)
                    {                        
                        try{
                            int j = re.nextRecordId();
                            len = online.getRecord(j,recData,0);
                            String address = new String(recData,0,len);
                            String address_id = Subid_ip(address);
                            if(tell_id.compareTo(address_id)==0)
                            {
                                ////////////////////////////////////////
                                try{
                                    online.deleteRecord(j);
                                } catch (InvalidRecordIDException e) {
                                    System.out.println("cannot delete");
                                }
                                ////////////////////////////////////////
                            }
                        }catch (Exception e){}
                    }
                   
                }
                catch(Exception e)
                {
                    db2(e.toString());
                }
                /////////////////////////////////////////
                closeRecStore2();
                out();
            }
            else if(stringpoint.length()==1)
            {
                System.out.println("New Client Start ID : "+stringpoint);
                IpRec_online(stringpoint);
                monster();
                IdRec();
                sendbroad();

            }
            else {
                strgive = give_id();
                send_reg(stringpoint);//ส่ง id 1 ตัวไป
                stringpoint = stringpoint.concat(strgive);
                score[Integer.parseInt(strgive)] = "000";
                IpRec();
            }
            } catch (Exception e) {
            System.out.println("Failed to initialize Connector receive");
        } finally {
            try {
                if (dataInputStream != null)
                    dataInputStream.close();
            } catch (Exception ignored) {}
            try {
                if (dataOutputStream != null)
                    dataOutputStream.close();
            } catch (Exception ignored) {}
            try {
                if (inputStream != null)
                    inputStream.close();
            } catch (Exception ignored) {}
            try {
                if (outputStream != null)
                    outputStream.close();
            } catch (Exception ignored) {}
            try {
                if (streamConnection != null)
                    streamConnection.close();
            } catch (Exception ignored) {}
            try {
                if (streamConnectionNotifier != null)
                    streamConnectionNotifier.close();
            } catch (Exception ignored) {}
        }
    }//close receive
//////////////////////////////////////////////////////////////////////////
    public void send(String ip_port,String xyid)
    {
       try {
            streamConnection = (StreamConnection) Connector.open("socket://"+ip_port);
            outputStream = streamConnection.openOutputStream();
            dataOutputStream = new DataOutputStream(outputStream);
            System.out.println("send : "+ip_port);
            System.out.println("send : "+xyid+"+"+xyid.length());
            dataOutputStream.writeChars(xyid);
            dataOutputStream.flush();
            resultField = new StringItem(null,"FINISH SERVER7");
            resultScreen.append(resultField);
            myDisplay.setCurrent(resultScreen);
            } catch (Exception e) {
            System.out.println("Failed to initialize Connector server : send "+e);
        } finally {
            try {
                if (dataInputStream != null)
                    dataInputStream.close();
            } catch (Exception ignored) {}
            try {
                if (dataOutputStream != null)
                    dataOutputStream.close();
            } catch (Exception ignored) {}
            try {
                if (inputStream != null)
                    inputStream.close();
            } catch (Exception ignored) {}
            try {
                if (outputStream != null)
                    outputStream.close();
            } catch (Exception ignored) {}
            try {
                if (streamConnection != null)
                    streamConnection.close();
            } catch (Exception ignored) {}
            try {
                if (streamConnectionNotifier != null)
                    streamConnectionNotifier.close();
            } catch (Exception ignored) {}
        }
    }//close send
//////////////////////////////////////////////////////////////////////
    public void send_reg(String con)
    {
        try {
            streamConnection = (StreamConnection) Connector.open("socket://"+con);
            outputStream = streamConnection.openOutputStream();
            dataOutputStream = new DataOutputStream(outputStream);
            System.out.println("send_reg : "+strgive);
            dataOutputStream.writeChars(strgive);
            dataOutputStream.flush();
            } catch (Exception e) {
            System.out.println("Failed to initialize Connector send_reg");
        } finally {
            try {
                if (dataInputStream != null)
                    dataInputStream.close();
            } catch (Exception ignored) {}
            try {
                if (dataOutputStream != null)
                    dataOutputStream.close();
            } catch (Exception ignored) {}
            try {
                if (inputStream != null)
                    inputStream.close();
            } catch (Exception ignored) {}
            try {
                if (outputStream != null)
                    outputStream.close();
            } catch (Exception ignored) {}
            try {
                if (streamConnection != null)
                    streamConnection.close();
            } catch (Exception ignored) {}
            try {
                if (streamConnectionNotifier != null)
                    streamConnectionNotifier.close();
            } catch (Exception ignored) {}
        }
    }
//////////////////////////////////////////////////////////////////////
    public void StringToInt(){
        System.out.println(stringpoint);
        ab =  ia.parseInt(stringpoint);
        id = ab%10;
        idstr = idi.toString(id);
    }
///////////////////////////////////////////////////////////////////////
    public void IdRec()
    {
        openRecStore2();
        try
        {
            byte[] recData = new byte[50];
            int len;
            int eq=0;

       if(online.getNumRecords()>1)
       {
           sendfirst();
       }
        }
       catch(Exception e)
       {
           db2(e.toString());
       }
        closeRecStore2();
    }
/////////////////////////////////////////////////////////////////////////
    public String Subip(String message)
    {
        String ip;
        ip = message.substring(0,message.length()-1);
        return(ip);
    }
//////////////////////////////////////////////////////////////////////////
    public String Subid_ip(String message)
    {
        String id;
        id = message.substring(message.length()-1);
        return(id);
    }
//////////////////////////////////////////////////////////////////////////
    public String give_id()
    {
        create_id = create_id + 1;
        return Integer.toString(create_id);
    }
//////////////////////////////////////////////////////////////////////////
    public void IpRec()
    {
        openRecStore();
        writeRecord(stringpoint);
        readRecords();
        closeRecStore();
    }
//////////////////////////////////////////////////////////////////////////
    public void IpRec_online(String id_in)
    {
        openRecStore2();
        openRecStore();
        try
        {
            byte[] recData = new byte[50];
            int len;

            for(int i=1;i<=rs.getNumRecords();i++)
            {
                len = rs.getRecord(i,recData,0);
                String rec_on = new String(recData,0,len);//ip,port,id
                String id_on = rec_on.substring(rec_on.length()-1);//id
                System.out.println("Compare id_in:"+id_in+" id_on:"+id_on);
                if(id_in.compareTo(id_on) == 0)
                {
                    writeRecord2(rec_on);//ip,port,id
                    System.out.println("write record 2 :"+rec_on);
                    //readRecords2();
                }                
            }
        }
        catch(Exception e)
        {
            db(e.toString());
        }
        closeRecStore();
        closeRecStore2();
    }
//////////////////////////////////////////////////////////////////////////
    public void sendbroad()
    {
        openRecStore2();
         try
        {
            byte[] recData = new byte[50];
            int len;
            re = online.enumerateRecords(null,null,false);
            for(int i=1;i<=re.numRecords();i++)
            {
                try{
                    int j = re.nextRecordId();
                    len = online.getRecord(j,recData,0);
                    String rec = new String(recData,0,len);
                    String id_other = Subid_ip(rec);
                    System.out.println("==============================================");
                    System.out.println("sendboard");
                    System.out.println("Compare between : "+stringpoint.substring(stringpoint.length()-1,stringpoint.length())+" "+id_other);
                    if((stringpoint.substring(stringpoint.length()-1,stringpoint.length())).compareTo(id_other) != 0)
                    {
                        System.out.println("ip "+rec.substring(0,rec.length()-1)+" position "+stringpoint);
                        send(rec.substring(0,rec.length()-1),stringpoint);
                    }
                } catch (Exception e){}
            }
        }
        catch(Exception e)
        {
            System.out.println("boooooooooooooooooooooooooooooo");
            db2(e.toString());
        }
        closeRecStore2();
    }
///////////////////////////////////   out   /////////////////////////////////
    public void out(){
        openRecStore2();
         try
        {
            byte[] recData = new byte[50];
            int len;
            re = online.enumerateRecords(null,null,false);
            for(int i=1;i<=re.numRecords();i++)
            {
                try{
                    int j = re.nextRecordId();
                    len = online.getRecord(j,recData,0);//have error
                    String rec = new String(recData,0,len);
                    System.out.println("ip "+rec.substring(0,rec.length()-1)+" stringpoint "+stringpoint.substring(0,2));
                    send(rec.substring(0,rec.length()-1),stringpoint.substring(0,2));
                } catch (Exception e){}
            }
        }
        catch(Exception e)
        {
            db2(e.toString());
        }
        closeRecStore2();
    }
/////////////////////////////////////////////////////////////////////////////    
    public void gen_perm()
    {
        s = generateRandoms();
        keep_mon(s);
        System.out.println(s);
        sb = table();
    }
/////////////////////////////////////////////////////////////////////////////
    public void monster()
    {
        ////////// set monster /////////////////////
        String mon = null;
        if (pos_x[0] < 10){
            mon = "0";
            mon = mon.concat(Integer.toString(pos_x[0]));
        } else mon = Integer.toString(pos_x[0]);
        if (pos_y[0] < 10){
            mon = mon.concat("0");
            mon = mon.concat(Integer.toString(pos_y[0]));
        } else mon = mon.concat(Integer.toString(pos_y[0]));
        
        for (int k=1;k<20;k++)
        {
            if (pos_x[k] < 10)
                mon = mon.concat("0");
            mon = mon.concat(Integer.toString(pos_x[k]));
            if (pos_y[k] < 10)
                mon = mon.concat("0");
            mon = mon.concat(Integer.toString(pos_y[k]));
        }
        ////////////////////////////////////////////////////////////////
        String new_actor = random_actor();
        String point_actor = "100";
        point_actor = point_actor.concat(new_actor).concat(stringpoint);
        point[Integer.parseInt(stringpoint)] = point_actor;
        String send_mon = mon.concat(new_actor);
        send_mon = send_mon.concat(score[Integer.parseInt(stringpoint)]);
        openRecStore2();
         try
        {
            byte[] recData = new byte[50];
            int len;
            re = online.enumerateRecords(null,null,false);
            for(int i=1;i<=re.numRecords();i++)
            {
                try{
                    int j = re.nextRecordId();
                    len = online.getRecord(j,recData,0);
                    String rec = new String(recData,0,len);
                    String id_owner = Subid_ip(rec);
                    if(stringpoint.compareTo(id_owner) == 0)
                    {
                        System.out.println("============== monster ============");
                        System.out.println("ip "+rec.substring(0,rec.length()-1)+" position "+send_mon);
                        send(rec.substring(0,rec.length()-1),send_mon);
                    }
                } catch(Exception e){}
            }
        }
        catch(Exception e)
        {
            db2(e.toString());
        }
        closeRecStore2();
        stringpoint = point[Integer.parseInt(stringpoint)];
        System.out.println("monster stringpoint :"+stringpoint);
    }
////////////////////////////////////////////////////////////////////////
    public void keep_mon(String monster_all)
    {
        int p = 0,t=0;
        while(p<monster_all.length())
        {
            String one = monster_all.substring(p,p+2);
            pos_x[t] = Integer.parseInt(one);
            String two = monster_all.substring(p+2,p+4);
            pos_y[t] = Integer.parseInt(two);
            p = p+4;
            t++;
        }
    }
    //////////////////////////////random/////////////////////////////////
    public String generateRandoms()
    {
        StringBuffer sb = new StringBuffer();
        Random rand = new Random();
        for(int i=0;i<20;++i)
        {
            int ri = Math.abs(rand.nextInt()%99);//x
            if (ri < 10){
                sb.append("0");
                sb.append(Integer.toString(ri));
            } else {
                sb.append(Integer.toString(ri));
            }
            ri = Math.abs(rand.nextInt()%79);//y
            if (ri < 10) {
                sb.append("0");
                sb.append(Integer.toString(ri));
            } else {
                sb.append(Integer.toString(ri));
            }
        }
        return sb.toString();
    }
/////////////////////////////////////////////////////////////////////////
    public String random_actor(){
        StringBuffer sb = new StringBuffer();
        int a = 0;
        int ri = 0;
        int rj = 0;
        Random rand = new Random();
        while(a==0)
        {
            ri = Math.abs(rand.nextInt()%99);//x
            rj = Math.abs(rand.nextInt()%79);//y
            if(Map[ri][rj] == 'o')
            {
                a = 1;
            }
        }
        if (ri < 10){
            sb.append("0");
            sb.append(Integer.toString(ri));
        } else {
            sb.append(Integer.toString(ri));
        }
        if (rj < 10) {
            sb.append("0");
            sb.append(Integer.toString(rj));
        } else {
            sb.append(Integer.toString(rj));
        }       
        return sb.toString();
    }
//////////////////////////////random if die//////////////////////////////
    public String generateRandoms_die()
    {
        StringBuffer sb = new StringBuffer();
        Random rand = new Random();

            int ri = Math.abs(rand.nextInt()%99);//x
            if (ri < 10){
                sb.append("0");
                sb.append(Integer.toString(ri));
            } else {
                sb.append(Integer.toString(ri));
            }
            ri = Math.abs(rand.nextInt()%79);//y
            if (ri < 10) {
                sb.append("0");
                sb.append(Integer.toString(ri));
            } else {
                sb.append(Integer.toString(ri));
            }

        return sb.toString();
    }
/////////////////////////////////////////////////////////////////////
    public String table()
    {
        int receiveactorX,receiveactorY;
        StringBuffer sb = new StringBuffer();
            for (int i=0;i<100;i++){
                for (int j=0;j<80;j++){
                    Map[i][j] = 'o';
                }
            }

            //set block position
            for (int i=0;i<100;i++){
                for (int j=0;j<80;j++){
                    if (((i % 5)==0)&&((j % 5)==0)){
                        Map[i][j] = 'n';
                    }
                }
            }

            //top wall and buttom wall
            for (int i=0;i<100;i++){
                Map[i][0] = 'm';
                Map[i][79] = 'm';
            }
            //left wall and riht wall
            for (int j=0;j<80;j++){
                Map[0][j] = 'm';
                Map[99][j] = 'm';
            }
        //////////////////////////////
        for(int j=0;j<10;j++){
                if(point[j] != null){
                    Integer integerpoint = null;
                    int intpoint = 0;
                    int ac;
                    intpoint =  integerpoint.parseInt(point[j]);
                    intpoint = intpoint/10;         //aaxxyy
                    ac = intpoint/10000;             //aa
                    intpoint = intpoint%10000;       //xxyy
                    receiveactorX = intpoint/100;   //xx
                    receiveactorY = intpoint%100;   //yy
//////////////// set action to map with Map /////////////////////////////
                    if (ac == 100)
                        Map[receiveactorX][receiveactorY] = 'a';
                    else if (ac == 101)
                        Map[receiveactorX][receiveactorY] = 'b';
                    else if (ac == 102)
                        Map[receiveactorX][receiveactorY] = 'c';
                    else if (ac == 103)
                        Map[receiveactorX][receiveactorY] = 'd';
                    else if (ac == 104)
                        Map[receiveactorX][receiveactorY] = 'e';
                    else if (ac == 105)
                        Map[receiveactorX][receiveactorY] = 'f';
                    else if (ac == 106)
                        Map[receiveactorX][receiveactorY] = 'g';
                    else if (ac == 107)
                        Map[receiveactorX][receiveactorY] = 'h';
                    else if (ac == 108)
                        Map[receiveactorX][receiveactorY] = 'i';
                    else if (ac == 109)
                        Map[receiveactorX][receiveactorY] = 'j';
                    else if (ac == 110)
                        Map[receiveactorX][receiveactorY] = 'k';
                    else if (ac == 111)
                        Map[receiveactorX][receiveactorY] = 'l';
                }
            }
        //////////////set item/////////////////////
            for(int k=0;k<20;k++)
            {   
                if(item[k] != 0){
                    if ((item[k]%10) <5) 
                        Map[item[k]/1000][(item[k]%1000)/10] = 't';
                    else Map[item[k]/1000][(item[k]%1000)/10] = 'u';
                }
            }
        //////////////////////////////////////////////////
            for(int k=0;k<20;k++)
            {
                if (Map[pos_x[k]][pos_y[k]]=='o')
                {
                    Map[pos_x[k]][pos_y[k]] = 'z';
                    if (pos_x[k] < 10)
                    {
                        sb.append("0");
                        sb.append(Integer.toString(pos_x[k]));
                    }
                    else
                    {
                        sb.append(Integer.toString(pos_x[k]));
                    }
                    if (pos_y[k] < 10)
                    {
                        sb.append("0");
                        sb.append(Integer.toString(pos_y[k]));
                    }
                    else
                    {
                        sb.append(Integer.toString(pos_y[k]));
                    }
                }
                else
                {
                    while(Map[pos_x[k]][pos_y[k]]!='o')
                    {
                        String new_mon = generateRandoms_die();
                        String one = new_mon.substring(0,2);
                        pos_x[k] = Integer.parseInt(one);
                        String two = new_mon.substring(2,4);
                        pos_y[k] = Integer.parseInt(two);
                    }
                    Map[pos_x[k]][pos_y[k]] = 'z';
                    if (pos_x[k] < 10)
                    {
                        sb.append("0");
                        sb.append(Integer.toString(pos_x[k]));
                    }
                    else
                    {
                        sb.append(Integer.toString(pos_x[k]));
                    }
                    if (pos_y[k] < 10)
                    {
                        sb.append("0");
                        sb.append(Integer.toString(pos_y[k]));
                    }
                    else
                    {
                        sb.append(Integer.toString(pos_y[k]));
                    }
                }
            }
        return sb.toString();
    }
////////////////////////////////////////////////////////////////////////
    public void keeppoint(){
        point[id] = stringpoint;
        System.out.println("Keep point = "+stringpoint);
    }
/////////////////////////////////////////////////////////////////////////
    public int Random_type_item(){
        Random rand = new Random();
        int ri = Math.abs(rand.nextInt()%9);//type_item
        System.out.println("type_item = "+ri);
        return ri;
    }
/////////////////////////////////////////////////////////////////////////
    public void ManageKill(){
        Integer integerpoint = null;
        int mon_kill = integerpoint.parseInt(stringpoint);
        int act_kill = (mon_kill%100000000)/100000;
        int intitem = Random_type_item();
        String stringitem = Integer.toString(intitem);
        String new_mon = generateRandoms_die();
        System.out.println("act_kill : "+act_kill);
        int mon_kill_x = (mon_kill%100000)/1000;
        System.out.println("mon_kill_x : "+mon_kill_x);
        int mon_kill_y = (mon_kill%1000)/10;
        System.out.println("mon_kill_y : "+mon_kill_y);

///////////// set real position monster is killed//////////////////////
        if ((act_kill == 100)||(act_kill == 101))
            mon_kill_y = mon_kill_y + 1;
        else if((act_kill == 103)||(act_kill == 104))
            mon_kill_y = mon_kill_y - 1;
        else if((act_kill == 106)||(act_kill == 107))
            mon_kill_x = mon_kill_x + 1;
        else if((act_kill == 109)||(act_kill == 110))
            mon_kill_x = mon_kill_x - 1;
///////////////////////////////////////////////////////////////////////////
        if (mon_kill_x < 10){
            point_mon_kill = "0";
            point_mon_kill = point_mon_kill.concat(ia.toString(mon_kill_x));/// 0x
        } else point_mon_kill = ia.toString(mon_kill_x); //xx
        if (mon_kill_y < 10){
            point_mon_kill = point_mon_kill.concat("0");
            point_mon_kill = point_mon_kill.concat(ia.toString(mon_kill_y));/// xx0y
        } else point_mon_kill = point_mon_kill.concat(ia.toString(mon_kill_y)); //xxyy
        point_mon_kill = point_mon_kill.concat(stringitem);//xxyyt
        point_mon_kill = point_mon_kill.concat(idstr);//xxyyti

        for (int j=0;j<20;j++){
            System.out.println(pos_x[j]+" "+pos_y[j]);
           if((pos_x[j] == mon_kill_x)&&(pos_y[j] == mon_kill_y)){
               ///////////////////////Keep point item in Map ///////////////////////////////
              if(intitem < 5)
                Map[mon_kill_x][mon_kill_y] = 't';
               else Map[mon_kill_x][mon_kill_y] = 'u';
               for (int k=0;k<20;k++)
                   if (item[k] == 0)
                   {
                       item[k] = Integer.parseInt(point_mon_kill.substring(0,5));  
                       k = 20;
                   }
               ///////////////////////////////////
               String one = new_mon.substring(0,2);
               pos_x[j] = Integer.parseInt(one);
               String two = new_mon.substring(2,4);
               pos_y[j] = Integer.parseInt(two);
               //////////////////////////////////
               if (j<10)
                   new_mon = new_mon.concat("0"+ia.toString(j));//xxyyid
               else new_mon = new_mon.concat(ia.toString(j));//xxyyid
               ////////////////////////////////////////////////////////////

               new_mon = new_mon.concat(point_mon_kill);//xxyyidxxyyti
               openRecStore2();
                try
                {
                    byte[] recData = new byte[50];
                    int len;
                    re = online.enumerateRecords(null,null,false);
                    for(int i=1;i<=re.numRecords();i++)
                    {           
                        try{
                            int k = re.nextRecordId();
                            len = online.getRecord(k,recData,0);
                            String rec = new String(recData,0,len);
                            System.out.println("send to ip: "+rec.substring(0,rec.length()-1)+" : "+new_mon);
                            send(rec.substring(0,rec.length()-1),new_mon);
                        }catch(Exception e){}
                    }//close for
                }//close try
                catch(Exception e)
                {
                    db2(e.toString());
                }
                closeRecStore2();
                j =20;  // to out from for loop because have one point that equal
           }//close if
        }//close for
    }
////////////////////////////////////////////////////////////////////////
    public void ManageItem(){
        Integer integerpoint = null;
        String stringkeep_item = null;
        int keep_item = integerpoint.parseInt(stringpoint);
        int act_keep = (keep_item%100000000)/100000;
        System.out.println("act_keep : "+act_keep);
        int keep_item_xy = (keep_item%100000)/10;
        int keep_item_x = keep_item_xy/100;
        System.out.println("keep_item_x : "+keep_item_x);
        int keep_item_y = keep_item_xy%100;
        System.out.println("keep_item_y : "+keep_item_y);
        ///////////// set real position item is kept//////////////////////
        if ((act_keep == 100)||(act_keep == 101))
            keep_item_y = keep_item_y + 1;
        else if((act_keep == 103)||(act_keep == 104))
            keep_item_y = keep_item_y - 1;
        else if((act_keep == 106)||(act_keep == 107))
            keep_item_x = keep_item_x + 1;
        else if((act_keep == 109)||(act_keep == 110))
            keep_item_x = keep_item_x - 1;

       //////////////////////////////////////////////////////////////////////
        if (keep_item_x < 10){
                   stringkeep_item = "0";
                   stringkeep_item = stringkeep_item.concat(Integer.toString(keep_item_x));
               } else stringkeep_item = Integer.toString(keep_item_x);
        if (keep_item_y < 10){
                   stringkeep_item = stringkeep_item.concat("0");
                   stringkeep_item = stringkeep_item.concat(Integer.toString(keep_item_y));
               } else stringkeep_item = stringkeep_item.concat(Integer.toString(keep_item_y));
        keep_item_xy = Integer.parseInt(stringkeep_item);

        for (int j=0;j<20;j++){
            System.out.println(item[j]+" ");
            if((item[j]/10) == keep_item_xy){
               ///////////////////////Keep point item in Map ///////////////////////////////
               Map[keep_item_x][keep_item_y] = 'o';
               item[j] =  0;

               if (j < 10){
                   stringkeep_item = stringkeep_item.concat("0");
                   stringkeep_item = stringkeep_item.concat(Integer.toString(j));
               } else stringkeep_item = stringkeep_item.concat(Integer.toString(j));
               stringkeep_item = stringkeep_item.concat(idstr);

               openRecStore2();
                try
                {
                    byte[] recData = new byte[50];
                    int len;
                    re = online.enumerateRecords(null,null,false);
                    for(int i=1;i<=re.numRecords();i++)
                    {
                        try{
                            int k = re.nextRecordId();
                            len = online.getRecord(k,recData,0);
                            String rec = new String(recData,0,len);
                            System.out.println("send to ip: "+rec.substring(0,rec.length()-1)+" : "+stringkeep_item);
                            send(rec.substring(0,rec.length()-1),stringkeep_item);
                        }catch(Exception e){}
                    }//close for
                }//close try
                catch(Exception e)
                {
                    db2(e.toString());
                }
                closeRecStore2();
                j =20;  // to out from for loop because have one point that equal
           }//close if
        }//close for


    }
//////////////////////////////////////////////////////////////////////////
    public void ManageKillActor(){
        Integer integerpoint = null;
        String stringkill_actor = null;
        int kill_actor = integerpoint.parseInt(stringpoint);
        int act_kill_actor = (kill_actor%100000000)/100000;
        System.out.println("act_kill_actor : "+act_kill_actor);
        int kill_actor_xy = (kill_actor%100000)/10;
        int kill_actor_x = kill_actor_xy/100;
        System.out.println("kill_actor_x : "+kill_actor_x);
        int kill_actor_y = kill_actor_xy%100;
        System.out.println("kill_actor_y : "+kill_actor_y);

        ///////////// set real position actor is killed//////////////////////
        if ((act_kill_actor == 100)||(act_kill_actor == 101))
            kill_actor_y = kill_actor_y + 1;
        else if((act_kill_actor == 103)||(act_kill_actor == 104))
            kill_actor_y = kill_actor_y - 1;
        else if((act_kill_actor == 106)||(act_kill_actor == 107))
            kill_actor_x = kill_actor_x + 1;
        else if((act_kill_actor == 109)||(act_kill_actor == 110))
            kill_actor_x = kill_actor_x - 1;
        ///////////////////////////////////////////////////////////////////////
        if (kill_actor_x < 10){
            stringkill_actor = "0";
            stringkill_actor = stringkill_actor.concat(Integer.toString(kill_actor_x));
        } else stringkill_actor = Integer.toString(kill_actor_x);//xx
        if (kill_actor_y < 10){
            stringkill_actor = stringkill_actor.concat("0");
            stringkill_actor = stringkill_actor.concat(Integer.toString(kill_actor_y));
        } else stringkill_actor = stringkill_actor.concat(Integer.toString(kill_actor_y));//xxyy


        ///////////////////////////////////////////////////////////////////////
        for (int j=0;j<10;j++){
            System.out.print("point[j] :"+point[j]+" ");
            if(point[j] != null) {
                if(point[j].substring(3,7).compareTo(stringkill_actor) == 0){

                    stringkill_actor = stringkill_actor.concat(Integer.toString(j));//xxyyi
                    stringkill_actor = stringkill_actor.concat(idstr);//xxyyii
                    System.out.println("kill_actor :::::::::::::::::::");
                    openRecStore2();
                    try
                    {
                        byte[] recData = new byte[50];
                        int len;
                        re = online.enumerateRecords(null,null,false);
                        for(int i=1;i<=re.numRecords();i++)
                        {
                            try{
                                int k = re.nextRecordId();
                                len = online.getRecord(k,recData,0);
                                String rec = new String(recData,0,len);
                                /////////////////
                                String idsub = Subid_ip(rec);
                                /////////////////
                                if((idsub.compareTo(idstr) == 0)||(idsub.compareTo(Integer.toString(j)) == 0))

                                System.out.println("send to ip: "+rec.substring(0,rec.length()-1)+" : "+stringkill_actor);
                                send(rec.substring(0,rec.length()-1),stringkill_actor);
                            }catch(Exception e){}
                        }//close for
                    }//close try
                    catch(Exception e)
                    {
                        db2(e.toString());
                    }
                    closeRecStore2();
                    j =20;  // to out from for loop because have one point that equal
                }//close if
            }//close if
        }//close for

    }


////////////////////////////////////////////////////////////////////////
    public void sendfirst(){
        openRecStore2();
         try
        {
            System.out.println("stringpoint : "+stringpoint);
            String strip = stringpoint.substring(stringpoint.length()-1);
            String sendip = null;
            byte[] temprecData = new byte[50];
            int templen;
            re = online.enumerateRecords(null,null,false);
            for(int j=1;j<=re.numRecords();j++){
                try{
                    int k = re.nextRecordId();
                    templen = online.getRecord(k,temprecData,0);
                    String temprec = new String(temprecData,0,templen);
                    String tempidsub = Subid_ip(temprec);
                    String ip = Subip(temprec);
                    if(strip.compareTo(tempidsub) == 0){
                        sendip = ip;
                        System.out.println("sendip : "+sendip);
                    }
                } catch(Exception e){}
            }            
            
            byte[] recData = new byte[50];
            int len;
            re = online.enumerateRecords(null,null,false);
            for(int i=1;i<=re.numRecords();i++)
            {
                try{
                    int k = re.nextRecordId();
                    len = online.getRecord(k,recData,0);
                    String rec = new String(recData,0,len);                
                    System.out.println("rec : "+rec);
                    /////////////////
                    String idsub = Subid_ip(rec);
                    //String ip = Subip(rec);
                    System.out.println("sendfirst 00 "+idsub+" "+stringpoint);
                    /////////////////
                    if(strip.compareTo(idsub) != 0)
                    {            
                        Integer integerrec = null;
                        int intrec = 0;
                        intrec = integerrec.parseInt(idsub);
                        stringsend = point[intrec];
                        System.out.println("============================================================");
                        System.out.println("sendfirst : sendip : "+sendip+" stringsend : "+stringsend);
                        for (int j=0;j<4500000;j++){}//timer
                        send(sendip,stringsend);
                    }
                } catch(Exception e){}
            }
        }
        catch(Exception e)
        {
            System.out.println("sendfirst sendfirst");
            db2(e.toString());
        }
        closeRecStore2();
    }

//////////////////////////////class//////////////////////////////////
    class Mythread implements Runnable {
        int ch;
        public Mythread(int n)
        {
            ch = n;
        }
        public void run()
        {
                if(ch == 1)
                {
                    receive();
                    System.out.println("in Thread");
                    //sendbroad();
                }
        }
    }//close class Mythread

}//close class RagNo0
