package src;

public class Data {
  static private int [][] m1;
  static private int [][] m2;
  static private int [][] m3;
  static private int [][] mapm3;
  static private int rowm1,colm1,rowm2,colm2,rowm3,colm3;

  // constructor
  public Data (int x1, int y1, int [][] matrix1, int x2, int y2, int [][] matrix2) {
    rowm1 = x1;
    colm1 = y1;
    rowm2 = x2;
    colm2 = y2;
    rowm3 = rowm1;
    colm3 = colm2;

    m1 = new int[rowm1][colm1];
    m2 = new int[rowm2][colm2];
    m3 = new int[rowm3][colm3];
    mapm3 = new int[rowm3][colm3];

    // init m1
    for (int i=0;i<rowm1;i++)
      for (int j=0;j<colm1;j++) {
        m1[i][j]=matrix1[i][j];
      }

    // init m2
    for (int i=0;i<rowm2;i++)
      for (int j=0;j<colm2;j++) {
        m2[i][j]=matrix2[i][j];
      }

    // init m3 and mapm3
    for (int i=0;i<rowm3;i++)
      for (int j=0;j<colm3;j++) {
        m3[i][j]=0;
        mapm3[i][j]=0;
      }
  }

  // get number of row or column of each array
  static public int getNumOfCol_m1() {
    return colm1;
  }

  static public int getNumOfRow_m2() {
    return rowm2;
  }
  static public int getNumOfRow_m3() {
    return rowm3;
  }

  static public int getNumOfCol_m3() {
    return colm3;
  }

  static public int[] getRow_m1(int n) {
    int [] tmp = new int [colm1];
    for (int i=0;i<colm1;i++) {
      tmp[i] = m1[n][i];
    }
    return tmp;
  }

  static public int[] getCol_m2(int n) {
    int [] tmp = new int [rowm2];
    for (int i=0;i<rowm2;i++) {
      tmp[i] = m2[i][n];
    }
    return tmp;
  }

  static public void set_m3(int r, int c, int num) {
    m3[r][c] = num;
    mapm3[r][c] = 1;
  }

  static public int[][] get_m3() {
    return m3;
  }

  static public boolean checkSubjobComplete(int r, int c) {
    if (mapm3[r][c] == 1) {
      return true;
    }else {
      return false;
    }
  }

  static public boolean checkComplete() {
    int sum = 0;
    for (int i=0;i<rowm3;i++)
      for (int j=0;j<colm3;j++) {
        sum = sum + mapm3[i][j];
      }
    if (sum == (rowm3*colm3)) {
      return true;
    }else{
      return false;
    }
  }

}