// FilterRule.h: interface for the CFilterRule class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FILTERRULE_H__0C9E0D12_660A_4141_ACF7_D9CF27E91594__INCLUDED_)
#define AFX_FILTERRULE_H__0C9E0D12_660A_4141_ACF7_D9CF27E91594__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CFilterRule : public CObject
{
	DECLARE_SERIAL(CFilterRule)

public:
	
	
	virtual void Serialize(CArchive& archive);
	static BOOL SameIP(PBYTE IP1, PBYTE IP2);
	static CFilterRule* CreateRule(CString ruleString);
	static BYTE *StringToIP(CString IPString);
	
	int GetRuleNo();
	CString GetProtocol() const;
	WORD GetDstPortRange() const;
	WORD GetDstPort() const;
	BYTE *GetDstMask();
	BYTE *GetDstAddr();
	WORD GetSrcPortRange() const;
	WORD GetSrcPort() const;
	BYTE *GetSrcMask();
	BYTE *GetSrcAddr();
	void SetRuleNo(const CString ruleNo);
	void SetProtocol(const CString);
	void SetDstPortRange(const CString);
	void SetDstPort(const CString);
	void SetDstMask(const CString);
	void SetDstAddr(const CString);
	void SetSrcPortRange(const CString);
	void SetSrcPort(const CString);
	void SetSrcMask(const CString SrcMask);
	void SetSrcAddr(const CString SrcAddr);

	CFilterRule();
	virtual ~CFilterRule();

	

protected:
	static void FormatPortRange(CString str, CString& portLowRange, CString& portHighRange);
	
	int m_ruleNo;
	BYTE m_SrcAddr[4];
	BYTE m_SrcMask[4];
	WORD m_SrcPort;
	WORD m_SrcPortRange;
	BYTE m_DstAddr[4];
	BYTE m_DstMask[4];
	WORD m_DstPort;
	WORD m_DstPortRange;
	CString m_Protocol;
};

#endif // !defined(AFX_FILTERRULE_H__0C9E0D12_660A_4141_ACF7_D9CF27E91594__INCLUDED_)
