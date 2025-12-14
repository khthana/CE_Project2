using System;
using System.Windows.Forms;
using System.Collections;

namespace Maker
{
	/// <summary>
	/// Summary description for App.
	/// </summary>
	public class App
	{
		public App()
		{
			//
			// TODO: Add constructor logic here 
			//
			base_model	= null;
			res3d		= new ArrayList();
			res2d		= new ArrayList();
			file		= new File();
			texture		= new ArrayList();
		}

		// base elements
		private Data3D		base_model;
		private ArrayList	texture;

		// resource elements
		private ArrayList	res3d;
		private ArrayList	res2d;

		// other
		private File		file;

		public Data3D Base
		{
			get
			{
				return base_model;
			}
		}

		public ArrayList Data3DList
		{
			get 
			{
				return res3d;
			}
		}

		public ArrayList Textures
		{
			get 
			{
				return texture;
			}
		}

		public ArrayList Data2DList
		{
			get 
			{
				return res2d;
			}
		}

		public void AddRes3d(Data3D m)
		{
			res3d.Add(m);
		}

		public void AddRes2d(Data2D m)
		{
			res2d.Add(m);
		}

		public bool SetBase(int i)
		{
			if (i>res3d.Count)
				return false;
			base_model	= (Data3D)res3d[i];
			return true;
		}

		public bool LoadData3D(string filename)
		{
			for (int i=0; i<res3d.Count; i++)
			{
				Data3D	t = (Data3D)res3d[i];
				if (t.FileName==filename)
					if (MessageBox.Show("A selected filename are already exist in data list.\nDo you want to add this data?", "Information", MessageBoxButtons.YesNo)==DialogResult.No)
						return false;
			}
			file.Read(filename);
			file.Tokenize();
			Data3D	temp3d	= new Data3D();
			temp3d.FromX(file.Tokens, filename);
			AddRes3d(temp3d);
			return true;
		}

		public bool LoadData3D(string[] filenames)
		{
			for (int j=0; j<filenames.Length; j++)
			{
				bool	read	= true;
				for (int i=0; i<res3d.Count; i++)
				{
					Data3D	t = (Data3D)res3d[i];
					if (t.FileName==filenames[j])
						if (MessageBox.Show("A selected filename are already exist in data list.\nDo you want to add this data?", "Information", MessageBoxButtons.YesNo)==DialogResult.No)
							read = false;
				}
				if (read)
				{
					file.Read(filenames[j]);
					file.Tokenize();
					Data3D	temp3d	= new Data3D();
					temp3d.FromX(file.Tokens, filenames[j]);
					AddRes3d(temp3d);
				}
			}
			return true;
		}

		public bool LoadData2D(string filename)
		{
			for (int i=0; i<res2d.Count; i++)
			{
				Data2D	t = (Data2D)res2d[i];
				if (t.Filename==filename)
					if (MessageBox.Show("A selected filename are already exist in data list.\nDo you want to add this data?", "Information", MessageBoxButtons.YesNo)==DialogResult.No)
						return false;
			}

			Data2D	temp2d	= new Data2D();
			temp2d.FromDDS(filename);
			res2d.Add(temp2d);
			return true;
		}

		public bool LoadData2D(string[] filenames)
		{
			for (int j=0; j<filenames.Length; j++)
			{
				bool	read	= true;
				for (int i=0; i<res2d.Count; i++)
				{
					Data2D	t = (Data2D)res2d[i];
					if (t.Filename==filenames[j])
						if (MessageBox.Show("A selected filename are already exist in data list.\nDo you want to add this data?", "Information", MessageBoxButtons.YesNo)==DialogResult.No)
							read = false;
				}
				if (read)
				{
					Data2D	temp2d	= new Data2D();
					temp2d.FromDDS(filenames[j]);
					res2d.Add(temp2d);
				}
			}
			return true;
		}
			
		public bool AddTexCoord1(int i)
		{
			return true;
		}

		public void AddTexture(int i)
		{
			texture.Add(res2d[i]);
		}
	}
}
