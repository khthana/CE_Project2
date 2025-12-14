package ngeecal;

import java.math.*;
import java.util.Vector;
import java.lang.*;
import java.sql.Date;
import java.sql.*;

public class CalDecission {

  private AccessDatabase database = Database.getDatabase();
  // refer sql.Date
  private Date dmax,dmin;
  // refer max date
  private String dddd="";
  // refer calDate
  private CalDate caldate = new CalDate();
  // refer Vector contain SET value
  private Vector set_value;

  public CalDecission() {
  }
}