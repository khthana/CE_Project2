/*
Module : PING.H
Purpose: Interface for an MFC wrapper class to encapsulate PING
Created: PJN / 10-06-1998

Copyright (c) 1998 - 2002 by PJ Naughter.  (Web: www.naughter.com, Email: pjna@naughter.com)

All rights reserved.

Copyright / Usage Details:

You are allowed to include the source code in any product (commercial, shareware, freeware or otherwise) 
when your product is released in binary form. You are allowed to modify the source code in any way you want 
except you cannot modify the copyright details at the top of each module. If you want to distribute source 
code with your application, then you are only allowed to distribute versions released by the author. This is 
to maintain a single distribution point for the source code. 

*/


/////////////////////////// Macros / Defines ////////////////////////

#ifndef __PING_H__
#define __PING_H__

#ifndef CPING_NO_WINSOCK2
  #ifndef _WINSOCK2API_
    #pragma message("To avoid this message place you need to include Winsock2.h in your PCH")
    #include <winsock2.h>
    #include <ws2tcpip.h>
  #endif
#else
  #ifndef _WINSOCKAPI_
    #pragma message("You need to include Winsock.h, Winsock2.h or AfxSock.h in your PCH to compile CPing")
    #include <winsock.h>
  #endif
#endif



/////////////////////////// Classes /////////////////////////////////

struct CPingReply
{
//Constructors / Destructors
  CPingReply();

//Member variables
	in_addr	 Address;              //The IP address of the replier
	unsigned long RTT;             //Round Trip time in Milliseconds
  unsigned long EchoReplyStatus; //here will be status of the last ping if successful
};

class CPing
{
public:
// Macros / Defines
#ifndef CPING_NO_WINSOCK2
  #define IP_TOS                      3    // IP type of service and precee
  #define IP_TTL                      4    // IP time to live
  #define IP_DONTFRAGMENT             14   // don't fragment IP datagrams
  #define MAX_CPING_ICMP_DATA_SIZE    1024 //Maximum icmp packet size
  #define MAX_CPING_ICMP_PACKET_SIZE  (MAX_CPING_ICMP_DATA_SIZE + sizeof(ICMP_HEADER))
  #define CPING_ICMP_ECHO_REPLY       0
  #define CPING_ICMP_ECHO_REQUEST     8
  #define CPING_ICMP_DEST_UNREACHABLE 3
  #define CPING_ICMP_TTL_EXPIRE       11

  //IP header
  #pragma pack(push, 1) //The IP_HEADER and ICMP_HEADER should be alligned on 1 byte boundaries
  typedef struct tagIP_HEADER 
  {
	  unsigned int   h_len:4;          // length of the header
	  unsigned int   version:4;        // Version of IP
	  unsigned char  tos;             // Type of service
	  unsigned short total_len;      // total length of the packet
	  unsigned short ident;          // unique identifier
	  unsigned short frag_and_flags; // flags
	  unsigned char  ttl; 
	  unsigned char  proto;           // protocol (TCP, UDP etc)
	  unsigned short checksum;       // IP checksum
	  unsigned int   sourceIP;
	  unsigned int   destIP;
  } IP_HEADER;
  typedef IP_HEADER FAR* LPIP_HEADER;

  // ICMP header
  typedef struct tagICMP_HEADER 
  {
    BYTE   i_type;
    BYTE   i_code; // type sub code
    USHORT i_cksum;
    USHORT i_id;
    USHORT i_seq;
    ULONG  timestamp; // This is not the std header, but we reserve space for time data field
  } ICMP_HEADER;
  typedef ICMP_HEADER FAR* LPICMP_HEADER;
  #pragma pack(pop)
#endif


#ifndef CPING_NO_ICMP
  //These defines & structure definitions are taken from the "ipexport.h" and
  //"icmpapi.h" header files as provided with the Platform SDK and
  //are used internally by the CPing class. Including them here allows
  //you to compile the CPing code without the need to have the latest and greatest 
  //Platform SDK installed.
  typedef unsigned long IPAddr;     // An IP address.

  typedef struct tagIP_OPTION_INFORMATION 
  {
    unsigned char      Ttl;              // Time To Live
    unsigned char      Tos;              // Type Of Service
    unsigned char      Flags;            // IP header flags
    unsigned char      OptionsSize;      // Size in bytes of options data
    unsigned char FAR *OptionsData;      // Pointer to options data
  } IP_OPTION_INFORMATION;

  typedef struct tagICMP_ECHO_REPLY 
  {
    IPAddr         Address;       // Replying address
    unsigned long  Status;        // Reply IP_STATUS
    unsigned long  RoundTripTime; // RTT in milliseconds
    unsigned short DataSize;      // Reply data size in bytes
    unsigned short Reserved;      // Reserved for system use
    void FAR       *Data;         // Pointer to the reply data
    IP_OPTION_INFORMATION Options;       // Reply options
  } ICMP_ECHO_REPLY;

  #define IP_FLAG_DF 0x2

  typedef IP_OPTION_INFORMATION FAR* LPIP_OPTION_INFORMATION;
  typedef ICMP_ECHO_REPLY FAR* LPICMP_ECHO_REPLY;

  typedef HANDLE (WINAPI ICMPCREATEFILE)(VOID);
  typedef ICMPCREATEFILE* LPICMPCREATEFILE;
  typedef BOOL (WINAPI ICMPCLOSEHANDLE)(HANDLE);
  typedef ICMPCLOSEHANDLE* LPICMPCLOSEHANDLE;
  typedef DWORD (WINAPI ICMPSENDECHO)(HANDLE, IPAddr, LPVOID, WORD, LPIP_OPTION_INFORMATION, LPVOID, DWORD, DWORD);
  typedef ICMPSENDECHO* LPICMPSENDECHO;
#endif

//Methods
#ifndef CPING_NO_ICMP
	BOOL PingUsingICMP(LPCTSTR pszHostName, CPingReply& pr, UCHAR nTTL = 10, DWORD dwTimeout = 5000, int nDataSize = 32, UCHAR nTOS = 0, BOOL bDontFragment = FALSE) const;
#endif
#ifndef CPING_NO_WINSOCK2
	BOOL PingUsingWinsock(LPCTSTR pszHostName, CPingReply& pr, UCHAR nTTL = 10, DWORD dwTimeout = 5000, int nDataSize = 32, UCHAR nTOS = 0, BOOL bDontFragment = FALSE, LPCTSTR pszLocalBoundAddress = NULL, USHORT nSequenceNumber = 0) const;
#endif

protected:
//Methods
#ifndef CPING_NO_WINSOCK2
  static BOOL Bind(SOCKET socket, LPCTSTR pszLocalBoundAddress);
  static void FillIcmpData(LPICMP_HEADER pIcmp, int nPacketSize, USHORT nSequenceNumber);
  static BOOL DecodeResponse(LPIP_HEADER pIPHeader, int nBytes, sockaddr_in* from, USHORT nExpectedSequenceNumber, BOOL& bTryAgain);
  static USHORT GenerateIPChecksum(USHORT* pBuffer, int nSize);
#endif
  static BOOL IsSocketReadible(SOCKET socket, DWORD dwTimeout, BOOL& bReadible);
};

#endif //__PING_H__

