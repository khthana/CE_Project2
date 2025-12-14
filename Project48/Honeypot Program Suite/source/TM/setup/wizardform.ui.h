/****************************************************************************
** ui.h extension file, included from the uic-generated form implementation.
**
** If you want to add, delete, or rename functions or slots, use
** Qt Designer to update this file, preserving your code.
**
** You should not define a constructor or destructor in this file.
** Instead, write your code in functions called init() and destroy().
** These will automatically be called by the form's constructor and
** destructor.
*****************************************************************************/

void WizardForm::init()
{  
    nameLineEdit->setReadOnly(TRUE);	
    setHelpEnabled(page(0),FALSE);
    setHelpEnabled(page(1),FALSE);    
    FILE *fp;
    bool flag=FALSE;
    fp = fopen("../tartarus.conf","r");
    if(fp == NULL)
    {
	system("touch ../tartarus.conf");
	ipHoneywall->setText("localhost");
	confPath->setText("/etc/snort_inline/snort_inline.conf");
	rulePath->setText("/etc/snort_inline/rules/");
	cagePath->setText("/home/vmware/");
	savePath->setEnabled(TRUE);
	savePath->setFocus();
	setNextEnabled(page(0),FALSE);
    }
    else
    {
	 char strbuf[81];
	 char *strptr, *substr,*token;
	 int length ;
	 QString config,rule,cage,ip;
	 strptr = fgets(strbuf,81,fp);
	 if(strptr == NULL)
	 {
	     ipHoneywall->setText("localhost");
	     confPath->setText("/etc/snort_inline/snort_inline.conf");
	     rulePath->setText("/etc/snort_inline/rules/");
	     cagePath->setText("/home/vmware/");
	     savePath->setEnabled(TRUE);
	     savePath->setFocus();
	     setNextEnabled(page(0),FALSE);
	 }
	 else
	 {
	     savePath->setEnabled(FALSE);
	     nextButton()->setEnabled(TRUE);
	     nextButton()->setFocus();
	 }
	 while(strptr != NULL)
	 {
	     if(strptr[0] == '#')
	     {
		  strptr = fgets(strbuf,81,fp);
	      }
	     length = strlen(strptr);
	     strptr[length-1] = '\0';
	     substr = strstr(strptr,"=");
	     token = strtok(strptr,"=");
	     
	     if(strcmp(token,"HONEYWALL") == 0)
	     {
		 ip = substr + 1;
		 ipHoneywall->setText(ip);
	     }
	     if(strcmp(token,"CONF_FILE") == 0 )
	     {
		 config = substr + 1;
		 confPath->setText(config);
	     }
	     else if(strcmp(token,"RULE_PATH") == 0)
	     {
		 rule = substr + 1;
		 rulePath->setText(rule);
	     }
	     else if(strcmp(token,"CAGE_PATH") == 0)
	     {
		 cage = substr + 1;
		 cagePath->setText(cage);
	     }
	     strptr = fgets(strbuf, 81, fp);
	 }
	 fclose(fp);
    }

    fp = fopen("../tartarusdb.conf","r");
    if(fp == NULL)
    {
	system("touch ../tartarusdb.conf");
	connectPushButton->setEnabled(FALSE);
	connectbuttonGroup->setEnabled(FALSE);
	delPushButton->setEnabled(FALSE);
    }
    else
    {
	 char strbuf[81];
	 char *strptr, *substr,*token;
	 int length ;
	 QString driver,dbname,username,password,hostname;
	 strptr = fgets(strbuf,81,fp);
	 if(strptr == NULL)
	 {
	     connectPushButton->setEnabled(FALSE);
	     connectbuttonGroup->setEnabled(FALSE);
	     delPushButton->setEnabled(FALSE);
	 }
	 else
	 {
	    setFinishEnabled(page(1),TRUE);
	 }
	 while(strptr != NULL)
	 {
	     if(strptr[0] == '#')
	     {
		 length = strlen(strptr);
		 strptr[length-1] = '\0';
		 substr = strstr(strptr," ");
		 token = strtok(substr+1," ");
		 dbListBox->insertItem(token);
		 dbListBox->setSelected(0,TRUE);
		 if(!flag)
		 {
		     nameLineEdit->setText(token);
		 }
		 strptr = fgets(strbuf,81,fp);
	      }
	     if(!flag)
	     {
		 length = strlen(strptr);
		 strptr[length-1] = '\0';
		 substr = strstr(strptr,"=");
		 token = strtok(strptr,"=");
	     
		 if(strcmp(token,"DRIVER") == 0 )
		 {
		     driverComboBox->insertItem(substr+1);
		 }
		 else if(strcmp(token,"DBNAME") == 0 )
		 {
		     dbname = substr + 1;
		     dbnameLineEdit->setText(dbname);
		 }
		 else if(strcmp(token,"USER") == 0)
		 {
		     username = substr + 1;
		     usernameLineEdit->setText(username);
		 }
		 else if(strcmp(token,"PASSWD") == 0)
		 {
		     password = substr + 1;
		     passwordLineEdit->setText(password);
		 }
		 else if(strcmp(token,"HOST") == 0)
		 {
		     hostname = substr + 1;
		     hostnameLineEdit->setText(hostname);
		 }
		 else if(strcmp(token,"PORT") == 0)
		 {
		     portLineEdit->setText(substr + 1);
		     connectbuttonGroup->setEnabled(TRUE);
		     connectPushButton->setEnabled(TRUE);
		     flag = TRUE;
		 }
	     }
	     strptr = fgets(strbuf,81,fp);
	 }
	 fclose(fp);
    }
    passwordLineEdit->setEchoMode(QLineEdit::Password);
}

void WizardForm::checkInput()
{
     if ( !confPath->text().isEmpty() && !rulePath->text().isEmpty() && !cagePath->text().isEmpty() )
    {
	 
	 savePath->setEnabled( TRUE );	
    }
    else
    {
	savePath->setEnabled( FALSE );
    }
    
    if(!nameLineEdit->text().isEmpty() && !dbnameLineEdit->text().isEmpty() && !usernameLineEdit->text().isEmpty() 
	&& !hostnameLineEdit->text().isEmpty() && !portLineEdit->text().isEmpty())
    {
	connectPushButton->setEnabled(TRUE);
    }
    else
    {
	connectPushButton->setEnabled(FALSE);
    }
}


void WizardForm::newConnect()
{
    connectbuttonGroup->setEnabled(TRUE);
    connectPushButton->setEnabled(TRUE);
    dbnameLineEdit->clear();
    usernameLineEdit->clear();
    passwordLineEdit->clear();
    portLineEdit->setText("3306");
    hostnameLineEdit->setText("localhost");
    nameLineEdit->setText("(Default)");
    nameLineEdit->setReadOnly(FALSE);
    if(!driverComboBox->count())
    {
	driverComboBox->insertItem("QMYSQL3");
    }
   newPushButton->setEnabled(FALSE);
}


void WizardForm::connectdb()
{
    QString name="";
    QString driver="QMYSQL3";
    QString dbname="";
    QString username="";
    QString password="";
    QString hostname="localhost";
    QString port="";
    bool flag = FALSE;
    name = nameLineEdit->text().upper();
    connectPushButton->setEnabled(FALSE);
    
    dbname = dbnameLineEdit->text();
    username = usernameLineEdit->text();
    password = passwordLineEdit->text();
    hostname = hostnameLineEdit->text();
    port = portLineEdit->text();
    for(unsigned int i = 0 ; i< dbListBox->count() ; i++)
    {
	QListBoxItem *item = dbListBox->item(i);
	if(name == item->text())
	{
	    editdb(item->text());
	    flag = TRUE;
	    break;
	}
    }
    if(!flag)
    {
	dbListBox->insertItem(name);
	FILE *fp;
	fp = fopen("../tartarusdb.conf","a");
	if(fp == NULL)
	{
	    fprintf(stderr,"Cannot open tartarus.conf\n");
	    exit(1);
	}
	else
	{
	    fprintf(fp,"#Edit %s Database connection here\n",nameLineEdit->text().upper().ascii());
	    fprintf(fp,"DRIVER=%s\n",driver.ascii());
	    fprintf(fp ,"DBNAME=%s\n",dbname.ascii());
	    fprintf(fp,"USER=%s\n",username.ascii());
	    fprintf(fp,"PASSWD=%s\n",password.ascii());
	    fprintf(fp,"HOST=%s\n",hostname.ascii());
	    fprintf(fp,"PORT=%s\n",port.ascii());
	}
	fclose(fp);
    }
    nameLineEdit->setReadOnly(TRUE);
    newPushButton->setEnabled(TRUE);
    finishButton()->setEnabled( TRUE );
}


void WizardForm::disconnectdb()
{
   QString name;
   unsigned  int count = dbListBox->count();
   for (unsigned int i = 0; i < count; i++ ) 
   {		
	QListBoxItem *item = dbListBox->item(i);
	if ( item->isSelected() ) 
	{  
	    name = item->text();
	    if(i>0)
	    {
		deldb(name);
		dbListBox->setSelected(i-1,TRUE);
	    }
	    if(i==0 && dbListBox->count() > 1)
	    {
		deldb(name);
		dbListBox->setSelected(i+1,TRUE);  
	    }
	    dbListBox->removeItem(i);

	    break;
	}
    }
   if(dbListBox->count()==0)
   {
       delPushButton->setDisabled(TRUE);
       finishButton()->setDisabled( TRUE );
       nameLineEdit->clear();
       dbnameLineEdit->clear();
       usernameLineEdit->clear();
       passwordLineEdit->clear();
       hostnameLineEdit->clear();
       portLineEdit->clear();
       connectbuttonGroup->setEnabled(FALSE);
       connectPushButton->setEnabled(FALSE);
       system("cat /dev/null > ../tartarusdb.conf");
   }
}

void WizardForm::saveConfig()
{
    QString ip,config,rule,cage;
    ip = ipHoneywall->text();
    config = confPath->text();
    rule = rulePath->text();
    cage = cagePath->text();
    savePath->setEnabled(FALSE);
    setNextEnabled(page(0),TRUE);
    nextButton()->setEnabled( TRUE );
    newPushButton->setEnabled(TRUE);
    
    FILE *fp;
    fp=fopen("../tartarus.conf","w");
    if(fp == NULL)
    {
	fprintf(stderr,"Cannot open tartarus.conf\n");
	exit(1);
    }
    else
    { 
	fprintf(fp,"#Edit IP honeywall\n");
	fprintf(fp,"HONEYWALL=%s\n",ip.ascii());
	fprintf(fp,"#Edit snort_inline configuration path\n");
	fprintf(fp,"CONF_FILE=%s\n",config.ascii());
	fprintf(fp,"#Edit snort_inline rules path here\n");
	fprintf(fp,"RULE_PATH=%s\n",rule.ascii());
	fprintf(fp,"#Edit cage path here\n");
	fprintf(fp,"CAGE_PATH=%s\n",cage.ascii());
    }
    fclose(fp);
}


void WizardForm::datachange()
{
   nameLineEdit->setReadOnly(TRUE);	
   finishButton()->setEnabled(TRUE);
   if(dbListBox->count() > 1)
    {
       QString name;
       FILE *fp;
       for (unsigned int i = 0; i <  dbListBox->count(); i++ ) 
       {		
	   QListBoxItem *item = dbListBox->item(i);
	   if ( item->isSelected() ) 
	   {
	       name = item->text();
	   }
       }
       
       delPushButton->setEnabled(TRUE);
       fp = fopen("../tartarusdb.conf","r");
       if(fp == NULL)
       {
	   system("touch ../tartarusdb.conf");
	   connectPushButton->setEnabled(FALSE);
	   connectbuttonGroup->setEnabled(FALSE);
       }
       else
       {
	   char strbuf[81];
	   char *strptr, *substr,*token;
	   int length ;
	   QString driver,dbname,username,password,hostname;
	   strptr = fgets(strbuf,81,fp);
	   while(strptr != NULL)
	   {
	       if(strptr[0] == '#')
	       {
		   length = strlen(strptr);
		   strptr[length-1] = '\0';
		   substr = strstr(strptr," ");
		   token = strtok(substr+1," ");
		   if(strcmp(token,name) == 0)
		   {
		       nameLineEdit->setText(token);
		       strptr = fgets(strbuf, 81, fp);
		       while(strptr != NULL)
		       {
			   length = strlen(strptr);
			   strptr[length-1] = '\0';
			   substr = strstr(strptr,"=");
			   token = strtok(strptr,"=");
	     
			   if(strcmp(token,"DBNAME") == 0 )
			   {
			       dbname = substr + 1;
			       dbnameLineEdit->setText(dbname);
			   }
			   else if(strcmp(token,"USER") == 0)
			   {
			       username = substr + 1;
			       usernameLineEdit->setText(username);
			   }
			   else if(strcmp(token,"PASSWD") == 0)
			   {
			       password = substr + 1;
			       passwordLineEdit->setText(password);
			   }
			   else if(strcmp(token,"HOST") == 0)
			   {
			       hostname = substr + 1;
			       hostnameLineEdit->setText(hostname);
			   }
			   else if(strcmp(token,"PORT") == 0)
			   {
			       portLineEdit->setText(substr + 1);
			       connectbuttonGroup->setEnabled(TRUE);
			       connectPushButton->setEnabled(TRUE);
			       break;
			   }
			   strptr = fgets(strbuf, 81, fp);
		       }
		   }
	       }
	         
	       strptr = fgets(strbuf, 81, fp);
	   }	
       }
       fclose(fp);
   }
}

void WizardForm::deldb(QString dbname)
{
    FILE *fp,*fp2;
    char *strptr,*tmpstr;
    char strbuf[81];
    fp = fopen("../tartarusdb.conf","r");
    if( fp == NULL)
    {
	system("touch ../tartarusdb.conf");
    }
    else
    {
	fp2 = fopen("../tartarusdb.tmp","w");
	strptr=fgets(strbuf,81,fp);
	while(strptr != NULL)
	{
	    if(strptr[0] == '#')
	    {
		tmpstr= strstr(strptr,dbname.ascii());
		if(tmpstr != NULL)
		{
		    strptr=fgets(strbuf,81,fp);
		    while(strptr[0] != '#')
		    {
			strptr=fgets(strbuf,81,fp);
			if(strptr == NULL)
			{
			    break;
			}
		    }
		}
		else
		{
		   if(strptr != NULL)
		   {
		       fprintf(fp2,"%s",strptr);
		       strptr=fgets(strbuf,81,fp);
		   }
		 }
	    }
	    else
	    {
		fprintf(fp2,"%s",strptr);	
		strptr=fgets(strbuf,81,fp);
	    }
	}
	fclose(fp);
	fclose(fp2);
    }
    system("cat ../tartarusdb.tmp > ../tartarusdb.conf");
    system("rm ../tartarusdb.tmp");
}


void WizardForm::editdb(QString name)
{
    FILE *fp,*fp2;
    char *strptr,*tmpstr;
    char strbuf[81];
    fp = fopen("../tartarusdb.conf","r");
    if(fp == NULL)
    {
	system("touch ../tartarusdb.conf");
    }
    else
    {
	fp2 = fopen("../tartarusdb.tmp","w");
	strptr=fgets(strbuf,81,fp);
	while(strptr != NULL)
	{
	    if(strptr[0] == '#')
	    {
		tmpstr= strstr(strptr,name.ascii());
		if(tmpstr != NULL)
		{
		    strptr=fgets(strbuf,81,fp);
		    while(strptr[0] != '#')
		    {
			strptr=fgets(strbuf,81,fp);
			if(strptr == NULL)
			{
			    break;
			}
		    }
		    fprintf(fp2,"#Edit %s Database connection here\n",nameLineEdit->text().upper().ascii());
		    fprintf(fp2,"DRIVER=%s\n",driverComboBox->currentText().ascii());
		    fprintf(fp2,"DBNAME=%s\n",dbnameLineEdit->text().ascii());
		    fprintf(fp2,"USER=%s\n",usernameLineEdit->text().ascii());
		    fprintf(fp2,"PASSWD=%s\n",passwordLineEdit->text().ascii());
		    fprintf(fp2,"HOST=%s\n",hostnameLineEdit->text().ascii());
		    fprintf(fp2,"PORT=%s\n",portLineEdit->text().ascii());
		}
		else
		{
		   if(strptr != NULL)
		   {
		       fprintf(fp2,"%s",strptr);
		       strptr=fgets(strbuf,81,fp);
		   }
		 }
	    }
	    else
	    {
		fprintf(fp2,"%s",strptr);	
		strptr=fgets(strbuf,81,fp);
	    }
	}
	fclose(fp);
	fclose(fp2);
    }
    system("cat ../tartarusdb.tmp > ../tartarusdb.conf");
    system("rm ../tartarusdb.tmp");
}


void WizardForm::destroy()
{
	if (!QMessageBox::question(this, "Install Tartarus Management", 
				    "Do you want to Install Tartarus Management ?",
				    tr("&Yes"), tr("&No"),QString::null, 0, 1 ) )
	 {
	     system("sh setup.sh");
	 }
}
