import java.io.*;
import java.util.*;

public class ReadContactDataFile
{
  OwnerUserInfo oUserInfo;

  ReadContactDataFile(OwnerUserInfo oUserInfo)
  {
     this.oUserInfo=oUserInfo;
  }

	public Vector ReadFile(String filename)
	{
    int num_uin=0 ,len = 0;
		byte[] data;

    ContactUserInfo   infoTemp;
    Vector            contactVector = new Vector();
		File							c_file		 = null;
		FileInputStream		file_in		 = null;
		FileOutputStream	file_out	 = null;
		DataInputStream		data_in	 	 = null;
		DataOutputStream	data_out	 = null;

		try
		{
      c_file	  = new File(filename);
			if (c_file.exists())
			{
        file_in		= new FileInputStream(c_file);
				data_in		= new DataInputStream(file_in);
        num_uin   = data_in.readInt();
        System.out.println("Total ContactUser : "+num_uin+" User(s)");

				if ( num_uin > 0 )
				{
          for (int i = 0 ;i<num_uin ; i++)
					{
            infoTemp = new ContactUserInfo(oUserInfo);

//--------------------read contactStatus--------------------------------
            infoTemp.setContactStatus(data_in.readInt());
//--------------------read infoStatus------------------------------------
            infoTemp.setInfoStatus(data_in.readInt());
//--------------------read UIN------------------------------------------
         		infoTemp.setUIN(data_in.readInt());

//------------------read password --------------------------------------
						len  = data_in.readInt();
						data = new byte[len];
						data_in.read(data);
						infoTemp.setPWD(new String(data));

//------------------read NickName --------------------------------------
						len = data_in.readInt();
						data = new byte[len];
						data_in.read(data);
						infoTemp.setNick (new String(data));

//------------------read FirstName --------------------------------------
						len = data_in.readInt();
						data = new byte[len];
						data_in.read(data);
						infoTemp.setFirst(new String(data));

//------------------read LastName --------------------------------------
						len = data_in.readInt();
						data = new byte[len];
						data_in.read(data);
						infoTemp.setLast(new String(data));

//------------------read Email -----------------------------------------
						len = data_in.readInt();
						data = new byte[len];
						data_in.read(data);
						infoTemp.setEmail(new String(data));

//------------------read Authorize -------------------------------------
						infoTemp.setAuth		(data_in.readByte());

//------------------read City ------------------------------------------
						len = data_in.readInt();
						data = new byte[len];
						data_in.read(data);
						infoTemp.setCity(new String(data));

//------------------read CountryCode ------------------------------------
						infoTemp.setCountryCode(data_in.readShort());

//------------------read CountryStatus ----------------------------------
						infoTemp.setCountryStatus(data_in.readByte());

//------------------read State ------------------------------------------
						len = data_in.readInt();
						data = new byte[len];
						data_in.read(data);
						infoTemp.setState(new String(data));

//------------------read Age --------------------------------------------
						infoTemp.setAge(data_in.readShort());

//------------------read Sex --------------------------------------------
						infoTemp.setSex(data_in.readByte());

//------------------read Phone ------------------------------------------
						len = data_in.readInt();
						data = new byte[len];
						data_in.read(data);
						infoTemp.setPhone(new String(data));

//------------------read HomePage ---------------------------------------
						len = data_in.readInt();
						data = new byte[len];
						data_in.read(data);
						infoTemp.setHomepage(new String(data));

//------------------read About ------------------------------------------
						len = data_in.readInt();
						data = new byte[len];
						data_in.read(data);
						infoTemp.setAbout(new String(data));

//-----------------Add Owner to OwnerVector-----------------------------
            contactVector.addElement(infoTemp);
					}	//------- end for
          System.out.println("Total Read ContactUser : "+contactVector.size()+" User(s)");
					file_in.close();
				}  // end if (num_uin > 0)
				else // if( num <= 0)
				{
          System.out.println("ContactUser not found.");
				}
			}	// end if file exists
			else // if file doesn't exists
			{
        System.out.println("ContactFile not found.");
        file_out = new FileOutputStream(c_file);
				data_out = new DataOutputStream(file_out);
				data_out.writeInt((int)0);
				file_out.flush();
				file_out.close();
        System.out.println("Create ContactFile complete.");
 			}
		} // end try
		catch (FileNotFoundException f){System.err.println("FileNotFoundException " +f);}
		catch (IOException ioe){System.err.println("IOException " +ioe);}

		return contactVector;
	}// end readDataFile
}