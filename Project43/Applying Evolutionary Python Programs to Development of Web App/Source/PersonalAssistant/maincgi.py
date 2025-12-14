from mod_python import apache
from string	import *
import os
import time

######################################################################
######################################################################
#########						    ##########	
#########		Signup Page			    ##########
#########						    ##########
######################################################################
######################################################################

def signup(req,user,username,password,confirm,email,pager,mobile,taskfield):
    req.content_type = "text/html"
    req.send_http_header()
    error = 0
    file = open('C:\ApacheGroup\Apache\htdocs\user\username.txt','r')
    namelist = file.read()
    file.close()
    exituser = split(namelist,'\n')
    ##### check same username ########
    if exituser != ['']:
        for i in range(len(exituser)-1):
            tmpuser = split(exituser[i],':')
            if tmpuser[0] == username:
                error = 1
    if user == "" or username == "" or password == "" or confirm == "":
        html = """<html>
<head>
<title>error</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<p><b><font size="5" face="Times New Roman, Times, serif">ERROR !</font></b></p>
<p> <font face="Times New Roman, Times, serif" size="4" color="#FF0000">Not Enough 
  Information Please fill all field!</font></p>
</body>
</html>"""
    elif error:
        html = """<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<p><b><font size="5" face="Times New Roman, Times, serif">ERROR !</font></b></p>
<p> <font face="Times New Roman, Times, serif" size="4" color="#FF0000">User name 
  already exist !</font></p>
</body>
</html>"""
    elif password != confirm:
        html = """<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<p><b><font size="5" face="Times New Roman, Times, serif">ERROR !</font></b></p>
<p> <font face="Times New Roman, Times, serif" size="4" color="#FF0000">Password 
  and confirm mismatch!</font></p>
</body>
</html>"""
    else:
        directory = 'C:\ApacheGroup\Apache\htdocs\user\username'
        directory = replace(directory,'username',username)
        ##### sign up success ######
        if exituser == ['']:
            namelist = replace(namelist,'\n','')
    	namelist = namelist + username + ':' + password + "\n"
    	##### save user name #####
    	file = open('C:\ApacheGroup\Apache\htdocs\user\username.txt','w')
    	file.write(namelist)
    	file.close()
    	##### create user directory #####
    	makedir = 'md C:\ApacheGroup\Apache\htdocs\user\username'
    	makedir = replace(makedir,'username',username)
    	os.system(makedir)
    	##### create user detail #####
    	userdir = directory + "\userdetail.txt"
    	userdetail = "user:" + user + "\n" + "username:" + username + "\n" + "password:" + password + "\n" + "email:" + email + "\n" + "pager:" + pager + "\n" + "mobil:" + mobile + "\n" + "field:" + taskfield
        file = open(userdir,'w')
    	file.write(userdetail)
    	file.close()
    	#### create task list #######
    	field = 'field-Time-Event-Action-Actiontime'
    	if taskfield != '':
    		field = field + '-' + taskfield
    	directory = 'C:\ApacheGroup\Apache\htdocs\user\username\\task.txt'
    	taskfile = replace(directory,'username',username)
    	file = open(taskfile,'w')
    	file.write(field)
    	file.close()
    	#### create job.txt #####
    	directory = 'C:\ApacheGroup\Apache\htdocs\user\username\\job.txt'
    	jobfile = replace(directory,'username',username)
    	file = open(jobfile,'w')
    	file.write('')
    	file.close()
    	#### copy user_met ####
    	userdir = 'C:\ApacheGroup\Apache\htdocs\user\user_met.py'
    	file = open(userdir,'r')
        user_met = file.read()
        file.close()
        user_met = replace(user_met,"Username = 'username'","Username = '"+username+"'")
    	userdir = 'C:\ApacheGroup\Apache\htdocs\user\username\user_met.py'
    	userdir = replace(userdir,'username',username)
    	file = open(userdir,'w')
    	file.write(user_met)
    	file.close()
    	#### create usercode add task  ####
    	file = open('C:\ApacheGroup\Apache\cgi-bin\codeaddtask.txt','r')
    	carbon = file.read()
    	file.close()
    	fieldhere = ''
    	taskdata = ''
    	addfield = split(taskfield,'-')
    	for i in addfield:
    		if i != '':
    			fieldhere = fieldhere+','+ i
    			taskdata = taskdata + '+' + "'-'" + '+' + i
    	file = open('C:\ApacheGroup\Apache\cgi-bin\codeaddtask.txt','r')
    	carbon = file.read()
    	file.close()
    	usercarbon = replace(carbon,'##fieldhere##',fieldhere)
    	okcarbon = replace(usercarbon,'##taskdatahere##',taskdata)
    	## add job data ##
    	jobdata = ''
    	if addfield != ['']:
    		jobdata = "+'-'"
    		for i in addfield:
    			if i != '':
    				jobdata = jobdata + '+' + "'<" +  i + ">'" + '+' +  i
    	else:
    		jobdata = jobdata + "+'-'+''" 
    	okcarbon = replace(okcarbon,'##jobdatahere##',jobdata)
    	## replace - ##
    	addreplace = ''
    	if addfield != ['']:
    		for i in addfield:
    			if i != '':
    				addreplace = addreplace +'\n'+'    '+ i +' = '+ 'replace(' + i + ',"-","#keed#")'
    	okcarbon = replace(okcarbon,'#replacekeed#',addreplace)
    	## add job data ##
    	codename = username+'submittask'
    	codefile = 'C:\ApacheGroup\Apache\cgi-bin\##codename##.py'
    	code = replace(codefile,'##codename##',codename)
    	file = open(code,'w')
    	file.write(okcarbon)
    	file.close()
        html = """<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<p><b><font size="5" face="Times New Roman, Times, serif" color="#0099FF">Welcome 
  ! your data already save</font></b></p>
<p><b><font face="Times New Roman, Times, serif" size="4">click main page link 
  for login</font></b></p>
</body>
</html>"""
    return html

######################################################################
######################################################################
#########						    ##########	
#########		Login Page			    ##########
#########						    ##########
######################################################################
######################################################################

def login(req,username,password):
    req.content_type = "text/html"
    req.send_http_header()
    havename = 0
    file = open('C:\ApacheGroup\Apache\htdocs\user\username.txt','r')
    namelist = file.read()
    file.close()
    user_list = split(namelist,'\n')
    for i in range(len(user_list)-1):
        uAndp = split(user_list[i],':')
        if uAndp[0] == username and uAndp[1] == password:
            havename = 1
    if havename:
        ########### personal page #############
        html = """<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
// -->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" link="#FFFFFF">
<table width="86%" border="0">
  <tr> 
    <td width="63%"><font size="+2" color="#000099">Web-base Evolutionary Python 
      Program<br>
      </font><font color="#3399FF"><b>Personal Page</b></font><font size="+2" color="#000099"> 
      </font></td>
    <td width="17%"> 
      <form name="form2" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/modify_page">
        <input type="hidden" name="username" value="#username#">
        <input type="hidden" name="password" value="#password#">
        <input type="image" border="0" name="imageField2" src="http://161.246.5.100/picture/modify.gif" width="105" height="33">
      </form>
    </td>
    <td width="18%"> 
      <form name="form1" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/showtask">
        <input type="hidden" name="username" value="#username#">
        <input type="image" border="0" name="imageField" src="http://161.246.5.100/picture/taskpage.gif" width="105" height="33">
      </form>
    </td>
    <td width="14%"> 
      <form name="form3" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/managemethod">
        <input type="hidden" name="username" value="#username#">
        <input type="image" border="0" name="imageField3" src="http://161.246.5.100/picture/methodpage.gif" width="105" height="33">
      </form>
    </td>
  </tr>
</table>
<p><br>
  <br>
</p>
<p><b><font size="4" color="#FF0000">#userhere# Data</font></b></p>
<table width="55%" border="0">
  <tr> 
    <td width="25%"><font size="3"><b><font face="Times New Roman, Times, serif">Username 
      :</font></b></font></td>
    <td width="75%"><b><font color="#669999">#username#</font></b></td>
  </tr>
  <tr> 
    <td width="25%"><font size="3"><b><font face="Times New Roman, Times, serif">Email 
      : </font></b></font></td>
    <td width="75%"><b><font color="#669999">#email#</font></b></td>
  </tr>
  <tr> 
    <td width="25%"><font size="3"><b><font face="Times New Roman, Times, serif">Pager 
      : </font></b></font></td>
    <td width="75%"><b><font color="#669999">#pager#</font></b></td>
  </tr>
  <tr> 
    <td width="25%"><font size="3"><b><font face="Times New Roman, Times, serif">Mobile 
      : </font></b></font></td>
    <td width="75%"><b><font color="#669999">#mobile#</font></b></td>
  </tr>
  <tr> 
    <td width="25%"><font size="3"><b><font face="Times New Roman, Times, serif">Field 
      : </font></b></font></td>
    <td width="75%"><b><font color="#669999">#field#</font></b></td>
  </tr>
</table>
</body>
</html>"""
	directory = 'C:\ApacheGroup\Apache\htdocs\user\username\userdetail.txt'
        detailfile = replace(directory,'username',username)
        file = open(detailfile,'r')
        detail = file.read()
    	file.close()
    	detaillist = split(detail,'\n')
    	user = split(detaillist[0],':')
    	email  = split(detaillist[3],':')
    	pager  = split(detaillist[4],':')
    	mobile = split(detaillist[5],':')
    	field  = split(detaillist[6],':')
    	html = replace(html,'#password#',password)
        html = replace(html,'#userhere#',user[1])
        html = replace(html,'#username#',username)
        html = replace(html,'#email#',email[1])
        html = replace(html,'#pager#',pager[1])
        html = replace(html,'#mobile#',mobile[1])
        html = replace(html,'#field#',field[1])
    	########### personal page #############
    elif username == '' or password == '':
        html = """<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<p><font face="Times New Roman, Times, serif" size="+3"><b>U<font size="+1">NAUTHORIZED</font></b></font> 
  <b>401</b></p>
<p><font face="Times New Roman, Times, serif" size="4" color="#FF0000">Please 
  fill all field !</font></p>
</body>
</html>"""
    else:
        html = """<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<p><font face="Times New Roman, Times, serif" size="+3"><b>U<font size="+1">NAUTHORIZED</font></b></font> 
  <b>401</b></p>
<p><font face="Times New Roman, Times, serif" size="4" color="#FF0000">Username 
  and Password mismatch!</font></p>
</body>
</html>"""
    return html

######################################################################
######################################################################
#########						    ##########	
#########		ShowTask Page			    ##########
#########						    ##########
######################################################################
######################################################################

def showtask(req,username):
    req.content_type = "text/html"
    req.send_http_header()
    html = """<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<table width="74%" border="0">
  <tr>
    <td width="85%"><font size="+2" color="#000099">Web-base Evolutionary Python 
      Program<br>
      </font><font color="#3399FF"><b>Show Task</b></font><font size="+2" color="#000099"> 
      <br>
      </font></td>
    <td width="15%">
      <form name="form2" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/login">
        <input type="hidden" name="username" value="##username##">
        <input type="hidden" name="password" value="##password##">
        <input type="image" border="0" name="imageField2" src="http://161.246.5.100/picture/personalpage.gif" width="105" height="33">
      </form>
    </td>
    <td width="15%">
      <form name="form4" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/managemethod">
        <input type="hidden" name="username" value="##username##">
        <input type="image" border="0" name="imageField4" src="http://161.246.5.100/picture/methodpage.gif" width="105" height="33">
      </form>
    </td>
  </tr>
</table><br>
<br>
<table width="92%" border="0">
  <tr>
    <td width="3%" height="41">&nbsp;</td>
    <td width="15%" height="41"> 
      <form name="form1" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/addtask">
        <input type="hidden" name="username" value="##username##">
        <input type="image" border="0" name="imageField" src="http://161.246.5.100/picture/addtask.gif" width="105" height="33">
      </form>
    </td>
    <td width="22%" height="41"> 
      <form name="form3" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/removetask">
        <input type="hidden" name="username" value="##username##">
        <input type="image" border="0" name="imageField3" src="http://161.246.5.100/picture/removetask.gif" width="105" height="33">
      </form>
    </td>
    <td width="60%" height="41">&nbsp;</td>
  </tr>
</table>
<br>
<table width="#addwidthhere#" border="0">
  <tr>   
    #AddAllFieldHere#
  </tr>
  <tr> 
    <td width="150">&nbsp;</td>
    <td width="250">&nbsp;</td>
    <td width="150">&nbsp;</td>
    #AddSpaceHere#
  </tr>
  #AddAllRowHere#
</table>
</body>
</html>"""
    html = replace(html,'##username##',username)
    directory = 'C:\ApacheGroup\Apache\htdocs\user\username\userdetail.txt'
    detailfile = replace(directory,'username',username)
    file = open(detailfile,'r')
    detail = file.read()
    file.close()
    detaillist = split(detail,'\n')
    password = split(detaillist[2],':')
    html = replace(html,'##password##',password[1])
    width = '550'
    directory = 'C:\ApacheGroup\Apache\htdocs\user\username\\task.txt'
    taskfile = replace(directory,'username',username)
    #### read user properties ######
    file = open(taskfile,'r')
    task = file.read()
    file.close()
    tasklist = split(task,'\n')
    #### add field ####
    space = ''
    spacetmp = '<td width="150">&nbsp;</td>'
    staticfield = ['field','Time','Event','Action']
    field = '<td width="150"><b><font face="Times New Roman, Times, serif" size="4" color="#FF0000">#fieldname</font></b></td>'
    fieldlist = split(tasklist[0],'-')
    allfield = """<td width="150"><b><font face="Times New Roman, Times, serif" size="4" color="#FF0000">Time</font></b></td>
<td width="250"><font face="Times New Roman, Times, serif" size="4"><b><font color="#FF0000">Event</font></b></font></td>
<td width="150"><b><font face="Times New Roman, Times, serif" size="4" color="#FF0000">Action</font></b></td>"""
    if len(fieldlist) > 4:
        widthint = atoi(width)
        for i in fieldlist:
            if i not in staticfield: 
                widthint = widthint + 150
                fieldtmp = replace(field,'#fieldname',i)
                allfield = allfield +"\n"+ fieldtmp
                space = space + spacetmp
        width = repr(widthint)
    html = replace(html,'#AddAllFieldHere#',allfield)
    html = replace(html,'#AddSpaceHere#',space)
    #### add field OK #####
    #### add data ######
    row = """<tr> 
#rowtmp#
</tr>"""
    datainrow = ''
    allrow = ''
    message = '<td width="150"><b><font face="Times New Roman, Times, serif">#AddMessageHere#</font></b></td>'
    for i in range(len(tasklist)):
        if i != 0:
            datalist = split(tasklist[i],'-')
            for j in range(len(fieldlist)):
                if j < (len(datalist)-1):
                    if datalist[j] != '0/0/0000 0:0':
                        showme = datalist[j]
                        showme = replace(showme,'#keed#','-')
                    else:
                        showme = 'Not notify'
                    messagetmp = replace(message,'#AddMessageHere#',showme)
                    datainrow = datainrow +'\n'+ messagetmp
            rowtmp = replace(row,"#rowtmp#",datainrow)
            datainrow = ''
            allrow = allrow + '\n' + rowtmp
    html = replace(html,'#AddAllRowHere#',allrow)
    #### change width ###
    html = replace(html,'#addwidthhere#',width)
    return html

######################################################################
######################################################################
#########						    ##########	
#########		AddTask Page			    ##########
#########						    ##########
######################################################################
######################################################################

def addtask(req,username):
    req.content_type = "text/html"
    req.send_http_header()
    userfield = """<br>
<br>
<table width="42%" border="0">
<tr>
<td width="20%"><b>#newfield#:</b></td>
<td width="80%"> 
<input type="text" name="#newfield#" size="40">
</td>
</tr>
</table>"""
    #### add task page ###
    html = """<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<p><font size="+2" color="#000099">Web-base Evolutionary Python Program</font><br>
  <font color="#3399FF"><b>Add Task Page</b></font></p>
<p><br>
</p>
<form name="form1" method="post" action="http://161.246.5.100/cgi-bin/##username##submittask.py/submit_task">
<input type="hidden" name="username" value="##username##">
  <table width="99%" border="0">
    <tr> 
      <td width="20%"><b>Day/Month/Year: </b></td>
      <td width="4%"> 
        <select name="day">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
          <option value="13">13</option>
          <option value="14">14</option>
          <option value="15">15</option>
          <option value="16">16</option>
          <option value="17">17</option>
          <option value="18">18</option>
          <option value="19">19</option>
          <option value="20">20</option>
          <option value="21">21</option>
          <option value="22">22</option>
          <option value="23">23</option>
          <option value="24">24</option>
          <option value="25">25</option>
          <option value="26">26</option>
          <option value="27">27</option>
          <option value="28">28</option>
          <option value="29">29</option>
          <option value="30">30</option>
          <option value="30">31</option>
        </select>
      </td>
      <td width="5%"> 
        <select name="month">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
        </select>
      </td>
      <td width="9%"> 
        <select name="year">
          <option value="2001">2001</option>
          <option value="2002">2002</option>
          <option value="2003">2003</option>
          <option value="2004">2004</option>
        </select>
      </td>
      <td width="29%"><b>Time (hour/minute/second):</b></td>
      <td width="5%"> 
        <select name="hour">
          <option value="0">0</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
          <option value="13">13</option>
          <option value="14">14</option>
          <option value="15">15</option>
          <option value="16">16</option>
          <option value="17">17</option>
          <option value="18">18</option>
          <option value="19">19</option>
          <option value="20">20</option>
          <option value="21">21</option>
          <option value="22">22</option>
          <option value="23">23</option>
        </select>
      </td>
      <td width="5%"> 
        <select name="minute">
          <option value="0">0</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
          <option value="13">13</option>
          <option value="14">14</option>
          <option value="15">15</option>
          <option value="16">16</option>
          <option value="17">17</option>
          <option value="18">18</option>
          <option value="19">19</option>
          <option value="20">20</option>
          <option value="21">21</option>
          <option value="22">22</option>
          <option value="23">23</option>
          <option value="24">24</option>
          <option value="25">25</option>
          <option value="26">26</option>
          <option value="27">27</option>
          <option value="28">28</option>
          <option value="29">29</option>
          <option value="30">30</option>
          <option value="31">31</option>
          <option value="32">32</option>
          <option value="33">33</option>
          <option value="34">34</option>
          <option value="35">35</option>
          <option value="36">36</option>
          <option value="37">37</option>
          <option value="38">38</option>
          <option value="39">39</option>
          <option value="40">40</option>
          <option value="41">41</option>
          <option value="42">42</option>
          <option value="43">43</option>
          <option value="44">44</option>
          <option value="45">45</option>
          <option value="46">46</option>
          <option value="47">47</option>
          <option value="48">48</option>
          <option value="49">49</option>
          <option value="50">50</option>
          <option value="51">51</option>
          <option value="52">52</option>
          <option value="53">53</option>
          <option value="54">54</option>
          <option value="55">55</option>
          <option value="56">56</option>
          <option value="57">57</option>
          <option value="58">58</option>
          <option value="59">59</option>
        </select>
      </td>
      <td width="23%"> 
        <select name="second">
          <option value="0">0</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
          <option value="13">13</option>
          <option value="14">14</option>
          <option value="15">15</option>
          <option value="16">16</option>
          <option value="17">17</option>
          <option value="18">18</option>
          <option value="19">19</option>
          <option value="20">20</option>
          <option value="21">21</option>
          <option value="22">22</option>
          <option value="23">23</option>
          <option value="24">24</option>
          <option value="25">25</option>
          <option value="26">26</option>
          <option value="27">27</option>
          <option value="28">28</option>
          <option value="29">29</option>
          <option value="30">30</option>
          <option value="31">31</option>
          <option value="32">32</option>
          <option value="33">33</option>
          <option value="34">34</option>
          <option value="35">35</option>
          <option value="36">36</option>
          <option value="37">37</option>
          <option value="38">38</option>
          <option value="39">39</option>
          <option value="40">40</option>
          <option value="41">41</option>
          <option value="42">42</option>
          <option value="43">43</option>
          <option value="44">44</option>
          <option value="45">45</option>
          <option value="46">46</option>
          <option value="47">47</option>
          <option value="48">48</option>
          <option value="49">49</option>
          <option value="50">50</option>
          <option value="51">51</option>
          <option value="52">52</option>
          <option value="53">53</option>
          <option value="54">54</option>
          <option value="55">55</option>
          <option value="56">56</option>
          <option value="57">57</option>
          <option value="58">58</option>
          <option value="59">59</option>
        </select>
      </td>
    </tr>
  </table>
  <br>
  <br>
  <table width="41%" border="0">
    <tr>
      <td width="52%"><b>Event:</b></td>
      <td width="48%"> 
        <textarea name="event" rows="3" cols="40"></textarea>
      </td>
    </tr>
  </table>
  <br>
  <br>
  <table width="33%" border="0">
    <tr>
      <td width="17%"><b>Action:</b></td>
      <td width="83%"> 
        <select name="action">
          <option value="None">None</option>
          ##actionvalue##
        </select>
      </td>
    </tr>
  </table>
  <br>
  <table width="99%" border="0">
    <tr> 
      <td width="27%"><b>Actiontime (dd/mm/yy):</b></td>
      <td width="1%"> 
        <select name="actday">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
          <option value="13">13</option>
          <option value="14">14</option>
          <option value="15">15</option>
          <option value="16">16</option>
          <option value="17">17</option>
          <option value="18">18</option>
          <option value="19">19</option>
          <option value="20">20</option>
          <option value="21">21</option>
          <option value="22">22</option>
          <option value="23">23</option>
          <option value="24">24</option>
          <option value="25">25</option>
          <option value="26">26</option>
          <option value="27">27</option>
          <option value="28">28</option>
          <option value="29">29</option>
          <option value="30">30</option>
          <option value="30">31</option>
        </select>
      </td>
      <td width="5%"> 
        <select name="actmonth">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
        </select>
      </td>
      <td width="7%"> 
        <select name="actyear">
          <option value="2001">2001</option>
          <option value="2002">2002</option>
          <option value="2003">2003</option>
          <option value="2004">2004</option>
        </select>
      </td>
      <td width="4%"><b>(h/m):</b></td>
      <td width="5%"> 
        <select name="acthour">
          <option value="0">0</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
          <option value="13">13</option>
          <option value="14">14</option>
          <option value="15">15</option>
          <option value="16">16</option>
          <option value="17">17</option>
          <option value="18">18</option>
          <option value="19">19</option>
          <option value="20">20</option>
          <option value="21">21</option>
          <option value="22">22</option>
          <option value="23">23</option>
        </select>
      </td>
      <td width="5%"> 
        <select name="actminute">
          <option value="0">0</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
          <option value="13">13</option>
          <option value="14">14</option>
          <option value="15">15</option>
          <option value="16">16</option>
          <option value="17">17</option>
          <option value="18">18</option>
          <option value="19">19</option>
          <option value="20">20</option>
          <option value="21">21</option>
          <option value="22">22</option>
          <option value="23">23</option>
          <option value="24">24</option>
          <option value="25">25</option>
          <option value="26">26</option>
          <option value="27">27</option>
          <option value="28">28</option>
          <option value="29">29</option>
          <option value="30">30</option>
          <option value="31">31</option>
          <option value="32">32</option>
          <option value="33">33</option>
          <option value="34">34</option>
          <option value="35">35</option>
          <option value="36">36</option>
          <option value="37">37</option>
          <option value="38">38</option>
          <option value="39">39</option>
          <option value="40">40</option>
          <option value="41">41</option>
          <option value="42">42</option>
          <option value="43">43</option>
          <option value="44">44</option>
          <option value="45">45</option>
          <option value="46">46</option>
          <option value="47">47</option>
          <option value="48">48</option>
          <option value="49">49</option>
          <option value="50">50</option>
          <option value="51">51</option>
          <option value="52">52</option>
          <option value="53">53</option>
          <option value="54">54</option>
          <option value="55">55</option>
          <option value="56">56</option>
          <option value="57">57</option>
          <option value="58">58</option>
          <option value="59">59</option>
        </select>
      </td>
      <td width="1%">&nbsp; </td>
      <td width="45%"><b><font size="3">&lt;&lt;&lt;&lt; time to notify</font></b></td>
    </tr>
  </table>
  ##adduserformhere##
<br>
  <br>
  <input type="submit" name="Submit" value="Submit">
</form>
<p>&nbsp; </p>
</body>
</html>"""
    ### add method in menu ###
    actionvalue = '<option value="##actvalue##">##actvalue##</option>'
    allvalue = ''
    userfile = 'C:\ApacheGroup\Apache\htdocs\user\username\user_met.py'
    userfile = replace(userfile,'username',username)
    dirtmp = 'C:\ApacheGroup\Apache\cgi-bin\get_methods.py'
    file = open(dirtmp,'r')
    tmp = file.read()
    file.close()
    exec tmp
    method_dic = get_methods(userfile)
    method_list = []
    if method_dic != {}:
        method_list = method_dic.keys()
    for method in method_list:
        acttmp = replace(actionvalue,'##actvalue##',method)
        allvalue = allvalue + acttmp
    html = replace(html,'##actionvalue##',allvalue) 
    ### add method in menu ###
    html = replace(html,'##username##',username)
    ### add task page ###
    directory = 'C:\ApacheGroup\Apache\htdocs\user\username\\task.txt'
    taskfile = replace(directory,'username',username)
    #### read user properties (use tasklist[0] for field)######
    file = open(taskfile,'r')
    task = file.read()
    file.close()
    tasklist = split(task,'\n')
    fieldlist = split(tasklist[0],'-')
    alluserfield = ''
    if len(fieldlist) > 5:
        for i in range(len(fieldlist)):
            if i > 4:
                userfieldtmp = replace(userfield,'#newfield#',fieldlist[i])
                alluserfield = alluserfield + userfieldtmp
                userfieldtmp = ''
    html = replace(html,'##adduserformhere##',alluserfield)
    return html

######################################################################
######################################################################
#########						    ##########	
#########		Modify Page			    ##########
#########						    ##########
######################################################################
######################################################################
    
def modify_page(req,username,password):
    req.content_type = "text/html"
    req.send_http_header()
    html = """<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
// -->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<p><font size="+2"><b><font face="Times New Roman, Times, serif" color="#0000CC">Modify 
  Data Form</font></b></font></p>
<p>&nbsp;</p>
<table width="92%" border="0">
  <tr>
    <td width="3%" height="41">&nbsp;</td>
    <td width="15%">
      <form name="form2" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/login">
        <input type="hidden" name="username" value="##username##">
        <input type="hidden" name="password" value="##password##">
        <input type="image" border="0" name="imageField2" src="http://161.246.5.100/picture/personalpage.gif" width="105" height="33">
      </form>
    </td>
    <td width="60%" height="41">&nbsp;</td>
  </tr>
</table>
<div id="Layer1" style="position:absolute; width:411px; height:249px; z-index:1; background-color: #CC6600; layer-background-color: #CC6600; border: 1px none #000000"> 
  <form name="form1" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/submitmodify">
    <br>
    <table width="98%" border="0" height="157">
      <tr> 
        <td width="7%" height="26">&nbsp;</td>
        <td width="22%" height="26"><font face="Times New Roman, Times, serif" size="3"><b>Your 
          Name:</b></font></td>
        <td width="71%" height="26"> 
          <input type="text" name="user" size="30" value="#user#">
        </td>
      </tr>
      <tr> 
        <td width="7%" height="22">&nbsp;</td>
        <td width="22%" height="22"><font face="Times New Roman, Times, serif" size="3"><b>Password:</b></font></td>
        <td width="71%" height="22"> 
          <input type="password" name="password" size="15" value="#password#">
        </td>
      </tr>
      <tr> 
        <td width="7%" height="9">&nbsp;</td>
        <td width="22%" height="9"><font face="Times New Roman, Times, serif" size="3"><b>Confirm:</b></font></td>
        <td width="71%" height="9"> 
          <input type="password" name="confirm" size="15">
        </td>
      </tr>
      <tr> 
        <td width="7%" height="2">&nbsp;</td>
        <td width="22%" height="2"><font face="Times New Roman, Times, serif" size="3"><b>Email:</b></font></td>
        <td width="71%" height="2"> 
          <input type="text" name="email" size="30" value="#email#">
          <font face="Times New Roman, Times, serif" size="3"><b>(optional)</b></font> 
        </td>
      </tr>
      <tr> 
        <td width="7%" height="2">&nbsp;</td>
        <td width="22%" height="2"><b><font face="Times New Roman, Times, serif" size="3">Pager:</font></b></td>
        <td width="71%" height="2"> 
          <input type="text" name="pager" size="30" value="#pager#">
          <font face="Times New Roman, Times, serif" size="3"><b>(optional)</b></font> 
        </td>
      </tr>
      <tr> 
        <td width="7%" height="2">&nbsp;</td>
        <td width="22%" height="2"><font face="Times New Roman, Times, serif" size="3"><b>Mobile:</b></font></td>
        <td width="71%" height="2"> 
          <input type="text" name="mobile" size="30" value="#mobile#">
          <font face="Times New Roman, Times, serif" size="3"><b>(optional)</b></font> 
        </td>
      </tr>
      <tr> 
        <td width="7%" height="2">&nbsp;</td>
        <td width="22%" height="2"><font face="Times New Roman, Times, serif" size="3"><b>TaskField:</b></font></td>
        <td width="71%" height="2"> 
          <input type="text" name="taskfield" size="30" value="#taskfield#">
          <font face="Times New Roman, Times, serif" size="3"><b>(optional)</b></font> 
          <input type="hidden" name="username" value="#username#">
          <input type="hidden" name="oldpassword" value="#oldpassword#">
          <input type="hidden" name="oldtaskfield" value="#oldtaskfield#">
        </td>
      </tr>
    </table>
    <br>
    <table width="68%" border="0">
      <tr>
        <td width="45%">&nbsp;</td>
        <td width="55%"> 
          <input type="submit" name="Submit" value="Modify">
        </td>
      </tr>
    </table>
    </form>
</div>
<p>&nbsp; </p>
</body>
</html>"""
    ## personal page link
    html = replace(html,'##username##',username)
    html = replace(html,'##password##',password)
    ##
    directory = 'C:\ApacheGroup\Apache\htdocs\user\username\userdetail.txt'
    detailfile = replace(directory,'username',username)
    file = open(detailfile,'r')
    detail = file.read()
    file.close()
    detaillist = split(detail,'\n')
    user = split(detaillist[0],':')
    email  = split(detaillist[3],':')
    pager  = split(detaillist[4],':')
    mobile = split(detaillist[5],':')
    taskfield  = split(detaillist[6],':')
    html = replace(html,"#username#",username)
    html = replace(html,"#oldpassword#",password)
    html = replace(html,"#user#",user[1])
    html = replace(html,"#password#",password)
    html = replace(html,"#email#",email[1])
    html = replace(html,"#pager#",pager[1])
    html = replace(html,"#mobile#",mobile[1])
    html = replace(html,"#taskfield#",taskfield[1])
    html = replace(html,"#oldtaskfield#",taskfield[1])
    return html

######################################################################
######################################################################
#########						    ##########	
#########	        Submit Modify Page		    ##########
#########						    ##########
######################################################################
######################################################################

def submitmodify(req,user,username,password,confirm,email,pager,mobile,taskfield,oldpassword,oldtaskfield):
    req.content_type = "text/html"
    req.send_http_header()
    error = 0
    file = open('C:\ApacheGroup\Apache\htdocs\user\username.txt','r')
    namelist = file.read()
    file.close()
    exituser = split(namelist,'\n')
    ##### not check same username ########
    if user == "" or username == "" or password == "" or confirm == "":
        html = """<html>
<head>
<title>error</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<p><b><font size="5" face="Times New Roman, Times, serif">ERROR !</font></b></p>
<p> <font face="Times New Roman, Times, serif" size="4" color="#FF0000">Not Enough 
  Information Please fill all field!</font></p>
</body>
</html>"""
    elif password != confirm:
        html = """<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<p><b><font size="5" face="Times New Roman, Times, serif">ERROR !</font></b></p>
<p> <font face="Times New Roman, Times, serif" size="4" color="#FF0000">Password 
  and confirm mismatch!</font></p>
</body>
</html>"""
    else:
        ######## remove old data ##########
        ######## keep old task and delete not use field ########
        directory = 'C:\ApacheGroup\Apache\htdocs\user\username\\task.txt'
        taskfile = replace(directory,'username',username)
        file = open(taskfile,'r')
        oldtask = file.read()
        file.close()
        if taskfield != oldtaskfield:
            oldtasklist = split(oldtask,'\n')
            for line in range(len(oldtasklist)):
                if line == 0:
                    oldtasklist[0] = ''
    		else:
    			field = split(oldtasklist[line],'-')
    			for f in range(len(field)):
    				if f > 3 and f != (len(field)-1):
    					field[f] = ''
    			ready = join(field,'-')
    			point = find(ready,'--')
    			pointend = rfind(ready,'-')
    			if point != -1:
    				tready1 = ready[:point]
    				tready2 = ready[pointend:]
    				ready = tready1 + tready2
    			oldtasklist[line] = ready
    	    oldtask = join(oldtasklist,'\n')
    	else:
    		oldtasklist = split(oldtask,'\n')
    		oldtasklist[0] = ''
    		oldtask = join(oldtasklist,'\n')
        ######## keep old task ########
        ##### keep old job ######
        directory = 'C:\ApacheGroup\Apache\htdocs\user\username\job.txt'
        jobfile = replace(directory,'username',username)
        file = open(jobfile,'r')
    	oldjob = file.read()
    	file.close()
        ##### keep old job ######
        ##### keep old method ####
        userdir = 'C:\ApacheGroup\Apache\htdocs\user\username\user_met.py'
    	userfile = replace(userdir,'username',username)
    	file = open(userfile,'r')
    	oldmethod = file.read()
    	file.close()
        ##### keep old method ####
    	userdir = 'C:\ApacheGroup\Apache\htdocs\user\#userdir#'
   	removedir = replace(userdir,'#userdir#',username)
    	command1 = 'del ' + removedir + '\userdetail.txt'
    	command2 = 'del ' + removedir + '\\task.txt'
    	command6 = 'del ' + removedir + '\job.txt'
    	command3 = 'rd ' + removedir
    	dircgi = 'C:\ApacheGroup\Apache\cgi-bin'
    	exception = ['a','b','f','n','r','t','v','\\']
    	if username[0] not in exception:
    		cgifile1 = '\#username#submittask.py'
        	cgifile2 = '\#username#submittask.pyc'
    	else:
    		cgifile1 = '\\#username#submittask.py'
    		cgifile2 = '\\#username#submittask.pyc'
    	usercgifile1 = replace(cgifile1,'#username#',username)
    	usercgifile2 = replace(cgifile2,'#username#',username)
    	usercgi1 = dircgi + usercgifile1
    	usercgi2 = dircgi + usercgifile2
    	command4 = 'del ' + usercgi1
    	command5 = 'del ' + usercgi2
    	os.system(command1)
    	os.system(command2)
    	os.system(command6)
    	os.system(command3)
    	os.system(command4)
    	os.system(command5)
    	file = open('C:\ApacheGroup\Apache\htdocs\user\username.txt','r')
    	namelist = file.read()
    	file.close()
    	removename = username+':'+oldpassword
    	numlist = split(namelist,'\n')
    	if numlist[len(numlist)-1] != removename:
    		removename = removename + '\n'
    	namelist = replace(namelist,removename,'')
    	file = open('C:\ApacheGroup\Apache\htdocs\user\username.txt','w')
    	file.write(namelist)
    	file.close()
    	######## remove old data ##########
        directory = 'C:\ApacheGroup\Apache\htdocs\user\username'
        directory = replace(directory,'username',username)
        ##### sign up success ######
        if exituser == ['']:
            namelist = replace(namelist,'\n','')
    	namelist = namelist + username + ':' + password + "\n"
    	##### save user name #####
    	file = open('C:\ApacheGroup\Apache\htdocs\user\username.txt','w')
    	file.write(namelist)
    	file.close()
    	##### create user directory #####
    	makedir = 'md C:\ApacheGroup\Apache\htdocs\user\username'
    	makedir = replace(makedir,'username',username)
    	os.system(makedir)
    	##### create user detail #####
    	userdir = directory + "\userdetail.txt"
    	userdetail = "user:" + user + "\n" + "username:" + username + "\n" + "password:" + password + "\n" + "email:" + email + "\n" + "pager:" + pager + "\n" + "mobil:" + mobile + "\n" + "field:" + taskfield
        file = open(userdir,'w')
    	file.write(userdetail)
    	file.close()
    	#### create task list #######
    	field = 'field-Time-Event-Action-Actiontime'
    	if taskfield != '':
    		field = field + '-' + taskfield
    	field = field + oldtask
    	directory = 'C:\ApacheGroup\Apache\htdocs\user\username\\task.txt'
    	taskfile = replace(directory,'username',username)
    	file = open(taskfile,'w')
    	file.write(field)
    	file.close()
    	#### create job.txt #####
    	directory = 'C:\ApacheGroup\Apache\htdocs\user\username\job.txt'
    	jobfile = replace(directory,'username',username)
    	file = open(jobfile,'w')
    	file.write(oldjob)
    	file.close()
    	#### create user_met.py ###
    	directory = 'C:\ApacheGroup\Apache\htdocs\user\username\user_met.py'
    	userfile = replace(directory,'username',username)
    	file = open(userfile,'w')
    	file.write(oldmethod)
    	file.close()
    	#### create usercode add task  ####
    	file = open('C:\ApacheGroup\Apache\cgi-bin\codeaddtask.txt','r')
    	carbon = file.read()
    	file.close()
    	fieldhere = ''
    	taskdata = ''
    	addfield = split(taskfield,'-')
    	for i in addfield:
    		if i != '':
    			fieldhere = fieldhere+','+ i
    			taskdata = taskdata + '+' + "'-'" + '+' + i
    	file = open('C:\ApacheGroup\Apache\cgi-bin\codeaddtask.txt','r')
    	carbon = file.read()
    	file.close()
    	usercarbon = replace(carbon,'##fieldhere##',fieldhere)
    	okcarbon = replace(usercarbon,'##taskdatahere##',taskdata)
    	## add job data ##
    	jobdata = ''
    	tag = split(oldtaskfield,'-')
    	if addfield != ['']:
    		jobdata = "+'-'"
    		for i in addfield:
    			if i != '':
    				jobdata = jobdata + '+' + "'<" +  i + ">'" + '+' +  i
    	else:
    		jobdata = jobdata + "+'-'+''"
    	okcarbon = replace(okcarbon,'##jobdatahere##',jobdata)
    	codename = username+'submittask'
    	codefile = 'C:\ApacheGroup\Apache\cgi-bin\##codename##.py'
    	code = replace(codefile,'##codename##',codename)
    	file = open(code,'w')
    	file.write(okcarbon)
    	file.close()
        html = """<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<p><b><font size="5" face="Times New Roman, Times, serif" color="#0099FF">Your data has been change !</font></b></p>
<p><b><font face="Times New Roman, Times, serif" size="4">click main page link 
  for login</font></b></p>
</body>
</html>"""
    return html

######################################################################
######################################################################
#########						    ##########	
#########	             remove task		    ##########
#########						    ##########
######################################################################
######################################################################
    
def removetask(req,username):
    req.content_type = "text/html"
    req.send_http_header()
    html = """<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<table width="70%" border="0">
  <tr>
    <td width="85%"><font size="+2" color="#000099">Web-base Evolutionary Python 
      Program<br>
      </font><font color="#3399FF"><b>Remove Task</b></font><font size="+2" color="#000099"> 
      <br>
      </font></td>
    <td width="15%">&nbsp; </td>
  </tr>
</table>
<p><br>
</p>
<table width="43%" border="0">
  <tr>
    <td width="21%">&nbsp;</td>
    <td width="71%"> 
      <form name="form1" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/submitremove">
        <table width="77%" border="0">
          <tr>
            <td width="48%">
              <input type="hidden" name="username" value="##username##"> 
              <select name="taskline">
                <option value="Not Remove">Not Remove</option>
                ##numtaskhere##
              </select>
            </td>
            <td width="52%"> 
              <input type="image" border="0" name="imageField" src="http://161.246.5.100/picture/removetask1.gif" width="105" height="33">
            </td>
          </tr>
        </table>
        </form>
    </td>
    <td width="8%">&nbsp;</td>
  </tr>
</table>
<br>
<table width="#addwidthhere#" border="0">
  <tr>   
    #AddAllFieldHere#
  </tr>
  <tr> 
    <td width="150">&nbsp;</td>
    <td width="250">&nbsp;</td>
    <td width="150">&nbsp;</td>
    #AddSpaceHere#
  </tr>
  #AddAllRowHere#
</table>
<p>&nbsp; </p>
<p>&nbsp;</p>
</body>
</html>"""
    html = replace(html,'##username##',username)
    directory = 'C:\ApacheGroup\Apache\htdocs\user\username\userdetail.txt'
    detailfile = replace(directory,'username',username)
    file = open(detailfile,'r')
    detail = file.read()
    file.close()
    detaillist = split(detail,'\n')
    password = split(detaillist[2],':')
    html = replace(html,'##password##',password[1])
    width = '550'
    directory = 'C:\ApacheGroup\Apache\htdocs\user\username\\task.txt'
    taskfile = replace(directory,'username',username)
    #### read user properties ######
    file = open(taskfile,'r')
    task = file.read()
    file.close()
    tasklist = split(task,'\n')
    #### add field ####
    space = ''
    spacetmp = '<td width="150">&nbsp;</td>'
    staticfield = ['field','Time','Event','Action']
    field = '<td width="150"><b><font face="Times New Roman, Times, serif" size="4" color="#FF0000">#fieldname</font></b></td>'
    fieldlist = split(tasklist[0],'-')
    allfield = """<td width="150"><b><font face="Times New Roman, Times, serif" size="4" color="#FF0000">Task</font></b></td>
<td width="150"><b><font face="Times New Roman, Times, serif" size="4" color="#FF0000">Time</font></b></td>
<td width="250"><font face="Times New Roman, Times, serif" size="4"><b><font color="#FF0000">Event</font></b></font></td>
<td width="150"><b><font face="Times New Roman, Times, serif" size="4" color="#FF0000">Action</font></b></td>"""
    if len(fieldlist) > 4:
        widthint = atoi(width)
        for i in fieldlist:
            if i not in staticfield: 
                widthint = widthint + 150
                fieldtmp = replace(field,'#fieldname',i)
                allfield = allfield +"\n"+ fieldtmp
                space = space + spacetmp
        width = repr(widthint)
    html = replace(html,'#AddAllFieldHere#',allfield)
    html = replace(html,'#AddSpaceHere#',space)
    #### add field OK #####
    #### add data ######
    row = """<tr> 
#rowtmp#
</tr>"""
    datainrow = '<td width="150"><b><font face="Times New Roman, Times, serif">task 1</font></b></td>'
    allrow = ''
    message = '<td width="150"><b><font face="Times New Roman, Times, serif">#AddMessageHere#</font></b></td>'
    for i in range(len(tasklist)):
        if i != 0:
            datalist = split(tasklist[i],'-')
            for j in range(len(fieldlist)):
                if j < (len(datalist)-1):
                    if datalist[j] != '0/0/0000 0:0':
                        showme = datalist[j]
                        showme = replace(showme,'#keed#','-')
                    else:
                        showme = 'Not notify'
                    messagetmp = replace(message,'#AddMessageHere#',showme)
                    datainrow = datainrow +'\n'+ messagetmp
            rowtmp = replace(row,"#rowtmp#",datainrow)
            datainrow = '<td width="150"><b><font face="Times New Roman, Times, serif">task '+repr(i+1)+'</font></b></td>'
            allrow = allrow + '\n' + rowtmp
    taskvalue = '<option value="#taskvalue#">#taskvalue#</option>'
    alltask = ''
    for num in range(i):
        ttmp = 'task '+repr(num+1)
        tvaluetmp = replace(taskvalue,'#taskvalue#',ttmp)
        alltask = alltask + tvaluetmp
    html = replace(html,'##numtaskhere##',alltask)
    html = replace(html,'#AddAllRowHere#',allrow)
    #### change width ###
    html = replace(html,'#addwidthhere#',width)
    return html

######################################################################
######################################################################
#########						    ##########	
#########	           submit remove		    ##########
#########						    ##########
######################################################################
######################################################################

def submitremove(req,username,taskline):
    req.content_type = "text/html"
    req.send_http_header()
    html = """<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<p><font face="Times New Roman, Times, serif" size="6"><b><font color="#3399FF">Your 
  Task Aready Remove!</font></b></font></p>
<p>&nbsp;</p>
<table width="61%" border="0">
  <tr>
    <td width="56%">&nbsp;</td>
    <td width="44%">
      <form name="form1" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/showtask">
        <input type="hidden" name="username" value="##username##">
        <input type="submit" name="Submit" value="Go to task page">
      </form>
      
    </td>
  </tr>
</table>
<p>&nbsp; </p>
</body>
</html>"""
    html = replace(html,'##username##',username)
    ### Remove Task File ###
    if taskline != 'Not Remove':
        line = int(replace(taskline,'task ',''))
        directory = 'C:\ApacheGroup\Apache\htdocs\user\username\\task.txt'
        taskfile = replace(directory,'username',username)
        file = open(taskfile,'r')
        tasklist = strip(file.read())
        file.close()
        ### send Remove Job ###
        tasklist = split(tasklist, '\n')
    	usetask = tasklist[line]
    	usetask = split(usetask,'-')
    	removeflag = 'Remove-'+ usetask[len(usetask)-1]
    	directory = 'C:\ApacheGroup\Apache\htdocs\user\username\job.txt'
    	jobfile = replace(directory,'username',username)
    	file = open(jobfile,'r')
    	job = file.read()
    	file.close()
    	if job != '':
    		job = job + '\n' + removeflag
    	else:
    		job = removeflag
    	file = open(jobfile,'w')
        file.write(job)
        file.close()
    	### send Remove Job ###
    	del tasklist[line]
        task = join(tasklist,'\n')
        task = ''
        for __i in range(len(tasklist)):
            if len(tasklist[__i]) != 0:
                task = task + tasklist[__i] + '\n'
        task = task[:-1]
        #task = replace(task,'\n\n','\n')
        file = open(taskfile,'w')
        file.write(task)
        file.close()
    else:
        html = """<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<p><font face="Times New Roman, Times, serif" size="6"><b><font color="#3399FF">No Task Remove!</font></b></font></p>
<p>&nbsp;</p>
<table width="61%" border="0">
  <tr>
    <td width="56%">&nbsp;</td>
    <td width="44%">
      <form name="form1" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/showtask">
        <input type="hidden" name="username" value="##username##">
        <input type="submit" name="Submit" value="Go to task page">
      </form>
      
    </td>
  </tr>
</table>
<p>&nbsp; </p>
</body>
</html>"""
        html = replace(html,'##username##',username)
    ### Remove Task File ###
    return html
    
######################################################################
######################################################################
#########						    ##########	
#########	           Manage Method		    ##########
#########						    ##########
######################################################################
######################################################################
    
def managemethod(req,username):
    req.content_type = "text/html"
    req.send_http_header()
    html = """<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<table width="74%" border="0">
  <tr>
    <td width="85%"><font size="+2" color="#000099">Web-base Evolutionary Python 
      Program<br>
      </font><font color="#3399FF"><b>Manage Method</b></font><font size="+2" color="#000099"> 
      <br>
      </font></td>
    <td width="15%">
      <form name="form2" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/login">
        <input type="hidden" name="username" value="##username##">
        <input type="hidden" name="password" value="##password##">
        <input type="image" border="0" name="imageField2" src="http://161.246.5.100/picture/personalpage.gif" width="105" height="33">
      </form>
    </td>
    <td width="15%">
      <form name="form4" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/showtask">
        <input type="hidden" name="username" value="##username##">
        <input type="image" border="0" name="imageField4" src="http://161.246.5.100/picture/taskpage.gif" width="105" height="33">
      </form>
    </td>
  </tr>
</table><br>
<p><br>
</p>
<table width="79%" border="0">
  <tr> 
    <td width="6%">&nbsp;</td>
    <td width="15%"> 
      <form name="form1" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/changemethod_add">
        <input type="hidden" name="username" value="##username##"> 
        <input type="image" border="0" name="imageField" src="http://161.246.5.100/picture/addmethod.gif" width="105" height="33">
      </form>
    </td>
    <td width="15%"> 
      <form name="form3" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/changemethod_remove">
        <input type="hidden" name="username" value="##username##">
        <input type="image" border="0" name="imageField3" src="http://161.246.5.100/picture/removemethod.gif" width="105" height="33">
      </form>
    </td>
    <td width="15%"> 
      <form name="form2" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/sendtopublic">
        <input type="hidden" name="username" value="##username##"> 
        <input type="image" border="0" name="imageField2" src="http://161.246.5.100/picture/sendmethod.gif" width="105" height="33">
      </form>
    </td>
    <td width="20%"> 
      <form name="form2" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/removepublic">
        <input type="hidden" name="username" value="##username##"> 
        <input type="image" border="0" name="imageField2" src="http://161.246.5.100/picture/delmethod.gif" width="105" height="33">
      </form>
    </td>
    <td width="29%">&nbsp;</td>
  </tr>
</table>
<br>
<font face="Times New Roman, Times, serif" size="5"><b><font color="#FF0000">My 
Method :</font></b></font> <br>
<br>
##allnamehere##
<p>&nbsp;</p>
</body>
</html>"""
    method_name = """<table width="30%" border="0">
  <tr> 
    <td width="18%">&nbsp;</td>
    <td width="7%">-</td>
    <td width="75%"><b>##methodnamehere##</b></td>
  </tr>
</table>"""
    html = replace(html,'##username##',username)
    directory = 'C:\ApacheGroup\Apache\htdocs\user\username\userdetail.txt'
    detailfile = replace(directory,'username',username)
    file = open(detailfile,'r')
    detail = file.read()
    file.close()
    detaillist = split(detail,'\n')
    password = split(detaillist[2],':')
    html = replace(html,'##password##',password[1])
    mymethod = ''
    userfile = 'C:\ApacheGroup\Apache\htdocs\user\username\user_met.py'
    userfile = replace(userfile,'username',username)
    dirtmp = 'C:\ApacheGroup\Apache\cgi-bin\get_methods.py'
    file = open(dirtmp,'r')
    tmp = file.read()
    file.close()
    exec tmp
    method_dic = get_methods(userfile)
    method_list = []
    if method_dic != {}:
        method_list = method_dic.keys()
    allmethodname = ''
    for method in method_list:
         m_name = replace(method_name,'##methodnamehere##',method)
         allmethodname = allmethodname + m_name
    html = replace(html,'##username##',username)
    html = replace(html,'##allnamehere##',allmethodname)
    return html
    
######################################################################
######################################################################
#########						    ##########	
#########	          Change Method add		    ##########
#########						    ##########
######################################################################
######################################################################

def changemethod_add(req,username):
    req.content_type = "text/html"
    req.send_http_header()
    html = """<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<table width="70%" border="0">
  <tr> 
    <td width="85%"><font size="+2" color="#000099">Web-base Evolutionary Python 
      Program<br>
      </font><font color="#3399FF"><b>Change My Method</b></font><font size="+2" color="#000099"> 
      <br>
      </font></td>
    <td width="15%">&nbsp; </td>
  </tr>
</table>
<p><br>
</p>
<table width="45%" border="0">
  <tr>
    <td width="29%">&nbsp;</td>
    <td width="56%"> 
      <form name="form1" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/addmethod">
        <table width="90%" border="0">
          <tr>
            <td width="71%"> 
              <input type="hidden" name="username" value="##username##"> 
              <select name="pubmethod">
                <option value="Not Select">Not Select</option>
                ##methodnamelist##
              </select>
            </td>
            <td width="29%">
              <input type="image" border="0" name="imageField" src="http://161.246.5.100/picture/addmethod.gif" width="105" height="33">
            </td>
          </tr>
        </table>
        </form>
    </td>
    <td width="15%">&nbsp;</td>
  </tr>
</table>
<p></p>
<p></p>
<p><font face="Times New Roman, Times, serif" size="5"><b><font color="#FF0000">Public 
  Method :</font></b></font><br>
  <br>
</p>
<table width="77%" border="0">
  <tr> 
    <td width="10%">&nbsp;</td>
    <td width="16%"><b><font color="#999999" face="Times New Roman, Times, serif" size="4">Methodname</font></b></td>
    <td width="9%">&nbsp;</td>
    <td width="65%"><b><font face="Times New Roman, Times, serif" size="4" color="#999999">Description</font></b></td>
  </tr>
</table>
<p> </p>
##methoddetail##
</body>
</html>"""
    html = replace(html,'##username##',username)
    methoddetail = """<table width="99%" border="0">
  <tr> 
    <td width="8%">&nbsp;</td>
    <td width="2%">-</td>
    <td width="17%"><b>##methodname##</b></td>
    <td width="73%"><b>##description##</b></td>
  </tr>
</table>
<p></p>"""
    publicfile = 'C:\ApacheGroup\Apache\htdocs\Public\pub_lib.py'
    dirtmp = 'C:\ApacheGroup\Apache\cgi-bin\get_methods.py'
    file = open(dirtmp,'r')
    tmp = file.read()
    file.close()
    exec tmp
    method_dic = get_methods(publicfile)
    method_list = []
    if method_dic != {}:
        method_list = method_dic.keys()
    allmethoddata = ''
    ## add method name to menu ##
    allvalue = ''
    value = '<option value="##value##">##value##</option>'
    for method in method_list:
        m_tmp = replace(methoddetail,'##methodname##',method)
        v_tmp = replace(value,'##value##',method)
        descrip = repr(method_dic[method][0] + '\n' + method_dic[method][1])
        m_tmp = replace(m_tmp,'##description##',descrip[1:-1])
        m_tmp = replace(m_tmp,'\\012','<br>')
        m_tmp = replace(m_tmp,'\\011','')
        allmethoddata = allmethoddata + m_tmp
        allvalue = allvalue + v_tmp
    html = replace(html,'##username##',username)
    html = replace(html,'##methoddetail##',allmethoddata)
    html = replace(html,'##methodnamelist##',allvalue)
    return html
    
######################################################################
######################################################################
#########						    ##########	
#########	         Send to Pub_lib		    ##########
#########						    ##########
######################################################################
######################################################################

def sendtopublic(req,username):
    req.content_type = "text/html"
    req.send_http_header()
    html = """<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<table width="70%" border="0">
  <tr> 
    <td width="85%"><font size="+2" color="#000099">Web-base Evolutionary Python 
      Program<br>
      </font><font color="#3399FF"><b>Send Method to Public</b></font><font size="+2" color="#000099"> 
      <br>
      </font></td>
    <td width="15%">&nbsp; </td>
  </tr>
</table>
<br>
<br>
<form name="form2" method="post" action="savetopublib">
  <table width="64%" border="0">
    <tr>
      <td width="3%">&nbsp;</td>
      <td width="35%"><b>Method Name:</b></td>
      <td width="62%"> 
        <input type="hidden" name="username" value="##username##"> 
        <input type="text" name="methodname">
      </td>
    </tr>
  </table>
  <br>
  <table width="30%" border="0">
    <tr>
      <td width="7%">&nbsp;</td>
      <td width="54%"><b>Code:</b></td>
      <td width="39%">&nbsp;</td>
    </tr>
  </table>
  <br>
  <table width="91%" border="0">
    <tr>
      <td width="13%">&nbsp;</td>
      <td width="87%"> 
        <textarea name="methodcode" cols="90" rows="20"></textarea>
      </td>
    </tr>
  </table>
  <br>
  <table width="30%" border="0">
    <tr>
      <td width="8%">&nbsp;</td>
      <td width="54%"><b>Comment:</b></td>
      <td width="38%">&nbsp;</td>
    </tr>
  </table>
  <br>
  <table width="91%" border="0">
    <tr> 
      <td width="13%">&nbsp;</td>
      <td width="87%"> 
        <textarea name="codecomment" cols="90" rows="5"></textarea>
      </td>
    </tr>
  </table>
  <br>
  <table width="66%" border="0">
    <tr>
      <td width="50%">&nbsp;</td>
      <td width="50%"> 
        <input type="image" border="0" name="imageField" src="http://161.246.5.100/picture/save.gif" width="105" height="33">
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</form>
<br>
<p></p>
</body>
</html>"""
    html = replace(html,'##username##',username)
    return html    
    
######################################################################
######################################################################
#########						    ##########	
#########	          Change Method remove		    ##########
#########						    ##########
######################################################################
######################################################################

def changemethod_remove(req,username):
    req.content_type = "text/html"
    req.send_http_header()
    html = """<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<table width="70%" border="0">
  <tr> 
    <td width="85%"><font size="+2" color="#000099">Web-base Evolutionary Python 
      Program<br>
      </font><font color="#3399FF"><b>Change My Method</b></font><font size="+2" color="#000099"> 
      <br>
      </font></td>
    <td width="15%">&nbsp; </td>
  </tr>
</table>
<p><br>
</p>
<table width="45%" border="0">
  <tr>
    <td width="29%">&nbsp;</td>
    <td width="56%"> 
      <form name="form1" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/removemethod">
        <table width="90%" border="0">
          <tr>
            <td width="71%"> 
              <input type="hidden" name="username" value="##username##"> 
              <select name="pubmethod">
                <option value="Not Select">Not Select</option>
                ##methodnamelist##
              </select>
            </td>
            <td width="29%">
              <input type="image" border="0" name="imageField" src="http://161.246.5.100/picture/removemethod.gif" width="105" height="33">
            </td>
          </tr>
        </table>
        </form>
    </td>
    <td width="15%">&nbsp;</td>
  </tr>
</table>
<p></p>
<p></p>
<p><font face="Times New Roman, Times, serif" size="5"><b><font color="#FF0000">My Method :</font></b></font><br>
  <br>
</p>
<table width="77%" border="0">
  <tr> 
    <td width="10%">&nbsp;</td>
    <td width="16%"><b><font color="#999999" face="Times New Roman, Times, serif" size="4">Methodname</font></b></td>
    <td width="9%">&nbsp;</td>
    <td width="65%"><b><font face="Times New Roman, Times, serif" size="4" color="#999999">Description</font></b></td>
  </tr>
</table>
<p> </p>
##methoddetail##
</body>
</html>"""
    html = replace(html,'##username##',username)
    methoddetail = """<table width="99%" border="0">
  <tr> 
    <td width="8%">&nbsp;</td>
    <td width="2%">-</td>
    <td width="17%"><b>##methodname##</b></td>
    <td width="73%"><b>##description##</b></td>
  </tr>
</table>
<p></p>"""
    userfile = 'C:\ApacheGroup\Apache\htdocs\user\username\user_met.py'
    userfile = replace(userfile,'username',username)
    dirtmp = 'C:\ApacheGroup\Apache\cgi-bin\get_methods.py'
    file = open(dirtmp,'r')
    tmp = file.read()
    file.close()
    exec tmp
    method_dic = get_methods(userfile)
    method_list = []
    if method_dic != {}:
        method_list = method_dic.keys()
    allmethoddata = ''
    ## add method name to menu ##
    allvalue = ''
    value = '<option value="##value##">##value##</option>'
    for method in method_list:
        m_tmp = replace(methoddetail,'##methodname##',method)
        v_tmp = replace(value,'##value##',method)
        descrip = repr(method_dic[method])
        m_tmp = replace(m_tmp,'##description##',descrip[2:-2])
        m_tmp = replace(m_tmp,'\\012','<br>')
        m_tmp = replace(m_tmp,'\\011','')
        allmethoddata = allmethoddata + m_tmp
        allvalue = allvalue + v_tmp
    html = replace(html,'##username##',username)
    html = replace(html,'##methoddetail##',allmethoddata)
    html = replace(html,'##methodnamelist##',allvalue)
    return html
    
######################################################################
######################################################################
#########						    ##########	
#########	               addmethod		    ##########
#########						    ##########
######################################################################
######################################################################

def addmethod(req,username,pubmethod):
    req.content_type = "text/html"
    req.send_http_header()
    html = """<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<p><b><font size="5" face="Times New Roman, Times, serif" color="#0099FF">##message##</font></b></p>
<p><b><font face="Times New Roman, Times, serif" size="4">click main page link 
  for login</font></b></p>
<table width="92%" border="0">
  <tr>
    <td width="3%" height="41">&nbsp;</td>
    <td width="15%">
      <form name="form2" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/managemethod">
        <input type="hidden" name="username" value="##username##">
        <input type="hidden" name="password" value="##password##">
        <input type="image" border="0" name="imageField2" src="http://161.246.5.100/picture/methodpage.gif" width="105" height="33">
      </form>
    </td>
    <td width="60%" height="41">&nbsp;</td>
  </tr>
</table>
</body>
</html>"""
    html = replace(html,'##username##',username)
    directory = 'C:\ApacheGroup\Apache\htdocs\user\username\userdetail.txt'
    detailfile = replace(directory,'username',username)
    file = open(detailfile,'r')
    detail = file.read()
    file.close()
    detaillist = split(detail,'\n')
    password = split(detaillist[2],':')
    html = replace(html,'##password##',password[1])
    if pubmethod != 'Not Select':
        usermethod = 'C:\ApacheGroup\Apache\htdocs\user\username\user_met.py'
        usermethod = replace(usermethod,'username',username)
        file = open(usermethod,'r')
        tmp = file.read()
        file.close()
        tmp = split(tmp,'\n')
        version = tmp[0]
        version = split(version,' : ')
        version = version[1]
        version = 'user'+version
        execfile(usermethod)
        command = 'user = ' + version +'()'
        exec command
        message = user.add_method(pubmethod)
        html = replace(html,'##message##',message)
    else:
        html = replace(html,'##message##','Not Select Method ! No Method add')
    return html
    
######################################################################
######################################################################
#########						    ##########	
#########	           remove method		    ##########
#########						    ##########
######################################################################
######################################################################

def removemethod(req,username,pubmethod):
    req.content_type = "text/html"
    req.send_http_header()
    html = """<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<p><b><font size="5" face="Times New Roman, Times, serif" color="#0099FF">##message##</font></b></p>
<p><b><font face="Times New Roman, Times, serif" size="4">click main page link 
  for login</font></b></p>
<table width="92%" border="0">
  <tr>
    <td width="3%" height="41">&nbsp;</td>
    <td width="15%">
      <form name="form2" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/managemethod">
        <input type="hidden" name="username" value="##username##">
        <input type="hidden" name="password" value="##password##">
        <input type="image" border="0" name="imageField2" src="http://161.246.5.100/picture/methodpage.gif" width="105" height="33">
      </form>
    </td>
    <td width="60%" height="41">&nbsp;</td>
  </tr>
</table>
</body>
</html>"""
    html = replace(html,'##username##',username)
    directory = 'C:\ApacheGroup\Apache\htdocs\user\username\userdetail.txt'
    detailfile = replace(directory,'username',username)
    file = open(detailfile,'r')
    detail = file.read()
    file.close()
    detaillist = split(detail,'\n')
    password = split(detaillist[2],':')
    html = replace(html,'##password##',password[1])
    if pubmethod != 'Not Select':
        usermethod = 'C:\ApacheGroup\Apache\htdocs\user\username\user_met.py'
        usermethod = replace(usermethod,'username',username)
        file = open(usermethod,'r')
        tmp = file.read()
        file.close()
        tmp = split(tmp,'\n')
        version = tmp[0]
        version = split(version,' : ')
        version = version[1]
        version = 'user'+version
        req.write(version)
        execfile(usermethod)
        command = 'user = ' + version +'()'
        exec command
        message = user.remove_method(pubmethod)
        req.write(pubmethod)
        html = replace(html,'##message##',message)
    else:
        html = replace(html,'##message##','Not Select Method ! No Method add')
    return html

######################################################################
######################################################################
#########						    ##########	
#########	           save to publib		    ##########
#########						    ##########
######################################################################
######################################################################
    
def savetopublib(req,username,methodname,methodcode,codecomment):
    req.content_type = "text/html"
    req.send_http_header()
    html = """<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<p><b><font size="5" face="Times New Roman, Times, serif" color="#0099FF">##message##</font></b></p>
<p><b><font face="Times New Roman, Times, serif" size="4"></font></b></p>
<table width="92%" border="0">
  <tr>
    <td width="3%" height="41">&nbsp;</td>
    <td width="15%">
      <form name="form2" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/managemethod">
        <input type="hidden" name="username" value="##username##">
        <input type="hidden" name="password" value="##password##">
        <input type="image" border="0" name="imageField2" src="http://161.246.5.100/picture/methodpage.gif" width="105" height="33">
      </form>
    </td>
    <td width="60%" height="41">&nbsp;</td>
  </tr>
</table>
</body>
</html>"""
    html = replace(html,'##username##',username)
    directory = 'C:\ApacheGroup\Apache\htdocs\user\username\userdetail.txt'
    detailfile = replace(directory,'username',username)
    file = open(detailfile,'r')
    detail = file.read()
    file.close()
    detaillist = split(detail,'\n')
    password = split(detaillist[2],':')
    html = replace(html,'##password##',password[1])
    #### save code ####
    ## cut 015 ##
    methodcode = replace(methodcode,'\015','')
    codecomment = replace(codecomment,'\015','')
    #testfile = 'C:\ApacheGroup\Apache\htdocs\public\\test.txt'
    #file = open(testfile,'w')
    #file.write(methodcode)
    #file.close()
    __localtime = time.localtime(time.time())
    nowtime = repr(__localtime[2]) + '/' + repr(__localtime[1]) + '/' + repr(__localtime[0]) + ' ' + repr(__localtime[3]) + ':' + repr(__localtime[4])
    pubmanager = 'C:\ApacheGroup\Apache\htdocs\Public\pub_man.py'
    execfile(pubmanager)
    command = 'pub_man = Public_Manager()'
    exec command
    message = pub_man.add(name = methodname,user = username,time = nowtime,code = methodcode,comment = codecomment)
    html = replace(html,'##message##',message)
    return html
    
######################################################################
######################################################################
#########						    ##########	
#########	          Remove from Pub_lib		    ##########
#########						    ##########
######################################################################
######################################################################

def removepublic(req,username):
    req.content_type = "text/html"
    req.send_http_header()
    html = """<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<table width="70%" border="0">
  <tr> 
    <td width="85%"><font size="+2" color="#000099">Web-base Evolutionary Python 
      Program<br>
      </font><font color="#3399FF"><b>Remove Method from Public</b></font><font size="+2" color="#000099"> 
      <br>
      </font></td>
    <td width="15%">&nbsp; </td>
  </tr>
</table>
<p><br>
</p>
<table width="45%" border="0">
  <tr>
    <td width="29%">&nbsp;</td>
    <td width="56%"> 
      <form name="form1" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/delpublicmethod">
        <table width="90%" border="0">
          <tr>
            <td width="71%"> 
              <input type="hidden" name="username" value="##username##"> 
              <select name="pubmethod">
                <option value="Not Select">Not Select</option>
                ##methodnamelist##
              </select>
            </td>
            <td width="29%">
              <input type="image" border="0" name="imageField" src="http://161.246.5.100/picture/removemethod.gif" width="105" height="33">
            </td>
          </tr>
        </table>
        </form>
    </td>
    <td width="15%">&nbsp;</td>
  </tr>
</table>
<p></p>
<p></p>
<p><font face="Times New Roman, Times, serif" size="5"><b><font color="#FF0000">Public 
  Method :</font></b></font><br>
  <br>
</p>
<table width="77%" border="0">
  <tr> 
    <td width="10%">&nbsp;</td>
    <td width="16%"><b><font color="#999999" face="Times New Roman, Times, serif" size="4">Methodname</font></b></td>
    <td width="9%">&nbsp;</td>
    <td width="65%"><b><font face="Times New Roman, Times, serif" size="4" color="#999999">Description</font></b></td>
  </tr>
</table>
<p> </p>
##methoddetail##
</body>
</html>"""
    html = replace(html,'##username##',username)
    methoddetail = """<table width="99%" border="0">
  <tr> 
    <td width="8%">&nbsp;</td>
    <td width="2%">-</td>
    <td width="17%"><b>##methodname##</b></td>
    <td width="73%"><b>##description##</b></td>
  </tr>
</table>
<p></p>"""
    publicfile = 'C:\ApacheGroup\Apache\htdocs\Public\pub_lib.py'
    dirtmp = 'C:\ApacheGroup\Apache\cgi-bin\get_methods.py'
    file = open(dirtmp,'r')
    tmp = file.read()
    file.close()
    exec tmp
    method_dic = get_methods(publicfile)
    method_list = []
    if method_dic != {}:
        method_list = method_dic.keys()
    allmethoddata = ''
    ## add method name to menu ##
    allvalue = ''
    value = '<option value="##value##">##value##</option>'
    for method in method_list:
        m_tmp = replace(methoddetail,'##methodname##',method)
        v_tmp = replace(value,'##value##',method)
        descrip = repr(method_dic[method][0] + '\n' + method_dic[method][1])
        m_tmp = replace(m_tmp,'##description##',descrip[1:-1])
        m_tmp = replace(m_tmp,'\\012','<br>')
        m_tmp = replace(m_tmp,'\\011','')
        allmethoddata = allmethoddata + m_tmp
        allvalue = allvalue + v_tmp
    html = replace(html,'##username##',username)
    html = replace(html,'##methoddetail##',allmethoddata)
    html = replace(html,'##methodnamelist##',allvalue)
    return html

######################################################################
######################################################################
#########						    ##########	
#########	          delpublicmethod		    ##########
#########						    ##########
######################################################################
######################################################################
    
def delpublicmethod(req,username,pubmethod):
    req.content_type = "text/html"
    req.send_http_header()
    html = """<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<p><b><font size="5" face="Times New Roman, Times, serif" color="#0099FF">##message##</font></b></p>
<p><b><font face="Times New Roman, Times, serif" size="4"></font></b></p>
<table width="92%" border="0">
  <tr>
    <td width="3%" height="41">&nbsp;</td>
    <td width="15%">
      <form name="form2" method="post" action="http://161.246.5.100/cgi-bin/maincgi.py/managemethod">
        <input type="hidden" name="username" value="##username##">
        <input type="hidden" name="password" value="##password##">
        <input type="image" border="0" name="imageField2" src="http://161.246.5.100/picture/methodpage.gif" width="105" height="33">
      </form>
    </td>
    <td width="60%" height="41">&nbsp;</td>
  </tr>
</table>
</body>
</html>"""
    html = replace(html,'##username##',username)
    directory = 'C:\ApacheGroup\Apache\htdocs\user\username\userdetail.txt'
    detailfile = replace(directory,'username',username)
    file = open(detailfile,'r')
    detail = file.read()
    file.close()
    detaillist = split(detail,'\n')
    password = split(detaillist[2],':')
    html = replace(html,'##password##',password[1])
    pubmanager = 'C:\ApacheGroup\Apache\htdocs\Public\pub_man.py'
    execfile(pubmanager)
    command = 'pub_man = Public_Manager()'
    exec command
    message = pub_man.remove(name = pubmethod,user = username)
    html = replace(html,'##message##',message)
    return html
    
    
