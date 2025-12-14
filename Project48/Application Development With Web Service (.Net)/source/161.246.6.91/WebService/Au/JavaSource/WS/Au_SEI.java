package WS;

public interface Au_SEI extends java.rmi.Remote
{
 public java.lang.String getCourseAll();
 public boolean buyClass(int ClassID,java.lang.String Email,java.lang.String ReceiveID);
 public boolean reservation(int ClassID,java.lang.String Email,java.lang.String Name,java.lang.String Surname,java.lang.String PhoneNo);
 public java.lang.String getCourse(java.lang.String Subject,int Period);
 public java.lang.String getCourseFromEmail(java.lang.String Email);
 public boolean cancel(int ClassID,java.lang.String Email);
}