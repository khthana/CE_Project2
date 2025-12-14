// Bomb_Packet.h: interface for the Bomb_Packet class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_BOMB_PACKET_H__B0F06CA5_09F3_4CC1_AD0E_8018BA363BD0__INCLUDED_)
#define AFX_BOMB_PACKET_H__B0F06CA5_09F3_4CC1_AD0E_8018BA363BD0__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define Max_Packet_Per_Sec 2000
#define Max_Sync_Per_Sec 400

class Bomb_Packet  
{
public:
	CString IP_Src;
	CString IP_Dst;
	LONG Count;
	Bomb_Packet();
	virtual ~Bomb_Packet();

};

#endif // !defined(AFX_BOMB_PACKET_H__B0F06CA5_09F3_4CC1_AD0E_8018BA363BD0__INCLUDED_)
