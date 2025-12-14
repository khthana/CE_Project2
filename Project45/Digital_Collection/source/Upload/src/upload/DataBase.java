package upload;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2002</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */
import java.sql.*;
import java.util.*;
import COM.ibm.db2.jdbc.*;
import COM.ibm.db2.jdbc.app.*;


/**
 *
 * @author  KUKI
 */
public class DataBase {
    private static Connection con;

    /** Creates a new instance of DatabaseUtility */
    public DataBase() {
        con = null;
    }


    public static boolean connect(String uname, String passwd, String url) {
        try {
            Class.forName("COM.ibm.db2.jdbc.app.DB2Driver").newInstance();
            con = DriverManager.getConnection("jdbc:db2:TF", "LYS","surapunassaratt");
            //con = DriverManager.getConnection(url, uname, passwd);
        } catch (ClassNotFoundException cnfex) {
            System.err.println("Failed to load JDBC/ODBC driver.");
            cnfex.printStackTrace();
            return false;
        } catch (SQLException sqlex) {
            System.err.println("Unable to connect");
            sqlex.printStackTrace();
            return false;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }

        return true;
    }


    public static void disconnect() {
        try {
            if (con != null) {
                con.close();
                con = null;
            }
        } catch (SQLException sqlex) {
            System.err.println("Unable to disconnect");
            sqlex.printStackTrace();
        }
    }


    public static int update(String query) {
        int result = 0;

        try {
            Statement stmt = con.createStatement();
            result = stmt.executeUpdate(query);
        } catch (SQLException sqlex) {
            System.out.println(sqlex.toString());
        }

        return result;
    }


    public static ResultSet getResultSet(String query) {
        Statement stmt = null;
        ResultSet rs = null;

        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
        } catch (SQLException sqlex) {
            System.out.println(sqlex.toString());
        }

        return rs;
    }


    public static Vector retrieve(String query) {
        Vector vector = new Vector();

        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            ResultSetMetaData rsmd = rs.getMetaData();

            // position to first record
            boolean moreRecords = rs.next();

            // if there are no records, return null
            if (!moreRecords) {
                return vector;
            }
            else {
                // get row data
                do {
                    vector.addElement(getNextRow(rs, rsmd));
                } while (rs.next());
            }
        } catch (SQLException sqlex) {
            sqlex.printStackTrace();
        }

        return vector;
    }


    private static Vector getNextRow(ResultSet rs, ResultSetMetaData rsmd) throws SQLException {
        Vector currentRow = new Vector();

        for (int i = 1; i <= rsmd.getColumnCount(); i++) {
            switch (rsmd.getColumnType(i)) {
                case Types.VARCHAR:
                case Types.LONGVARCHAR:
                    currentRow.addElement(rs.getString(i));
                    break;
                case Types.DECIMAL:
                    currentRow.addElement(rs.getBigDecimal(i));
                    break;
                case Types.SMALLINT:
                    currentRow.addElement(Integer.toString(rs.getInt(i)));
                    break;
                case Types.DATE:
                    currentRow.addElement(rs.getDate(i));
                    break;
                case Types.TIME:
                    currentRow.addElement(rs.getTime(i));
                    break;
                default:
                    currentRow.addElement(rs.getString(i));
//                    System.out.println("Type was: " + rsmd.getColumnTypeName(i));
            }
        }

        return currentRow;
    }
}