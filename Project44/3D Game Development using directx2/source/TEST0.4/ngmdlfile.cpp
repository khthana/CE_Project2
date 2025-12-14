#include "ngmdlfile.h"

NGMD2File::NGMD2File()
{}

NGMD2File::~NGMD2File()
{}

NGFRAME* NGMD2File::ReadFrame()
{
	NGFRAME*	frame = new NGFRAME();

	try
	{
		m_file.ReadString(frame->m_strName);
		m_file.Read(&frame->m_matTran);
		m_file.Read(&frame->m_fdesc);
		
		D3DXVECTOR3	p;
		D3DXVECTOR3	n;
		D3DXVECTOR2	t0;
		D3DXVECTOR2	t1;
		NGBLEND4	b;
		NGFACE*		f;
		DWORD i,j;
		DWORD	size;
		DWORD	type;

		for (i=0; i<frame->m_fdesc.numPos; i++)
		{
			m_file.Read(&p);
			type	= D3DFVF_XYZ;

			// blend weight
			for (j=0; (j<frame->m_fdesc.numBlend)&&(j<4); j++)
			{
				m_file.Read(&b.b[j]);
				type = D3DFVF_XYZB4;
			}
			// blend index
			for (j=0; (j<frame->m_fdesc.numBlend)&&(j<4); j++)
			{
				m_file.Read(&b.i[j]);
				type |= D3DFVF_LASTBETA_UBYTE4;
			}
			// normal
			if (frame->m_fdesc.bNormal)
			{
				m_file.Read(&n);
				type |= D3DFVF_NORMAL;
			}
			// tex0
			if (frame->m_fdesc.bTex0)
			{
				type |= D3DFVF_TEX0;
				m_file.Read(&t0);
			}
			// tex1
			if (frame->m_fdesc.bTex1)
			{
				type |= D3DFVF_TEX1;
				m_file.Read(&t1);
			}

			switch (type)
			{
			case NGFVF_PNT1:
				{
					NGVB_PNT1 v;
					v.p	= p;
					v.n	= n;
					v.t	= t0;

					if (i==0)
						frame->m_Vertex.Create(NGFVF_PNT1);
					frame->m_Vertex.Add(v);
					frame->m_bMesh = true;
					frame->m_dwFVF = NGFVF_PNT1;
				}
				break;
			case NGFVF_PNT2:
				{
					NGVB_PNT2 v;
					v.p	= p;
					v.n	= n;
					v.t0 = t0;
					v.t1 = t1;

					if (i==0)
						frame->m_Vertex.Create(NGFVF_PNT2);
					frame->m_Vertex.Add(v);
					frame->m_bMesh = true;
					frame->m_dwFVF = NGFVF_PNT2;
				}
				break;
			case NGFVF_PNT1B4:
				{
					NGVB_PNT1B4 v;
					v.p	= p;
					v.b	= b;
					v.n	= n;
					v.t = t0;

					v.b.i1+=1;
					v.b.i2+=1;


					if (i==0)
						frame->m_Vertex.Create(NGFVF_PNT1B4);
					frame->m_Vertex.Add(v);
					frame->m_bMesh = true;
					frame->m_dwFVF = NGFVF_PNT1B4;
				}
				break;
			case NGFVF_PNT2B4:
				{
					NGVB_PNT2B4 v;
					v.p	= p;
					v.b	= b;
					v.n	= n;
					v.t0 = t0;
					v.t1 = t1;

					if (i==0)
						frame->m_Vertex.Create(NGFVF_PNT2B4);
					frame->m_Vertex.Add(v);
					frame->m_bMesh = true;
					frame->m_dwFVF = NGFVF_PNT2B4;
				}
				break;
			default:
				throw NGException();
			}
		}

		frame->m_Index.index.Reserve(frame->m_fdesc.numIndexSet);
		for (i=0; i<frame->m_fdesc.numIndexSet; i++)
		{
			m_file.Read(&size);
			frame->m_Index.index[i] = new NGINDEXSET();
			frame->m_Index.index[i]->face.Reserve(size);
			m_file.Read(&frame->m_Index.index[i]->mtrl);
			

			for (j=0; j<size; j++)
			{
				f = &frame->m_Index.index[i]->face[j];
				m_file.Read(&f->f1);
				m_file.Read(&f->f2);
				m_file.Read(&f->f3);
			}
		}

		frame->m_jIndex.Reserve(frame->m_fdesc.numJoint);
		frame->m_jOffset.Reserve(frame->m_fdesc.numJoint);
		for (i=0; i<frame->m_fdesc.numJoint; i++)
			m_file.Read(&frame->m_jIndex[i]);
		for (i=0; i<frame->m_fdesc.numJoint; i++)
			m_file.Read(&frame->m_jOffset[i]);

		frame->m_cIndex.Reserve(frame->m_fdesc.numChild);
		for (i=0; i<frame->m_fdesc.numChild; i++)
			m_file.Read(&frame->m_cIndex[i]);

		m_file.Read(&frame->m_pindex);
	}
	catch (NGException)
	{

	}
	
	return frame;
}

NGMTRLS* NGMD2File::ReadMtrl()
{
	NGMTRLS* mtrl = new NGMTRLS();
	NGFILEMTRL tmpmtrl;
	string tex0;
	string tex1;

	try
	{
		
		m_file.ReadString(mtrl->strName);
		m_file.Read(&tmpmtrl);
		
		mtrl->mtrlDef.mtrlD3D = tmpmtrl.ToMtrl();
	
		int size,size2;
		float key;
	
		m_file.Read(&size);

		mtrl->mtrlSet.Reserve(size);
		for (int i=0; i<size; i++)
		{
			NGMTRLSET ms;
			m_file.Read(&size2);

			mtrl->mtrlSet[i].mtrlKey.Reserve(size2);
			for (int j=0; j<size2; j++)
			{
				m_file.Read(&tmpmtrl);

				mtrl->mtrlSet[i].mtrlKey[j].mtrlD3D = tmpmtrl.ToMtrl();
				m_file.Read(&key);
			}
			m_file.ReadString(tex0);
			m_file.ReadString(tex1);
			mtrl->mtrlSet[i].tex0   = tex0;
			mtrl->mtrlSet[i].tex1	= tex1;
		}
		m_file.ReadString(tex0);
		m_file.ReadString(tex1);
		mtrl->tex0	  = tex0;
		mtrl->tex1	  = tex1;
	}
	catch (NGException)
	{
	}
	
	return mtrl;
}

NGANIME* NGMD2File::ReadAnime()
{
	NGANIME* anime = new NGANIME();

	m_file.ReadString(anime->m_strName);

	int size, tran, rot, scale, i, j;

	m_file.Read(&size);

	anime->m_Sets.Reserve(size);
	for (i=0; i<size; i++)
	{
		anime->m_Sets[i] = new ANIMESET();
		m_file.ReadString(anime->m_Sets[i]->name);
		m_file.Read(&rot);
		m_file.Read(&scale);
		m_file.Read(&tran);

		anime->m_Sets[i]->rotKeys.Reserve(rot);
		anime->m_Sets[i]->scaleKeys.Reserve(scale);
		anime->m_Sets[i]->tranKeys.Reserve(tran);

		FLOAT	tmp;
		for (j=0; j<rot; j++)
		{
			m_file.Read(&anime->m_Sets[i]->rotKeys[j]);
			tmp	= anime->m_Sets[i]->rotKeys[j].key.x;
			anime->m_Sets[i]->rotKeys[j].key.x = anime->m_Sets[i]->rotKeys[j].key.y;
			anime->m_Sets[i]->rotKeys[j].key.y = anime->m_Sets[i]->rotKeys[j].key.z;
			anime->m_Sets[i]->rotKeys[j].key.z = anime->m_Sets[i]->rotKeys[j].key.w;
			anime->m_Sets[i]->rotKeys[j].key.w = tmp;
		}
		
		for (j=0; j<scale; j++)
		{
			m_file.Read(&anime->m_Sets[i]->scaleKeys[j]);
		}

		for (j=0; j<tran; j++)
		{
			m_file.Read(&anime->m_Sets[i]->tranKeys[j]);
		}
	}

	return anime;
}

NGCOLLIDE* NGMD2File::ReadCollide()
{
	NGCOLLIDE* n = new NGCOLLIDE();

	m_file.Read(&n->type);
	m_file.ReadString(n->name);
	m_file.ReadString(n->parent);
	m_file.Read(&n->radius);
	m_file.Read(&n->height);

	if ((n->type==1)||(n->type==2))
	{
		int size,i;
		D3DXVECTOR3 vec;
		NGFACE		face;
		m_file.Read(&size);
		n->pos.Reserve(size);

		for (i=0; i<size; i++)
		{
			m_file.Read(&vec);
			n->pos[i] = vec;
		}

		m_file.Read(&size);
		n->index.Reserve(size);
		for (i=0; i<size; i++)
		{
			m_file.Read(&face);
			n->index[i] = face;
		}
	}
	return n;
}

NGModel* NGMD2File::LoadMD2(string filename)
{
	NGModel*	model = new NGModel();

	try
	{
		if (!m_file.Exists((const char*)filename.c_str()))
			throw NGException();

		if (!m_file.Open((const char*)filename.c_str()))
			throw NGException();

		DWORD	magic;
		string	name;
		DWORD	numFrame;
		DWORD	numAnime;
		DWORD	numMtrls;
		DWORD	numCollide;

		m_file.Read(&magic);
		m_file.ReadString(name);
		m_file.Read(&numFrame);
		m_file.Read(&numMtrls);
		m_file.Read(&numAnime);
		m_file.Read(&numCollide);

		

		DWORD i;
		for (i=0; i<numFrame; i++)
		{
			model->Add(ReadFrame());
		}

		for (i=0; i<numMtrls; i++)
		{
			model->Add(ReadMtrl());
		}

		for (i=0; i<numAnime; i++)
		{
			model->Add(ReadAnime());
		}

		for (i=0; i<numCollide; i++)
		{
			model->Add(ReadCollide());
		}

	}
	catch(NGException)
	{
		return NULL;
	}

	NGFRAME* f = model->Frame()->ToArray();

	return model;
}