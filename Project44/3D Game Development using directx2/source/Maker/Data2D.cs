using System;
using System.IO;
using System.Collections;

namespace Maker
{
	/// <summary>
	/// Summary description for Data2D.
	/// </summary>
	public struct DDSURFACEDESC2
	{
		public uint	size;				// size of the DDSURFACEDESC structure
		public uint	flags;				// determines what fields are valid
		public uint	height;				// height of surface to be created
		public uint	width;				// width of input surface

		public uint	pitch;				// linear size
		// distance to start of next line (return value only)
		// Formless late-allocated optimized surface size

		public uint	depth;				// number of back buffers requested
		// the depth if this is a volume texture 

		public uint	mipmap;				// number of mip-map levels requestde

		public uint	alphaBitDepth;		// depth of alpha buffer requested
		public uint	reserved;     		// reserved
		public uint surface;      		// pointer to the associated surface memory

		public uint	cklow;
		public uint	ckhigh;

		public uint	ckDestBltlow;
		public uint	ckDestBlthigh;
		public uint	ckSrcOverlaylow;
		public uint	ckSrcOverlayhigh;
		public uint	ckSrcBltlow;
		public uint	ckSrcBlthigh;
		
		public uint	datasize;
		public uint	pixelflags;
		public uint	fourcc;
		public uint	bitcount;
		public uint	rmask;
		public uint	gmask;
		public uint	bmask;
		public uint	amask;

		public uint	ddcaps1;
		public uint	ddcaps2;
		public uint	ddcaps3;
		public uint	ddcaps4;
		public uint	texstage;

		public void FromBinary(BinaryReader br)
		{
			size = br.ReadUInt32();
			flags = br.ReadUInt32();		
			height = br.ReadUInt32();		
			width = br.ReadUInt32();		
			
			pitch = br.ReadUInt32();		
			depth = br.ReadUInt32();		
			mipmap = br.ReadUInt32();		
			
			alphaBitDepth = br.ReadUInt32();  
			reserved = br.ReadUInt32();    
			surface = br.ReadUInt32();     
			
			cklow = br.ReadUInt32();
			ckhigh = br.ReadUInt32();
			
			ckDestBltlow = br.ReadUInt32();
			ckDestBlthigh = br.ReadUInt32();
			ckSrcOverlaylow = br.ReadUInt32();
			ckSrcOverlayhigh = br.ReadUInt32();
			ckSrcBltlow = br.ReadUInt32();
			ckSrcBlthigh = br.ReadUInt32();
			
			datasize = br.ReadUInt32();
			pixelflags = br.ReadUInt32();
			fourcc = br.ReadUInt32();
			bitcount = br.ReadUInt32();

			rmask = br.ReadUInt32();
			gmask = br.ReadUInt32();
			bmask = br.ReadUInt32();
			amask = br.ReadUInt32();
			
			ddcaps1 = br.ReadUInt32();
			ddcaps2 = br.ReadUInt32();
			ddcaps3 = br.ReadUInt32();
			ddcaps4 = br.ReadUInt32();
			texstage = br.ReadUInt32();
		}

		public void ToBinary(BinaryWriter bw)
		{
			bw.Write(size);
			bw.Write(flags);	
			bw.Write(height);		
			bw.Write(width);	
			
			bw.Write(pitch);	
			bw.Write(depth);	
			bw.Write(mipmap);
			
			bw.Write(alphaBitDepth);
			bw.Write(reserved);
			bw.Write(surface);  
			
			bw.Write(cklow);
			bw.Write(ckhigh);
			
			bw.Write(ckDestBltlow);
			bw.Write(ckDestBlthigh);
			bw.Write(ckSrcOverlaylow);
			bw.Write(ckSrcOverlayhigh);
			bw.Write(ckSrcBltlow);
			bw.Write(ckSrcBlthigh);
			
			bw.Write(datasize);
			bw.Write(pixelflags);
			bw.Write(fourcc);
			bw.Write(bitcount);

			bw.Write(rmask);
			bw.Write(gmask);
			bw.Write(bmask);
			bw.Write(amask);
			
			bw.Write(ddcaps1);
			bw.Write(ddcaps2);
			bw.Write(ddcaps3);
			bw.Write(ddcaps4);
			bw.Write(texstage);
		}
	}

	public struct Image
	{
		public string filename;
		public string name;
		public DDSURFACEDESC2 surdesc;
		public byte[][] data;

		public bool ToBinary(BinaryWriter bw)
		{
			bw.Write(name);
			surdesc.ToBinary(bw);
			bw.Write(data[0].Length);
			bw.Write(data[0]);
			return true;
		}
	}

	public class Data2D
	{
		private int e;
		private string error;
		private Image defImage;
		private ArrayList image;		// contain data of texture
		private int frame;
		private string filename;
		private string name;

		public Data2D()
		{
			image = new ArrayList();
		}

		public Image ReadDDS(string fname)
		{
			try 
			{
				string[] fn;
				char[]	 ch	= {'.','\\'};
			
				Image	pic		= new Image();
				fn	= fname.Split(ch);
				pic.filename	= fname;
				pic.name		= fn[fn.Length-2];
			
				FileStream	fs	= new FileStream(fname, FileMode.Open, FileAccess.Read);
				BinaryReader br = new BinaryReader(fs);
				byte[]	b;	

				uint magic = br.ReadUInt32();
				if (magic!=0x20534444)
				{
					throw new Exception();
					return pic;
				}

				pic.surdesc.FromBinary(br);
				pic.data	= new byte[pic.surdesc.mipmap+1][];

				uint count = pic.surdesc.width*pic.surdesc.height*pic.surdesc.datasize/4;
				pic.data[0]	= br.ReadBytes((int)count);

				return pic;
			}
			catch (Exception)
			{
				throw new Exception();
			}
		}

		public bool FromDDS(string fname)
		{
			defImage = ReadDDS(fname);
			filename = fname;
			name	 = defImage.name;

			return true;
		}

		public bool FromTEX(byte[] data)
		{
			return true;
		}

		public bool ToTex(string fname)
		{
			FileStream	 fs = new FileStream(fname, FileMode.Create, FileAccess.Write);
			BinaryWriter bw = new BinaryWriter(fs);

			bw.Write(0x2032444d);
			bw.Write(name);
			bw.Write(frame);
			defImage.ToBinary(bw);
			bw.Write(image.Count);
			for (int i=0; i<image.Count; i++)
				((Image)image[i]).ToBinary(bw);
			fs.Close();
			return true;
		}

		public string Filename
		{
			get
			{
				return filename;
			}
		}

		public string Name
		{
			get
			{
				return name;
			}
		}

		public Image Default
		{
			get
			{
				return defImage;
			}
		}

		public ArrayList Images
		{
			get
			{
				return image;
			}
		}

		public int FPS
		{
			get
			{
				return frame;
			}
			set
			{
				frame = value;
			}
		}
	}
}
