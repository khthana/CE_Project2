
//Title:        Your Product Name
//Version:      
//Copyright:    Copyright (c) 1999
//Author:       bank
//Company:      KMIT'L
//Description:  Your description

package Spider2;

import java.awt.*;

public class inter extends Frame {
  TextField Before = new TextField();
  TextField After = new TextField();
  TextField InputURL = new TextField();
  Button OK = new Button();
  TextArea Answer = new TextArea();

  public inter() {
    try  {
      jbInit();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }

  private void jbInit() throws Exception {
    this.setLayout(null);
    Before.setBounds(new Rectangle(49, 68, 266, 27));
    After.setBounds(new Rectangle(49, 102, 266, 27));
    InputURL.setBounds(new Rectangle(13, 33, 302, 27));
    InputURL.setText("http://161.246.5.185:8080/crawler/crawler");
    OK.setBounds(new Rectangle(13, 67, 28, 60));
    OK.setName("OK");
    OK.setLabel("OK");
    Answer.setBounds(new Rectangle(11, 137, 307, 200));
    this.add(InputURL, null);
    this.add(Before, null);
    this.add(After, null);
    this.add(OK, null);
    this.add(Answer, null);
  }
}              
