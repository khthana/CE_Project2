
//Title:        Your Product Name
//Version:      
//Copyright:    Copyright (c) 1999
//Author:       bank
//Company:      KMIT'L
//Description:  Your description

package Spider2;
import java.awt.*;
import javax.swing.*;
public class SpiderInterface extends Frame {
  List crawler_list = new List();
  List URL_list = new List();
  Label label1 = new Label();
  Label label2 = new Label();
  List ProductList = new List();
  Label label3 = new Label();
  List formattor_list = new List();
  Label label4 = new Label();

  public SpiderInterface() {
    try  {
      jbInit();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }

  private void jbInit() throws Exception {
    this.setLayout(null);
    crawler_list.setBounds(new Rectangle(12, 60, 113, 163));
    URL_list.setBounds(new Rectangle(10, 291, 234, 115));
    label1.setBounds(new Rectangle(10, 270, 78, 17));
    label1.setText("URL");
    label2.setBounds(new Rectangle(12, 37, 42, 21));
    label2.setAlignment(1);
    label2.setText("Crawler");
    ProductList.setBounds(new Rectangle(10, 435, 234, 143));
    label3.setText("Product");
    label3.setBounds(new Rectangle(9, 410, 78, 23));
    formattor_list.setBounds(new Rectangle(131, 60, 113, 163));
    label4.setText("Formatter");
    label4.setAlignment(1);
    label4.setBounds(new Rectangle(132, 36, 42, 21));
    this.add(URL_list, null);
    this.add(crawler_list, null);
    this.add(ProductList, null);
    this.add(label1, null);
    this.add(label3, null);
    this.add(label2, null);
    this.add(formattor_list, null);
    this.add(label4, null);
  }
} 