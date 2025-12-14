#include "ngtexfile.h"

NGIMAGE* NGTX2File::ReadImage()
{
	NGIMAGE* image = new NGIMAGE();

	m_file.ReadString(image->name);
	m_file.Read(&image->surdesc);
	m_file.Read(&image->size);
	image->data = new BYTE[image->size];
	m_file.ReadBuff(image->data, sizeof(BYTE), image->size);

	return image;
}

NGDATA2D* NGTX2File::ReadData2d()
{
	NGDATA2D* data = new NGDATA2D();

	try
	{
		m_file.ReadString(data->name);
		m_file.Read(&data->frame);
	}
	catch (NGException)
	{
		throw NGException();
	}

	return data;
}

BOOL NGTX2File::LoadTX2(string filename, NGRes2d* res2d)
{
	ArrayList<NGIMAGE*>	image;
	NGDATA2D* data;
	NGIMAGE*  pic;
	INT		  count;

	try
	{
		if (!m_file.Exists((const char*)filename.c_str()))
			throw NGException();

		if (!m_file.Open((const char*)filename.c_str()))
			throw NGException();

		DWORD magic;
		m_file.Read(&magic);
		
		if (magic!=0x2032444d)
			throw NGException();
	
		data = ReadData2d();
		pic  = ReadImage();
		data->defImage = pic->name;
		m_file.Read(&count);

		image.Reserve(count+1);
		data->image.Reserve(count);
		image[0] = pic;
		for (int i=0; i<count; i++)
		{
			image[i+1] = ReadImage();
			data->image[i] = image[i+1]->name;
		}
	}
	catch (NGException)
	{
		return false;
	}

	res2d->Add(image, data);
	int x = res2d->FindData2d(data->name);
	int y = res2d->FindImage(image[0]->name);

	return true;
}