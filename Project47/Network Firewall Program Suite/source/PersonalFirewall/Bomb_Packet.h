// Bomb_Packet.h: interface for the Bomb_Packet class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_BOMB_PACKET_H__3BEAA1DE_975B_477D_9413_936FFCA8CC0D__INCLUDED_)
#define AFX_BOMB_PACKET_H__3BEAA1DE_975B_477D_9413_936FFCA8CC0D__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define Max_Packet_Per_Sec 250  //20000
#define Max_Sync_Per_Sec 400

class Bomb_Packet  
{
public:
	CString IP_Dst;
	CString IP_Src;
	LONG Count;
	Bomb_Packet();
	virtual ~Bomb_Packet();

};

#endif // !defined(AFX_BOMB_PACKET_H__3BEAA1DE_975B_477D_9413_936FFCA8CC0D__INCLUDED_)
