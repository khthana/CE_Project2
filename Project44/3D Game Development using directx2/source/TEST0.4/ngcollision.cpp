#include "stdafx.h"
#include "ngcollision.h"
/*
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

VOID NGPLANE2::CheckBound(D3DXVECTOR3* v1)
{
	if (v1->x > m_Box.x_max)
		m_Box.x_max	= v1->x;
	if (v1->x < m_Box.x_min)
		m_Box.x_min	= v1->x;
	
	if (v1->y > m_Box.y_max)
		m_Box.y_max	= v1->y;
	if (v1->y < m_Box.y_min)
		m_Box.y_min	= v1->y;
	
	if (v1->z > m_Box.z_max)
		m_Box.z_max	= v1->z;
	if (v1->z < m_Box.z_min)
		m_Box.z_min	= v1->z;
}

DWORD NGPLANE2::Create(D3DXVECTOR3* v0, D3DXVECTOR3* v1, D3DXVECTOR3* v2)
{
	// Create plane
	D3DXPlaneFromPoints(&m_Plane, v0, v1, v2);

	// Create box
	m_Box.x_max	= v0->x;
	m_Box.x_min	= v0->x;
	m_Box.y_max	= v0->y;
	m_Box.y_min	= v0->y;
	m_Box.z_max	= v0->z;
	m_Box.z_min	= v0->z;

	CheckBound(v1);
	CheckBound(v2);
	
	// Create Equation
	FLOAT	r;
	m_Center	= (*v0 + *v1 + *v2) * 0.3333333f;

		// Eq1 - v0,v1
	m_LineEq[0].x	= v1->x - v0->x;
	m_LineEq[0].y	= v0->z - v1->z;
	m_LineEq[0].z	= (-m_LineEq[0].x * v0->z) + (-m_LineEq[0].y * v0->x);

		// Eq2 - v1,v2
	m_LineEq[1].x	= v2->x - v1->x;
	m_LineEq[1].y	= v1->z - v2->z;
	m_LineEq[1].z	= (-m_LineEq[1].x * v1->z) + (-m_LineEq[1].y * v1->x);

		// Eq3 - v2,v0
	m_LineEq[2].x	= v0->x - v2->x;
	m_LineEq[2].y	= v2->z - v0->z;
	m_LineEq[2].z	= (-m_LineEq[2].x * v2->z) + (-m_LineEq[2].y * v2->x);

	ZeroMemory(m_LineGe, sizeof(m_LineGe));

	r	= (m_LineEq[0].x * v2->z) + (m_LineEq[0].y * v2->x) + m_LineEq[0].z;
	if (r>0)
		m_LineGe[0]	= TRUE;

	r	= (m_LineEq[1].x * v0->z) + (m_LineEq[1].y * v0->x) + m_LineEq[1].z;
	if (r>0)
		m_LineGe[1]	= TRUE;

	r	= (m_LineEq[2].x * v1->z) + (m_LineEq[2].y * v1->x) + m_LineEq[2].z;
	if (r>0)
		m_LineGe[2]	= TRUE;

	return TRUE;
}

NGLINE::NGLINE(D3DXVECTOR3 v1, D3DXVECTOR3 v2)
{
	Create(&v1, &v2);
}

DWORD NGLINE::Create(D3DXVECTOR3* v1, D3DXVECTOR3* v2)
{
	m_vStart	= *v1;
	m_vFactor	= *v2-*v1;

	return TRUE;
}

VOID NGCollide::CheckBound(D3DXVECTOR3* v1)
{
	if (v1->x > m_Box.x_max)
		m_Box.x_max	= v1->x;
	if (v1->x < m_Box.x_min)
		m_Box.x_min	= v1->x;
	
	if (v1->y > m_Box.y_max)
		m_Box.y_max	= v1->y;
	if (v1->y < m_Box.y_min)
		m_Box.y_min	= v1->y;
	
	if (v1->z > m_Box.z_max)
		m_Box.z_max	= v1->z;
	if (v1->z < m_Box.z_min)
		m_Box.z_min	= v1->z;
}

DWORD NGCollide::Create(DWORD type)
{
	m_Result.resize(m_Position.size());
	for (int i=0; i<m_Position.size(); i++)
	{
		if (m_Parent==NULL)
		{
			m_Result.at(i)	= m_Position.at(i);

			if (i==0)
			{
				m_Box.x_max	= m_Result.at(i).x;
				m_Box.x_min	= m_Result.at(i).x;
				m_Box.y_max	= m_Result.at(i).y;
				m_Box.y_min	= m_Result.at(i).y;
				m_Box.z_max	= m_Result.at(i).z;
				m_Box.z_min	= m_Result.at(i).z;
			}
			else
				CheckBound(&m_Result.at(i));
			continue;
		}

		D3DXVec3TransformCoord(&m_Result.at(i), &m_Position.at(i), m_Parent);
		// Create box
		if (i==0)
		{
			m_Box.x_max	= m_Result.at(i).x;
			m_Box.x_min	= m_Result.at(i).x;
			m_Box.y_max	= m_Result.at(i).y;
			m_Box.y_min	= m_Result.at(i).y;
			m_Box.z_max	= m_Result.at(i).z;
			m_Box.z_min	= m_Result.at(i).z;
		}
		else
			CheckBound(&m_Result.at(i));
	}
	
	m_Type	= (NGCOLLIDETYPE)type;

	switch(type)
	{
	case NGCT_LINE:
		{
			for (int i=0; i<m_Face.size(); i++)
			{
				D3DXVECTOR3	v0	= m_Result.at(m_Face.at(i).f1);
				D3DXVECTOR3	v1	= m_Result.at(m_Face.at(i).f2);
				D3DXVECTOR3	v2	= m_Result.at(m_Face.at(i).f3);

				NGLINE	line;
				line.Create(&v0,&v1);
				m_Line.push_back(line);
				line.Create(&v1,&v2);
				m_Line.push_back(line);
				line.Create(&v2,&v0);
				m_Line.push_back(line);

			}
		}
		break;
	case NGCT_PLANE:
		{
			for (int i=0; i<m_Face.size(); i++)
			{
				D3DXVECTOR3	v0	= m_Result.at(m_Face.at(i).f1);
				D3DXVECTOR3	v1	= m_Result.at(m_Face.at(i).f2);
				D3DXVECTOR3	v2	= m_Result.at(m_Face.at(i).f3);

				NGPLANE2	p;
				p.Create(&v0, &v1, &v2);
				m_Plane.push_back(p);
			}
		}
		break;
	}

	return TRUE;
}

DWORD NGCollide::Update()
{
	if (m_Type!=NGCT_LINE)
		return FALSE;

	for (int i=0; i<m_Position.size(); i++)
	{
		if (m_Parent==NULL)
		{
			m_Result.at(i)	= m_Position.at(i);
			if (i==0)
			{
				m_Box.x_max	= m_Result.at(i).x;
				m_Box.x_min	= m_Result.at(i).x;
				m_Box.y_max	= m_Result.at(i).y;
				m_Box.y_min	= m_Result.at(i).y;
				m_Box.z_max	= m_Result.at(i).z;
				m_Box.z_min	= m_Result.at(i).z;
			}
			else
				CheckBound(&m_Result.at(i));
			continue;
		}

		D3DXVec3TransformCoord(&m_Result.at(i), &m_Position.at(i), m_Parent);
		if (i==0)
		{
			m_Box.x_max	= m_Result.at(i).x;
			m_Box.x_min	= m_Result.at(i).x;
			m_Box.y_max	= m_Result.at(i).y;
			m_Box.y_min	= m_Result.at(i).y;
			m_Box.z_max	= m_Result.at(i).z;
			m_Box.z_min	= m_Result.at(i).z;
		}
		else
			CheckBound(&m_Result.at(i));
	}
		
	switch(m_Type)
	{
	case NGCT_LINE:
		{
			for (int i=0; i<m_Face.size(); i++)
			{
				D3DXVECTOR3	v0	= m_Result.at(m_Face.at(i).f1);
				D3DXVECTOR3	v1	= m_Result.at(m_Face.at(i).f2);
				D3DXVECTOR3	v2	= m_Result.at(m_Face.at(i).f3);

				NGLINE	line;
				line.Create(&v0,&v1);
				m_Line.at(0)	= line;
				line.Create(&v1,&v2);
				m_Line.at(1)	= line;
				line.Create(&v2,&v0);
				m_Line.at(2)	= line;
			}
		}
		break;
	}

	return TRUE;
}

DWORD DetectBound(NGBOUND* b1, NGBOUND* b2)
{
	if (b1->x_min > b2->x_max)
		return FALSE;

	if (b1->x_max < b2->x_min)
		return FALSE;

	if (b1->y_min > b2->y_max)
		return FALSE;

	if (b1->y_max < b2->y_min)
		return FALSE;

	if (b1->z_min > b2->z_max)
		return FALSE;

	if (b1->z_max < b2->z_min)
		return FALSE;

	return TRUE;
}

DWORD Detect(NGCollide* c1, NGCollide* c2)
{
	if ((c1->GetType() == NGCT_NONE)||(c2->GetType() == NGCT_NONE))
		return -1;

	if (c1->GetType() == c2->GetType())
		return FALSE;

	// c1 must be type plane and c2 must be type line
	if (c1->GetType() != NGCT_PLANE)
	{
		NGCollide*	temp;
		temp	= c1;
		c1		= c2;
		c2		= temp;
	}

	if (!DetectBound(&c1->m_Box, &c2->m_Box))
		return FALSE;

	FLOAT	t;
	FLOAT	a;
	FLOAT	b;
	D3DXPLANE*		p;
	D3DXVECTOR3*	v;
	D3DXVECTOR3*	f;
	for (int i=0; i<c1->m_Plane.size(); i++)
	{
		if (!DetectBound(c1->m_Plane.at(i).GetBox(), &c2->m_Box))
			continue;

		p	= c1->m_Plane.at(i).GetPlane();

		for (int j=0; j<c2->m_Line.size(); j++)
		{	
			v	= c2->m_Line.at(j).GetStart();
			f	= c2->m_Line.at(j).GetFactor();

			a	= p->a*v->x + p->b*v->y + p->c*v->z + p->d;
			b	= p->a*f->x + p->b*f->y + p->c*f->z;

			if (b==0)
				continue;

			t	= -a/b;

			if ((t>=0)&&(t<=1.0f))
				return TRUE;
		}
	}

	return FALSE;
}

DWORD DetectBoundProj(NGBOUND* b1, D3DXVECTOR3* b2)
{
	if (b1->x_min > b2->x)
		return FALSE;

	if (b1->x_max < b2->x)
		return FALSE;

	if (b1->z_min > b2->z)
		return FALSE;

	if (b1->z_max < b2->z)
		return FALSE;

	return TRUE;
}

DWORD	Projection(NGCollide* c, D3DXVECTOR3* p, FLOAT& z)
{
	// c must be type plane
	if (c->GetType() != NGCT_PLANE)
	{
		return FALSE;
	}

	if (!DetectBoundProj(&c->m_Box, p))
		return FALSE;

	FLOAT		r;
	NGPLANE2	plane;
	for (int i=0; i<c->m_Plane.size(); i++)
	{
		if (!DetectBoundProj(c->m_Plane.at(i).GetBox(), p))
			continue;

		plane	= c->m_Plane.at(i);

		r	= (plane.m_LineEq[0].x * p->z) + (plane.m_LineEq[0].y * p->x) + plane.m_LineEq[0].z;
		if ((r>0)!=plane.m_LineGe[0])
			continue;

		r	= (plane.m_LineEq[1].x * p->z) + (plane.m_LineEq[1].y * p->x) + plane.m_LineEq[1].z;
		if ((r>0)!=plane.m_LineGe[1])
			continue;

		r	= (plane.m_LineEq[2].x * p->z) + (plane.m_LineEq[2].y * p->x) + plane.m_LineEq[2].z;
		if ((r>0)!=plane.m_LineGe[2])
			continue;

		z	= -(plane.m_Plane.d + plane.m_Plane.c*p->z + plane.m_Plane.a*p->x) / plane.m_Plane.b;
		return TRUE;
	}
	
	return FALSE;
}


//---------------------------------------------------

VOID CheckBound(NGBOUND* bound, D3DXVECTOR3* v1)
{
	if (v1->x > bound->x_max)
		bound->x_max	= v1->x;
	if (v1->x < bound->x_min)
		bound->x_min	= v1->x;
	
	if (v1->y > bound->y_max)
		bound->y_max	= v1->y;
	if (v1->y < bound->y_min)
		bound->y_min	= v1->y;
	
	if (v1->z > bound->z_max)
		bound->z_max	= v1->z;
	if (v1->z < bound->z_min)
		bound->z_min	= v1->z;
}

DWORD NGWALL::Create(D3DXVECTOR3& v0, D3DXVECTOR3& v1, D3DXVECTOR3& v2)
{
	// Create bound
	Bound.x_max	= v0.x;
	Bound.x_min	= v0.x;
	Bound.y_max	= v0.y;
	Bound.y_min	= v0.y;
	Bound.z_max	= v0.z;
	Bound.z_min	= v0.z;

	CheckBound(&Bound, &v1);
	CheckBound(&Bound, &v2);
	
	if ((Bound.x_max-Bound.x_max)>=(Bound.z_max-Bound.z_min))
		Radius	= (Bound.x_max-Bound.x_max)*0.5f;
	else
		Radius	= (Bound.z_max-Bound.z_max)*0.5f;

	Center.x	= (Bound.x_max+Bound.x_min)*0.5f;
	Center.y	= (Bound.y_max+Bound.y_min)*0.5f;

	BOOL	bPlus;
	bPlus	= ((((v0.x==Bound.x_max)&&(v0.z==Bound.z_min))	||
				((v1.x==Bound.x_max)&&(v1.z==Bound.z_min))	||
				((v2.x==Bound.x_max)&&(v2.z==Bound.z_min)))	||
			   (((v0.x==Bound.x_min)&&(v0.z==Bound.z_max))	||
				((v1.x==Bound.x_min)&&(v1.z==Bound.z_max))	||
				((v2.x==Bound.x_min)&&(v2.z==Bound.z_max))));

	if (bPlus)
	{
		LineEq.a	= Bound.x_max - Bound.x_min;
		LineEq.b	= Bound.z_max - Bound.z_min;
		LineEq.c	= (-LineEq.a*Bound.z_max) + (-LineEq.b*Bound.x_min);
	}
	else
	{
		LineEq.a	= Bound.x_max - Bound.x_min;
		LineEq.b	= Bound.z_min - Bound.z_max;
		LineEq.c	= (-LineEq.a*Bound.z_min) + (-LineEq.b*Bound.x_min);
	}

	return TRUE;
}

NGCYLINDER::NGCYLINDER(D3DXVECTOR3& vec, FLOAT h, FLOAT r)
{
	RefPoint	= vec;
	Height		= h;
	Radius		= r;
	Radius2		= r*r;
}

DWORD NGCYLINDER::SetData(D3DXVECTOR3& vec, FLOAT h, FLOAT r)
{
	RefPoint	= vec;
	Height		= h;
	Radius		= r;
	Radius2		= r*r;
	return TRUE;
}

DWORD DetectCircle(NGWALL* w, NGCYLINDER* c, FLOAT r2)
{
	FLOAT	x	= (w->Center.x - c->RefPoint.x);
	FLOAT	y	= (w->Center.y - c->RefPoint.y);
	FLOAT	d2	= x*x+y*y;
	if (d2>r2)
		return FALSE;
	return TRUE;
}

DWORD Detect(NGCollide* col, NGCYLINDER* cyl, D3DXVECTOR3& vec)
{
	if (col->GetType() == NGCT_WALL)
		return FALSE;

	if (!DetectBoundProj(&col->m_Box, &cyl->RefPoint))
		return FALSE;

	FLOAT	r,r2;
	FLOAT	a,b,d2;

	NGWALL*	wall;
	for (int i=0; i<col->m_Wall.size(); i++)
	{
		wall	= &col->m_Wall.at(i);
		r		= wall->Radius + cyl->Radius;
		r2		= r*r;
		if (DetectCircle(wall, cyl, r2))
		{
			a	= cyl->RefPoint.x*wall->LineEq.a + 
				  cyl->RefPoint.z*wall->LineEq.b +
				  wall->LineEq.c;
			b	= (wall->LineEq.a*wall->LineEq.a) + 
				  (wall->LineEq.b*wall->LineEq.b);
			d2	= (a*a)/b;

			if (d2<=cyl->Radius2)
				return TRUE;
		}
	}

	return FALSE;
}
/*
DWORD NGGROUND::Create(D3DXVECTOR3& v0, D3DXVECTOR3& v1, D3DXVECTOR3& v2)
{
	// Create plane
	D3DXPlaneFromPoints(&PlaneEq, &v0, &v1, &v2);

	// Create bound
	Bound.x_max	= v0.x;
	Bound.x_min	= v0.x;
	Bound.y_max	= v0.y;
	Bound.y_min	= v0.y;
	Bound.z_max	= v0.z;
	Bound.z_min	= v0.z;

	CheckBound(&Bound, &v1);
	CheckBound(&Bound, &v2);

	// Create line equation
	// - From v0, v1
	LineEq[0].a	= v1.x-v0.x;
	LineEq[0].b	= v0.z-v1.z;
	LineEq[0].c	= -((LineEq[0].b*v0.x)+(LineEq[0].a*v0.z));
	// - From v1, v2
	LineEq[1].a	= v2.x-v1.x;
	LineEq[1].b	= v1.z-v2.z;
	LineEq[1].c	= -((LineEq[1].b*v1.x)+(LineEq[1].a*v1.z));
	// - From v2, v0
	LineEq[2].a	= v0.x-v2.x;
	LineEq[2].b	= v2.z-v0.z;
	LineEq[2].c	= -((LineEq[2].b*v2.x)+(LineEq[2].a*v2.z));
	

	return TRUE;
}
*/

NGSphere::NGSphere()
{

}

NGSphere::~NGSphere()
{

}

BOOL NGSphere::Create(NGCOLLIDE* col, D3DXMATRIX* mat, LPVOID param)
{
	m_radius	= col->radius;
	m_r2		= m_radius*m_radius;
	m_param		= param;
	m_matrix	= mat;
	m_locate	= D3DXVECTOR3(mat->m[3][0], mat->m[3][1], mat->m[3][2]);
	
	return TRUE;
}

NGCylinder::NGCylinder()
{

}

NGCylinder::~NGCylinder()
{

}

BOOL NGCylinder::Create(NGCOLLIDE* col, D3DXMATRIX* mat, LPVOID param)
{
	m_radius	= col->radius;
	m_r2		= m_radius*m_radius;
	m_param		= param;
	m_matrix	= mat;
	m_locate	= D3DXVECTOR3(mat->m[3][0], mat->m[3][1], mat->m[3][2]);

	return TRUE;
}

void NGCylinder::Update()
{
	m_locate	= D3DXVECTOR3(m_matrix->m[3][0], m_matrix->m[3][1], m_matrix->m[3][2]);
}

NGGround::NGGround()
{

}

NGGround::~NGGround()
{

}

void NGGround::GROUNDFACE::Create(D3DXVECTOR3& v0, D3DXVECTOR3& v1, D3DXVECTOR3& v2)
{
	D3DXPlaneFromPoints(&plane, &v0, &v1, &v2);

	D3DXVECTOR3	center	= (v0 + v1 + v2) * 0.3333333f;

		// Eq1 - v0,v1
	line[0].x	= v1.x - v0.x;
	line[0].y	= v0.z - v1.z;
	line[0].z	= (-line[0].x * v0.z) + (-line[0].y * v0.x);

		// Eq2 - v1,v2
	line[1].x	= v2.x - v1.x;
	line[1].y	= v1.z - v2.z;
	line[1].z	= (-line[1].x * v1.z) + (-line[1].y * v1.x);

		// Eq3 - v2,v0
	line[2].x	= v0.x - v2.x;
	line[2].y	= v2.z - v0.z;
	line[2].z	= (-line[2].x * v2.z) + (-line[2].y * v2.x);

	ZeroMemory(lineGeq, sizeof(lineGeq));

	FLOAT r;

	r	= (line[0].x * v2.z) + (line[0].y * v2.x) + line[0].z;
	if (r>0)
		lineGeq[0]	= TRUE;

	r	= (line[1].x * v0.z) + (line[1].y * v0.x) + line[1].z;
	if (r>0)
		lineGeq[1]	= TRUE;

	r	= (line[2].x * v1.z) + (line[2].y * v1.x) + line[2].z;
	if (r>0)
		lineGeq[2]	= TRUE;
}

void NGGround::Update()
{

}

BOOL NGGround::Create(NGCOLLIDE* col, D3DXMATRIX* mat, LPVOID param)
{
	m_size		= col->index.Length();
	m_detect	= new GROUNDFACE[m_size];

	for (int i=0; i<m_size; i++)
	{
		m_detect[i].Create(	col->pos[col->index[i].f1], 
							col->pos[col->index[i].f2],
							col->pos[col->index[i].f3]);
	}

	m_matrix	= mat;
	m_param		= param;
	return TRUE;
}

NGWall::NGWall()
{

}

NGWall::~NGWall()
{

}

BOOL NGWall::Create(NGCOLLIDE* col, D3DXMATRIX* mat, LPVOID param)
{
	
	return TRUE;
}

NGDetector::NGDetector()
{

}

NGDetector::~NGDetector()
{

}

BOOL NGDetector::Add(NGCOLLIDE* col, D3DXMATRIX* mat, LPVOID param)
{
	switch (col->type)
	{
	case NGCT_UNKNOWN:
		return FALSE;
	case NGCT_WALL:
		{
			NGWall*	wall = new NGWall();
			wall->Create(col, mat, param);
			m_Wall.Add(wall);
		}
		break;
	case NGCT_GROUND:
		{
			NGGround* gnd = new NGGround();
			gnd->Create(col, mat, param);
			m_Ground.Add(gnd);
		}
		break;
	case NGCT_CYLINDER:
		{
			NGCylinder*	cyl	= new NGCylinder();
			cyl->Create(col, mat, param);
			m_Cylinder.Add(cyl);
		}
		break;
	case NGCT_SPHERE:
		{
			NGSphere* phr	= new NGSphere();
			phr->Create(col, mat, param);
			m_Sphere.Add(phr);
		}
		break;
	}

	return TRUE;
}

void DetectCollision(NGDetector* d1, NGDetector* d2)
{
	int i,j;

	for (i=0;i<d1->m_gRes.Length(); i++)
		delete d1->m_gRes[i];
	
	for (i=0;i<d2->m_gRes.Length(); i++)
		delete d2->m_gRes[i];
	
	d1->m_gRes.Delete();
	d2->m_gRes.Delete();

	// update data
	for (i=0; i<d1->m_Cylinder.Length(); i++)
	{
		d1->m_Cylinder[i]->Update();
	}

	for (i=0; i<d2->m_Cylinder.Length(); i++)
	{
		d2->m_Cylinder[i]->Update();
	}

	// detect d1 cylinder VS d2 ground
	for (i=0; i<d1->m_Cylinder.Length(); i++)
	{
		for (j=0; j<d2->m_Ground.Length(); j++)
		{
			d1->m_gRes.Add(DetectGC(d1->m_Cylinder[i], d2->m_Ground[j]));
		}
	}

	// detect d2 cylinder VS d1 ground
	for (i=0; i<d2->m_Cylinder.Length(); i++)
	{
		for (j=0; j<d1->m_Ground.Length(); j++)
		{
			d2->m_gRes.Add(DetectGC(d2->m_Cylinder[i], d1->m_Ground[j]));
		}
	}
}

GROUNDRESULT* DetectGC(NGCylinder* cyl, NGGround* gnd)
{
	GROUNDRESULT*	res	= new GROUNDRESULT();

	FLOAT			r;
	D3DXVECTOR3*	line;
	BOOL*			geq;
	D3DXPLANE		plane;
	D3DXVECTOR3		p	= cyl->m_locate;
	for (int i=0; i<gnd->m_size; i++)
	{
		line	= gnd->m_detect[i].line;
		geq		= gnd->m_detect[i].lineGeq;

		r	= (line[0].x * p.z) + (line[0].y * p.x) + line[0].z;
		if ((r>0)!=geq[0])
			continue;

		r	= (line[1].x * p.z) + (line[1].y * p.x) + line[1].z;
		if ((r>0)!=geq[1])
			continue;

		r	= (line[2].x * p.z) + (line[2].y * p.x) + line[2].z;
		if ((r>0)!=geq[2])
			continue;

		plane	= gnd->m_detect[i].plane;
		res->height.Add(-(plane.d + plane.c*p.z + plane.a*p.x) / plane.b);
	}

	return res;
}