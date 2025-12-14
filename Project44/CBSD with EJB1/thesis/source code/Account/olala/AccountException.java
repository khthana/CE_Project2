package olala;

public class AccountException extends java.lang.Exception
{
    public AccountException()
    {
        super();
    }
    public AccountException(Exception e)
    {
        super(e.toString());
    }
    public AccountException(String s)
    {
        super(s);
    }
}