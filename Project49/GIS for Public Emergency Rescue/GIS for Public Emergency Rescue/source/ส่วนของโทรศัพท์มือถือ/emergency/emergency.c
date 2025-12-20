/*===========================================================================

FILE: emergency.c
===========================================================================*/
/*===============================================================================
INCLUDES AND VARIABLE DEFINITIONS
=============================================================================== */
#include "emergency.h"


/*===============================================================================
FUNCTION DEFINITIONS
=============================================================================== */

/*===========================================================================

FUNCTION: AEEClsCreateInstance

DESCRIPTION
	This function is invoked while the app is being loaded. All Modules must provide this 
	function. Ensure to retain the same name and parameters for this function.
	In here, the module must verify the ClassID and then invoke the AEEApplet_New() function
	that has been provided in AEEAppGen.c. 

   After invoking AEEApplet_New(), this function can do app specific initialization. In this
   example, a generic structure is provided so that app developers need not change app specific
   initialization section every time except for a call to IDisplay_InitAppData(). 
   This is done as follows: InitAppData() is called to initialize AppletData 
   instance. It is app developers responsibility to fill-in app data initialization 
   code of InitAppData(). App developer is also responsible to release memory 
   allocated for data contained in AppletData -- this can be done in 
   IDisplay_FreeAppData().

PROTOTYPE:
   int AEEClsCreateInstance(AEECLSID ClsId,IShell * pIShell,IModule * po,void ** ppObj)

PARAMETERS:
	clsID: [in]: Specifies the ClassID of the applet which is being loaded

	pIShell: [in]: Contains pointer to the IShell object. 

	pIModule: pin]: Contains pointer to the IModule object to the current module to which
	this app belongs

	ppObj: [out]: On return, *ppObj must point to a valid IApplet structure. Allocation
	of memory for this structure and initializing the base data members is done by AEEApplet_New().

DEPENDENCIES
  none

RETURN VALUE
  AEE_SUCCESS: If the app needs to be loaded and if AEEApplet_New() invocation was
     successful
  EFAILED: If the app does not need to be loaded or if errors occurred in 
     AEEApplet_New(). If this function returns FALSE, the app will not be loaded.

SIDE EFFECTS
  none
===========================================================================*/
int AEEClsCreateInstance(AEECLSID ClsId,IShell * pIShell,IModule * po,void ** ppObj)
{
	*ppObj = NULL;

	if(ClsId == AEECLSID_EMERGENCY)
	{
		if(AEEApplet_New(sizeof(myProject),
			ClsId,
			pIShell,
			po,
			(IApplet**)ppObj,(AEEHANDLER)emergency_HandleEvent,
			(PFNFREEAPPDATA)emergency_FreeAppData))
		{
		 // Add your code here .....
			if(emergency_InitAppData((myProject*)*ppObj))
			{
				return (AEE_SUCCESS);
			}
			else
			{
				IAPPLET_Release((IApplet*)*ppObj);
				return (EFAILED);
			}
		}
	}
	return (EFAILED);
}

/*===========================================================================

FUNCTION emergency_HandleEvent

DESCRIPTION
	This is the EventHandler for this app. All events to this app are handled in this
	function. All APPs must supply an Event Handler.

PROTOTYPE:
	boolean emergency_HandleEvent(IApplet * pi, AEEEvent eCode, uint16 wParam, uint32 dwParam)

PARAMETERS:
	pi: Pointer to the AEEApplet structure. This structure contains information specific
	to this applet. It was initialized during the AEEClsCreateInstance() function.

	ecode: Specifies the Event sent to this applet

   wParam, dwParam: Event specific data.

DEPENDENCIES
  none

RETURN VALUE
  TRUE: If the app has processed the event
  FALSE: If the app did not process the event

SIDE EFFECTS
  none
===========================================================================*/
static boolean emergency_HandleEvent(IApplet * pi, AEEEvent eCode, uint16 wParam, uint32 dwParam)
{
	myProject* pMe = (myProject*) pi;
	uint16 index;
	switch (eCode) 
	{
		case EVT_APP_START:        
			
			// Add your code here .....
			DBGPRINTF("******* EVT_APP_START *******");		 
			IDISPLAY_ClearScreen(pMe->pIDisplay);
			showMainMenu(pMe);
			DBGPRINTF("******* EVT_APP_START (ED)*******");

			return(TRUE);

		case EVT_APP_STOP:

			// Add your code here .....
			DBGPRINTF("******* EVT_APP_STOP *******");		 
			emergency_CleanUp(pMe);

			DBGPRINTF("******* EVT_APP_STOP (ED)*******");		 

			return TRUE;

        // App is being suspended 
        case EVT_APP_SUSPEND:
		    // Add your code here...

      		return(TRUE);


        // App is being resumed
        case EVT_APP_RESUME:
		    // Add your code here...

      		return(TRUE);


        // An SMS message has arrived for this app. Message is in the dwParam above as (char *)
        // sender simply uses this format "//BREW:ClassId:Message", example //BREW:0x00000001:Hello World
        case EVT_APP_MESSAGE:
		    // Add your code here...

      		return(TRUE);

        // A key was pressed. Look at the wParam above to see which key was pressed. The key
        // codes are in AEEVCodes.h. Example "AVK_1" means that the "1" key was pressed.
        case EVT_KEY:
		    // Add your code here...
			
			DBGPRINTF("******* EVT_KEY *******");

			if(pMe->pIMenu[MAIN_MENU] && IMENUCTL_IsActive(pMe->pIMenu[MAIN_MENU]))
			{
				index = IMENUCTL_GetSel(pMe->pIMenu[MAIN_MENU]);
				DBGPRINTF("******* index =  ******* %d", index);
				switch(index)
				{
				case CALL_AMBULANCE:
					// EVENT ON CALL_AMBULANCE
					DBGPRINTF("***** CALL_AMBULANCE *****");
					if (wParam == AVK_CLR)
					{
						DBGPRINTF("******* CANCEL PROGRESS *******");
						IMENUCTL_Redraw(pMe->pIMenu[MAIN_MENU]);
						IMENUCTL_SetActive(pMe->pIMenu[MAIN_MENU], TRUE);

						return TRUE;
					}
					else
					{
						IMENUCTL_HandleEvent(pMe->pIMenu[MAIN_MENU], eCode, wParam, dwParam);
						return TRUE;
					}
					
					break;

				case CALL_POLICE:
					// EVENT ON CALL_POLICE
					DBGPRINTF("******* CALL_POLICE *******");
					if (wParam == AVK_CLR)
					{
						DBGPRINTF("******* CANCEL PROGRESS *******");
						IMENUCTL_Redraw(pMe->pIMenu[MAIN_MENU]);
						IMENUCTL_SetActive(pMe->pIMenu[MAIN_MENU], TRUE);

						return TRUE;
					}
					else
					{
						IMENUCTL_HandleEvent(pMe->pIMenu[MAIN_MENU], eCode, wParam, dwParam);
						return TRUE;
					}

					break;

				case CALL_FIRER:
					// EVENT ON CALL_FIRER
					DBGPRINTF("******* CALL_FIRER *******");
					if(wParam == AVK_CLR)
					{
						DBGPRINTF("***** CANCEL PROGRESS *****");
						IMENUCTL_Redraw(pMe->pIMenu[MAIN_MENU]);
						IMENUCTL_SetActive(pMe->pIMenu[MAIN_MENU], TRUE);

						return TRUE;
					}
					else
					{
						IMENUCTL_HandleEvent(pMe->pIMenu[MAIN_MENU], eCode, wParam, dwParam);
						return TRUE;
					}

					break;

				default:
					break;
				}
			}
			else if(pMe->pIMenu[AMBU_MENU] && IMENUCTL_IsActive(pMe->pIMenu[AMBU_MENU]))
			{
				index = IMENUCTL_GetSel(pMe->pIMenu[AMBU_MENU]);
				DBGPRINTF("******* index =  ******* %d", index);
				switch(index)
				{
				case QUICK_CALL:
					// EVENT ON CALL_AMBULANCE
					DBGPRINTF("***** CALL_AMBULANCE *****");
					if (wParam == AVK_CLR)
					{
						DBGPRINTF("******* CANCEL PROGRESS *******");
						IMENUCTL_SetActive(pMe->pIMenu[AMBU_MENU], FALSE);
						IMENUCTL_Redraw(pMe->pIMenu[MAIN_MENU]);
						IMENUCTL_SetActive(pMe->pIMenu[MAIN_MENU], TRUE);
						return TRUE;
					}
					else
					{
						IMENUCTL_HandleEvent(pMe->pIMenu[AMBU_MENU], eCode, wParam, dwParam);
						return TRUE;
					}

					break;
					
				case CANCEL_CALL:
					// EVENT ON CALL_AMBULANCE
					DBGPRINTF("***** CALL_AMBULANCE *****");
					if (wParam == AVK_CLR)
					{
						DBGPRINTF("******* CANCEL PROGRESS *******");
						IMENUCTL_SetActive(pMe->pIMenu[AMBU_MENU], FALSE);
						IMENUCTL_Redraw(pMe->pIMenu[MAIN_MENU]);
						IMENUCTL_SetActive(pMe->pIMenu[MAIN_MENU], TRUE);
						return TRUE;
					}
					else
					{
						IMENUCTL_HandleEvent(pMe->pIMenu[AMBU_MENU], eCode, wParam, dwParam);
						return TRUE;
					}

					break;

				}
			}
			else if(pMe->pIMenu[POLI_MENU] && IMENUCTL_IsActive(pMe->pIMenu[POLI_MENU]))
			{
				index = IMENUCTL_GetSel(pMe->pIMenu[POLI_MENU]);
				DBGPRINTF("******* index =  ******* %d", index);
				switch(index)
				{
				case QUICK_CALL:
					// EVENT ON CALL_AMBULANCE
					DBGPRINTF("***** CALL_AMBULANCE *****");
					if (wParam == AVK_CLR)
					{
						DBGPRINTF("******* CANCEL PROGRESS *******");
						IMENUCTL_SetActive(pMe->pIMenu[POLI_MENU], FALSE);
						IMENUCTL_Redraw(pMe->pIMenu[MAIN_MENU]);
						IMENUCTL_SetActive(pMe->pIMenu[MAIN_MENU], TRUE);
						return TRUE;
					}
					else
					{
						IMENUCTL_HandleEvent(pMe->pIMenu[POLI_MENU], eCode, wParam, dwParam);
						return TRUE;
					}

					break;
					
				case CANCEL_CALL:
					// EVENT ON CALL_AMBULANCE
					DBGPRINTF("***** CALL_AMBULANCE *****");
					if (wParam == AVK_CLR)
					{
						DBGPRINTF("******* CANCEL PROGRESS *******");
						IMENUCTL_SetActive(pMe->pIMenu[POLI_MENU], FALSE);				
						IMENUCTL_Redraw(pMe->pIMenu[MAIN_MENU]);
						IMENUCTL_SetActive(pMe->pIMenu[MAIN_MENU], TRUE);
						return TRUE;
					}
					else
					{
						IMENUCTL_HandleEvent(pMe->pIMenu[POLI_MENU], eCode, wParam, dwParam);
						return TRUE;
					}

					break;

				}
			}
			else if(pMe->pIMenu[FIRE_MENU] && IMENUCTL_IsActive(pMe->pIMenu[FIRE_MENU]))
			{
				index = IMENUCTL_GetSel(pMe->pIMenu[FIRE_MENU]);
				DBGPRINTF("******* index =  ******* %d", index);
				switch(index)
				{
				case QUICK_CALL:
					// EVENT ON CALL_AMBULANCE
					DBGPRINTF("***** CALL_AMBULANCE *****");
					if (wParam == AVK_CLR)
					{
						DBGPRINTF("******* CANCEL PROGRESS *******");
						IMENUCTL_SetActive(pMe->pIMenu[FIRE_MENU], FALSE);
						IMENUCTL_Redraw(pMe->pIMenu[MAIN_MENU]);
						IMENUCTL_SetActive(pMe->pIMenu[MAIN_MENU], TRUE);
						return TRUE;
					}
					else
					{
						IMENUCTL_HandleEvent(pMe->pIMenu[FIRE_MENU], eCode, wParam, dwParam);
						return TRUE;
					}
					break;
					
				case CANCEL_CALL:
					// EVENT ON CALL_AMBULANCE
					DBGPRINTF("***** CALL_AMBULANCE *****");
					if (wParam == AVK_CLR)
					{
						DBGPRINTF("******* CANCEL PROGRESS *******");
						IMENUCTL_SetActive(pMe->pIMenu[FIRE_MENU], FALSE);
						IMENUCTL_Redraw(pMe->pIMenu[MAIN_MENU]);
						IMENUCTL_SetActive(pMe->pIMenu[MAIN_MENU], TRUE);
						return TRUE;
					}
					else
					{
						IMENUCTL_HandleEvent(pMe->pIMenu[FIRE_MENU], eCode, wParam, dwParam);
						return TRUE;
					}
					break;

				}
			}
			else if(pMe->pIMenu[CANCEL_MENU] && IMENUCTL_IsActive(pMe->pIMenu[CANCEL_MENU]))
			{
				index = IMENUCTL_GetSel(pMe->pIMenu[CANCEL_MENU]);
				DBGPRINTF("******* index =  ******* %d", index);
				switch(index)
				{
				case NO:
					// EVENT ON CALL_AMBULANCE
					DBGPRINTF("***** CALL_AMBULANCE *****");
					if (wParam == AVK_CLR)
					{
						DBGPRINTF("******* CANCEL PROGRESS *******");
						IMENUCTL_SetActive(pMe->pIMenu[CANCEL_MENU], FALSE);
						IMENUCTL_Redraw(pMe->pIMenu[MAIN_MENU]);
						IMENUCTL_SetActive(pMe->pIMenu[MAIN_MENU], TRUE);
						return TRUE;
					}
					else
					{
						IMENUCTL_HandleEvent(pMe->pIMenu[CANCEL_MENU], eCode, wParam, dwParam);
						return TRUE;
					}
					break;
					
				case YES:
					// EVENT ON CALL_AMBULANCE
					DBGPRINTF("***** CALL_AMBULANCE *****");
					if (wParam == AVK_CLR)
					{
						DBGPRINTF("******* CANCEL PROGRESS *******");
						IMENUCTL_SetActive(pMe->pIMenu[CANCEL_MENU], FALSE);
						IMENUCTL_Redraw(pMe->pIMenu[MAIN_MENU]);
						IMENUCTL_SetActive(pMe->pIMenu[MAIN_MENU], TRUE);
						return TRUE;
					}
					else
					{
						IMENUCTL_HandleEvent(pMe->pIMenu[CANCEL_MENU], eCode, wParam, dwParam);
						return TRUE;
					}
					break;

				}
			}
			else if(pMe->pIMenu[SUCCESS_MENU] && IMENUCTL_IsActive(pMe->pIMenu[SUCCESS_MENU]))
			{
				index = IMENUCTL_GetSel(pMe->pIMenu[SUCCESS_MENU]);
				DBGPRINTF("******* SUCCESS_MENU *******");
				DBGPRINTF("******* index =  ******* %d", index);
				switch(index)
				{
				case RETURN:
					// EVENT ON CANCEL_MENU
					DBGPRINTF("***** RETURN *****");
					IMENUCTL_SetActive(pMe->pIMenu[SUCCESS_MENU], FALSE);
					IMENUCTL_SetActive(pMe->pIMenu[MAIN_MENU], TRUE);

					break;
				}
			}
			else if(pMe->pIMenu[ERROR_MENU] && IMENUCTL_IsActive(pMe->pIMenu[ERROR_MENU]))
			{
				index = IMENUCTL_GetSel(pMe->pIMenu[ERROR_MENU]);
				DBGPRINTF("******* SUCCESS_MENU *******");
				DBGPRINTF("******* index =  ******* %d", index);
				switch(index)
				{
				case RETURN:
					// EVENT ON CANCEL_MENU
					DBGPRINTF("***** RETURN *****");
					IMENUCTL_SetActive(pMe->pIMenu[ERROR_MENU], FALSE);
					IMENUCTL_SetActive(pMe->pIMenu[MAIN_MENU], TRUE);

					break;
				}
			}


      		return(TRUE);

			//////////////////////////////////////
			// EVENT COMMAND
			/////////////////////////////////////
		case EVT_COMMAND:
		    // Add your code here...

			DBGPRINTF("******* EVT_COMMAND *******");
			if(pMe->pIMenu[MAIN_MENU] && IMENUCTL_IsActive(pMe->pIMenu[MAIN_MENU]))
			{
				DBGPRINTF("******* MAIN_MENU *******");
				index = IMENUCTL_GetSel(pMe->pIMenu[MAIN_MENU]);
				switch(index)
				{
				case CALL_AMBULANCE:
					// CALL_AMBULANCE
					DBGPRINTF("******* CALL_AMBULANCE ******* index = %d", index);
					IMENUCTL_SetActive(pMe->pIMenu[MAIN_MENU], FALSE);
					drawStartAmbulanceLogo(pMe);
					ISHELL_SetTimer(pMe->pIShell, 1000, (PFNNOTIFY)showAmbulanceMenu, pMe);
										
					break;

				case CALL_POLICE:
					// CALL_POLICE
					DBGPRINTF("******* CALL_POLICE ******* index = %d", index);
					IMENUCTL_SetActive(pMe->pIMenu[MAIN_MENU], FALSE);
					drawStartPoliceLogo(pMe);
					ISHELL_SetTimer(pMe->pIShell, 1000, (PFNNOTIFY)showPoliceMenu, pMe);

					break;

				case CALL_FIRER:
					// CALL_FIRER
					DBGPRINTF("******* CALL_FIRER ******* index = %d", index);
					IMENUCTL_SetActive(pMe->pIMenu[MAIN_MENU], FALSE);
					drawStartFirerLogo(pMe);
					ISHELL_SetTimer(pMe->pIShell, 1000, (PFNNOTIFY)showFirerMenu, pMe);

					break;

				default:
					break;
				}
			}
			else if(pMe->pIMenu[AMBU_MENU] && IMENUCTL_IsActive(pMe->pIMenu[AMBU_MENU]))
			{
				index = IMENUCTL_GetSel(pMe->pIMenu[AMBU_MENU]);
				DBGPRINTF("******* AMBU_MENU *******");
				switch(index)
				{
				case QUICK_CALL:
					//
					DBGPRINTF("******* QUICK_CALL ******* index = %d", index);
					GetGPSInfo(pMe);
					callQuickChkType(pMe);
					StartProgressDisplay(pMe);

					break;
					
				case CANCEL_CALL:
					//
					DBGPRINTF("******* CANCEL_CALL ******* index = %d", index);
					IMENUCTL_SetActive(pMe->pIMenu[AMBU_MENU], FALSE);
					cancelCall(pMe);

					break;

				}
			}
			else if(pMe->pIMenu[POLI_MENU] && IMENUCTL_IsActive(pMe->pIMenu[POLI_MENU]))
			{
				index = IMENUCTL_GetSel(pMe->pIMenu[POLI_MENU]);
				DBGPRINTF("******* POLI_MENU *******");
				switch(index)
				{
				case QUICK_CALL:
					//
					DBGPRINTF("******* POLICE_TITLE ******* index = %d", index);
					GetGPSInfo(pMe);
					callQuickChkType(pMe);
					StartProgressDisplay(pMe);

					break;
					
				case CANCEL_CALL:
					//
					DBGPRINTF("******* POLICE_TITLE ******* index = %d", index);
					IMENUCTL_SetActive(pMe->pIMenu[POLI_MENU], FALSE);
					cancelCall(pMe);

					break;
				}
			}
			else if(pMe->pIMenu[FIRE_MENU] && IMENUCTL_IsActive(pMe->pIMenu[FIRE_MENU]))
			{
				index = IMENUCTL_GetSel(pMe->pIMenu[FIRE_MENU]);
				DBGPRINTF("******* FIRE_MENU *******");
				switch(index)
				{
				case QUICK_CALL:
					//
					DBGPRINTF("******* FIRER_TITLE ******* index = %d", index);
					GetGPSInfo(pMe);
					callQuickChkType(pMe);
					StartProgressDisplay(pMe);

					break;
					
				case CANCEL_CALL:
					//
					DBGPRINTF("******* FIRER_TITLE ******* index = %d", index);
					IMENUCTL_SetActive(pMe->pIMenu[FIRE_MENU], FALSE);
					cancelCall(pMe);

					break;
				}
			}
			else if(pMe->pIMenu[CANCEL_MENU] && IMENUCTL_IsActive(pMe->pIMenu[CANCEL_MENU]))
			{
				index = IMENUCTL_GetSel(pMe->pIMenu[CANCEL_MENU]);
				DBGPRINTF("******* CANCEL_MENU *******");
				DBGPRINTF("******* index =  ******* %d", index);
				switch(index)
				{
				case NO:
					// EVENT ON CANCEL_MENU
					DBGPRINTF("***** NO *****");
					IMENUCTL_SetActive(pMe->pIMenu[CANCEL_MENU], FALSE);
					if(pMe->pIMenu[AMBU_MENU])
					{
						IMENUCTL_SetActive(pMe->pIMenu[AMBU_MENU], TRUE);
					}
					else if(pMe->pIMenu[POLI_MENU])
					{
						IMENUCTL_SetActive(pMe->pIMenu[POLI_MENU], TRUE);
					}
					else if(pMe->pIMenu[FIRE_MENU])
					{
						IMENUCTL_SetActive(pMe->pIMenu[FIRE_MENU], TRUE);
					}

					break;
					
				case YES:
					// EVENT ON CANCEL_MENU
					DBGPRINTF("***** YES *****");
					IMENUCTL_SetActive(pMe->pIMenu[CANCEL_MENU], FALSE);
					IMENUCTL_SetActive(pMe->pIMenu[MAIN_MENU], TRUE);

					break;

				}
			}
			else if(pMe->pIMenu[SUCCESS_MENU] && IMENUCTL_IsActive(pMe->pIMenu[SUCCESS_MENU]))
			{
				index = IMENUCTL_GetSel(pMe->pIMenu[SUCCESS_MENU]);
				DBGPRINTF("******* SUCCESS_MENU *******");
				DBGPRINTF("******* index =  ******* %d", index);
				switch(index)
				{
				case RETURN:
					// EVENT ON CANCEL_MENU
					DBGPRINTF("***** RETURN *****");
					IMENUCTL_SetActive(pMe->pIMenu[SUCCESS_MENU], FALSE);
					IMENUCTL_SetActive(pMe->pIMenu[MAIN_MENU], TRUE);

					break;
				}
			}
			else if(pMe->pIMenu[ERROR_MENU] && IMENUCTL_IsActive(pMe->pIMenu[ERROR_MENU]))
			{
				index = IMENUCTL_GetSel(pMe->pIMenu[ERROR_MENU]);
				DBGPRINTF("******* SUCCESS_MENU *******");
				DBGPRINTF("******* index =  ******* %d", index);
				switch(index)
				{
				case RETURN:
					// EVENT ON CANCEL_MENU
					DBGPRINTF("***** RETURN *****");
					IMENUCTL_SetActive(pMe->pIMenu[ERROR_MENU], FALSE);
					IMENUCTL_SetActive(pMe->pIMenu[MAIN_MENU], TRUE);

					break;
				}
			}
			
			return (TRUE);

		case EVT_APP_NO_SLEEP:

			return (TRUE);
			
        // If nothing fits up to this point then we'll just break out

		default:
			break;

	}
	return FALSE;
}
/*===========================================================================*/

/*===========================================================================*/
/*---------------------------------------------------------------------------
Function emergency_InitAppData
-----------------------------------------------------------------------------*/
static boolean emergency_InitAppData(myProject * pInit)
{
	int i;
	DBGPRINTF("******* emergency_InitAppData *******");	
	// Get the Device infomation for this handset
	pInit->DeviceInfo.wStructSize = sizeof(pInit->DeviceInfo);
	ISHELL_GetDeviceInfo(pInit->App.m_pIShell, &pInit->DeviceInfo);

	// The Display and Shell interfaces are always create
	pInit->pIDisplay = pInit->App.m_pIDisplay;
	pInit->pIShell = pInit->App.m_pIShell;   

	pInit->m_cxScreen = pInit->DeviceInfo.cxScreen;
	pInit->m_cyScreen = pInit->DeviceInfo.cyScreen;
	SETAEERECT(&pInit->LogoFrame, 0, LOGO_HIGH+1, pInit->m_cxScreen, (LOGO_HIGH+1));
	SETAEERECT(&pInit->MainFrame, 0, LOGO_HIGH+1, pInit->m_cxScreen, pInit->m_cyScreen - (LOGO_HIGH+1));
	SETAEERECT(&pInit->ProgFrame, (pInit->m_cxScreen - CX_PROG_DISPLAY)/2, 
		(pInit->m_cyScreen - CY_PROG_DISPLAY)/2, CX_PROG_DISPLAY, CY_PROG_DISPLAY);

    // set the Interface pointers to NULL before trying to create any, so in
    // case any fail in the middle, we can release based upon valid pointers
    pInit->pIWeb = NULL;
    pInit->pIWebResponse = NULL;
 
    // open the static text window for displaying messages
    if ( ISHELL_CreateInstance(pInit->pIShell, AEECLSID_STATIC, (void **)&pInit->pIStatic) != SUCCESS )
    {
        return FALSE;
    }

	if (ISHELL_CreateInstance(pInit->pIShell,AEECLSID_FILEMGR, (void**)&pInit->pIFileMgr) != SUCCESS) 
	{
		pInit->pIFileMgr = NULL;
		return (FALSE);
	}

    // we can either user a c string or a unicode string for the
    // Istatic interface. We'll tell it here that we'll be using ascii
    ISTATIC_SetProperties(pInit->pIStatic, ST_ASCII);


	// MENU
	for(i=0; i<MAX_MENU; i++)
	{
		pInit->pIMenu[i] = NULL;
	}

	// IMAGE
	if((pInit->pIImage[IMAGE_LOGO] = ISHELL_LoadResImage(pInit->pIShell, EMERGENCY_RES_FILE, IMG_LOGO)) ==NULL ||
		(pInit->pIImage[IMAGE_AMBULANCE] = ISHELL_LoadResImage(pInit->pIShell, EMERGENCY_RES_FILE, IMG_AMBULANCE)) ==NULL ||
		(pInit->pIImage[IMAGE_POLICE] = ISHELL_LoadResImage(pInit->pIShell, EMERGENCY_RES_FILE, IMG_POLICE)) == NULL ||
		(pInit->pIImage[IMAGE_FIRER] = ISHELL_LoadResImage(pInit->pIShell, EMERGENCY_RES_FILE, IMG_FIRER)) == NULL ||
		(pInit->pIImage[MENU_AMBULANCE] = ISHELL_LoadResImage(pInit->pIShell, EMERGENCY_RES_FILE, AMBULANCE_MENU)) == NULL ||
		(pInit->pIImage[MENU_POLICE] = ISHELL_LoadResImage(pInit->pIShell, EMERGENCY_RES_FILE, POLICE_MENU)) == NULL ||
		(pInit->pIImage[MENU_FIRER] = ISHELL_LoadResImage(pInit->pIShell, EMERGENCY_RES_FILE, FIRER_MENU)) == NULL ||
		(pInit->pIImage[MENU_QUICKCALL] = ISHELL_LoadResImage(pInit->pIShell, EMERGENCY_RES_FILE, CALL_QUICK)) == NULL ||
		(pInit->pIImage[MENU_CANCELCALL] = ISHELL_LoadResImage(pInit->pIShell, EMERGENCY_RES_FILE, CANCLE_CALL)) == NULL ||
		(pInit->pIImage[PHONE_ANI] = ISHELL_LoadResImage(pInit->pIShell, EMERGENCY_RES_FILE, PHONE_ANIMATE)) == NULL ||
		(pInit->pIImage[POS_ANI] = ISHELL_LoadResImage(pInit->pIShell, EMERGENCY_RES_FILE, POSITION_ANIMATE)) == NULL ||
		(pInit->pIImage[ARROW_ANI] = ISHELL_LoadResImage(pInit->pIShell, EMERGENCY_RES_FILE, ARROW_ANIMATE)) == NULL 
		)
	{
		return FALSE;
	}
 

	return TRUE;
}
/*===========================================================================*/

/*===========================================================================*/
/*---------------------------------------------------------------------------
Function emergency_FreeAppData
-----------------------------------------------------------------------------*/
static void emergency_FreeAppData(myProject * pFree)
{
	int i;
	// freeing any resources
	DBGPRINTF("******* emergency_FreeAppData *******");	
    
	// MENU
	for(i=0; i<MAX_MENU; i++)
	{
		if(pFree->pIMenu[i])
		{
			IMENUCTL_Release(pFree->pIMenu[i]);
			pFree->pIMenu[i] = NULL;
		}
	}

	// IMAGE
	for(i=0; i<MAX_IMAGE; i++)
	{
		if(pFree->pIImage[i])
		{
			IIMAGE_Release(pFree->pIImage[i]);
			pFree->pIImage[i] = NULL;
		}
	}

    // free resources for the text window
    if ( pFree->pIStatic != NULL )
    {
        ISTATIC_Release(pFree->pIStatic);
        pFree->pIStatic = NULL;
    }

	if ( pFree->pIFileMgr)
	{
		
		IFILEMGR_Release(pFree->pIFileMgr);
		pFree->pIFileMgr = NULL;
	}


	DBGPRINTF("******* emergency_FreeAppData (ED)*******");	
}
/*===========================================================================*/

/*===========================================================================*/
/*---------------------------------------------------------------------------
Function callQuick
-----------------------------------------------------------------------------*/
/*===========================================================================*/

/*===========================================================================*/
/*---------------------------------------------------------------------------
Function 
-----------------------------------------------------------------------------*/

/*===========================================================================*/

/*===========================================================================*/
/*---------------------------------------------------------------------------
Function callQuick
-----------------------------------------------------------------------------*/
static void callQuickChkType(myProject * pMe)
{
	DBGPRINTF("******* callQuickChkType *******");

	if(pMe->pIMenu[AMBU_MENU] && IMENUCTL_IsActive(pMe->pIMenu[AMBU_MENU]))
	{
		DBGPRINTF("******* AMBULANCE_TYPE *******");
		pMe->callType = AMBULANCE_CALL_QUICK;
	}
	else if(pMe->pIMenu[POLI_MENU] && IMENUCTL_IsActive(pMe->pIMenu[POLI_MENU]))
	{
		DBGPRINTF("******* POLICE_TYPE *******");
		pMe->callType = POLICE_CALL_QUICK;
	}
	else if(pMe->pIMenu[FIRE_MENU] && IMENUCTL_IsActive(pMe->pIMenu[FIRE_MENU]))
	{
		DBGPRINTF("******* FIRER_TYPE *******");
		pMe->callType = FIRER_CALL_QUICK;
	}

	DBGPRINTF("******* callQuickChkType (ED) *******");
}
/*===========================================================================*/

/*===========================================================================*/
/*---------------------------------------------------------------------------
Function GetGPSInfo
-----------------------------------------------------------------------------*/
static int GetGPSInfo(myProject * pMe)
{
	AEEGPSConfig config;
	DBGPRINTF("***** GetGPSInfo *****");
	if(ISHELL_CreateInstance(pMe->pIShell, AEECLSID_POSDET, (void **)(&pMe->pIPosDet))!=SUCCESS)
	{
		DBGPRINTF("***** EFAILED *****");
		return EFAILED;
	}

	IPOSDET_GetGPSConfig(pMe->pIPosDet, &config );
	config.mode = AEEGPS_MODE_TRACK_NETWORK;
	config.nFixes = 1;
	config.nInterval = 60;
	if(IPOSDET_SetGPSConfig(pMe->pIPosDet, &config ) != SUCCESS)
		return FALSE;

	CALLBACK_Init(&pMe->CallbackGPS, (PFNNOTIFY) emergency_GPSCB, pMe);
	if(IPOSDET_GetGPSInfo(pMe->pIPosDet, AEEGPS_GETINFO_LOCATION, AEEGPS_ACCURACY_LEVEL1,
						&pMe->GPSInfo, &pMe->CallbackGPS) != SUCCESS)
	{
		DBGPRINTF("***** NOT SUCCESS *****");
		return FALSE;
	}
	
	DBGPRINTF("***** GetGPSInfo (ED)*****");

	return TRUE;
}
/*===========================================================================*/

/*===========================================================================*/
/*---------------------------------------------------------------------------
Function emergency_GPSCB
-----------------------------------------------------------------------------*/
static void emergency_GPSCB(void * pUser)
{
	myProject *pMe = (myProject*) pUser;
	DBGPRINTF("***** emergency_GPSCB *****");
	if(pMe->GPSInfo.status == AEEGPS_ERR_NO_ERR)
	{
		ISHELL_PostEvent(pMe->pIShell, pMe->App.clsID, EVT_COMMAND, NULL, NULL );
		DBGPRINTF("---- GPS OK");
		DBGPRINTF("***** showLocation lat = %d lon = %d*****", pMe->GPSInfo.dwLat, pMe->GPSInfo.dwLon);
		ConnectToWeb(pMe);
	}
	else
	{
		DBGPRINTF("---- GPS NO OK");
		pMe->chk = FALSE;
	}

	GPSCleanUp(pMe);

	DBGPRINTF("***** emergency_GPSCB (ED) *****");

}
/*===========================================================================*/

/*===========================================================================*/
/*---------------------------------------------------------------------------
Function GPSCleanUp
-----------------------------------------------------------------------------*/
static void GPSCleanUp(myProject * pMe)
{
	DBGPRINTF("***** GPSCleanUp *****");
	CALLBACK_Cancel(&pMe->CallbackGPS);

	if(pMe->pIPosDet)
	{
		IPOSDET_Release(pMe->pIPosDet);
		pMe->pIPosDet = NULL;
	}
	DBGPRINTF("***** GPSCleanUp (ED) *****");

}
/*===========================================================================*/

/*===========================================================================*/
/*-------------------------------------------------------------------
Function showLocation
------------------------------------------------------------------- */
static void ConnectToWeb(myProject * pMe)
{
	if(pMe->callType == AMBULANCE_CALL_QUICK)
	{
		IMENUCTL_SetActive(pMe->pIMenu[AMBU_MENU], FALSE);
	}
	else if(pMe->callType == POLICE_CALL_QUICK)
	{
		IMENUCTL_SetActive(pMe->pIMenu[POLI_MENU], FALSE);
	}
	else if(pMe->callType == FIRER_CALL_QUICK)
	{
		IMENUCTL_SetActive(pMe->pIMenu[FIRE_MENU], FALSE);
	}

	DBGPRINTF("***** ConnectToWeb *****");	
	DBGPRINTF("***** showLocation lat = %d lon = %d*****", pMe->GPSInfo.dwLat, pMe->GPSInfo.dwLon);

	applenPath(pMe);
	OpenConnectionToWebsite(pMe, pMe->stFullUrl);
	StartProgressDisplay(pMe);

	if(pMe->chk)
		ISHELL_SetTimer(pMe->pIShell, 4000, (PFNNOTIFY)SuccessCall, pMe);
	else
		ISHELL_SetTimer(pMe->pIShell, 4000, (PFNNOTIFY)ErrorCall, pMe);

	
	DBGPRINTF("***** ConnectToWeb (ED)*****");
}
/*===========================================================================*/

/*===========================================================================*/
/*-------------------------------------------------------------------
Function StartProgressDisplay
------------------------------------------------------------------- */
static void StartProgressDisplay(myProject *pMe)
{
	DBGPRINTF("***** StartProgressDisplay *****");
	
	ISHELL_LoadResString(pMe->pIShell, EMERGENCY_RES_FILE, CONNECTING, pMe->szBuff, sizeof(pMe->szBuff));
	DisplayMessage(pMe);

	IDISPLAY_EraseRect(pMe->App.m_pIDisplay, &pMe->ProgFrame);
	IDISPLAY_FrameRect(pMe->App.m_pIDisplay, &pMe->ProgFrame);

	IIMAGE_Draw(pMe->pIImage[PHONE_ANI], pMe->ProgFrame.x + 5, pMe->ProgFrame.y + 40);
	IIMAGE_Draw(pMe->pIImage[POS_ANI],  pMe->ProgFrame.x + 55, pMe->ProgFrame.y + 20);
	IIMAGE_Start(pMe->pIImage[ARROW_ANI], pMe->ProgFrame.x + 15, pMe->ProgFrame.y + 35);

	DBGPRINTF("***** StartProgressDisplay (ED)*****");
}
/*===========================================================================*/

/*===========================================================================*/
/*-------------------------------------------------------------------
Function applenPath
------------------------------------------------------------------- */
static void applenPath(myProject * pMe)
{
	char query1[50];
	char query2[50];
	char query3[50];
	AECHAR queryx[100];
	DBGPRINTF("***** applenPath *****");

	MEMSET(query1,0,sizeof(query1));
	MEMSET(query2,0,sizeof(query2));
	MEMSET(query3,0,sizeof(query3));

	if(pMe->callType == AMBULANCE_CALL_QUICK)
	{
		STRNCPY(query1, AMBULANCE, sizeof(query1));
	}
	else if(pMe->callType == POLICE_CALL_QUICK)
	{
		STRNCPY(query1, POLICE, sizeof(query1));
	}
	else if(pMe->callType == FIRER_CALL_QUICK)
	{
		STRNCPY(query1, FIRER, sizeof(query1));
	}

	FLOATTOWSTR(pMe->GPSInfo.dwLat,queryx,sizeof(queryx));
	WSTRTOSTR(queryx,query2,sizeof(query2));
	TRIMNUMERIC(query2,sizeof(query2));

	FLOATTOWSTR(pMe->GPSInfo.dwLon,queryx,sizeof(queryx));
	WSTRTOSTR(queryx,query3,sizeof(query3));
	TRIMNUMERIC(query3,sizeof(query3));

	STRNCPY(pMe->url, MAIN_URL, sizeof(pMe->url));

	SPRINTF(pMe->stFullUrl,"%stype=%s&x_pos=%s&y_pos=%s", pMe->url, query1, query2, query3);
	DBGPRINTF("output URL:%stype=%s&x_pos=%s&y_pos%s",pMe->url, query1, query2, query3);

	DBGPRINTF("***** applenPath (ED)*****");
}
/*===========================================================================*/

/*===========================================================================*/
/*-------------------------------------------------------------------
Function OpenConnectionToWebsite
------------------------------------------------------------------- */
static int OpenConnectionToWebsite(myProject *pMe, char *stWebsiteAndPath)
{
	DBGPRINTF("******* OpenConnectionToWebsite *******");
	// open the web interface
    if ( ISHELL_CreateInstance(pMe->pIShell, AEECLSID_WEB, (void **)(&pMe->pIWeb)) != SUCCESS )
    {
        return FALSE;
    }

    // Set a function to be called upon connection to web site.
    CALLBACK_Init(&pMe->OpenWebConnectionCallbackStruct, OpenConnectionCB, pMe);

	pMe->chk = TRUE;
    // keep track of the website and the filename so we can use it when we need it
    STRLCPY(pMe->stWebsiteAndPath, stWebsiteAndPath, sizeof(pMe->stWebsiteAndPath));
    //STRLCPY(pMe->stFilename, stFilename, sizeof(pMe->stFilename));

    // create the full path of the web site including file to get
    // for example "http://www.place.com/myfile.zip"
    SNPRINTF(pMe->stFullUrl,sizeof(pMe->stFullUrl), "%s", stWebsiteAndPath);
	DBGPRINTF("*** URL : %s ", pMe->stFullUrl);

    // Now we simply call IWEB_GetResponse to make the HTTP connection
    // Initiate the web connection. We'll go to sleep as soon as we return and
    // be woken up as soon as something happens.
    IWEB_GetResponse(pMe->pIWeb,
                     (pMe->pIWeb,
                     &pMe->pIWebResponse,
                     &pMe->OpenWebConnectionCallbackStruct,
                     pMe->stFullUrl,
                     WEBOPT_FLAGS, WEBREQUEST_FORCENEWCONN,
                     WEBOPT_END));

    // update display that we're connecting
    //DisplayMessage(pMe, "Connecting...");
	ISHELL_LoadResString(pMe->pIShell, EMERGENCY_RES_FILE, CONNECTING, pMe->szBuff, sizeof(pMe->szBuff));
	DisplayMessage(pMe);


	DBGPRINTF("******* OpenConnectionToWebsite (ED) *******");
    return TRUE;
}

/*===========================================================================

FUNCTION: OpenConnectionCB

DESCRIPTION
	Callback for opening HTTP connection

PROTOTYPE:
    static void OpenConnectionCB(ReadWebFileApp *pMe)

PARAMETERS:
	pMe: [in]: Pointer to my static app data

DEPENDENCIES
  none

RETURN VALUE
    none

SIDE EFFECTS
  none
===========================================================================*/
static void OpenConnectionCB(myProject *pMe)
{
	// get the web response struct - for seeing how much data to read
    pMe->pWebResponseInfo = IWEBRESP_GetInfo(pMe->pIWebResponse);

	DBGPRINTF("******* OpenConnectionCB *******");
    // if there was a network error then say so
    // we can look at these in AEEError.h
    if ( WEB_ERROR_SUCCEEDED(pMe->pWebResponseInfo->nCode) == FALSE )
    {
		DBGPRINTF("******* Error : Net Error *******");
        pMe->AppState = MYAPP_END;
		ISHELL_LoadResString(pMe->pIShell, EMERGENCY_RES_FILE, ERROR, pMe->szBuff, sizeof(pMe->szBuff));
        DisplayMessage(pMe);
		pMe->chk = FALSE;
        return;
    }

    DBGPRINTF("******* DisplayMessage Connected. *******");
    // we're passed the errors, so show we're connected!
    //DisplayMessage(pMe, "Connected.");
	//ISHELL_LoadResString(pMe->pIShell, EMERGENCY_RES_FILE, CONNECTED, pMe->szBuff, sizeof(pMe->szBuff));
	//DisplayMessage(pMe);
	DBGPRINTF("******* pMe->chk = %d*******", pMe->chk);

	WebCleanup(pMe);
	DBGPRINTF("******* OpenConnectionCB (ED)*******");

}
/*===========================================================================

/*===========================================================================

FUNCTION WebCleanup()

DESCRIPTION
	Free any resources allocated as part of the web retrieval.  This can be
	called before the app exits, or before the web access is repeated.

===========================================================================*/
static void WebCleanup(myProject *pMe)
{
	if(pMe->pIWeb)
	{
		IWEB_Release(pMe->pIWeb);
		pMe->pIWeb = NULL;
	}

	if(pMe->pIWebResponse)
	{
		IWEBRESP_Release(pMe->pIWebResponse);
		pMe->pIWebResponse = NULL;
	}

}
/*===========================================================================*/

/*===========================================================================*/
/*---------------------------------------------------------------------------
Function DisplayMessage
// this function is better for displaying a message because
// it formats the text automatically
-----------------------------------------------------------------------------*/
static boolean DisplayMessage(myProject *pMe)
{
	IDISPLAY_ClearScreen(pMe->pIDisplay);
	IDISPLAY_DrawText(pMe->pIDisplay,    // Display instance
                      AEE_FONT_BOLD,       // Use BOLD font
                      pMe->szBuff,              // Text - Normally comes from resource
                      -1,                  // -1 = Use full string length
                      0,                   // Ignored - IDF_ALIGN_CENTER
                      0,                   // Ignored - IDF_ALIGN_MIDDLE
                      NULL,                // No clipping
                      IDF_ALIGN_CENTER | IDF_ALIGN_TOP);
	IDISPLAY_Update(pMe->pIDisplay);

    return TRUE;
}
/*===========================================================================*/

//============== delete alphabet and other white space
static void TRIMNUMERIC(char* inputstr,uint16 size)
{
	char* bufferDest = (char*)MALLOC(size);
	uint16 indexDest = 0;
	uint16 indexSrc=size;
	for (indexSrc=0;indexSrc<size;indexSrc++){
		switch(inputstr[indexSrc]){
		case '1':
		case '2':
		case '3':
		case '4':
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
		case '0':
		case '.':
		case '-':
		case '+':
			bufferDest[indexDest++]=inputstr[indexSrc];
			break;
		}
	}
	bufferDest[indexDest]='\0'; //insert last NULL-string
	MEMCPY(inputstr,bufferDest,size);
	FREE(bufferDest);
}
/*===========================================================================*/

/*===========================================================================*/
/*---------------------------------------------------------------------------
Function showMainMenu
-----------------------------------------------------------------------------*/
static void showMainMenu(myProject* pMe)
{
	AEEImageInfo	ii;
	CtlAddItem		pAddItem;
	uint16			index;
	DBGPRINTF("******* showMainMenu *******");

	IDISPLAY_ClearScreen(pMe->pIDisplay);
	IIMAGE_GetInfo(pMe->pIImage[IMAGE_LOGO], &ii);

	if(pMe->pIMenu[MAIN_MENU] == NULL)
	{
		ISHELL_CreateInstance(pMe->pIShell, AEECLSID_MENUCTL,(void**) &pMe->pIMenu[MAIN_MENU]);
		
		if(pMe->pIMenu[MAIN_MENU] == NULL)
		{
			ISHELL_PostEvent(pMe->pIShell, AEECLSID_EMERGENCY, EVT_APP_STOP, 0, 0);
			return;
		}
	}

	// SET FRAME DRAW LOGO
	IMENUCTL_SetRect(pMe->pIMenu[MAIN_MENU], &(pMe->LogoFrame));
	IIMAGE_Draw(pMe->pIImage[IMAGE_LOGO], (pMe->m_cxScreen - ii.cx)/2, 0);
	IDISPLAY_DrawHLine(pMe->pIDisplay, 0, LOGO_HIGH, pMe->m_cxScreen);
	
	// SET MAIN FRAME & TITLE MENU
	IMENUCTL_SetProperties(pMe->pIMenu[MAIN_MENU], MP_UNDERLINE_TITLE);
	IMENUCTL_SetTitle(pMe->pIMenu[MAIN_MENU],EMERGENCY_RES_FILE, MENU_MAIN, NULL);
	IMENUCTL_SetRect(pMe->pIMenu[MAIN_MENU], &(pMe->MainFrame));

	// ADD ITEM MENU
	pAddItem.pText = NULL;
	pAddItem.pImage = NULL;
	pAddItem.pszResImage = EMERGENCY_RES_FILE;
	pAddItem.pszResText = EMERGENCY_RES_FILE;
	pAddItem.wText = CALL_AMBULANCE;
	pAddItem.wFont = AEE_FONT_BOLD;
	pAddItem.wImage = AMBULANCE_MENU;
	pAddItem.wItemID = CALL_AMBULANCE;
	pAddItem.dwData = 0;
	IMENUCTL_AddItemEx(pMe->pIMenu[MAIN_MENU], &pAddItem);

	pAddItem.pText = NULL;
	pAddItem.pImage = NULL;
	pAddItem.pszResImage = EMERGENCY_RES_FILE;
	pAddItem.pszResText = EMERGENCY_RES_FILE;
	pAddItem.wText = CALL_POLICE;
	pAddItem.wFont = AEE_FONT_BOLD;
	pAddItem.wImage = POLICE_MENU;
	pAddItem.wItemID = CALL_POLICE;
	IMENUCTL_AddItemEx(pMe->pIMenu[MAIN_MENU], &pAddItem);

	pAddItem.pText = NULL;
	pAddItem.pImage = NULL;
	pAddItem.pszResImage = EMERGENCY_RES_FILE;
	pAddItem.pszResText = EMERGENCY_RES_FILE;
	pAddItem.wText = CALL_FIRER;
	pAddItem.wFont = AEE_FONT_BOLD;
	pAddItem.wImage = FIRER_MENU;
	pAddItem.wItemID = CALL_FIRER;
	IMENUCTL_AddItemEx(pMe->pIMenu[MAIN_MENU], &pAddItem);
		
	IMENUCTL_SetSel(pMe->pIMenu[MAIN_MENU], CALL_AMBULANCE);
	IMENUCTL_SetActive(pMe->pIMenu[MAIN_MENU], TRUE );

	IDISPLAY_Update(pMe->pIDisplay);
	index = IMENUCTL_GetSel(pMe->pIMenu[MAIN_MENU]);
	DBGPRINTF("index = %d", index);
	DBGPRINTF("******* showMainMenu (ED) *******");
}
/*===========================================================================*/

/*===========================================================================*/
/*---------------------------------------------------------------------------
Function showAmbulanceMenu
-----------------------------------------------------------------------------*/
static void showAmbulanceMenu(myProject* pMe)
{
	AEEImageInfo	ii;
	CtlAddItem		pAddItem;
	uint16			index;
	DBGPRINTF("******* showAmbulanceMenu *******");

	IDISPLAY_ClearScreen(pMe->pIDisplay);
	IIMAGE_GetInfo(pMe->pIImage[IMAGE_LOGO], &ii);

	if(pMe->pIMenu[AMBU_MENU] == NULL)
	{
		ISHELL_CreateInstance(pMe->pIShell, AEECLSID_MENUCTL,(void**) &pMe->pIMenu[AMBU_MENU]);
		
		if(pMe->pIMenu[AMBU_MENU] == NULL)
		{
			ISHELL_PostEvent(pMe->pIShell, AEECLSID_EMERGENCY, EVT_APP_STOP, 0, 0);
			return;
		}
	}

		// SET FRAME DRAW LOGO
		IMENUCTL_SetRect(pMe->pIMenu[AMBU_MENU], &(pMe->LogoFrame));
		IIMAGE_Draw(pMe->pIImage[IMAGE_LOGO], (pMe->m_cxScreen - ii.cx)/2, 0);
		IDISPLAY_DrawHLine(pMe->pIDisplay, 0, LOGO_HIGH, pMe->m_cxScreen);
		
		// SET MAIN FRAME & TITLE MENU
		IMENUCTL_SetProperties(pMe->pIMenu[AMBU_MENU], MP_UNDERLINE_TITLE);
		IMENUCTL_SetTitle(pMe->pIMenu[AMBU_MENU],EMERGENCY_RES_FILE, AMBULANCE_TITLE, NULL);
		IMENUCTL_SetRect(pMe->pIMenu[AMBU_MENU], &(pMe->MainFrame));

		// ADD ITEM MENU
		pAddItem.pText = NULL;
		pAddItem.pImage = NULL;
		pAddItem.pszResImage = EMERGENCY_RES_FILE;
		pAddItem.pszResText = EMERGENCY_RES_FILE;
		pAddItem.wText = QUICK_CALL;
		pAddItem.wFont = AEE_FONT_BOLD;
		pAddItem.wImage = CALL_QUICK;
		pAddItem.wItemID = QUICK_CALL;
		pAddItem.dwData = 0;
		IMENUCTL_AddItemEx(pMe->pIMenu[AMBU_MENU], &pAddItem);

		pAddItem.pText = NULL;
		pAddItem.pImage = NULL;
		pAddItem.pszResImage = EMERGENCY_RES_FILE;
		pAddItem.pszResText = EMERGENCY_RES_FILE;
		pAddItem.wText = CANCEL_CALL;
		pAddItem.wFont = AEE_FONT_BOLD;
		pAddItem.wImage = CANCLE_CALL;
		pAddItem.wItemID = CANCEL_CALL;
		IMENUCTL_AddItemEx(pMe->pIMenu[AMBU_MENU], &pAddItem);

		IMENUCTL_SetSel(pMe->pIMenu[AMBU_MENU], QUICK_CALL);
		IMENUCTL_SetActive(pMe->pIMenu[AMBU_MENU], TRUE );

	IDISPLAY_Update(pMe->pIDisplay);
	index = IMENUCTL_GetSel(pMe->pIMenu[AMBU_MENU]);
	DBGPRINTF("index = %d", index);
	DBGPRINTF("******* showAmbulanceMenu (ED) *******");
}
/*===========================================================================*/

/*===========================================================================*/
/*---------------------------------------------------------------------------
Function showPoliceMenu
-----------------------------------------------------------------------------*/
static void showPoliceMenu(myProject* pMe)
{
	AEEImageInfo	ii;
	CtlAddItem		pAddItem;
	uint16			index;
	DBGPRINTF("******* showPoliceMenu *******");

	IDISPLAY_ClearScreen(pMe->pIDisplay);
	IIMAGE_GetInfo(pMe->pIImage[IMAGE_LOGO], &ii);

	if(pMe->pIMenu[POLI_MENU] == NULL)
	{
		ISHELL_CreateInstance(pMe->pIShell, AEECLSID_MENUCTL,(void**) &pMe->pIMenu[POLI_MENU]);
		
		if(pMe->pIMenu[POLI_MENU] == NULL)
		{
			ISHELL_PostEvent(pMe->pIShell, AEECLSID_EMERGENCY, EVT_APP_STOP, 0, 0);
			return;
		}
	}

		// SET FRAME DRAW LOGO
		IMENUCTL_SetRect(pMe->pIMenu[POLI_MENU], &(pMe->LogoFrame));
		IIMAGE_Draw(pMe->pIImage[IMAGE_LOGO], (pMe->m_cxScreen - ii.cx)/2, 0);
		IDISPLAY_DrawHLine(pMe->pIDisplay, 0, LOGO_HIGH, pMe->m_cxScreen);
		
		// SET MAIN FRAME & TITLE MENU
		IMENUCTL_SetProperties(pMe->pIMenu[POLI_MENU], MP_UNDERLINE_TITLE);
		IMENUCTL_SetTitle(pMe->pIMenu[POLI_MENU],EMERGENCY_RES_FILE, POLICE_TITLE, NULL);
		IMENUCTL_SetRect(pMe->pIMenu[POLI_MENU], &(pMe->MainFrame));

		// ADD ITEM MENU
		pAddItem.pText = NULL;
		pAddItem.pImage = NULL;
		pAddItem.pszResImage = EMERGENCY_RES_FILE;
		pAddItem.pszResText = EMERGENCY_RES_FILE;
		pAddItem.wText = QUICK_CALL;
		pAddItem.wFont = AEE_FONT_BOLD;
		pAddItem.wImage = CALL_QUICK;
		pAddItem.wItemID = QUICK_CALL;
		pAddItem.dwData = 0;
		IMENUCTL_AddItemEx(pMe->pIMenu[POLI_MENU], &pAddItem);

		pAddItem.pText = NULL;
		pAddItem.pImage = NULL;
		pAddItem.pszResImage = EMERGENCY_RES_FILE;
		pAddItem.pszResText = EMERGENCY_RES_FILE;
		pAddItem.wText = CANCEL_CALL;
		pAddItem.wFont = AEE_FONT_BOLD;
		pAddItem.wImage = CANCLE_CALL;
		pAddItem.wItemID = CANCEL_CALL;
		IMENUCTL_AddItemEx(pMe->pIMenu[POLI_MENU], &pAddItem);

		IMENUCTL_SetSel(pMe->pIMenu[POLI_MENU], QUICK_CALL);
		IMENUCTL_SetActive(pMe->pIMenu[POLI_MENU], TRUE );	

	IDISPLAY_Update(pMe->pIDisplay);
	index = IMENUCTL_GetSel(pMe->pIMenu[POLI_MENU]);
	DBGPRINTF("index = %d", index);
	DBGPRINTF("******* showPoliceMenu (ED) *******");
}
/*===========================================================================*/

/*===========================================================================*/
/*---------------------------------------------------------------------------
Function showFirerMenu
-----------------------------------------------------------------------------*/
static void showFirerMenu(myProject* pMe)
{
	AEEImageInfo	ii;
	CtlAddItem		pAddItem;
	uint16			index;
	DBGPRINTF("******* showFirerMenu *******");

	IDISPLAY_ClearScreen(pMe->pIDisplay);
	IIMAGE_GetInfo(pMe->pIImage[IMAGE_LOGO], &ii);

	if(pMe->pIMenu[FIRE_MENU] == NULL)
	{
		ISHELL_CreateInstance(pMe->pIShell, AEECLSID_MENUCTL,(void**) &pMe->pIMenu[FIRE_MENU]);
		
		if(pMe->pIMenu[FIRE_MENU] == NULL)
		{
			ISHELL_PostEvent(pMe->pIShell, AEECLSID_EMERGENCY, EVT_APP_STOP, 0, 0);
			return;
		}
	}

		// SET FRAME DRAW LOGO
		IMENUCTL_SetRect(pMe->pIMenu[FIRE_MENU], &(pMe->LogoFrame));
		IIMAGE_Draw(pMe->pIImage[IMAGE_LOGO], (pMe->m_cxScreen - ii.cx)/2, 0);
		IDISPLAY_DrawHLine(pMe->pIDisplay, 0, LOGO_HIGH, pMe->m_cxScreen);
		
		// SET MAIN FRAME & TITLE MENU
		IMENUCTL_SetProperties(pMe->pIMenu[FIRE_MENU], MP_UNDERLINE_TITLE);
		IMENUCTL_SetTitle(pMe->pIMenu[FIRE_MENU],EMERGENCY_RES_FILE, FIRER_TITLE, NULL);
		IMENUCTL_SetRect(pMe->pIMenu[FIRE_MENU], &(pMe->MainFrame));

		// ADD ITEM MENU
		pAddItem.pText = NULL;
		pAddItem.pImage = NULL;
		pAddItem.pszResImage = EMERGENCY_RES_FILE;
		pAddItem.pszResText = EMERGENCY_RES_FILE;
		pAddItem.wText = QUICK_CALL;
		pAddItem.wFont = AEE_FONT_BOLD;
		pAddItem.wImage = CALL_QUICK;
		pAddItem.wItemID = QUICK_CALL;
		pAddItem.dwData = 0;
		IMENUCTL_AddItemEx(pMe->pIMenu[FIRE_MENU], &pAddItem);

		pAddItem.pText = NULL;
		pAddItem.pImage = NULL;
		pAddItem.pszResImage = EMERGENCY_RES_FILE;
		pAddItem.pszResText = EMERGENCY_RES_FILE;
		pAddItem.wText = CANCEL_CALL;
		pAddItem.wFont = AEE_FONT_BOLD;
		pAddItem.wImage = CANCLE_CALL;
		pAddItem.wItemID = CANCEL_CALL;
		IMENUCTL_AddItemEx(pMe->pIMenu[FIRE_MENU], &pAddItem);
		
		IMENUCTL_SetSel(pMe->pIMenu[FIRE_MENU], QUICK_CALL);
		IMENUCTL_SetActive(pMe->pIMenu[FIRE_MENU], TRUE );

	IDISPLAY_Update(pMe->pIDisplay);
	index = IMENUCTL_GetSel(pMe->pIMenu[FIRE_MENU]);
	DBGPRINTF("index = %d", index);
	DBGPRINTF("******* showFirerMenu (ED) *******");
}
/*===========================================================================*/

/*===========================================================================*/
/*---------------------------------------------------------------------------
Function resultCallOK
-----------------------------------------------------------------------------*/
static void SuccessCall(myProject* pMe)
{
	AEEImageInfo	ii;
	//CtlAddItem		pAddItem;
	uint16			index;
	DBGPRINTF("******* cancelCall *******");

	IDISPLAY_ClearScreen(pMe->pIDisplay);
	IIMAGE_GetInfo(pMe->pIImage[IMAGE_LOGO], &ii);

	if(pMe->pIMenu[SUCCESS_MENU] == NULL)
	{
		ISHELL_CreateInstance(pMe->pIShell, AEECLSID_MENUCTL,(void**) &pMe->pIMenu[SUCCESS_MENU]);
		
		if(pMe->pIMenu[SUCCESS_MENU] == NULL)
		{
			ISHELL_PostEvent(pMe->pIShell, AEECLSID_EMERGENCY, EVT_APP_STOP, 0, 0);
			return;
		}
	}

		// SET FRAME DRAW LOGO
		IMENUCTL_SetRect(pMe->pIMenu[SUCCESS_MENU], &(pMe->LogoFrame));
		IIMAGE_Draw(pMe->pIImage[IMAGE_LOGO], (pMe->m_cxScreen - ii.cx)/2, 0);
		IDISPLAY_DrawHLine(pMe->pIDisplay, 0, LOGO_HIGH, pMe->m_cxScreen);
		
		// SET MAIN FRAME & TITLE MENU
		IMENUCTL_SetProperties(pMe->pIMenu[SUCCESS_MENU], MP_UNDERLINE_TITLE);
		IMENUCTL_SetTitle(pMe->pIMenu[SUCCESS_MENU],EMERGENCY_RES_FILE, CALLOK, NULL);
		IMENUCTL_SetRect(pMe->pIMenu[SUCCESS_MENU], &(pMe->MainFrame));

		// ADD ITEM MENU
		ISHELL_LoadResString(pMe->pIShell, EMERGENCY_RES_FILE, RETURN, pMe->szBuff, sizeof(pMe->szBuff));
		IMENUCTL_AddItem(pMe->pIMenu[SUCCESS_MENU], NULL, NULL, RETURN, pMe->szBuff, NULL);

		IMENUCTL_SetActive(pMe->pIMenu[SUCCESS_MENU], TRUE );

	IDISPLAY_Update(pMe->pIDisplay);
	index = IMENUCTL_GetSel(pMe->pIMenu[SUCCESS_MENU]);
	DBGPRINTF("index = %d", index);
	DBGPRINTF("******* cancelCall (ED) *******");
}
/*===========================================================================*/

/*===========================================================================*/
/*---------------------------------------------------------------------------
Function resultCallOK
-----------------------------------------------------------------------------*/
static void ErrorCall(myProject* pMe)
{
	AEEImageInfo	ii;
	//CtlAddItem		pAddItem;
	uint16			index;
	DBGPRINTF("******* cancelCall *******");

	IDISPLAY_ClearScreen(pMe->pIDisplay);
	IIMAGE_GetInfo(pMe->pIImage[IMAGE_LOGO], &ii);

	if(pMe->pIMenu[ERROR_MENU] == NULL)
	{
		ISHELL_CreateInstance(pMe->pIShell, AEECLSID_MENUCTL,(void**) &pMe->pIMenu[ERROR_MENU]);
		
		if(pMe->pIMenu[ERROR_MENU] == NULL)
		{
			ISHELL_PostEvent(pMe->pIShell, AEECLSID_EMERGENCY, EVT_APP_STOP, 0, 0);
			return;
		}
	}

		// SET FRAME DRAW LOGO
		IMENUCTL_SetRect(pMe->pIMenu[ERROR_MENU], &(pMe->LogoFrame));
		IIMAGE_Draw(pMe->pIImage[IMAGE_LOGO], (pMe->m_cxScreen - ii.cx)/2, 0);
		IDISPLAY_DrawHLine(pMe->pIDisplay, 0, LOGO_HIGH, pMe->m_cxScreen);
		
		// SET MAIN FRAME & TITLE MENU
		IMENUCTL_SetProperties(pMe->pIMenu[ERROR_MENU], MP_UNDERLINE_TITLE);
		IMENUCTL_SetTitle(pMe->pIMenu[ERROR_MENU],EMERGENCY_RES_FILE, EROR, NULL);
		IMENUCTL_SetRect(pMe->pIMenu[ERROR_MENU], &(pMe->MainFrame));

		// ADD ITEM MENU
		ISHELL_LoadResString(pMe->pIShell, EMERGENCY_RES_FILE, RETURN, pMe->szBuff, sizeof(pMe->szBuff));
		IMENUCTL_AddItem(pMe->pIMenu[ERROR_MENU], NULL, NULL, RETURN, pMe->szBuff, NULL);

		IMENUCTL_SetActive(pMe->pIMenu[ERROR_MENU], TRUE );

	IDISPLAY_Update(pMe->pIDisplay);
	index = IMENUCTL_GetSel(pMe->pIMenu[ERROR_MENU]);
	DBGPRINTF("index = %d", index);
	DBGPRINTF("******* cancelCall (ED) *******");
}
/*===========================================================================*/

/*===========================================================================*/
/*---------------------------------------------------------------------------
Function cancelCall
-----------------------------------------------------------------------------*/
static void cancelCall(myProject* pMe)
{
	AEEImageInfo	ii;
	//CtlAddItem		pAddItem;
	uint16			index;
	DBGPRINTF("******* cancelCall *******");

	IDISPLAY_ClearScreen(pMe->pIDisplay);
	IIMAGE_GetInfo(pMe->pIImage[IMAGE_LOGO], &ii);

	if(pMe->pIMenu[CANCEL_MENU] == NULL)
	{
		ISHELL_CreateInstance(pMe->pIShell, AEECLSID_MENUCTL,(void**) &pMe->pIMenu[CANCEL_MENU]);
		
		if(pMe->pIMenu[CANCEL_MENU] == NULL)
		{
			ISHELL_PostEvent(pMe->pIShell, AEECLSID_EMERGENCY, EVT_APP_STOP, 0, 0);
			return;
		}
	}

		// SET FRAME DRAW LOGO
		IMENUCTL_SetRect(pMe->pIMenu[CANCEL_MENU], &(pMe->LogoFrame));
		IIMAGE_Draw(pMe->pIImage[IMAGE_LOGO], (pMe->m_cxScreen - ii.cx)/2, 0);
		IDISPLAY_DrawHLine(pMe->pIDisplay, 0, LOGO_HIGH, pMe->m_cxScreen);
		
		// SET MAIN FRAME & TITLE MENU
		IMENUCTL_SetProperties(pMe->pIMenu[CANCEL_MENU], MP_UNDERLINE_TITLE);
		IMENUCTL_SetTitle(pMe->pIMenu[CANCEL_MENU],EMERGENCY_RES_FILE, CANCEL_CALL, NULL);
		IMENUCTL_SetRect(pMe->pIMenu[CANCEL_MENU], &(pMe->MainFrame));

		// ADD ITEM MENU
		ISHELL_LoadResString(pMe->pIShell, EMERGENCY_RES_FILE, NO, pMe->szBuff, sizeof(pMe->szBuff));
		IMENUCTL_AddItem(pMe->pIMenu[CANCEL_MENU], NULL, NULL, NO, pMe->szBuff, NULL);
		ISHELL_LoadResString(pMe->pIShell, EMERGENCY_RES_FILE, YES, pMe->szBuff, sizeof(pMe->szBuff));
		IMENUCTL_AddItem(pMe->pIMenu[CANCEL_MENU], NULL, NULL, YES, pMe->szBuff, NULL);

		IMENUCTL_SetSel(pMe->pIMenu[CANCEL_MENU], NO);
		IMENUCTL_SetActive(pMe->pIMenu[CANCEL_MENU], TRUE );

	IDISPLAY_Update(pMe->pIDisplay);
	index = IMENUCTL_GetSel(pMe->pIMenu[CANCEL_MENU]);
	DBGPRINTF("index = %d", index);
	DBGPRINTF("******* cancelCall (ED) *******");
}
/*===========================================================================*/

/*===========================================================================*/
/*---------------------------------------------------------------------------
Function CleanUp
-----------------------------------------------------------------------------*/
void emergency_CleanUp(myProject* pMe)
{
	int i;
	// freeing any resources
	DBGPRINTF("******* emergency_CleanUp *******");	
	
	// MENU
	for(i=0; i<MAX_MENU; i++)
	{
		if(pMe->pIMenu[i])
		{
			IMENUCTL_Release(pMe->pIMenu[i]);
			pMe->pIMenu[i] = NULL;
		}
	}

	// IMAGE
	for(i=0; i<MAX_IMAGE; i++)
	{
		if(pMe->pIImage[i])
		{
			IIMAGE_Release(pMe->pIImage[i]);
			pMe->pIImage[i] = NULL;
		}
	}
	DBGPRINTF("******* emergency_CleanUp (ED)*******");	
}
/*===========================================================================*/

/*===========================================================================*/
/*---------------------------------------------------------------------------
Function drawStartAmbulanceLogo
-----------------------------------------------------------------------------*/
static void drawStartAmbulanceLogo(myProject * pMe)
{
	AEEImageInfo ii;
	DBGPRINTF("******* drawStartAmbulanceLogo *******");
	IDISPLAY_ClearScreen(pMe->pIDisplay);
	if(pMe->pIImage[IMAGE_AMBULANCE] != NULL)
	{
		IIMAGE_GetInfo(pMe->pIImage[IMAGE_AMBULANCE], &ii);
		IIMAGE_Draw(pMe->pIImage[IMAGE_AMBULANCE], (pMe->m_cxScreen - ii.cx)/2, 
			(pMe->m_cyScreen - ii.cy)/2);
		IDISPLAY_Update(pMe->pIDisplay);
	}
	
	DBGPRINTF("******* drawStartAmbulanceLogo (ED) *******");
}
/*===========================================================================*/

/*===========================================================================*/
/*---------------------------------------------------------------------------
Function drawStartPoliceLogo
-----------------------------------------------------------------------------*/
static void drawStartPoliceLogo(myProject * pMe)
{
	AEEImageInfo ii;
	DBGPRINTF("******* drawStartPoliceLogo *******");
	IDISPLAY_ClearScreen(pMe->pIDisplay);
	if(pMe->pIImage[IMAGE_POLICE] != NULL)
	{
		IIMAGE_GetInfo(pMe->pIImage[IMAGE_POLICE], &ii);
		IIMAGE_Draw(pMe->pIImage[IMAGE_POLICE], (pMe->m_cxScreen - ii.cx)/2, 
			(pMe->m_cyScreen - ii.cy)/2);
		IDISPLAY_Update(pMe->pIDisplay);
	}
	
	DBGPRINTF("******* drawStartPoliceLogo (ED) *******");
}
/*===========================================================================*/

/*===========================================================================*/
/*---------------------------------------------------------------------------
Function drawStartFirerLogo
-----------------------------------------------------------------------------*/
static void drawStartFirerLogo(myProject * pMe)
{
	AEEImageInfo ii;
	DBGPRINTF("******* drawStartFirerLogo *******");
	IDISPLAY_ClearScreen(pMe->pIDisplay);
	if(pMe->pIImage[IMAGE_FIRER] != NULL)
	{
		IIMAGE_GetInfo(pMe->pIImage[IMAGE_FIRER], &ii);
		IIMAGE_Draw(pMe->pIImage[IMAGE_FIRER], (pMe->m_cxScreen - ii.cx)/2, 
			(pMe->m_cyScreen - ii.cy)/2);
		IDISPLAY_Update(pMe->pIDisplay);
	}
	
	DBGPRINTF("******* drawStartFirerLogo (ED) *******");
}
/*===========================================================================*/







