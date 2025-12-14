package src;

import src.Data;
import src.Subjob;

import  java.util.*;
import java.io.*;

public class Client{
  private  int [][]matrix1;
  private  int [][]matrix2;
  private int rowm1;
  private int colm1;
  private int rowm2;
  private int colm2;

  // check file is Matrix file and set environment for convert
  public boolean isMatrix(String filename, int m) {
    String tmp;
    int col = -1,row = 0;
    try {
      File file = new File(filename);
      FileReader fileReader = new FileReader(file);
      BufferedReader bin = new BufferedReader(fileReader);

      while ( (tmp = bin.readLine()) != null) {
        StringTokenizer token = new StringTokenizer(tmp);
        if (col == -1) {
          col = token.countTokens();
        }
        else if (col != token.countTokens()) {
          System.out.println("file is not matrix");
          return false;
        }
        row++;
      }
    }catch (Exception e){
      System.out.println("Readfile Error!!");
      return false;
    }

    // set environment of checked matrix
    if  (m==1) {
      matrix1 = new int[row][col];
      rowm1 = row;
      colm1 = col;
    }else {
      matrix2 = new int[row][col];
      rowm2 = row;
      colm2 = col;
    }
    return true;
  }

  // build Matrix from text file
  public void buildMatrix(String filename, int m, int row, int col) {
    String tmp;
    int r = 0,c =0;
    try {
      File file = new File(filename);
      FileReader fileReader = new FileReader(file);
      BufferedReader bin = new BufferedReader(fileReader);

      while ( (tmp = bin.readLine()) != null) {
        StringTokenizer token = new StringTokenizer(tmp);
        c =0;
        while (token.hasMoreTokens()) {
          if (m==1){
            matrix1[r][c] = Integer.parseInt(token.nextToken());
          }else {
            matrix2[r][c] = Integer.parseInt(token.nextToken());
          }
          c++;
        }
        r++;
      }
    }catch (Exception e) {
      System.out.println("build matrix Error!!");
    }
  }

  public void printResultToFile(String filename) {
    int row = Data.getNumOfRow_m3();
    int col = Data.getNumOfCol_m3();
    int result[][] = Data.get_m3();
    try {
      FileWriter file = new FileWriter(filename);  //write to fileName

      for (int i=0;i<row ;i++) {
        for (int j=0;j<col ;j++) {
          String s = Integer.toString(result[i][j]);
          file.write(s);
          file.write(' ');
        }
        file.write('\n');
      }
      file.close();
    } catch(Exception e) {
      System.out.println("Error.");
    }
  }

  public static void main (String args[]) {
    // input 2 arguments(files) from user
    String file1 = args[0];
    String file2 = args[1];
    String file3 = args[3];


    Client client = new Client();
    client.isMatrix(file1, 1);
    client.isMatrix(file2, 2);

    if (client.colm1 != client.rowm2) {
      System.out.println("Matrix cannot multiply");
    }
    else {
      client.buildMatrix(file1, 1, client.rowm1, client.colm1);
      client.buildMatrix(file2, 2, client.rowm2, client.colm2);

      // Create Data instance
      Data data1 = new Data(client.rowm1, client.colm1, client.matrix1,
                            client.rowm2, client.colm2, client.matrix2);
//      Data.print_all();
      int machine = 1;

      long time1 = System.currentTimeMillis();

      // split job to be subjob and distibuted by use Thread
      for (int i=0;i<client.rowm1;i++)
        for (int j=0;j<client.colm2;j++)  {
          // choose machine to execute subjob
          if (machine ==1){ machine = 2;}
          else if (machine ==2){ machine = 3; }
          else { machine = 1; };

          // send subjob to selected machine
          Subjob S = new Subjob(i,j,machine);
          S.start();
        }

      // check all thread is completed
      boolean tmp;
      do {
        tmp = Data.checkComplete();
      }while (tmp != true);

      long time2 = System.currentTimeMillis();
      long totaltime = (time2 - time1) / 1000;

      System.out.println("time = " + totaltime);

      // return value to user
     client.printResultToFile(file3);
    }
  }
}
