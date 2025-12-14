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

void UserPass::init()
{
    loginButton->setEnabled(false);
    flag = 0;
}

void UserPass::dataChange()
{
    if ( !userEdit->text().isEmpty() &&
         !passEdit->text().isEmpty())
        loginButton->setEnabled( TRUE );
    else
        loginButton->setEnabled( FALSE );
}

void UserPass::chkUser()
{
    QString nameUser = "";
    QString passUser = "";
    nameUser = userEdit->text();
    passUser = passEdit->text();
    
    if ((nameUser == "root") && (passUser == "123qwe"))
    {
	flag = 1 ;
	this->close(); 	    	    
    }
    else
    {
	switch( QMessageBox::warning( this, "Longin ERROR",     
		"Your username or password is incorrect\n"
		"      Please try again or quit program.\n ",
		"Retry",
		"Quit", 0, 0, 1 ) ) 
	{
	case 0:// try again
		this->show();
		break;
	case 1: // The user clicked the Quit or pressed Escape
		exit(0);
		break;
	}
    }
}


void UserPass::cancelLogin()
{
    this->close();
    exit(0);
}

int UserPass::getFlag()
{
    return flag;
}


