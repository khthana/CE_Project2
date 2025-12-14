package upload;

import java.lang.String;
import java.sql.*;
import java.util.*;
import java.math.*;


/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2546</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class SearchAgent {

    private boolean found;
    private String[] queryKey = {
        "", "", "", "", "", "", "", "", "", "", ""};
    private int flagC[] = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    private int q[] = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

    private double idf[] = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    private int number;
    private String query;
    private Vector result;
    private int N;
    private DataBase con;

    // super ultra constructor
    public SearchAgent() {
        con = new DataBase();
    }


    private boolean GetKey(String key) {
        int j = 0;
        for (int i = 0; i < key.length(); i++) {
            if (key.charAt(i) == ' ') {
                j++;
            }
        }
        if (j == key.length() || key.compareTo("") == 0) {
            return false;
        }
        else {
            keyToword(key);
            return true;
        }
    }


//==============================================================
//----------------Search with keyword only--------***********
//==============================================================
    public boolean Search(String key) {
        key = key.toLowerCase();
        if (!GetKey(key)) {
            return false;
        }
        toQueryKey();

        //===prepare and connect to DB
        con.connect("Por", "nightelf", "jdbc:db2:dc");
        result = con.retrieve("Select count(*) from LYS.TXML AS TXML");
        System.err.println(result);
        N = Integer.parseInt( ( (Vector)result.elementAt(0)).elementAt(0).
                             toString());

        query = "SELECT *  "
            + "FROM LYS.TXML AS TXML "
            + "WHERE ";

        for (int i = 0; i < number; i++) { //each key
            if (flagC[i] == 0 || flagC[i] == 3 || flagC[i] == 6) {
                if (i != 0) {
                    query = query + " OR  ";
                }
                query = query
                    + "(LOWER(TXML.TITLE) LIKE '%" + queryKey[i].toLowerCase() +
                    "%' OR "
                    + "LOWER(TXML.FILENAME) LIKE '%" + queryKey[i].toLowerCase() +
                    "%' OR "
                    + "LOWER(TXML.FILETYPE) LIKE '%" + queryKey[i].toLowerCase() +
                    "%' OR "
                    + "LOWER(TXML.CATEGORY) LIKE '%" + queryKey[i].toLowerCase() +
                    "%' OR "
                    + "LOWER(TXML.DESCRIPTION) LIKE '%" +
                    queryKey[i].toLowerCase() +
                    "%' OR "
                    + "LOWER(TXML.AUTHOR) LIKE '%" + queryKey[i].toLowerCase() +
                    "%'  OR "
                    + "LOWER(TXML.EMAIL) LIKE '%" + queryKey[i].toLowerCase() +
                    "%')";
            }
            else if (flagC[i] == 1 || flagC[i] == 4) {
                if (i != 0) {
                    query = query + " AND ";
                }
                query = query
                    + "(LOWER(TXML.TITLE) LIKE '%" + queryKey[i].toLowerCase() +
                    "%'OR "
                    + "LOWER(TXML.FILENAME) LIKE '%" + queryKey[i].toLowerCase() +
                    "%' OR "
                    + "LOWER(TXML.FILETYPE) LIKE '%" + queryKey[i].toLowerCase() +
                    "%' OR "
                    + "LOWER(TXML.CATEGORY) LIKE '%" + queryKey[i].toLowerCase() +
                    "%' OR "
                    + "LOWER(TXML.DESCRIPTION) LIKE '%" +
                    queryKey[i].toLowerCase() +
                    "%' OR "
                    + "LOWER(TXML.AUTHOR) LIKE '%" + queryKey[i].toLowerCase() +
                    "%'  OR "
                    + "LOWER(TXML.EMAIL) LIKE '%" + queryKey[i].toLowerCase() +
                    "%')";
            }
            else if (flagC[i] == 2 || flagC[i] == 5) {
                if (i != 0) {
                    query = query + " AND ";
                }
                query = query
                    + "(LOWER(TXML.TITLE) NOT LIKE '%" +
                    queryKey[i].toLowerCase() +
                    "%' AND "
                    + "LOWER(TXML.FILENAME) NOT LIKE '%" +
                    queryKey[i].toLowerCase() +
                    "%' AND "
                    + "LOWER(TXML.FILETYPE) NOT LIKE '%" +
                    queryKey[i].toLowerCase() +
                    "%' AND "
                    + "LOWER(TXML.CATEGORY) NOT LIKE '%" +
                    queryKey[i].toLowerCase() +
                    "%' AND "
                    + "LOWER(TXML.DESCRIPTION) NOT LIKE '%" +
                    queryKey[i].toLowerCase() +
                    "%' AND "
                    + "LOWER(TXML.AUTHOR) NOT LIKE '%" +
                    queryKey[i].toLowerCase() +
                    "%'  AND "
                    + "LOWER(TXML.EMAIL) NOT LIKE '%" + queryKey[i].toLowerCase() +
                    "%')";
            }
        } // end for

        result = con.retrieve(query);
        if (result.size() == 0) {
            con.disconnect();
            return false;
        }
        else {
            Rank();
            con.disconnect();
            return true;
        }
    }


//==============================================================
//----------------Search with keyword + category --------***********
//==============================================================
    public boolean Search(String key, String cat) {
        key = key.toLowerCase();
        GetKey(key);
        toQueryKey();
        //===prepare and connect to DB
        con.connect("Por", "nightelf", "jdbc:db2:dc");
        result = con.retrieve("Select count(*) from LYS.TXML AS TXML");
        N = Integer.parseInt( ( (Vector)result.elementAt(0)).elementAt(0).
                             toString());

        query = "SELECT *  "
            + "FROM LYS.TXML AS TXML "
            + "WHERE (LOWER(TXML.CATEGORY) LIKE '%" + cat.toLowerCase() +
            "%' )  AND (";

        for (int i = 0; i < number; i++) { //each key
            if (flagC[i] == 0 || flagC[i] == 3 || flagC[i] == 6) {
                if (i != 0) {
                    query = query + " OR  ";
                }
                query = query
                    + "(LOWER(TXML.TITLE) LIKE '%" + queryKey[i].toLowerCase() +
                    "%' OR "
                    + "LOWER(TXML.FILENAME) LIKE '%" + queryKey[i].toLowerCase() +
                    "%' OR "
                    + "LOWER(TXML.FILETYPE) LIKE '%" + queryKey[i].toLowerCase() +
                    "%' OR "
                    + "LOWER(TXML.CATEGORY) LIKE '%" + queryKey[i].toLowerCase() +
                    "%' OR "
                    + "LOWER(TXML.DESCRIPTION) LIKE '%" +
                    queryKey[i].toLowerCase() +
                    "%' OR "
                    + "LOWER(TXML.AUTHOR) LIKE '%" + queryKey[i].toLowerCase() +
                    "%'  OR "
                    + "LOWER(TXML.EMAIL) LIKE '%" + queryKey[i].toLowerCase() +
                    "%')";
            }
            else if (flagC[i] == 1 || flagC[i] == 4) {
                if (i != 0) {
                    query = query + " AND ";
                }
                query = query
                    + "(LOWER(TXML.TITLE) LIKE '%" + queryKey[i].toLowerCase() +
                    "%'OR "
                    + "LOWER(TXML.FILENAME) LIKE '%" + queryKey[i].toLowerCase() +
                    "%' OR "
                    + "LOWER(TXML.FILETYPE) LIKE '%" + queryKey[i].toLowerCase() +
                    "%' OR "
                    + "LOWER(TXML.CATEGORY) LIKE '%" + queryKey[i].toLowerCase() +
                    "%' OR "
                    + "LOWER(TXML.DESCRIPTION) LIKE '%" +
                    queryKey[i].toLowerCase() +
                    "%' OR "
                    + "LOWER(TXML.AUTHOR) LIKE '%" + queryKey[i].toLowerCase() +
                    "%'  OR "
                    + "LOWER(TXML.EMAIL) LIKE '%" + queryKey[i].toLowerCase() +
                    "%')";
            }
            else if (flagC[i] == 2 || flagC[i] == 5) {
                if (i != 0) {
                    query = query + " AND ";
                }
                query = query
                    + "(LOWER(TXML.TITLE) NOT LIKE '%" +
                    queryKey[i].toLowerCase() +
                    "%' AND "
                    + "LOWER(TXML.FILENAME) NOT LIKE '%" +
                    queryKey[i].toLowerCase() +
                    "%' AND "
                    + "LOWER(TXML.FILETYPE) NOT LIKE '%" +
                    queryKey[i].toLowerCase() +
                    "%' AND "
                    + "LOWER(TXML.CATEGORY) NOT LIKE '%" +
                    queryKey[i].toLowerCase() +
                    "%' AND "
                    + "LOWER(TXML.DESCRIPTION) NOT LIKE '%" +
                    queryKey[i].toLowerCase() +
                    "%' AND "
                    + "LOWER(TXML.AUTHOR) NOT LIKE '%" +
                    queryKey[i].toLowerCase() +
                    "%'  AND "
                    + "LOWER(TXML.EMAIL) NOT LIKE '%" + queryKey[i].toLowerCase() +
                    "%')";
            }
        } // end for
        query = query + ")";
        result = con.retrieve(query);
        if (result.size() == 0) {
            con.disconnect();
            return false;
        }
        else {
            Rank();
            con.disconnect();
            return true;
        }
    }


//==============================================================
//---------------RANKING --------------------***********
//==============================================================
    private void Rank() {
        double simd = 0.0;
        int i, j;
        int temp, max;
        String s;
        Object o, o2;
        Vector sim = new Vector();

        for (j = 0; j < number; j++) { //each key#1
            temp = countDoc(queryKey[j]);
            if (temp != 0) {
                idf[j] = Math.log(N / temp);
            }
            else {
                idf[j] = 0;
            }
        } // end each key#1

        for (i = 0; i < result.size(); i++) { // each row
            s = result.elementAt(i).toString().toLowerCase();
            simd = 0;
            max = 0;
            for (j = 0; j < number; j++) { // each key#2
                temp = countKey(s, queryKey[j]);
                if (flagC[j] == 6 || flagC[j] == 3 || flagC[j] == 4) {
                    q[j] = 2;
                }
                else if (flagC[j] == 2 || flagC[j] == 5) {
                    q[j] = 0;
                }
                else {
                    q[j] = 1;
                }
                if (inTitle(queryKey[j], result.elementAt(i))) {
                    q[j] = q[j] * 2; // in title tag assign double
                }
                if (temp > max) {
                    max = temp;
                }
                simd = simd + temp * idf[j] * q[j];
            } // end each key#2
            simd = simd / max;
            sim.addElement(Double.toString(simd));
            simd = Double.parseDouble(sim.elementAt(i).toString());
        } // end each row
        //loop for swap row
        for (i = 0; i < result.size() - 1; i++) {
            for (j = i + 1; j < result.size(); j++) {
                if (Double.parseDouble(sim.elementAt(i).toString()) <
                    Double.parseDouble(sim.elementAt(j).toString())) {
                    //Swap row
                    //sim
                    o = sim.elementAt(j); //retrieve object index j
                    sim.removeElementAt(j); //remove index j
                    sim.insertElementAt(o, i); //insert object into index i
                    //result
                    o2 = result.elementAt(j);
                    result.removeElementAt(j);
                    result.insertElementAt(o2, i);
                } // end if to Swap
            }
        }
    }


//==============================================================
//==============================================================
    public int getNumber() {
        return result.size();
    }


    //==============================================================
//==============================================================
    public String getString(int row, int column) {
        Vector v;
        v = (Vector)result.elementAt(row);
        return v.elementAt(column).toString();
    }


    //==============================================================
//==============================================================
    public String getString(int row, String column) {
        Vector v;
        int index = 1;
        column = column.toLowerCase();
        if (column.equals( (Object)"title")) {
            index = 1;
        }
        else if (column.equals( (Object)"filename")) {
            index = 2;
        }
        else if (column.equals( (Object)"filetype")) {
            index = 3;
        }
        else if (column.equals( (Object)"category")) {
            index = 4;
        }
        else if (column.equals( (Object)"size")) {
            index = 5;
        }
        else if (column.equals( (Object)"date")) {
            index = 6;
        }
        else if (column.equals( (Object)"time")) {
            index = 7;
        }
        else if (column.equals( (Object)"description")) {
            index = 8;
        }
        else if (column.equals( (Object)"author")) {
            index = 9;
        }
        else if (column.equals( (Object)"email")) {
            index = 10;

        }
        v = (Vector)result.elementAt(row);
        return v.elementAt(index).toString();
    }


//==============================================================
//==============================================================
    private int countKey(String s, String k) {
        int n = 0, i = 25;
        while (i < s.length()) {
            if (s.startsWith(k, i)) {
                n++;
            }
            i++;
        } //end while loop
        return n;
    }


//==============================================================
//==============================================================
    private boolean inTitle(String k, Object o) {
        int i = 0;
        Vector v = (Vector)o;
        while (i < v.elementAt(1).toString().length()) {
            if (v.elementAt(1).toString().toLowerCase().startsWith(k, i)) {
                return true;
            }
            i++;
        } //end while loop
        return false;
    }


//==============================================================
//==============================================================
    private int countDoc(String k) {
        Vector temp;
        query = "Select count(*) from TXML where "
            + "(LOWER(TXML.TITLE) LIKE '%" + k.toLowerCase() +
            "%'OR "
            + "LOWER(TXML.FILENAME) LIKE '%" + k.toLowerCase() +
            "%' OR "
            + "LOWER(TXML.FILETYPE) LIKE '%" + k.toLowerCase() +
            "%' OR "
            + "LOWER(TXML.CATEGORY) LIKE '%" + k.toLowerCase() +
            "%' OR "
            + "LOWER(TXML.DESCRIPTION) LIKE '%" + k.toLowerCase() +
            "%' OR "
            + "LOWER(TXML.AUTHOR) LIKE '%" + k.toLowerCase() +
            "%'  OR "
            + "LOWER(TXML.EMAIL) LIKE '%" + k.toLowerCase() + "%')";
        temp = con.retrieve(query);
        return Integer.parseInt( ( (Vector)temp.elementAt(0)).elementAt(0).
                                toString());

    }


//==============================================================
//==============================================================
    private void toQueryKey() {
        int i = 0;
        while (i < number && flagC[i] == 0) {
            i++;
        }
        if (i == number && i != 1) {
            number++;
            flagC[number - 1] = 6;
            for (i = 0; i < number - 1; i++) {
                queryKey[number - 1] = queryKey[number - 1].concat(queryKey[i]);
                if (i != number - 2) {
                    queryKey[number - 1] = queryKey[number - 1] + " ";
                }
            }
        }
    }


//==============================================================
//==============================================================
    private void keyToword(String key) {
        number = 0;
        int i = 0, j = 0, flag = 0;
        while (i < key.length()) {
            if (flag == 0) {
                if (key.charAt(i) != ' ') { // if not space
                    // hit sign
                    if (key.charAt(i) == '+') { // hit '+'  first
                        number++; // count first word
                        flagC[number - 1] = 1;
                        flag = 1;
                    }
                    else
                    if (key.charAt(i) == '-') { // hit '-' first
                        number++; // count first word
                        flagC[number - 1] = 2;
                        flag = 1;
                    }
                    else
                    if (key.charAt(i) == '\"') { // hit ' " ' first
                        number++; // count first word
                        flagC[number - 1] = flagC[number - 1] + 3;
                        flag = 3;
                    }
                    else
                    // dont' hit sign
                    {
                        number++; // count first word
                        queryKey[number - 1] = queryKey[number -
                            1].concat(String.valueOf(key.charAt(i))); //assign first character of key
                        flag = 1;
                    }
                } // end if not space
            } // end if flag = 0,Start & go until Char
            else
            if (flag == 1) { // assign char to queryKey
                if (key.charAt(i) == ' ') {
                    flag = 2;
                }
                else {
                    if (key.charAt(i) == '\"') {
                        flagC[number - 1] = flagC[number - 1] + 3;
                        flag = 3;
                    }
                    else {
                        queryKey[number - 1] = queryKey[number -
                            1].concat(String.valueOf(key.charAt(i)));
                    }
                } //end else
            } //end if flag = 1
            else
            if (flag == 2) { // check next word
                if (key.charAt(i) != ' ') { // if not space
                    if (key.charAt(i) == '+') {
                        number++; // count first word
                        flagC[number - 1] = 1;
                        flag = 1;
                    }
                    else
                    if (key.charAt(i) == '-') {
                        number++; // count first word
                        flagC[number - 1] = 2;
                        flag = 1;
                    }
                    else
                    if (key.charAt(i) == '\"') {
                        number++; // count next word
                        flagC[number - 1] = flagC[number - 1] + 3;
                        flag = 3;
                    }
                    else {
                        number++; // count next word
                        queryKey[number - 1] = queryKey[number -
                            1].concat(String.valueOf(key.charAt(i)));
                        flag = 1;
                    }
                } // end if - if not space
            } //end if flag = 2
            else
            if (flag == 3) {
                if (key.charAt(i) != '\"') {
                    queryKey[number - 1] = queryKey[number -
                        1].concat(String.valueOf(key.charAt(i)));
                }
                else {
                    flag = 2;
                }
            } //end if flag = 3
            i++;
        } // end while loop
    } // end keyToword()

}
