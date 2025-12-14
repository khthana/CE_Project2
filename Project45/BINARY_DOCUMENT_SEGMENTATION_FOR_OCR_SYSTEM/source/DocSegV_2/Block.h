// Block.h: interface for the Block class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_BLOCK_H__626D49E9_36BB_4B28_AA8C_A0814B7AF7A2__INCLUDED_)
#define AFX_BLOCK_H__626D49E9_36BB_4B28_AA8C_A0814B7AF7A2__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class Block  
{
public:
	long x;         // position
	long y;			// position
	int Checked;	// walk ready or not
	int count;		// count pixel black in block but now count not correct because want quick
	Block();	
	virtual ~Block();
};

#endif // !defined(AFX_BLOCK_H__626D49E9_36BB_4B28_AA8C_A0814B7AF7A2__INCLUDED_)
