#include "stdafx.h"
#include "ngcollision.h"

DWORD NGPLANE::FindBox(D3DXVECTOR3 v0, D3DXVECTOR3 v1, DWORD index)
{
	if (index>2)
		return FALSE;

	if (v0.x > v1.x)
	{
		m_Box[index].x_max	= v0.x;
		m_Box[index].x_min	= v1.x;
	}
	else
	{
		m_Box[index].x_max	= v1.x;
		m_Box[index].x_min	= v0.x;
	}

	if (v0.y > v1.y)
	{
		m_Box[index].y_max	= v0.y;
		m_Box[index].y_min	= v1.y;
	}
	else
	{
		m_Box[index].y_max	= v1.y;
		m_Box[index].y_min	= v0.y;
	}

	if (v0.z > v1.z)
	{
		m_Box[index].z_max	= v0.z;
		m_Box[index].z_min	= v1.z;
	}
	else
	{
		m_Box[index].z_max	= v1.z;
		m_Box[index].z_min	= v0.z;
	}

	return TRUE;
}

DWORD NGPLANE::InBox(D3DXVECTOR3 vec, DWORD i)
{
	if (m_Box[i].x_max >= vec.x)
		if (m_Box[i].x_min <= vec.x)
			if (m_Box[i].y_max >= vec.y)
				if (m_Box[i].y_min <= vec.y)
					if (m_Box[i].z_max >= vec.z)
						if (m_Box[i].z_min <= vec.z)
							return TRUE;
	return FALSE;
}

FLOAT NGPLANE::DET(D3DXPLANE p1, D3DXPLANE p2, D3DXPLANE p3)
{
	return ( (p1.a * p2.b * p3.c) + (p1.b * p2.c * p3.a) + (p1.c * p2.a * p3.b) 
			-(p1.a * p2.c * p3.b) - (p1.b * p2.a * p3.c) - (p1.c * p2.b * p3.a));
}

FLOAT NGPLANE::DETi(D3DXPLANE p1, D3DXPLANE p2, D3DXPLANE p3, DWORD i)
{
	if (i>=3)
		return 0;

	switch (i)
	{
	case 0:
		return ( (-p1.d * p2.b * p3.c) + (p1.b * p2.c * -p3.d) + (p1.c * -p2.d * p3.b) 
				-(-p1.d * p2.c * p3.b) - (p1.b * -p2.d * p3.c) - (p1.c * p2.b * -p3.d));
	case 1:
		return ( (p1.a * -p2.d * p3.c) + (p1.d * p2.c * p3.a) + (p1.c * p2.a * p3.d) 
				-(p1.a * p2.c * -p3.d) - (p1.d * p2.a * p3.c) - (p1.c * p2.d * p3.a));
	case 2:
		return ( (p1.a * p2.b *- p3.d) + (p1.b * -p2.d * p3.a) + (-p1.d * p2.a * p3.b) 
				-(p1.a * -p2.d * p3.b) - (p1.b * p2.a * -p3.d) - (-p1.d * p2.b * p3.a));
	}

	return 0;
}

DWORD NGPLANE::Coplanar(D3DXPLANE p1, D3DXPLANE p2)
{
	if ((p1.a == p2.a) && (p1.b == p2.b) && (p1.c == p2.c))
	{
		if (p1.d == p2.d)
			return 1;
		return -1;
	}
	return 0;
}

DWORD NGPLANE::Prepare(vector<D3DXVECTOR3>* pPos, NGFACE* pFace)
{
	D3DXVECTOR3	vec[3];
	D3DXVECTOR3	norm;
	D3DXVECTOR3	temp[3];
	D3DXVECTOR3	cross;
	D3DXPLANE	result;

	vec[0]	= pPos->at(pFace->f1);
	vec[1]	= pPos->at(pFace->f2);
	vec[2]	= pPos->at(pFace->f3);

	// bound box
	for (int i=0; i<3; i++)
	{
		if (vec[i].x > m_BBox.x_max)
			m_BBox.x_max = vec[i].x;
		if (vec[i].x < m_BBox.x_min)
			m_BBox.x_min = vec[i].x;
		if (vec[i].y > m_BBox.y_max)
			m_BBox.y_max = vec[i].y;
		if (vec[i].y < m_BBox.y_min)
			m_BBox.y_min = vec[i].y;
		if (vec[i].z > m_BBox.z_max)
			m_BBox.z_max = vec[i].z;
		if (vec[i].z < m_BBox.z_min)
			m_BBox.z_min = vec[i].z;
	}

	D3DXPlaneFromPoints(&m_Plane, &vec[0], &vec[1], &vec[2]);
	
	temp[1]	= vec[0] - vec[1];
	temp[2]	= vec[0] - vec[2];

	D3DXVec3Cross(&temp[0], &temp[1], &temp[2]);
	D3DXVec3Normalize(&cross, &temp[0]);

	norm	= vec[0] + cross;
	D3DXPlaneFromPoints(&m_Bound[0], &vec[0], &norm, &vec[1]);
	FindBox(vec[0], vec[1], 0);
		
	norm	= vec[1] + cross;
	D3DXPlaneFromPoints(&m_Bound[1], &vec[1], &norm, &vec[2]);
	FindBox(vec[1], vec[2], 1);

	norm	= vec[2] + cross;
	D3DXPlaneFromPoints(&m_Bound[2], &vec[2], &norm, &vec[0]);
	FindBox(vec[2], vec[0], 2);

	return TRUE;
};

DWORD NGPLANE::Detect(NGPLANE* detect)
{
	FLOAT		d;
	FLOAT		t;
	D3DXVECTOR3	pos;
	m_Point.clear();

	if (!DetectBBox(detect->GetBBox()))
		return FALSE;

	d	= DET (m_Plane, m_Bound[0], detect->m_Plane);
	if ((d>0.001)||(d<-0.001))
	{
		pos.x	= DETi(m_Plane, m_Bound[0], detect->m_Plane, 0) / d;
		pos.y	= DETi(m_Plane, m_Bound[0], detect->m_Plane, 1) / d;
		pos.z	= DETi(m_Plane, m_Bound[0], detect->m_Plane, 2) / d;

		if (InBox(pos, 0))
		{
		t	=	detect->m_Bound[0].a*pos.x + detect->m_Bound[0].b*pos.y +
				detect->m_Bound[0].c*pos.z + detect->m_Bound[0].d;
		if (t>=0)
		t	=	detect->m_Bound[1].a*pos.x + detect->m_Bound[1].b*pos.y +
				detect->m_Bound[1].c*pos.z + detect->m_Bound[1].d;
		if (t>=0) 
		t	=	detect->m_Bound[2].a*pos.x + detect->m_Bound[2].b*pos.y +
				detect->m_Bound[2].c*pos.z + detect->m_Bound[2].d;
		if (t>=0) 
			m_Point.push_back(pos);
		}
	}

	d	= DET (m_Plane, m_Bound[1], detect->m_Plane);
	if ((d>0.001)||(d<-0.001))
	{
		pos.x	= DETi(m_Plane, m_Bound[1], detect->m_Plane, 0) / d;
		pos.y	= DETi(m_Plane, m_Bound[1], detect->m_Plane, 1) / d;
		pos.z	= DETi(m_Plane, m_Bound[1], detect->m_Plane, 2) / d;

		if (InBox(pos, 1))
		{
		t	=	detect->m_Bound[0].a*pos.x + detect->m_Bound[0].b*pos.y +
				detect->m_Bound[0].c*pos.z + detect->m_Bound[0].d;
		if (t>=0)
		t	=	detect->m_Bound[1].a*pos.x + detect->m_Bound[1].b*pos.y +
				detect->m_Bound[1].c*pos.z + detect->m_Bound[1].d;
		if (t>=0) 
		t	=	detect->m_Bound[2].a*pos.x + detect->m_Bound[2].b*pos.y +
				detect->m_Bound[2].c*pos.z + detect->m_Bound[2].d;
		if (t>=0) 
			m_Point.push_back(pos);
		}
	}

	d	= DET (m_Plane, m_Bound[2], detect->m_Plane);
	if ((d>0.001)||(d<-0.001))
	{
		pos.x	= DETi(m_Plane, m_Bound[2], detect->m_Plane, 0) / d;	
		pos.y	= DETi(m_Plane, m_Bound[2], detect->m_Plane, 1) / d;
		pos.z	= DETi(m_Plane, m_Bound[2], detect->m_Plane, 2) / d;

		if (InBox(pos, 2))
		{
		t	=	detect->m_Bound[0].a*pos.x + detect->m_Bound[0].b*pos.y +
				detect->m_Bound[0].c*pos.z + detect->m_Bound[0].d;
		if (t>=0)
		t	=	detect->m_Bound[1].a*pos.x + detect->m_Bound[1].b*pos.y +
				detect->m_Bound[1].c*pos.z + detect->m_Bound[1].d;
		if (t>=0) 
		t	=	detect->m_Bound[2].a*pos.x + detect->m_Bound[2].b*pos.y +
				detect->m_Bound[2].c*pos.z + detect->m_Bound[2].d;
		if (t>=0) 
			m_Point.push_back(pos);
		}
	}
	return TRUE;
}

DWORD NGPLANE::DetectBBox(NGBOUND* pBound)
{
	if (m_BBox.x_max > pBound->x_min)
		return FALSE;

	if (m_BBox.x_min > pBound->x_max)
		return FALSE;

	if (m_BBox.y_max > pBound->x_min)
		return FALSE;

	if (m_BBox.y_min > pBound->x_max)
		return FALSE;

	if (m_BBox.z_max > pBound->x_min)
		return FALSE;

	if (m_BBox.z_min > pBound->x_max)
		return FALSE;
	return TRUE;
}

BOOL NGPLANE::GetDetect()
{
	if (m_Point.size()>0)
		return TRUE;
	return FALSE;
}
