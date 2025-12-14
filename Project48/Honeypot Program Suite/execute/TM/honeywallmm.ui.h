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
****************************************************************************/

int next=0;
bool addButton = FALSE;
bool del = TRUE;
bool add = TRUE;
static int cage_size=0;
static QString id="";
static QString HONEYWALL="";
static QString CONF_FILE ="";
static QString RULE_PATH ="";
static QString RULE_FILE ="";
static QString CAGE_PATH ="";

//Read config file
void readConf()
{
    FILE *fp;
    fp = fopen("./tartarus.conf","r");
    if(fp == NULL)
    {
	printf("cannot open tartarus.conf\n");
	HONEYWALL="localhost";
	CONF_FILE = "/etc/snort_inline/snort_inline.conf";
	RULE_PATH = "/etc/snort_inline/rules/";
	CAGE_PATH = "/home/vmware/";
    }
    else
    {
	 char strbuf[81];
	 char *strptr, *substr,*token;
	 int length ;
	 QString ip,config,rule,cage;
	 strptr = fgets(strbuf,81,fp);
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
	     
	     if(strcmp(token,"HONEYWALL") ==0)
	     {
		 ip = substr + 1;
		 HONEYWALL = ip;
	     }
	     if(strcmp(token,"CONF_FILE") == 0 )
	     {
		 config = substr + 1;
		 CONF_FILE = config;
	     }
	     else if(strcmp(token,"RULE_PATH") == 0)
	     {
		 rule = substr + 1;
		 RULE_PATH = rule;
	     }
	     else if(strcmp(token,"CAGE_PATH") == 0)
	     {
		 cage = substr + 1;
		 CAGE_PATH = cage;
	     }
	     strptr = fgets(strbuf, 81, fp);
	 }
	 fclose(fp);
    }
}

//Initailize program
void HoneywallMM::init()
{
    FILE *fp, *fp2;
    
    char strbuf[81];
    char *strptr, *substr,*token;
    int length ;
    QString CMD;
    
    next =1;

    readConf();

    if(!createConnections())
    {
	printf("Cannot connect to Database\n");
    }
    else
    {
	printf("Connect to database success\n");
    }
    
    RULE_FILE = RULE_PATH + "honeywall.rules";
    
    hostnameLabel->setText("honeywall");
    hostnameLabel->setAlignment(Qt::AlignCenter);
     
    //initailize rule listbox
    CMD = "ssh root@" + HONEYWALL +" ls " + RULE_PATH + " | grep .rules > ./tmp_rules";
    system(CMD.ascii());

    CMD = "ssh root@" + HONEYWALL + " cat " + RULE_FILE + " > ./tmp_honeywall";
    system(CMD.ascii());
    
    fp=fopen("./tmp_honeywall", "r");
    if(fp == NULL)
    {
	fprintf(stderr,"Cannot open honeywall.rules\n");
	exit(1);
    }
    else
    {
	fp2=fopen("./tmp_rules","a");
	 if(fp == NULL)
    	{
		fprintf(stderr,"Cannot open tmp_rules\n");
		exit(1);
    	}
	strptr = fgets(strbuf, 81, fp);
	while(strptr != NULL)
	{
	    length = strlen(strptr);
	    strptr[length-1] = '\0';
	    substr = strstr(strptr,"/");
	    fprintf(fp2,"%s\n",substr+1);
	    token = strtok(substr+1,".");
	    selectRuleListbox->insertItem(token);
	    strptr = fgets(strbuf, 81, fp);
	}
    }
    fclose(fp);
    fclose(fp2);

    system("cat ./tmp_rules | sort -o ./sort_rules");
    system("sort ./tmp_rules -o ./sort_rules");
    system("uniq -u ./sort_rules > ./remain_rules");
    
    fp=fopen("./remain_rules","r");
    if(fp==NULL)
    {
	fprintf(stderr,"Cannot open remain_rules\n");
	exit(1);
    }
    else
    {
	strptr = fgets(strbuf,81,fp);
	while(strptr !=NULL )
	{
	    length = strlen(strptr);
	    strptr[length-1] = '\0';
	    token = strtok(strptr,".");
	    if(strcmp("honeywall",strptr) != 0)
	    {
		RuleChoiceListbox->insertItem(token);
	    }
	    strptr = fgets(strbuf, 81, fp);
	}
    }
   fclose(fp);
   
    //initialize logging tab
    sebek_log->setHidden(TRUE);
    samhain_log->setHidden(TRUE);
    snort_inline_log->setHidden(FALSE);
    showLog();
    
    ip_src_lineEdit->setEnabled(FALSE);
    ip_dst_lineEdit->setEnabled(FALSE);
    sig_lineEdit->setEnabled(FALSE);
    
    path_lineEdit->setEnabled(FALSE);
    owner_new_lineEdit->setEnabled(FALSE);
    owner_old_lineEdit->setEnabled(FALSE);
    
    command_lineEdit1->setEnabled(FALSE);
    command_lineEdit2->setEnabled(FALSE);
    command_lineEdit3->setEnabled(FALSE);
    
    //initail rules tab
    RuleOkButton->setEnabled(FALSE);
    RuleChoiceListbox->setSelectionMode(QListBox::Multi);
    selectRuleListbox->setSelectionMode(QListBox::Multi);
    
    //initail cage information tab
    chageCageState();
    showCageInformation();
    showCageTable();
    PushButtonPrev->setEnabled(FALSE);
    PushButtonFirst->setEnabled(FALSE);
     
    //check status snort_inline and start snort_inline
    CMD = "ssh root@" + HONEYWALL + " cat /usr/local/start.txt > ./tmp_check";
    //printf("CMD ssh = %s\n",CMD.ascii());
    system(CMD.ascii());
    
    
    fp=fopen("./tmp_check","r");
     if(fp==NULL)
    {
	 fprintf(stderr,"Cannot open tmp_check\n");
	 exit(1);
    }
    else
    {
	int flag=0;
	fscanf(fp,"%d",&flag);
	if(flag == 0)
	{
	    starth1();
	    printf("none start\n");
	}
	else
	{
	      h1StartButton->setEnabled(FALSE);
	      h1StopButton->setEnabled(TRUE);
	      h1Status->setText("Active");
	}
    }
   fclose(fp);
	
       
    //initial Cage &Management tab
    PushButtonInsert->setEnabled(FALSE);  
    ipCage->setMaxLength(15);
}

//Destroy dialog
void HoneywallMM::destroy()
{
    FILE *fp;
    system("rm ./tmp_rules");
    system("rm ./remain_rules");
    system("rm ./sort_rules");
    system("rm ./tmp_honeywall");
    fp = fopen("./tmp_check","r");
    if(fp != NULL)
    {
	system("rm ./tmp_check");
	fclose(fp);
    }
}

//Start cage1
void HoneywallMM::startcage1()
{
    if ( !QMessageBox::question(this, "Start Cage?", "Do you want to start it?","&Yes", "&No"
				,QString::null, 0, 1 ) )
    {
	int current=0;
	QString name="", sqlcmd="",cage_path="",CMD="";
	QSqlQuery query;
	name=nameCage1->text();
   
	sqlcmd = "select * from cage.`information` where cname = '"+ name + "'";
	query = queryDB("CAGE",sqlcmd);
	if(query.next())
	    cage_path = query.value(3).toString();
  
	sqlcmd = "update cage.`information` set cstate = 'start' where cname = '"+ name + "'";
	query = queryDB("CAGE",sqlcmd);
   
	//start cage
	CMD = "vmware-cmd -q " + cage_path + "/cage/" + name + "/" + name + ".vmx start";
	system(CMD.ascii());
	printf("start cage1 command = %s\n",CMD.ascii());
      
	QProgressDialog *progressdlg = new QProgressDialog("Now Starting Cage.",
						      "Cancel", 5, this,"progress", TRUE);
	progressdlg->setCaption("Please Wait");
	QPushButton *cancel = new QPushButton(tr("Cancel"),progressdlg);
	progressdlg->setCancelButton(cancel);
	cancel->setEnabled(FALSE);
	while (current<5)
	{
	    progressdlg->setProgress(current++);
	    if (progressdlg->wasCanceled())
		break;
	    sleep(1);
	}
	progressdlg->setProgress(5);
	delete progressdlg;
	progressdlg= NULL ;
    
	cage1StartButton->setEnabled(FALSE);
	cage1SuspendButton->setEnabled(TRUE);
	cage1Status->setText("start");
	cage1Status->setAlignment(Qt::AlignCenter);
	showCageTable();
    }
}

//Suspend cage1 
void HoneywallMM::suspendcage1()
{
    if ( !QMessageBox::question(this, "Suspend Cage?", "Do you want to suspend it?","&Yes", "&No"
				,QString::null, 0, 1 ) )
    {
	int current=0;
	QString name="", hostname ="", sqlcmd="",cage_path="",CMD="";
	QSqlQuery query;
	name=nameCage1->text();
	hostname = hostNametextLabel1->text();
	
	sqlcmd = "select * from cage.`information` where cname = '"+ name + "'";
	query = queryDB("CAGE",sqlcmd);
	if(query.next())
	    cage_path = query.value(3).toString();
   
   
	sqlcmd = "update cage.`information` set cstate = 'suspend' where cname = '"+ name + "'";
	query = queryDB("CAGE",sqlcmd);
	
	if(hostname != "WINDOWS")
	{
	    sqlcmd = "update samhain.`log` set flag = 1 where log_host = '" + hostname + "'"; 
	    query = queryDB("SAMHAIN",sqlcmd);
	}
   
	//suspend cage
	CMD = "vmware-cmd -q " + cage_path + "/cage/"  + name + "/"  + name + ".vmx suspend hard";
	system(CMD.ascii());
	printf("suspend cage1 command = %s\n",CMD.ascii());
	
	QProgressDialog *progressdlg = new QProgressDialog("Now Suspending Cage.", 
							   "Cancel", 5, this,"progress", TRUE);
	progressdlg->setCaption("Please Wait");
	QPushButton *cancel = new QPushButton(tr("Cancel"),progressdlg);
	progressdlg->setCancelButton(cancel);
	cancel->setEnabled(FALSE);
	while (current<5)
	{
	    progressdlg->setProgress(current++);
	    if (progressdlg->wasCanceled())
		break;
	    sleep(1);
	}
	progressdlg->setProgress(5);
	delete progressdlg;
	progressdlg= NULL ;

	cage1StartButton->setEnabled(TRUE);
	cage1SuspendButton->setEnabled(FALSE);
	cage1Status->setText("suspend");
	cage1Status->setAlignment(Qt::AlignCenter);
	showCageTable();
    }
    chageCageState();
}


//Start cage2 
void HoneywallMM::startcage2()
{
    if ( !QMessageBox::question(this, "Start Cage?", "Do you want to start it?","&Yes", "&No"
				,QString::null, 0, 1 ) )
    {
	int current=0;
	QString name="", sqlcmd="",cage_path="",CMD="";
	QSqlQuery query;
	name=nameCage2->text();
   
	sqlcmd = "select * from cage.`information` where cname = '"+ name + "'";
	query = queryDB("CAGE",sqlcmd);
	if(query.next())
	    cage_path = query.value(3).toString();
      
	sqlcmd = "update cage.`information` set cstate = 'start' where cname = '"+ name + "'";
	query = queryDB("CAGE",sqlcmd);
   
	//start cage
	CMD = "vmware-cmd -q " + cage_path + "/cage/"  + name + "/" + name + ".vmx start";
	system(CMD.ascii());
	printf("start cage2 command = %s\n",CMD.ascii());
   
	QProgressDialog *progressdlg = new QProgressDialog("Now Starting Cage.", 
						       "Cancel", 5, this,"progress", TRUE);
	progressdlg->setCaption("Please Wait");
	QPushButton *cancel = new QPushButton(tr("Cancel"),progressdlg);
	progressdlg->setCancelButton(cancel);
	cancel->setEnabled(FALSE);
	while (current<5)
	{
	    progressdlg->setProgress(current++);
	    if (progressdlg->wasCanceled())
		break;
	    sleep(1);
	}
	progressdlg->setProgress(5);
	delete progressdlg;
	progressdlg= NULL ;
   
	cage2StartButton->setEnabled(false);
	cage2SuspendButton->setEnabled(true);
	cage2Status->setText("start");
	cage2Status->setAlignment(Qt::AlignCenter);
	showCageTable();
    }
}

//Suspend cage2 
void HoneywallMM::suspendcage2()
{
    if ( !QMessageBox::question(this, "Suspend Cage?", "Do you want to suspend it?","&Yes", "&No"
				,QString::null, 0, 1 ) )
    {
	int current=0;
	QString name="",hostname="", sqlcmd="",cage_path="",CMD="";
	QSqlQuery query;
	name=nameCage2->text();
	hostname = hostNametextLabel2->text();
   
	sqlcmd = "select * from cage.`information` where cname = '"+ name + "'";
	query = queryDB("CAGE",sqlcmd);
	if(query.next())
	    cage_path = query.value(3).toString();
   
   
	sqlcmd = "update cage.`information` set cstate = 'suspend' where cname = '"+ name + "'";
	query = queryDB("CAGE",sqlcmd);
	
	if(hostname != "WINDOWS")
	{
	    sqlcmd = "update samhain.`log` set flag = 1 where log_host = '" + hostname + "'"; 
	    query = queryDB("SAMHAIN",sqlcmd);
	}
   
	//suspend cage
	CMD = "vmware-cmd -q " + cage_path + "/cage/"  + name + "/" + name + ".vmx suspend hard";
	system(CMD.ascii());
	printf("suspend cage2 command = %s\n",CMD.ascii());
   
	QProgressDialog *progressdlg = new QProgressDialog("Now Suspending Cage.",
							   "Cancel", 5, this,"progress", TRUE);
	progressdlg->setCaption("Please Wait");
	QPushButton *cancel = new QPushButton(tr("Cancel"),progressdlg);
	progressdlg->setCancelButton(cancel);
	cancel->setEnabled(FALSE);
	while (current<5)
	{
	    progressdlg->setProgress(current++);
	    if (progressdlg->wasCanceled())
		break;
	    sleep(1);
	}
	progressdlg->setProgress(5);
	delete progressdlg;
	progressdlg= NULL ;
   
	cage2StartButton->setEnabled(TRUE);
	cage2SuspendButton->setEnabled(FALSE);
	cage2Status->setText("suspend");
	cage2Status-> setAlignment(Qt::AlignCenter);
	showCageTable();
    } 
    chageCageState();
}

//Start cage3 cage
void HoneywallMM::startcage3()
{
    if ( !QMessageBox::question(this, "Start Cage?", "Do you want to start it?","&Yes", "&No"
				,QString::null, 0, 1 ) )
    {
	int current=0;
	QString name="", sqlcmd="",cage_path="",CMD="";
	QSqlQuery query;
	name=nameCage3->text();
   
	sqlcmd = "select * from cage.`information` where cname = '"+ name + "'";
	query = queryDB("CAGE",sqlcmd);
	if(query.next())
	    cage_path = query.value(3).toString();
	
   
	sqlcmd = "update cage.`information` set cstate = 'start' where cname = '"+ name + "'";
	query = queryDB("CAGE",sqlcmd);
	
	//start cage
	CMD = "vmware-cmd -q " + cage_path + "/cage/"  + name + "/" + name + ".vmx start";
	system(CMD.ascii());
	printf("start cage3 command = %s\n",CMD.ascii());
	
	QProgressDialog *progressdlg = new QProgressDialog("Now Starting Cage.",
							   "Cancel", 5, this,"progress", TRUE);
	progressdlg->setCaption("Please Wait");
	QPushButton *cancel = new QPushButton(tr("Cancel"),progressdlg);
	progressdlg->setCancelButton(cancel);
	cancel->setEnabled(FALSE);
	while (current<5)
	{
	    progressdlg->setProgress(current++);
	    if (progressdlg->wasCanceled())
		break;
	    sleep(1);
	}
	progressdlg->setProgress(5);
	delete progressdlg;
	progressdlg= NULL ;

	cage3StartButton-> setDisabled(true);
	cage3SuspendButton->setEnabled(true);
	cage3Status->setText("start");
	cage3Status->setAlignment(Qt::AlignCenter);
	showCageTable();
    }
}

//Suspend cage3  cage
void HoneywallMM::suspendcage3()
{
    if ( !QMessageBox::question(this, "Suspend Cage?", "Do you want to suspend it?","&Yes", "&No"
				,QString::null, 0, 1 ) )
    {
	int current=0;   
	QString name="",hostname="", sqlcmd="",cage_path="",CMD="";
	QSqlQuery query;
	name=nameCage3->text();
	hostname = hostNametextLabel3->text();
	
	sqlcmd = "select * from cage.`information` where cname = '"+ name + "'";
	query = queryDB("CAGE",sqlcmd);
	if(query.next())
	    cage_path = query.value(3).toString();
   
   
	sqlcmd = "update cage.`information` set cstate = 'suspend' where cname = '"+ name + "'";
	query = queryDB("CAGE",sqlcmd);
	
	if(hostname != "WINDOWS")
	{
	    sqlcmd = "update samhain.`log` set flag = 1 where log_host = '" + hostname + "'"; 
	    query = queryDB("SAMHAIN",sqlcmd);
	}
   
	//suspend cage
	CMD = "vmware-cmd -q " + cage_path + "/cage/"  + name + "/" + name + ".vmx suspend hard";
	//system(CMD.ascii());
	printf("suspend cage3 command = %s\n",CMD.ascii());
   
	QProgressDialog *progressdlg = new QProgressDialog("Now Suspending Cage.", 
							   "Cancel", 5, this,"progress", TRUE);
	progressdlg->setCaption("Please Wait");
	QPushButton *cancel = new QPushButton(tr("Cancel"),progressdlg);
	progressdlg->setCancelButton(cancel);
	cancel->setEnabled(FALSE);
	while (current<5)
	{
	    progressdlg->setProgress(current++);
	    if (progressdlg->wasCanceled())
		break;
	    sleep(1);
	}
	progressdlg->setProgress(5);
	delete progressdlg;
	progressdlg= NULL ;

	cage3StartButton->setEnabled(true);
	cage3SuspendButton->setEnabled(false);
	cage3Status->setText("suspend");
	cage3Status->setAlignment(Qt::AlignCenter);
	showCageTable();
    }
        	chageCageState();
}

//Start snort_inline
void HoneywallMM::starth1()
{
    QString CMD;
    CMD = "ssh root@" + HONEYWALL + " sh /root/start_snort.sh";
    system(CMD.ascii());
    h1StartButton->setEnabled(FALSE);
    h1StopButton->setEnabled(TRUE);
    h1Status->setText("Active");
}

//Stop snort_inline
void HoneywallMM::stoph1()
{
    QString CMD;
    CMD = "ssh root@" + HONEYWALL + " sh /root/stop_snort.sh";
    system(CMD.ascii());
    h1StopButton->setEnabled(FALSE);
    h1StartButton->setEnabled(TRUE);
    h1Status->setText("Inactive");
}

//check input data
void HoneywallMM::dataChange()
{
    if(addButton)
    {
	if ( !nameCage->text().isEmpty() &&
	     !ipCage->text().isEmpty() &&
	     !pathCage->text().isEmpty() )
	    PushButtonInsert->setEnabled( TRUE );
	else
	    PushButtonInsert->setEnabled( FALSE );
    }
    else
    {
	PushButtonInsert->setEnabled( FALSE );
	saveConfigButton->setEnabled(TRUE);
    }
}

//Copy Vmware
void HoneywallMM::copyVmware()
{
    QString name = nameCage->text();
    QString old_name = "";
    QString hostname = hostnamecomboBox->currentText();
    QString ip	= ipCage->text();
    QString path = pathCage->text();
    QString source_path = CAGE_PATH;
    QString dest_path = path + "/cage/" + name + "/" ;
    QString CMD;
    int row = 0;
    if(hostname == "FTP")
    {
	old_name = "cage1";
	source_path = source_path + "cage1/* ";
    }
    if(hostname == "WWW")
    {
	old_name = "cage2";
	source_path = source_path + "cage2/* ";
    }
   
    QSqlQuery query;
    QString sqlcmd("SELECT COUNT(*) FROM cage.`information` WHERE cname = '" + name + "'");
    query = queryDB("CAGE",sqlcmd);
    query.next();
    row = query.value(0).toInt();
    if(!query.value(0).toInt())
    {
	CMD = "mkdir -p " + dest_path  + " && " +  "cp -f " + source_path + dest_path + " && " "mv " + dest_path + old_name + ".vmx " + dest_path + name + ".vmx && cat " + dest_path + name + ".vmx | sed s/\\\"" + old_name + "\\\"/\\\"" + name + "\\\"/ > tmp_vmx && mv tmp_vmx " + dest_path + name + ".vmx && chmod 755 "+ dest_path + name + ".vmx &";
	printf("copy vmware = %s\n", CMD.ascii());
	system(CMD.ascii());
	
	int check=60;
	int current=0;
	QProgressDialog *progressdlg = new QProgressDialog("Now Creating New Cage.", "Cancel", check, this,"progress", TRUE);
   
	progressdlg->setCaption("Please Wait");
    
	while (current<check)
	{
	    progressdlg->setProgress(current++);
	    if (progressdlg->wasCanceled())
	   {
	       break;
	   }
	   sleep(1);
            }
	progressdlg->setProgress(check);
	delete progressdlg;
	progressdlg= NULL ;
	if(current >= check)
	{
	    this->regisCage();
	    chageCageState();	
	}
	else
	{
	    PushButtonInsert->setEnabled(FALSE);
	    add = FALSE;
	    CMD = "rm -rf " + dest_path ;
	    printf("remove cage command = %s\n",CMD.ascii());
	    system(CMD);
	}
    }
    else
    {
	PushButtonInsert->setEnabled(FALSE);
	add = FALSE;
	addButton = FALSE;
	QMessageBox::warning( this, "Create Cage ERROR",     
		"This name is exist in database\n"
		"      Please use other name",
		"OK", 0, 0); 
    }
}

//Register cage
void HoneywallMM::regisCage()
{
    QString name = nameCage->text();
    QString hostname = hostnamecomboBox->currentText();
    QString path = pathCage->text() ;
    QString reg;
    if (!QMessageBox::question(this, "Register Cage", tr("Do you want to Register your's cage to Honeypot System ?"), tr("&Yes"), tr("&No"),QString::null, 0, 1 ) )
    {
	reg = "vmware-cmd -s register "+ path + "/cage/" + name + "/"+ name + ".vmx &";
	printf("register cage command = %s\n",reg.ascii());
	system(reg.ascii());
    }
}

//delete cage
void HoneywallMM::delCage()
{
    QString name = nameCage->text();
    QString path = pathCage->text();
    QString del="rm -rf " + path + "/cage/" + name +"/ &";
    QString unreg="vmware-cmd -s unregister "+ path + "/cage/" + name + "/" + name + ".vmx";
    printf("unregis command = %s\n",unreg.ascii());
    printf("del command = %s\n",del.ascii());
    system(unreg.ascii());
    system(del.ascii());
    chageCageState();
    int check=15;
    int current=0;
   QProgressDialog *progressdlg = new QProgressDialog("Now Deleting Cage.", "Cancel", check, this,"progress", TRUE);
     progressdlg->setCaption("Please Wait");
     QPushButton *cancel = new QPushButton(tr("Cancel"),progressdlg);
     progressdlg->setCancelButton(cancel);
     cancel->setEnabled(FALSE);
    
      while (current<check)
      {
	  progressdlg->setProgress(current++);
	  if (progressdlg->wasCanceled())
	  {
	      break; 
	  }
	  sleep(1);
      }
      progressdlg->setProgress(check);
      delete progressdlg;
      progressdlg= NULL;
}

//Create Cage configuration
void HoneywallMM::createCageConfig()
{
    FILE *fp;
    int numU=0;
    int numG=0;
    QString filename="",filename2="";
    QString ownPass="";
    QString pasCh="";
    QString modPas="";
    QString name=nameCage->text();
    QString ip=ipCage->text();
    QString path=pathCage->text();
    QSqlQuery query;   
    
    
    if(saveConfigButton->isDown())
    {
	filename= path + "/cage/" + name + "/cage.conf"; 
    
	if (numCheck->isChecked())
	{
	    numU=numUser->value();
	}
	if (groupCheck->isChecked())
	{
	    numG=groupRoot->value();
	}
	if (ownCheck->isChecked())
	{  	
	    ownPass=ownerPass->text();
	}
	if(passCheck->isChecked())
	{	
	    pasCh=passCh->currentText();
	}
	if(modeCheck->isChecked())
	{	
	    modPas=modePass->currentText();
	}
     
	//check if file not found create new file config
	fp = fopen(filename.ascii(),"w");
	if(fp == NULL)
	{
	    printf("Cannot open %s config file\n",name.ascii());
	}
	else
	{
	    fprintf(fp,"Name=%s\n",name.ascii());
	    fprintf(fp,"User_limit=%d\n",numU);
	    fprintf(fp,"Group_limit=%d\n",numG);
	    fprintf(fp,"Owner_of_passwd=%s\n",ownPass.ascii());
	    fprintf(fp,"Check_password_root=%s\n",pasCh.ascii());
	    fprintf(fp,"Mod_of_passwd=%s\n",modPas.ascii());
	    fclose(fp);
	}
	saveConfigButton->setEnabled(FALSE);
	QString sqlcmd("update cage.`information` set cuser_limit = "+ numUser->text()+ ", cgrp_limit = "+  groupRoot->text() +" where cage_id = "+ id);
	query = queryDB("CAGE",sqlcmd);
	showCageTable();
    }
    if(resetConfigButton->isDown())
    {
	saveConfigButton->setEnabled(TRUE);
	numCheck->setChecked(FALSE);
	groupCheck->setChecked(FALSE);
	ownCheck->setChecked(FALSE);
	passCheck->setChecked(FALSE);
	modeCheck->setChecked(FALSE);
    }
}

//set snort rule
void HoneywallMM::applyRule()
{
    FILE *fp;
    QString rule,CMD;
    if(selectRuleListbox->count() != 0)
    {
	fp=fopen("./tmp_honeywall", "w");
	if( fp ==NULL)
	{
	    printf("Cannot open file honeywall.rules\n");
	    exit(1);
	}
	else
	{
	    for ( unsigned int i = 0; i < selectRuleListbox->count(); i++ ) 
	    {
		QListBoxItem *item = selectRuleListbox->item( i );
		rule =  item->text() ;
		fprintf(fp,"include $RULE_PATH/%s.rules\n",rule.ascii());
	    }
	    fclose(fp);
	}
    }
    else
    {
	clearRule();
    }
    RuleOkButton->setEnabled(FALSE);
    CMD = "scp ./tmp_honeywall root@" + HONEYWALL + ":" + RULE_FILE;
    system(CMD.ascii());

}

//clear snort rules
void HoneywallMM::clearRule()
{
    QString CMD;
    unsigned int count;
    count = selectRuleListbox->count();
    for ( unsigned int i = 0; i < count; i++ ) 
   {
       QListBoxItem *item = selectRuleListbox->item(i);
       RuleChoiceListbox->insertItem(item->text());
   }
    RuleChoiceListbox->sort(TRUE);
    CMD = "cat /dev/null > ./tmp_honeywall";
    system(CMD.ascii());
    CMD = "scp ./tmp_honeywall root@" + HONEYWALL + ":" + RULE_FILE;
    system(CMD.ascii());
    CMD = "ssh root@" + HONEYWALL + " sh restart_snort.sh" ;
    system(CMD.ascii());
    RuleCancleButton->setEnabled(FALSE);
    selectRuleListbox->clear();
}

//Select Rules from list
void HoneywallMM::selectRule()
{
   int count = 0, j=0;
   RuleOkButton->setEnabled(TRUE);
   UnselectRuleButton->setEnabled(TRUE);
   RuleCancleButton->setEnabled(TRUE);
   for (unsigned int i = 0; i <  RuleChoiceListbox->count(); i++ ) 
  {		
	QListBoxItem *item = RuleChoiceListbox->item(i);
	if ( item->isSelected() ) 
	    {
	            count++;
	            selectRuleListbox->insertItem( item->text() );
	    }
    }
   selectRuleListbox->sort(TRUE);
   while (count != 0)
   {
       QListBoxItem *item = RuleChoiceListbox->item(j);
       if ( item->isSelected() ) 
       {
	   RuleChoiceListbox->removeItem(j);
	   count--;
       }
       else
       {
	   j++; 
       }
   }
   if( RuleChoiceListbox->count()==0)
   {
       SelectRuleButton->setEnabled(FALSE);
   }
}

//Remove rules from list
void HoneywallMM::removeRule()
{
   int count = 0, j=0;
   RuleOkButton->setEnabled(TRUE);
   for ( unsigned int i = 0; i < selectRuleListbox->count(); i++ ) 
   {
       QListBoxItem *item = selectRuleListbox->item(i);
       if ( item->isSelected() ) 
       {
	    RuleChoiceListbox->insertItem(item->text());
	    count++;
        }
   }
   RuleChoiceListbox->sort(TRUE);
   while (count != 0)
   {
       QListBoxItem *item = selectRuleListbox->item(j);
       if ( item->isSelected() ) 
       {
	   selectRuleListbox->removeItem(j);
	   count--;
       }
       else
       {
	   j++; 
       }
   }
   if( selectRuleListbox->count()==0)
   {
       UnselectRuleButton->setEnabled(FALSE);
   }
}

//show log
void HoneywallMM::showLog()
{
    QString limit,key1 ="", key2 = "", key3 = "";
    limit = LogcomboBox2->currentText() ;
      
    if(LogcomboBox->currentText () == "snort_inline")
    {
	 if(ip_src_checkBox->isChecked())
	{
	     ip_src_lineEdit->setEnabled(TRUE);
	     if(ip_src_lineEdit->text() != "")
	     {
              	 key1 =  "and inet_ntoa(`ip_src`) like '%"+ ip_src_lineEdit->text() + "%\'";
	     }
	 }
	 else
	 {
	     ip_src_lineEdit->setEnabled(FALSE);
	 }
	 if(ip_dst_checkBox->isChecked())
	 {
	     ip_dst_lineEdit->setEnabled(TRUE);
	     if(ip_dst_lineEdit->text() != "")
	     {
		 key2 = " and inet_ntoa(`ip_dst`) like '%"+ ip_dst_lineEdit->text() + "%\'";
	      }
	 }
	 else
	 {
	      ip_dst_lineEdit->setEnabled(FALSE);
	  }
	  if(sig_name_checkBox->isChecked())
	 {
	      sig_lineEdit->setEnabled(TRUE);
	     if(sig_lineEdit->text() != "")
	     {
		 key3 = " and  `sig_name` like '%"+ sig_lineEdit->text()+ "%\'";		      }
	  }
	  else
	  {
	      sig_lineEdit->setEnabled(FALSE);
	  }
	 QString sqlcmd("SELECT  `timestamp`, `sid`,`cid`,`signature`,`sig_name`,`sig_class_id`,`sig_priority`,inet_ntoa(`ip_src`) AS `ip_src`, inet_ntoa(`ip_dst`) AS `ip_dst` ,`layer4_sport` , `layer4_dport` FROM snort.`acid_event`  where 1 " + key1 + key2 + key3 +" order by`timestamp` DESC limit "  + limit);
	querySnortDB(sqlcmd);
	sebek_log->setHidden(TRUE);
	samhain_log->setHidden(TRUE);
 	snort_inline_log->setHidden(FALSE);
    }
    else if(LogcomboBox->currentText () == "samhain")
    {
	 if(path_checkBox->isChecked())
	{
	     path_lineEdit->setEnabled(TRUE);
	     if(path_lineEdit->text() != "")
	     {
		 key1 = " and l.`path` like '%"+ path_lineEdit->text() + "%\'";
	     }
	 }
	 else
	 {
	     path_lineEdit->setEnabled(FALSE);
	     path_lineEdit->clear();
	 }
	 if(owner_new_checkBox->isChecked())
	 {
	     owner_new_lineEdit->setEnabled(TRUE);
	     if(owner_new_lineEdit->text() != "")
	     {
		 key2 = " and l.`owner_new` like '%"+ owner_new_lineEdit->text() + "%\'";
	     }
	 }
	 else
	 {
	     owner_new_lineEdit->setEnabled(FALSE);
	     owner_new_lineEdit->clear();
	 }
	 if(owner_old_checkBox->isChecked())
	 {
	     owner_old_lineEdit->setEnabled(TRUE);
	     if(owner_old_lineEdit->text() != "")
	     {
		  key3 = " and l.`owner_old` like '%"+ owner_old_lineEdit->text() + "%\'";
	      }
	 }
	 else
	 {
	     owner_old_lineEdit->setEnabled(FALSE);
	     owner_old_lineEdit->clear();
	 }
	 QString sqlcmd("SELECT l.`log_time`, l.`log_host`, l.`log_msg`, l.`path`, l.`mode_old`, l.`mode_new`,l.`owner_old`, l.`owner_new`, l.`group_old`, l.`group_new`, l.`ctime_old`, l.`ctime_new`, l.`link_old`, l.`link_new`, l.`hardlinks_old`, l.`hardlinks_new` FROM samhain.`log` l where 1 " + key1 + key2 + key3 + " order by l.`log_time` DESC limit "+ limit);
	 querySamhainDB(sqlcmd);
	 sebek_log->setHidden(TRUE);
	 samhain_log->setHidden(FALSE);
    }
    else
    {
	 if(command_checkBox1->isChecked())
	{
	     command_lineEdit1->setEnabled(TRUE);
	     if(command_lineEdit1->text() != "")
	     {
		 key1 = " and inet_ntoa(`ip_addr`) like '%"+ command_lineEdit1->text() + "%\'";
	     }
	 }
	 else
	 {
	     command_lineEdit1->setEnabled(FALSE);
	     command_lineEdit1->clear();
	 }
	 if(command_checkBox2->isChecked())
	 {
	     command_lineEdit2->setEnabled(TRUE);
	     if(command_lineEdit2->text() != "")
	     {
		 key2 = " and `command` like '%"+ command_lineEdit2->text() + "%\'";
	     }
	 }
	 else
	 {
	     command_lineEdit2->setEnabled(FALSE);
	     command_lineEdit2->clear();
	 }
	 if(command_checkBox3->isChecked())
	 {
	     command_lineEdit3->setEnabled(TRUE);
	     if(command_lineEdit3->text() != "")
	     {
		 key3 = " or `command` like '%"+ command_lineEdit3->text() + "%\'";
	     }
	 }
	 else
	 {
	     command_lineEdit3->setEnabled(FALSE);
	     command_lineEdit3->clear();
	 }
	 QString sqlcmd("SELECT inet_ntoa(`ip_addr`),`insert_time`, `command`, `counter`, `filed`, `pid`, `uid`, `length` FROM sebek.`read_data`  where 1 " + key1 + key2 + key3 +" order by `insert_time` DESC limit " + limit);
	 //printf("sqlcmd = %s\n",sqlcmd.ascii());
	 querySebekDB(sqlcmd);
	 sebek_log->setShown(TRUE);
	 sebek_log->setHidden(FALSE);
    }
}

void HoneywallMM::showCageInformation()
{
    QString sqlcmd("SELECT * FROM cage.`information` i order by cage_id");
    queryCageDB(sqlcmd);
    saveConfigButton->setEnabled(TRUE);
}

void HoneywallMM::showCageTable()
{
    QString sqlcmd("SELECT * FROM cage.`information` i order by cage_id");
    int i=0,row=0,col;
    QSqlQuery query;
    query = queryDB("CAGE",sqlcmd);
    i= query.size();
    cageTable->setNumRows(i);
    while(query.next())
    {
	for(col = 0 ; col < 9 ; col++)
	{
	    cageTable->setText(row,col,query.value(col+1).toString());
	    cageTable->adjustColumn(col);
	}
	row++;
    }
}

void HoneywallMM::querySnortDB(QString sqlcmd)	
{
    int i=0,row=0,col;  
    QSqlQuery query;
    query = queryDB("SNORT", sqlcmd);
    i= query.size();
    snortLogTable->setNumRows(i);
    while(query.next())
    {
	for(col = 0 ; col < 11; col++)
	{
	    snortLogTable->setText(row,col,query.value(col).toString());
	    snortLogTable->adjustColumn(col);
	}
	row++;
    }	
}

void HoneywallMM::querySamhainDB(QString sqlcmd)	
{
    int i=0,row=0,col=0;
    QSqlQuery query;
    query = queryDB("SAMHAIN", sqlcmd);
    i= query.size();
    samhainLogTable->setNumRows(i);
    while(query.next() )
    {
	for(col = 0 ; col < 16; col++)
	{
	    samhainLogTable->setText(row,col,query.value(col).toString());
	    samhainLogTable->adjustColumn(col);
	}
	row++;
    }
}

void HoneywallMM::querySebekDB(QString sqlcmd)	
{
    int i=0,row=0;
    QSqlQuery query;
    query = queryDB("SEBEK", sqlcmd);
    i= query.size();
    sebekLogTable->setNumRows(i);
    while(query.next() )
    {
	for(int col = 0 ; col < 8; col++)
	{
	    sebekLogTable->setText(row,col,query.value(col).toString());
	    sebekLogTable->adjustColumn(col);
	}
	row++;
    }
}

void HoneywallMM::queryCageDB(QString sqlcmd)
{
       QSqlQuery query;
       query = queryDB("CAGE",sqlcmd);
       cage_size =query.size();
       if(next == cage_size)
      {
	   PushButtonNext->setEnabled(FALSE);
      }
      else if(next<2)
      {
	  PushButtonPrev->setEnabled(FALSE);
      }
       for(int j=0;j<next;j++)
       {
	   query.next();
       }
	id= query.value(0).toString();
	nameCage->setText(query.value(1).toString());
	ipCage->setText(query.value(2).toString());
	pathCage->setText(query.value(3).toString());
	if(query.value(4).toString() == "WWW")
	    hostnamecomboBox->setCurrentItem(0);
	else if (query.value(4).toString() == "FTP")
	    hostnamecomboBox->setCurrentItem(1);
	else
	    if(cage_size >1)
	    hostnamecomboBox->setCurrentItem(2);
	
	numUser->setValue(query.value(6).toInt());
	groupRoot->setValue(query.value(8).toInt());
	
	nameCage->setReadOnly(TRUE);
	pathCage->setReadOnly(TRUE);
	hostnamecomboBox->setEnabled(FALSE);
}

void HoneywallMM::checkButton()
{
    if(PushButtonNext->isDown())
    {
	addButton=FALSE;
	next++;
	PushButtonPrev->setEnabled(TRUE);
	PushButtonFirst->setEnabled(TRUE);
	PushButtonDelete->setEnabled(TRUE);
	PushButtonInsert->setEnabled(FALSE);
	showCageInformation();
	
    }
    else if(PushButtonPrev->isDown())
    {
	if(next > 1)
	{
	    next--;
	    PushButtonNext->setEnabled(TRUE);
	    PushButtonFirst->setEnabled(TRUE);
	    PushButtonDelete->setEnabled(TRUE);
	    PushButtonLast->setEnabled(TRUE);
	    showCageInformation();
	}
                  addButton = FALSE;
    }
    else if(PushButtonFirst->isDown())
    {
	next=1;
	PushButtonNext->setEnabled(TRUE);
	PushButtonPrev->setEnabled(FALSE);
	PushButtonFirst->setEnabled(FALSE);
	PushButtonDelete->setEnabled(TRUE);
	PushButtonLast->setEnabled(TRUE);
	showCageInformation();
	addButton = FALSE;
    }
    else if(PushButtonInsert->isDown())
    {	
	copyVmware();
	if(add)
	{
	    QSqlQuery query;
	    QString name,ip,path,hostname;
	    name = nameCage->text();
	    ip = ipCage->text() ;
	    path = pathCage->text() ;
	    hostname = hostnamecomboBox->currentText();
	    QString sqlcmd("insert into cage.`information`(cname,cip,cpath,chostname,cuser_current,cuser_limit,cgrp_current,cgrp_limit) values('"+ name+"','"+ ip+"','" + path + "','" + hostname +"' , 23 , 26, 1, 1)");
	    query = queryDB("CAGE",sqlcmd);	    
	    PushButtonDelete->setEnabled(TRUE);
	    PushButtonLast->setEnabled(TRUE);
	    showCageTable();
	    chageCageState();
	    PushButtonInsert->setEnabled(FALSE);
	    addButton = FALSE;
	    add = FALSE;
	}
	showCageInformation();
	 
    }
    else if(PushButtonLast->isDown())
    {
	next = cage_size;
	PushButtonLast->setEnabled(FALSE);
	PushButtonNext->setEnabled(FALSE);
	if(next > 1)
	{
	    PushButtonPrev->setEnabled(TRUE);
	}
	PushButtonFirst->setEnabled(TRUE);
	PushButtonInsert->setEnabled(FALSE);
	showCageInformation();
	addButton = FALSE;
    }
    else if(PushButtonDelete->isDown())
    {
	if ( !QMessageBox::question(this, "Delete Cage?", "Do you want to delete it?","&Yes", "&No",QString::null, 0, 1 ) )
	{	
		delCage();
		QSqlQuery query;
		QString sqlcmd("delete from cage.`information` where cage_id = "+ id);
		query = queryDB("CAGE",sqlcmd);
		next--;
		showCageInformation();
		showCageTable();
		chageCageState();
	    }
	PushButtonDelete->setEnabled(FALSE);
	PushButtonDelete->setEnabled(TRUE);
	addButton = FALSE;
    }
    else if(PushButtonClear->isDown())
    {
	addButton = TRUE;
	nameCage->clear();
	ipCage->clear();
	pathCage->clear();
	PushButtonDelete->setEnabled(FALSE);
	nameCage->setReadOnly(FALSE);
	ipCage->setReadOnly(FALSE);
	pathCage->setReadOnly(FALSE);
	hostnamecomboBox->setEnabled(TRUE);
	showCageTable();
    }
}

void HoneywallMM::chageCageState()
{
    QSqlQuery query;
    QString sqlcmd("SELECT * FROM cage.`information` i where cstate = 'start' or cstate = 'stop' order by cstate");
    query = queryDB("CAGE",sqlcmd);
    
    if(query.next())
    {
	hostNametextLabel1->setText(query.value(4).toString());
	hostNametextLabel1->setAlignment(Qt::AlignCenter);
	nameCage1->setText(query.value(1).toString());
	nameCage1->setAlignment(Qt::AlignCenter);
	cage1Status->setText(query.value(5).toString());
	cage1Status->setAlignment(Qt::AlignCenter);
	if(query.value(5).toString() == "start")
	{
	    cage1StartButton->setEnabled(FALSE);
	    cage1SuspendButton->setEnabled(TRUE);
	}
	else
	{
	    cage1SuspendButton->setEnabled(FALSE);
	    cage1StartButton->setEnabled(TRUE);
	}
    }
     else
     {
	 hostNametextLabel1->setText("");
	 nameCage1->setText("");
	 cage1Status->setText("");
     }
     while(query.next())
     {
	 if(query.value(4).toString() !=  hostNametextLabel1->text())
	 {
	     hostNametextLabel2->setText(query.value(4).toString());
	     hostNametextLabel2->setAlignment(Qt::AlignCenter);
	     nameCage2->setText(query.value(1).toString());
	     nameCage2->setAlignment(Qt::AlignCenter);
	     cage2Status->setText(query.value(5).toString());
	     cage2Status->setAlignment(Qt::AlignCenter);
	     if(query.value(5).toString() == "start")
	     {
		 cage2StartButton->setEnabled(FALSE);
		 cage2SuspendButton->setEnabled(TRUE);
	     }
	     else
	     {
		 cage2SuspendButton->setEnabled(FALSE);
		 cage2StartButton->setEnabled(TRUE);
	     }
	     break;
	 }
     }
  
     while(query.next())
    {
	 if((query.value(4).toString() !=  hostNametextLabel1->text()) && 
	    (query.value(4).toString() !=  hostNametextLabel2->text()))
	 {
	     hostNametextLabel3->setText(query.value(4).toString());
	     hostNametextLabel3->setAlignment(Qt::AlignCenter);
	     nameCage3->setText(query.value(1).toString());
	     nameCage3->setAlignment(Qt::AlignCenter);
	     cage3Status->setText(query.value(5).toString());
	     cage3Status->setAlignment(Qt::AlignCenter);
	     if(query.value(5).toString() == "start")
	     {
		 cage3StartButton->setEnabled(FALSE);
		 cage3SuspendButton->setEnabled(TRUE);
	     }
	     else
	     {
		 cage3SuspendButton->setEnabled(FALSE);
		 cage3StartButton->setEnabled(TRUE);
	     }
	     break;
	 }
    }

      
     //initailize status tab
    if(hostNametextLabel1->text() == "")
    {
	cage1StartButton->setEnabled(FALSE);
	cage1SuspendButton->setEnabled(FALSE);
    }
    if(hostNametextLabel2->text() == "")
    {
	cage2StartButton->setEnabled(FALSE);
	cage2SuspendButton->setEnabled(FALSE);
    }
     if(hostNametextLabel3->text() == "")
    {
	cage3StartButton->setEnabled(FALSE);
	cage3SuspendButton->setEnabled(FALSE);
    }
}


void HoneywallMM::configTartarus()
{
    WizardForm *w= new WizardForm(this,"Setup Configuration Wizard",TRUE);
    if(w->exec())
    {
	readConf();

	if(!createConnections())
	{
	    printf("Cannot connect to Database\n");
	}
	else
	{
	    printf("Connect to database success\n");
	}
	
	RULE_FILE = RULE_PATH + "honeywall.rules";
	refresh();
    }
}


void HoneywallMM::about()
{
    AboutDialog	*a = new AboutDialog(this,"About Tartarus Management",TRUE);
    a->show();
}



//Get data from database
void HoneywallMM::refresh()
{
     next =1;
     
     //initialize logging tab
    sebek_log->setHidden(TRUE);
    samhain_log->setHidden(TRUE);
    snort_inline_log->setHidden(FALSE);
    showLog();
    
    ip_src_lineEdit->setEnabled(FALSE);
    ip_dst_lineEdit->setEnabled(FALSE);
    sig_lineEdit->setEnabled(FALSE);
    
    path_lineEdit->setEnabled(FALSE);
    owner_new_lineEdit->setEnabled(FALSE);
    owner_old_lineEdit->setEnabled(FALSE);
    
    command_lineEdit1->setEnabled(FALSE);
    command_lineEdit2->setEnabled(FALSE);
    command_lineEdit3->setEnabled(FALSE);
    
    //initail rules tab
    RuleOkButton->setEnabled(FALSE);
    RuleChoiceListbox->setSelectionMode(QListBox::Multi);
    selectRuleListbox->setSelectionMode(QListBox::Multi);
    
    //initail cage information tab
    chageCageState();
    showCageInformation();
    showCageTable();
    PushButtonPrev->setEnabled(FALSE);
    PushButtonFirst->setEnabled(FALSE);
}
