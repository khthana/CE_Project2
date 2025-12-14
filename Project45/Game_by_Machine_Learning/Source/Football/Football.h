#if !defined(AFX_FOOTBALL_H__2AF57AE5_B2D0_4FB6_999F_D7502BA91D0F__INCLUDED_)
#define AFX_FOOTBALL_H__2AF57AE5_B2D0_4FB6_999F_D7502BA91D0F__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "resource.h"

#define MAXSTRINGNAME		50
#define NUMBER_OF_PLAYERS	 5
#define CAN_PASS_RANGE		36

#define LEFTSIDE	0
#define RIGHTSIDE	1

#define SC_TOPLEFT		0
#define SC_BOTTOMLEFT	1
#define SC_TOPRIGHT		2
#define SC_BOTTOMRIGHT	3

#define CONFIG_VERSION		0x00000
#define CONFIG_FILE			"Data\\Football.cfg"
#define NEURAL_VERSION		0x00000
#define NEURAL_FILE			"Data\\Neural.net"
#define DATA_VERSION		0x00000
#define DATA_FILE			"Data\\Data.dat"
#define DATA_LOGFILE		"Data\\Data.log"
#define SCORE_LOGFILE		"Data\\Score.log"
#define TRAIN_LOGFILE		"Data\\Train.log"

#define ZONE_ROW			4
#define ZONE_COL			4

#endif // !defined(AFX_FOOTBALL_H__2AF57AE5_B2D0_4FB6_999F_D7502BA91D0F__INCLUDED_)
