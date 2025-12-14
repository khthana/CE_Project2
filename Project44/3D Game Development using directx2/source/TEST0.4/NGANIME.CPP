#include "nganime.h"

DWORD ANIMESET::FindKeyTime()
{
	DWORD kt;
	DWORD tmp;

	kt	= tranKeys[tranKeys.Length()-1].time;
	tmp	= rotKeys[rotKeys.Length()-1].time;

	if (kt<tmp)
		kt = tmp;

	tmp	= scaleKeys[scaleKeys.Length()-1].time;

	if (kt<tmp)
		kt = tmp;

	keyTime = kt;

	return kt;
}

VOID NGANIME::Initialize()
{
	m_keyTime = 0;
	for (int i=0; i<m_Sets.Length(); i++)
	{
		if (m_Sets[i]->FindKeyTime()>m_keyTime)
			m_keyTime = m_Sets[i]->keyTime;
	}
	m_keyTime *= m_factor;
}

D3DXMATRIX NGANIME::PlaySet(DWORD ID, FLOAT time)
{
	D3DXMATRIX	matResult;
	D3DXMATRIX	matTran;
	D3DXMATRIX	matScale;
	D3DXMATRIX	matRotate;

	D3DXMatrixIdentity(&matResult);

	if (ID>m_Sets.Length())
		return matResult;

	ANIMESET*	as	= m_Sets[ID];
	FLOAT	endTime = as->GetKeyTime()*m_factor;
	FLOAT	Time	= time * m_multer *10;

/*	if (endTime<Time)
		Time-=endTime;*/

	INT		kTMin	= -1;		// Translation key
	INT		kTMax	= -1;
	INT		kRMin	= -1;		// Rotation key
	INT		kRMax	= -1;
	INT		kSMin	= -1;		// Scale key
	INT		kSMax	= -1;

	// find key
	int i;

	// Translation
	for (i=0; i<as->tranKeys.Length(); i++)
	{
		if (as->tranKeys[i].time>=Time)
		{
			kTMin	= i-1;
			break;
		}
	}

	for (i=0; i<as->tranKeys.Length(); i++)
	{
		kTMax = i;
		if (as->tranKeys[i].time>Time)
		{
			break;
		}
	}
	kTMin	= kTMax-1;

	// Rotation
	for (i=0; i<as->rotKeys.Length(); i++)
	{
		if (as->rotKeys[i].time>=Time)
		{
			kRMin	= i-1;
			break;
		}
	}

	for (i=0; i<as->rotKeys.Length(); i++)
	{
		kRMax	= i;
		if (as->rotKeys[i].time>Time)
		{
			break;	
		}
	}
	kRMin	= kRMax-1;

	// Scalation
	for (i=0; i<as->scaleKeys.Length(); i++)
	{
		if (as->scaleKeys[i].time>=Time)
		{
			kSMin	= i-1;
			break;
		}
	}

	for (i=0; i<as->scaleKeys.Length(); i++)
	{
		kSMax	= i;
		if (as->scaleKeys[i].time>Time)
		{
			break;	
		}
	}
	kSMin	= kSMax-1;

	// Calculation
	FLOAT	t1;
	FLOAT	t2;
	FLOAT	t = Time;
	FLOAT	value;
	
	if ((kTMin==-1)&&(kTMax<=0))	// Non key
	{
		D3DXMatrixIdentity(&matTran);
	}
	else if (kTMin==kTMax)			// Last key
	{
		D3DXMatrixTranslation(&matTran, as->tranKeys[kTMax].key.x, as->tranKeys[kTMax].key.y, as->tranKeys[kTMax].key.z);
	}
	else							// Normal key
	{
		t1	= (FLOAT)as->tranKeys[kTMin].time;
		t2	= (FLOAT)as->tranKeys[kTMax].time;
		value =	(t-t1)/(t2-t1);
		D3DXVECTOR3		vTran;
		D3DXVec3Lerp(&vTran, &as->tranKeys[kTMin].key, &as->tranKeys[kTMax].key, value);
		D3DXMatrixTranslation(&matTran, vTran.x, vTran.y, vTran.z);
		//D3DXMatrixIdentity(&matTran);
	}

	if ((kRMin==-1)&&(kRMax<=0))
	{
		D3DXMatrixIdentity(&matRotate);
	}
	else if (kRMin==kRMax)
	{
		D3DXMatrixRotationQuaternion(&matRotate, &as->rotKeys[kRMax].key);
	}
	else
	{
		t1	= (FLOAT)as->rotKeys[kRMin].time;
		t2	= (FLOAT)as->rotKeys[kRMax].time;
		value =	(t-t1)/(t2-t1);
		D3DXQUATERNION	qRot, q1, q2;
		q1	= as->rotKeys[kRMin].key;
		q2	= as->rotKeys[kRMax].key;
		D3DXQuaternionSlerp(&qRot, &as->rotKeys[kRMin].key, &as->rotKeys[kRMax].key, value);
		D3DXMatrixRotationQuaternion(&matRotate, &qRot);
	}

	if ((kSMin==-1)&&(kSMax<=0))
	{
		D3DXMatrixIdentity(&matScale);
	}
	else if (kSMin==kSMax)
	{
		D3DXMatrixScaling(&matScale, as->scaleKeys[kSMax].key.x, as->scaleKeys[kSMax].key.y, as->scaleKeys[kSMax].key.z);
	}
	else
	{
		t1	= (FLOAT)as->scaleKeys[kSMin].time;
		t2	= (FLOAT)as->scaleKeys[kSMax].time;
		value =	(t-t1)/(t2-t1);
		D3DXVECTOR3		vScale;
		D3DXVec3Lerp(&vScale, &as->scaleKeys[kSMin].key, &as->scaleKeys[kSMax].key, value);
		D3DXMatrixScaling(&matScale, vScale.x, vScale.y, vScale.z);
	}

	D3DXMATRIX	tmp;
	//D3DXMatrixMultiply(&tmp, &matScale, &matRotate);
	//D3DXMatrixMultiply(&matResult, &matTran, &tmp);
	//matResult = matRotate;
	D3DXMatrixIdentity(&tmp);
	D3DXMatrixMultiply(&tmp, &tmp, &matScale);
	D3DXMatrixMultiply(&tmp, &tmp, &matRotate);
	D3DXMatrixMultiply(&tmp, &tmp, &matTran);
	matResult = tmp;

	return matResult;
}