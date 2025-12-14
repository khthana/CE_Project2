import java.io.*;
import java.util.*;

public class WriteContactDataFile
{
  WriteContactDataFile(){}
  WriteContactDataFile(String filename ,Vector contactVector)
  {
    WriteFile(filename,contactVector);
  }

	public void WriteFile(String filename ,Vector contactVector)
	{
      ContactUserInfo      uallinfo;
		try
		{
      FileOutputStream file_out=new FileOutputStream(filename);
			DataOutputStream data_out=new DataOutputStream(file_out);

			data_out.writeInt(contactVector.size());

			for(int i=0;i<contactVector.size();i++)
			{
        uallinfo = (ContactUserInfo)contactVector.elementAt(i);
        //------------------
        data_out.writeInt		(uallinfo.getcontactStatus());
        data_out.writeInt		(uallinfo.getInfoStatus());
        //------------------
        data_out.writeInt		(uallinfo.getUIN());
        data_out.writeInt		(uallinfo.getPWD().length());
				data_out.write			(uallinfo.getPWD().getBytes());
				data_out.writeInt		(uallinfo.getNick().length());
				data_out.write			(uallinfo.getNick().getBytes());
				data_out.writeInt		(uallinfo.getFirst().length());
				data_out.write			(uallinfo.getFirst().getBytes());
				data_out.writeInt		(uallinfo.getLast().length());
				data_out.write			(uallinfo.getLast().getBytes());
				data_out.writeInt		(uallinfo.getEmail().length());
				data_out.write			(uallinfo.getEmail().getBytes());
				data_out.writeByte	(uallinfo.getAuth());

				data_out.writeInt		(uallinfo.getCity().length());
				data_out.write			(uallinfo.getCity().getBytes());
				data_out.writeShort (uallinfo.getCountryCode());
				data_out.writeByte	(uallinfo.getCountryStatus());
				data_out.writeInt		(uallinfo.getState().length());
				data_out.write			(uallinfo.getState().getBytes());
				data_out.writeShort (uallinfo.getAge());
				data_out.writeByte	(uallinfo.getSex());
				data_out.writeInt		(uallinfo.getPhone().length());
				data_out.write			(uallinfo.getPhone().getBytes());
				data_out.writeInt		(uallinfo.getHomepage().length());
				data_out.write			(uallinfo.getHomepage().getBytes());
				data_out.writeInt		(uallinfo.getAbout().length());
				data_out.write			(uallinfo.getAbout().getBytes());

			}
			data_out.flush();
			data_out.close();
			System.out.println("Write contact file "+filename+" complete.");
      System.out.println("Total user in contact file : "+contactVector.size()+" user(s).");
		}
		catch (IOException io)
		{
      System.out.println("IOException "+io);
		}
	}
}