// SnmputilDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Snmputil.h"
#include "SnmputilDlg.h"
#include <windows.h>

#include <stdio.h>
#include <string.h>
#include <malloc.h>

#include <snmp.h>
#include <mgmtapi.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#define GET     1
#define GETNEXT 2
#define WALK    3
#define TRAP    4

#define TIMEOUT 1000 /* milliseconds */
#define RETRIES 2
/////////////////////////////////////////////////////////////////////////////
// CSnmputilDlg dialog

CSnmputilDlg::CSnmputilDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CSnmputilDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CSnmputilDlg)
	m_Output = _T("");
	m_SNMPCommand = _T("");
	m_IPAddress = _T("");
	m_CommuName = _T("");
	m_ObjID = _T("");
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CSnmputilDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CSnmputilDlg)
	DDX_Control(pDX, IDC_LIST1, m_Out2);
	DDX_Text(pDX, IDC_EDIT2, m_Output);
	DDX_Text(pDX, IDC_EDIT1, m_SNMPCommand);
	DDX_Text(pDX, IDC_EDIT3, m_IPAddress);
	DDX_Text(pDX, IDC_EDIT4, m_CommuName);
	DDX_Text(pDX, IDC_EDIT5, m_ObjID);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CSnmputilDlg, CDialog)
	//{{AFX_MSG_MAP(CSnmputilDlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON1, OnSNMP)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSnmputilDlg message handlers

BOOL CSnmputilDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CSnmputilDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CSnmputilDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

int CSnmputilDlg::OnSNMP() 
{
	UpdateData(TRUE);
	// TODO: Add your control notification handler code here
	IN int  argumentCount=5;
	//IN char *argumentVector[20];
	/*CString Input;
	CString SNMPcommand;
	CString address;
	CString commu_name;
	CString objID;*/
	char temp[255];
//	m_InputCommand.GetWindowText(argumentVector);

	INT                operation;
    LPSTR              agent;
    LPSTR              community;
    RFC1157VarBindList variableBindings;
    LPSNMP_MGR_SESSION session;

    INT        timeout = TIMEOUT;
    INT        retries = RETRIES;

    BYTE       requestType;
    AsnInteger errorStatus;
    AsnInteger errorIndex;
    char        *chkPtr = NULL;


    // Parse command line arguments to determine requested operation.


    // Get/verify operation...
    //argumentVector++;

	//strcpy(command,argumentVector[1]);
    //argumentCount--;

    if      (!strcmp(m_SNMPCommand, "get"))
        operation = GET;
    else if (!strcmp(m_SNMPCommand, "getnext"))
        operation = GETNEXT;
    else if (!strcmp(m_SNMPCommand, "walk"))
        operation = WALK;
    else
        {

        sprintf(temp,"Error:  Invalid operation, '%s', specified.\n",
               m_SNMPCommand);
		m_Output.Insert(m_Output.GetLength(),temp);
		UpdateData(FALSE);
        return 1;
        }

    if (operation != TRAP)
        {
        if (argumentCount < 4)
            {
            sprintf(temp,"Error:  Incorrect number of arguments specified.\n");
            m_Output.Insert(m_Output.GetLength(),temp);
			sprintf(temp,"\nusage:  snmputil [get|getnext|walk] agent community oid [oid ...]\n");
            m_Output.Insert(m_Output.GetLength(),temp);
			sprintf(temp,"        snmputil trap\n");
			m_Output.Insert(m_Output.GetLength(),temp);
			UpdateData(FALSE);
            return 1;
            }

        // Get agent address...
//        argumentVector++;
	
//		strcpy(address,argumentVector[2]);
        argumentCount--;
        agent = (LPSTR)SNMP_malloc(strlen(m_IPAddress) + 1);
        strcpy(agent, m_IPAddress);

        // Get agent community...
//        argumentVector++;
	
		//strcpy(commu_name,argumentVector[3]);
        argumentCount--;
        community = (LPSTR)SNMP_malloc(strlen(m_CommuName) + 1);
        strcpy(community, m_CommuName);

        // Get oid's...
        variableBindings.list = NULL;
        variableBindings.len = 0;

        while(--argumentCount)
            {
            AsnObjectIdentifier reqObject;

//            argumentVector++;
			
			//strcpy(objID,argumentVector[4]);
            // Convert the string representation to an internal representation.
            char c_ObjID[255];
			strcpy(c_ObjID,m_ObjID);
			if (!SnmpMgrStrToOid(c_ObjID, &reqObject))
                {
                sprintf(temp,"Error: Invalid oid, %s, specified.\n", c_ObjID);
				m_Output.Insert(m_Output.GetLength(),temp);
				UpdateData(FALSE);
                return 1;
                }
            else
                {
                // Since sucessfull, add to the variable bindings list.
                variableBindings.len++;
                if ((variableBindings.list = (RFC1157VarBind *)SNMP_realloc(
                    variableBindings.list, sizeof(RFC1157VarBind) *
                    variableBindings.len)) == NULL)
                    {
                    sprintf(temp,"Error: Error allocating oid, %s.\n",
                           c_ObjID);
					m_Output.Insert(m_Output.GetLength(),temp);
					UpdateData(FALSE);
                    return 1;
                    }

                variableBindings.list[variableBindings.len - 1].name =
                    reqObject; // NOTE!  structure copy
                variableBindings.list[variableBindings.len - 1].value.asnType =
                    ASN_NULL;
                }
            } // end while()

        // Make sure only one variable binding was specified if operation
        // is WALK.
        if (operation == WALK && variableBindings.len != 1)
            {
            sprintf(temp,"Error: Multiple oids specified for WALK.\n");
			m_Output.Insert(m_Output.GetLength(),temp);
			UpdateData(FALSE);
            return 1;
            }


        // Establish a SNMP session to communicate with the remote agent.  The
        // community, communications timeout, and communications retry count
        // for the session are also required.

        if ((session = SnmpMgrOpen(agent, community, timeout, retries)) == NULL)
            {
            sprintf(temp,"error on SnmpMgrOpen %d\n", GetLastError());
			m_Output.Insert(m_Output.GetLength(),temp);
			UpdateData(FALSE);
            return 1;
            }

        } // end if(TRAP)


    // Determine and perform the requested operation.

    if      (operation == GET || operation == GETNEXT)
        {
        // Get and GetNext are relatively simple operations to perform.
        // Simply initiate the request and process the result and/or
        // possible error conditions.


        if (operation == GET)
            requestType = ASN_RFC1157_GETREQUEST;
        else
            requestType = ASN_RFC1157_GETNEXTREQUEST;


        // Request that the API carry out the desired operation.

        if (!SnmpMgrRequest(session, requestType, &variableBindings,
                            &errorStatus, &errorIndex))
            {
            // The API is indicating an error.

            sprintf(temp,"error on SnmpMgrRequest %d\n", GetLastError());
			m_Output.Insert(m_Output.GetLength(),temp);
			UpdateData(FALSE);
            }
        else
            {
            // The API succeeded, errors may be indicated from the remote
            // agent.

            if (errorStatus > 0)
                {
                sprintf(temp,"Error: errorStatus=%d, errorIndex=%d\n",
                       errorStatus, errorIndex);
				m_Output.Insert(m_Output.GetLength(),temp);
				UpdateData(FALSE);
                }
            else
                {
                // Display the resulting variable bindings.

                UINT i;
                char *string = NULL;

                for(i=0; i < variableBindings.len; i++)
                    {
                    SnmpMgrOidToStr(&variableBindings.list[i].name, &string);
                    sprintf(temp,"Variable = %s\n", string);
					m_Output.Insert(m_Output.GetLength(),temp);
					UpdateData(FALSE);
                    if (string) SNMP_free(string);

                    sprintf(temp,"Value    = ");
					m_Output.Insert(m_Output.GetLength(),temp);
					UpdateData(FALSE);
                    SnmpUtilPrintAsnAny(&variableBindings.list[i].value);

                    sprintf(temp,"\n");
					m_Output.Insert(m_Output.GetLength(),temp);
					UpdateData(FALSE);
                    } // end for()
                }
            }


        // Free the variable bindings that have been allocated.

        SnmpUtilVarBindListFree(&variableBindings);


        }
    else if (operation == WALK)
        {
        // Walk is a common term used to indicate that all MIB variables
        // under a given OID are to be traversed and displayed.  This is
        // a more complex operation requiring tests and looping in addition
        // to the steps for get/getnext above.


        AsnObjectIdentifier root;
        AsnObjectIdentifier tempOid;


        SnmpUtilOidCpy(&root, &variableBindings.list[0].name);

        requestType = ASN_RFC1157_GETNEXTREQUEST;


        while(1)
            {
            if (!SnmpMgrRequest(session, requestType, &variableBindings,
                                &errorStatus, &errorIndex))
                {
                // The API is indicating an error.

                sprintf(temp,"error on SnmpMgrRequest %d\n", GetLastError());
				m_Output.Insert(m_Output.GetLength(),temp);
				UpdateData(FALSE);
                break;
                }
            else
                {
                // The API succeeded, errors may be indicated from the remote
                // agent.


                // Test for end of subtree or end of MIB.

                if (errorStatus == SNMP_ERRORSTATUS_NOSUCHNAME ||
                    SnmpUtilOidNCmp(&variableBindings.list[0].name,
                                    &root, root.idLength))
                    {
                    sprintf(temp,"End of MIB subtree.\n\n");
					m_Output.Insert(m_Output.GetLength(),temp);
					UpdateData(FALSE);
                    break;
                    }


                // Test for general error conditions or sucesss.

                if (errorStatus > 0)
                    {
                    sprintf(temp,"Error: errorStatus=%d, errorIndex=%d \n",
                           errorStatus, errorIndex);
					m_Output.Insert(m_Output.GetLength(),temp);
					UpdateData(FALSE);
                    break;
                    }
                else
                    {
                    // Display resulting variable binding for this iteration.

                    char *string = NULL;

                    SnmpMgrOidToStr(&variableBindings.list[0].name, &string);
                    sprintf(temp,"Variable = %s\n", string);
					m_Output.Insert(m_Output.GetLength(),temp);
					UpdateData(FALSE);
                    if (string) SNMP_free(string);

                    sprintf(temp,"Value    = ");
					m_Output.Insert(m_Output.GetLength(),temp);
					UpdateData(FALSE);
                    SnmpUtilPrintAsnAny(&variableBindings.list[0].value);

                    sprintf(temp,"\n");
					m_Output.Insert(m_Output.GetLength(),temp);
					UpdateData(FALSE);
                    }
                } // end if()


            // Prepare for the next iteration.  Make sure returned oid is
            // preserved and the returned value is freed.

            SnmpUtilOidCpy(&tempOid, &variableBindings.list[0].name);

            SnmpUtilVarBindFree(&variableBindings.list[0]);

            SnmpUtilOidCpy(&variableBindings.list[0].name, &tempOid);
            variableBindings.list[0].value.asnType = ASN_NULL;

            SnmpUtilOidFree(&tempOid);

            } // end while()


        // Free the variable bindings that have been allocated.

        SnmpUtilVarBindListFree(&variableBindings);

        SnmpUtilOidFree(&root);


        }
 


    if (operation != TRAP)
        {
        // Close SNMP session with the remote agent.

        if (!SnmpMgrClose(session))
            {
            sprintf(temp,"error on SnmpMgrClose %d\n", GetLastError());
			m_Output.Insert(m_Output.GetLength(),temp);
			UpdateData(FALSE);

            return 1;
            }
        }


    // Let the command interpreter know things went ok.

    return 0;
}
