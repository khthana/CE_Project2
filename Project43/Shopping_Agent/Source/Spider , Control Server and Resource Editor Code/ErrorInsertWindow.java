
//Title:        Your Product Name
//Version:      
//Copyright:    Copyright (c) 1999
//Author:       bank
//Company:      KMIT'L
//Description:  Your description

package Spider2;

import java.awt.*;

public class ErrorInsertWindow extends Frame {
  List InsertList = new List();
  Label label1 = new Label();
  TextField TableName = new TextField();
  Label label2 = new Label();
  TextField KeyWord = new TextField();
  Label label3 = new Label();
  TextField Value = new TextField();
  TextField ProvValue = new TextField();
  Label label4 = new Label();
  Button Insert = new Button();
  Button Cancel = new Button();

  public ErrorInsertWindow() {
    try  {
      jbInit();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }

  private void jbInit() throws Exception {
    this.setTitle("Thesaurus");
    this.setLayout(null);
    InsertList.setBounds(new Rectangle(4, 24, 246, 194));
    label1.setBounds(new Rectangle(265, 28, 41, 21));
    label1.setText("Table  :");
    TableName.setBounds(new Rectangle(307, 30, 153, 20));
    label2.setBounds(new Rectangle(276, 53, 69, 21));
    label2.setText("SYNONYM  :");
    KeyWord.setBounds(new Rectangle(346, 54, 114, 20));
    label3.setBounds(new Rectangle(295, 77, 52, 18));
    label3.setText("VALUE  :");
    Value.setBounds(new Rectangle(346, 77, 114, 20));
    ProvValue.setBounds(new Rectangle(346, 99, 114, 20));
    label4.setBounds(new Rectangle(257, 98, 89, 21));
    label4.setText("PROV. VALUE  :");
    Insert.setBounds(new Rectangle(97, 230, 106, 28));
    Insert.setName("Insert");
    Insert.setLabel("Insert");
    Cancel.setLabel("Cancel");
    Cancel.setName("Cancel");
    Cancel.setBounds(new Rectangle(245, 231, 106, 28));
    this.add(InsertList, null);
    this.add(label1, null);
    this.add(TableName, null);
    this.add(label2, null);
    this.add(KeyWord, null);
    this.add(label3, null);
    this.add(Value, null);
    this.add(ProvValue, null);
    this.add(label4, null);
    this.add(Insert, null);
    this.add(Cancel, null);
  }
}                                                                                            
