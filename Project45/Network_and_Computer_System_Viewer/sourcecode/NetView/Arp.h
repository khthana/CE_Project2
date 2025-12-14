#include <windows.h>
#include <winsock.h>
#include <stdio.h>
#include <conio.h>
#include <time.h>

#include "Include\packet32.h"

#ifdef ARP_EXPORTS
#define ARP_API __declspec(dllexport)
#else
#define ARP_API __declspec(dllimport)
#endif

#define Max_Num_Adapter 10

typedef unsigned int __u32;

#define ETH_ALEN	6		/* Octets in one ethernet addr	 */
#define ETH_P_ARP	0x0806		/* Address Resolution packet	*/
#define ETH_P_802_3	0x0001		/* Dummy type for 802.3 frames  */
#define ETH_P_IP	0x0800		/* Internet Protocol packet	*/
#define	ARPOP_REQUEST	1		/* ARP request			*/
#define	ARPOP_REPLY	2			/* ARP reply			*/

#define	ARP_WAIT_TIME	500		/* Arp Response waiting time (ms) */

/*
 *	This is an Ethernet frame header.
 */
 

const char *_hostnameToDotIP(const char *IPAddr);

//##ModelId=3E9ABEEB0326
struct ethhdr 
{
	//##ModelId=3E9ABEEB0332
	unsigned char	h_dest[ETH_ALEN];	/* destination eth addr	*/
	//##ModelId=3E9ABEEB0331
	unsigned char	h_source[ETH_ALEN];	/* source ether addr	*/
	//##ModelId=3E9ABEEB0330
	unsigned short	h_proto;		/* packet type ID field	*/
};


//##ModelId=3E9ABEE700E6
struct arphdr
{
	//##ModelId=3E9ABEE700FB
	unsigned short	ar_hrd;		/* format of hardware address	*/
	//##ModelId=3E9ABEE700FA
	unsigned short	ar_pro;		/* format of protocol address	*/
	//##ModelId=3E9ABEE700F6
	unsigned char	ar_hln;		/* length of hardware address	*/
	//##ModelId=3E9ABEE700F5
	unsigned char	ar_pln;		/* length of protocol address	*/
	//##ModelId=3E9ABEE700F4
	unsigned short	ar_op;		/* ARP opcode (command)		*/

	//##ModelId=3E9ABEE700F3
	unsigned char	ar_sha[ETH_ALEN];	/* sender hardware address	*/
	//##ModelId=3E9ABEE700F2
	unsigned char	ar_sip[4];			/* sender IP address		*/
	//##ModelId=3E9ABEE700F1
	unsigned char	ar_tha[ETH_ALEN];	/* target hardware address	*/
	//##ModelId=3E9ABEE700F0
	unsigned char	ar_tip[4];			/* target IP address		*/
};

//##ModelId=3E9ABEE4029E
struct arpPacket
{
	//##ModelId=3E9ABEE402B5
	struct ethhdr	ethhdr;
	//##ModelId=3E9ABEE402B0
	struct arphdr	arphdr;
};


// This class is exported from the Arp.dll
//##ModelId=3E9ABEEC038C
class ARP_API CArp {
public:
	//##ModelId=3E9ABEED003E
	CArp::CArp(
		const char* srcIPAddr,
		const char* subnetIPAddr,
		const char* defaultGWAddr,
		unsigned long waitTime = ARP_WAIT_TIME // 500
		);

	//##ModelId=3E9ABEED003D
	~CArp();

	//##ModelId=3E9ABEED003C
	bool isArpVaild();

	//##ModelId=3E9ABEED003B
	char* getLastMessage();

	//##ModelId=3E9ABEED0027
	bool arpSendRecv(const char* ipAddr, char* macAddr);
	//##ModelId=3E9ABEED0031
	bool arpSendRecv(__u32 hostTypeIPAddr32, char* mac_ethAlen);

private:

	//##ModelId=3E9ABEEC03E1
	bool			m_CArpFlag;

	//##ModelId=3E9ABEED001C
	bool getAdapterInfo(
		const char* nicIPAddress,	// input
		char* AdapterName,			// output
		unsigned char*	macAddr		// output
		);
	
	//##ModelId=3E9ABEED0012
	bool packetDelimiter(
		struct arpPacket *p_arp, unsigned char* ar_tip);

	//##ModelId=3E9ABEEC03E6
	bool analizeRawPacket(
		char *pChar, u_int dataLen, struct arpPacket *p_arp, unsigned char* ar_tip);

	//##ModelId=3E9ABEEC03DE
	LPADAPTER		m_lpAdapter; 
	//##ModelId=3E9ABEEC03D7
	LPPACKET		m_lpPacket;

	//##ModelId=3E9ABEEC03D2
	LPADAPTER		m_lpAdapter2; 
	//##ModelId=3E9ABEEC03CA
	LPPACKET		m_lpPacket2;

	//##ModelId=3E9ABEEC03C0
	char			m_buffer2[25600];  // buffer to hold the data coming from the driver

	//##ModelId=3E9ABEEC03BF
	char			m_message[1024];

	// string that contains a list of the network adapters
	//##ModelId=3E9ABEEC03BE
	char			m_adapterName[512];
	
	// local MAC Address
	//##ModelId=3E9ABEEC03B6
	unsigned char	m_macAddr[ETH_ALEN];
	//##ModelId=3E9ABEEC03B5
	char			m_ipAddr[16];
	//##ModelId=3E9ABEEC03B4
	char			m_subAddr[16];
	//##ModelId=3E9ABEEC03AC
	char			m_defgAddr[16];
//	char			m_netAddr[16];

	//##ModelId=3E9ABEEC03AB
	char			m_defgMacAddr[18];
	//##ModelId=3E9ABEEC03AA
	char			m_localMacAddr[18];

	//##ModelId=3E9ABEEC03A7
	__u32			m_subAddr_u32;
	//##ModelId=3E9ABEEC03A2
	__u32			m_defgAddr_u32;
	//##ModelId=3E9ABEEC0399
	__u32			m_netAddr_u32;

	//##ModelId=3E9ABEEC0396
	unsigned long	m_waitTime;



};

