// LinkListSubParagraph.h: interface for the LinkListSubParagraph class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_LINKLISTSUBPARAGRAPH_H__CEA6743C_4A81_4AB8_84EC_6F89E9289B67__INCLUDED_)
#define AFX_LINKLISTSUBPARAGRAPH_H__CEA6743C_4A81_4AB8_84EC_6F89E9289B67__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class LinkListSubParagraph  
{
public:
	LinkListSubParagraph* NextSubParagraph;
	long picrow;  // row of subparagraph base on pixel(picture) position
	long blockrow; // row of subparagraph base on block position
	LinkListSubParagraph();
	virtual ~LinkListSubParagraph();
};

#endif // !defined(AFX_LINKLISTSUBPARAGRAPH_H__CEA6743C_4A81_4AB8_84EC_6F89E9289B67__INCLUDED_)
