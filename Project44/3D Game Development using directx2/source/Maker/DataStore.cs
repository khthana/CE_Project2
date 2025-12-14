using System;
using System.IO;
using System.Collections;

namespace Maker
{
	/// <summary>
	/// Summary description for DataStore.
	/// </summary>
	public class FrameEx
	{
		private string name;
		private float[,]	matTran;

		private FrameDesc	fdesc;

		private Vertex[]	vertex;
		private	IndexSet[]	data;
		private string[]	jname;
		private int[]		jindex;
		private float[][,]	joffset;
		private string[]	cname;
		private int[]		cindex;
		private string		pname;
		private int			pindex;

		public FrameEx()
		{
			data	= new IndexSet[0];
			vertex	= new Vertex[0];
			jname	= new string[0];
			jindex	= new int[0];
			joffset	= new float[0][,];
			cname	= new string[0];
			cindex	= new int[0];
		}

		public void ToBinary(BinaryWriter bw)
		{
			int i,j;

			//bw.Write(name.Length);
			bw.Write(name);
			
			for (i=0; i<4; i++)
				for (j=0; j<4; j++)
					bw.Write(matTran[i,j]);

			fdesc.ToBinary(bw);

			// vertex
			for (i=0; i<vertex.Length; i++)
			{
				// position
				vertex[i].p.ToBinary(bw);;
				// blend weight
				for (j=0; (j<fdesc.numBlend)&&(j<4); j++)
					bw.Write(vertex[i].bw[j]);
				// blend index
				for (j=0; (j<fdesc.numBlend)&&(j<4); j++)
					bw.Write(vertex[i].bi[j]);
				// normal
				if (fdesc.bNormal)
					vertex[i].n.ToBinary(bw);
				// tex0
				if (fdesc.bTex0)
					vertex[i].t0.ToBinary(bw);
				// tex1
				if (fdesc.bTex1)
					vertex[i].t1.ToBinary(bw);
			}

			// index
			for (i=0; i<data.Length; i++)
				data[i].ToBinary(bw);
			
			// joint
			for (i=0; i<jindex.Length; i++)
				bw.Write(jindex[i]);
			int k;
			if (joffset!=null)
				for (i=0; i<joffset.Length; i++)
				{
					for (j=0; j<4; j++)
						for (k=0; k<4; k++)
							bw.Write(joffset[i][j,k]);
				}
			
			// child
			for (i=0; i<cindex.Length; i++)
				bw.Write(cindex[i]);

			bw.Write(pindex);
		}

		public string[] JointNames
		{
			get
			{
				return jname;
			}
		}

		public int[] JointIndex
		{
			get
			{
				return jindex;
			}
			set
			{
				jindex = value;
			}
		}

		public string[] ChildNames
		{
			get
			{
				return cname;
			}
		}

		public int[] ChildIndex
		{
			get
			{
				return cindex;
			}
			set
			{
				cindex = value;
			}
		}

		public string ParentName
		{
			get
			{
				return pname;	
			}
		}

		public int ParentIndex
		{
			get
			{
				return pindex;
			}
			set
			{
				pindex = value;
			}
		}

		public IndexSet[] IndexSet
		{
			get
			{
				return data;
			}
		}

		public bool FromFrame(Frame frame)
		{
			name	= frame.Name;
			matTran = frame.MatTran;

			// child
			fdesc.numChild = frame.Child.Count;
			cname	= new string[frame.Child.Count];
			for (int x=0; x<frame.Child.Count; x++)
			{
				Frame cf = (Frame)frame.Child[x];
				cname[x] = cf.Name;
			}
			cindex	= new int[cname.Length];

			// parent
			if (frame.Parent==null)
				pname = "null";
			else
				pname	= frame.Parent.Name;

			if (!frame.Mesh)
				return true;

			// joint
			fdesc.numJoint = frame.BoneName.Length;
			jname	= frame.BoneName;
			joffset	= frame.BoneOffset;
			if (jname!=null)
				jindex	= new int[jname.Length];

			// vertex

			if (frame.Position.Length==0)
			{
				fdesc.numPos		= 0;
				fdesc.numIndexSet	= 0;
				fdesc.numBlend		= 0;
				fdesc.bNormal		= false;
				fdesc.bTex0			= false;
				fdesc.bTex1			= false;
				return true;
			}

			int a,b;
			int lPos = frame.Position.Length;
			vertex	= new Vertex[lPos];
			for (a=0; a<lPos; a++)
			{
				vertex[a].p = frame.Position[a];
				fdesc.numPos = lPos;
			}

			// -- blend
			if (frame.BoneWeight!=null)
				if (frame.BoneWeight.Length>=lPos)
				{
					fdesc.numBlend	= frame.BoneVInf;

					for (a=0; a<lPos; a++)
					{
						vertex[a].bw	= new float[frame.BoneVInf];
						vertex[a].bi	= new byte[frame.BoneVInf];
					
						for (b=0;b<frame.BoneVInf;b++)
						{
							vertex[a].bw[b] = frame.BoneWeight[a,b];
							vertex[a].bi[b]	= frame.BoneIndex[a,b];
						}
					}
				}

			// -- normal
			if (frame.Normal.Length>=lPos)
			{
				fdesc.bNormal = true;
				for (a=0; a<lPos; a++)
				{
					vertex[a].n = frame.Normal[a];
				}
			}

			// -- tex0
			if (frame.TexCoord0.Length>=lPos)
			{
				fdesc.bTex0 = true;
				for (a=0; a<lPos; a++)
				{
					vertex[a].t0 = frame.TexCoord0[a];
				}
			}

			// -- tex1
			if (frame.TexCoord1.Length>=lPos)
			{
				fdesc.bTex1 = true;
				for (a=0; a<lPos; a++)
				{
					vertex[a].t1 = frame.TexCoord1[a];
				}
			}

			ArrayList face = new ArrayList();

			// face
			int i,j;
			ushort[] index;
			fdesc.numIndexSet	= frame.MtrlList.Length;
			data	= new IndexSet[frame.MtrlData.Length];
			for (i=0; i<frame.MtrlList.Length; i++)
			{
				for (j=0; j<frame.MtrlList[i].Length; j++)
				{
					index = frame.Index[frame.MtrlList[i][j]];

					int m = 0;
					do
					{
						if (index.Length-m>3)
						{
							
							face3 f1 = new face3(index[m],index[m+1],index[m+2]);
							face3 f2 = new face3(index[m],index[m+2],index[m+3]);
							face.Add(f1);
							face.Add(f2);
							m++;
							if (index.Length-m==3)
								break;
						}
						else if (index.Length-m==3)
						{
							face3 f = new face3(index[m],index[m+1],index[m+2]);
							face.Add(f);
							break;
						}
						else
							break;
					}
					while (true);
				}

				data[i].f = new face3[face.Count];
				material mat = (material)frame.MtrlData[i];
				data[i].mtrlname = mat.name;
				for (int z=0; z<face.Count; z++)
					data[i].f[z] = (face3)face[z];
			}
			return true;	
		}
	}

	public class Frame
	{
		// attribute
		private bool	 bMesh;
		private bool	 bRender;
		// name
		private string	 name;

		// matrix 
		private float[,] matTran;
		//private float[,] matAnim;
		//private float[,] matRend;
		//private float[,] matUser;

		// vertex
		private vector3d[] vecPos;		// Position
		private vector3d[] vecNorm;		// Normal
		private vector2d[] texCoord0;	// Texture Coordinate Lev 0
		private vector2d[] texCoord1;	// Texture Coordinate Lev 1
		private uint[][]   mtrlList;	// Material List
		private material[] mtrlData;	// Data of Material	
		private float[][]  fDuplicate;	// Duplication data

		// index
		private ushort[][]  index;		// Index = each component consist of any number
		//		private ArrayList  face;		// face = each component consist of 3

		// bone
		private int			bone_vert_inf;		// number of bone influence per vertex
		private int			bone_face_inf;		// number of bone influence per face
		private string[]	bone_name;			// index of bone - store frame name
		private float[,]	bone_weight;		// weight for each bone index
		private byte[,]		bone_index;			// index for eace vertex
		private float[][,]	bone_offset;		// offset of each bone

		// hierachy
		private Frame      parent;
		private ArrayList  child;

		public Frame()
		{
			bMesh = false;
			bRender = true;
			vecPos = new vector3d[0];		
			vecNorm = new vector3d[0];		
			texCoord0 = new vector2d[0];
			texCoord1 = new vector2d[0];
			mtrlList = null;	
			mtrlData = new material[0];	
			index = new ushort[0][];
			fDuplicate = null;
			parent = null;
			child = new ArrayList();
			bone_name = new string[0];
			bone_weight = null;
		}

		public float[,]	  MatTran
		{
			get
			{
				return matTran;
			}
			set
			{
				matTran = value;
			}
		}

		public string Name
		{
			get
			{
				return name;
			}
			set
			{
				name = value;
			}
		}

		public vector3d[] Position
		{
			get
			{
				return vecPos;
			}
			set
			{
				vecPos	= value;
			}
		}

		public vector3d[] Normal
		{
			get
			{
				return vecNorm;
			}
			set
			{
				vecNorm	= value;
			}
		}
		public vector2d[] TexCoord0
		{
			get
			{
				return texCoord0;
			}
			set
			{
				texCoord0	= value;
			}
		}

		public vector2d[] TexCoord1
		{
			get
			{
				return texCoord1;
			}
			set
			{
				texCoord1	= value;
			}
		}

	
		public uint[][]	  MtrlList
		{
			get
			{
				return mtrlList;
			}
			set
			{
				mtrlList = value;
			}
		}

		public material[] MtrlData
		{
			get
			{
				return mtrlData;
			}
			set
			{
				mtrlData = value;
			}
		}

		public float[][]   Duplicate
		{
			get
			{
				return fDuplicate;
			}
			set
			{
				fDuplicate	= value;
			}
		}

		public ushort[][]  Index
		{
			get
			{
				return index;
			}
			set 
			{
				index = value;
			}
		}

		/*public ArrayList  Face
		{
			get
			{
				return face;
			}
		}*/
		public Frame Parent
		{
			get
			{
				return parent;
			}
			set
			{
				parent	= value;
			}
		}

		public ArrayList Child
		{
			get
			{
				return child;
			}
		} 

		public void AddChild(Frame f)
		{
			child.Add(f);
		}

		public int BoneVInf
		{
			get
			{
				return bone_vert_inf;
			}
			set
			{
				bone_vert_inf = value;
			}
		}

		public int BoneFInf
		{
			get
			{
				return bone_face_inf;
			}
			set
			{
				bone_face_inf = value;
			}
		}

		public string[] BoneName
		{
			get
			{
				return bone_name;
			}
			set
			{
				bone_name = value;
			}
		}

		public float[,] BoneWeight
		{
			get
			{
				return bone_weight;
			}
			set
			{
				bone_weight = value;
			}
		}

		public byte[,] BoneIndex
		{
			get
			{
				return bone_index;
			}
			set
			{
				bone_index = value;
			}
		}

		public float[][,] BoneOffset
		{
			get
			{
				return bone_offset;
			}
			set
			{
				bone_offset = value;
			}
		}
		
		public void Tessalate()
		{

		}

		public bool Mesh
		{
			get
			{
				return bMesh;
			}
			set
			{
				bMesh = value;
			}
		}

		public bool Render
		{
			get
			{
				return bRender;
			}
			set
			{
				bRender = value;
			}
		}
	}


	public struct material
	{
		public string name;
		public colorRGBA diffuse;
		public float power;
		public colorRGB specular;
		public colorRGB emissive;

		public void ToBinary(BinaryWriter bw)
		{
			/*bw.Write(name.Length);
			bw.Write(name);*/
			string str = "null";
			diffuse.ToBinary(bw);
			bw.Write(power);
			specular.ToBinary(bw);
			emissive.ToBinary(bw);
		}
	}

	public class MtrlKey
	{
		public string name;
		private material[] mtrl;
		private string texture0;
		private string texture1;
		private int[] key;
		private int size;

		public MtrlKey()
		{
			mtrl = new material[16];
			key	 = new int[16];
			size = 0;
		}

		public void ToBinary(BinaryWriter bw)
		{
			bw.Write(size);
			material m;
			for (int i=0; i<size; i++)
			{
				m = (material)mtrl[i];
				m.ToBinary(bw);
				bw.Write((int)key[i]);
			}
			string str = "null";
			if (texture0==null)
				bw.Write(str);
			else
				bw.Write(texture0);
			if (texture1==null)
				bw.Write(str);
			else
				bw.Write(texture1);
		}

		public material[] Mtrl
		{
			get
			{
				return mtrl;
			}
		}
		public int[] Key
		{
			get
			{
				return key;
			}
		}
		public void Add(material m, int k)
		{
			if (size==15)
				return;
			mtrl[size] = m;
			key[size] = k;
			size++;
		}

		public int Length
		{
			get
			{
				return size;
			}
		}

		public string Tex0
		{
			get
			{
				return texture0;
			}
			set
			{
				texture0 = value;
			}
		}

		public string Tex1
		{
			get
			{
				return texture1;
			}
			set
			{
				texture1 = value;
			}
		}
	}

	public class MtrlSet
	{
		public string		name;
		public material		defmtrl;
		public ArrayList	mtrlkeys;
		public string 		texture0;
		public string 		texture1;

		public MtrlSet()
		{
			mtrlkeys = new ArrayList();
		}

		public void ToBinary(BinaryWriter bw)
		{
			try
			{
				//bw.Write(name.Length);
				bw.Write(name);
				defmtrl.ToBinary(bw);

				if (mtrlkeys==null)
					mtrlkeys = new ArrayList();

				bw.Write(mtrlkeys.Count);
				for (int i=0; i<mtrlkeys.Count; i++)
				{
					MtrlKey mk = (MtrlKey)mtrlkeys[i];
					mk.ToBinary(bw);
				}
				string str = "null";
				if (texture0==null)
					bw.Write(str);
				else
					bw.Write(texture0);
				if (texture1==null)
					bw.Write(str);
				else
					bw.Write(texture1);
			}
			catch (Exception ex)
			{
				throw(ex);
			}
		}
	}

	public struct face3
	{
		public ushort f1, f2, f3;

		public face3(ushort f1, ushort f2, ushort f3)
		{
			this.f1	= f1;
			this.f2	= f2;
			this.f3	= f3;
		}
	}

	public struct AnimeKey3
	{
		public float x, y, z;
		public uint  time;

		public AnimeKey3(float x, float y, float z, uint time)
		{
			this.x = x;
			this.y = y;
			this.z = z;
			this.time = time;
		}
		
		public void ToBinary(BinaryWriter bw)
		{
			bw.Write(time);
			bw.Write(x);
			bw.Write(y);
			bw.Write(z);
		}

	}

	public struct AnimeKey4
	{
		public float x, y, z, w;
		public uint time;

		public AnimeKey4(float x, float y, float z, float w, uint time)
		{
			this.x = x;
			this.y = y;
			this.z = z;
			this.w = w;
			this.time = time;
		}

		public void ToBinary(BinaryWriter bw)
		{
			bw.Write(time);
			bw.Write(x);
			bw.Write(-y);
			bw.Write(-z);
			bw.Write(-w);
		}
	}

	public class AnimeSet
	{
		public string name;
		public int	  findex;
		// translation
		public int nTranKey;
		public AnimeKey3[] tranKeys;

		// rotation
		public int nRotKey;
		public AnimeKey4[] rotKeys;

		// scale
		public int nScaleKey;
		public AnimeKey3[] scaleKeys;

		public void ToBinary(BinaryWriter bw)
		{
			//bw.Write(name.Length);
			bw.Write(name);
			bw.Write(rotKeys.Length);
			bw.Write(scaleKeys.Length);
			bw.Write(tranKeys.Length);

			int i;
			for (i=0; i<rotKeys.Length; i++)
				rotKeys[i].ToBinary(bw);
			for (i=0; i<scaleKeys.Length; i++)
				scaleKeys[i].ToBinary(bw);
			for (i=0; i<tranKeys.Length; i++)
				tranKeys[i].ToBinary(bw);
		}
	}

	public struct Vertex
	{
		public vector3d p;		// position
		public byte[]   bi;		// blend index
		public float[]  bw;		// blend weight
		public vector3d n;		// normal
		public vector2d t0;		// texture coordinate 0
		public vector2d t1;		// texture coordinate 1
	}

	public struct IndexSet
	{
		public face3[]	f;			// index data
		public int		mtrlindex;	// mtrl data
		public string	mtrlname;	// mtrl name

		public void ToBinary(BinaryWriter bw)
		{
			bw.Write(f.Length);
			bw.Write(mtrlindex);
			for (int i=0; i<f.Length; i++)
			{
				bw.Write(f[i].f1);
				bw.Write(f[i].f2);
				bw.Write(f[i].f3);
			}
		}
	}

	public struct FrameDesc
	{
		public int	numPos;			// number of data in position field
		public int	numBlend;		// number of element in blend field
		public bool bNormal;		// exist of normal
		public bool	bTex0;			// exist of tex0
		public bool	bTex1;			// exist of tex1
		public int	numIndexSet;	// number of index set
		public int	numChild;		// number of child
		public int	numJoint;		// number of joint

		public void ToBinary(BinaryWriter bs)
		{
			bs.Write(numPos);
			bs.Write(numBlend);	
			if (bNormal)
				bs.Write((int)1);
			else 
				bs.Write((int)0);
			if (bTex0)
				bs.Write((int)1);
			else 
				bs.Write((int)0);
			if (bTex1)
				bs.Write((int)1);
			else 
				bs.Write((int)0);
			/*bs.Write(bTex0);		
			bs.Write(bTex1);*/
			bs.Write(numIndexSet);
			bs.Write(numChild);	
			bs.Write(numJoint);	
		}
	}



	public class Anime
	{
		private ArrayList animeSet;
		private string name;

		public Anime()
		{
			animeSet = new ArrayList();
		}

		public bool Add(AnimeSet anim)
		{
			animeSet.Add(anim);
			return true;
		}

		public void ToBinary(BinaryWriter bw)
		{
			//bw.Write(name.Length);
			bw.Write(name);
			bw.Write(animeSet.Count);

			for (int i=0; i<animeSet.Count; i++)
			{
				AnimeSet aset = (AnimeSet)animeSet[i];
				aset.ToBinary(bw);
			}
		}

		public ArrayList Sets
		{
			get
			{
				return animeSet;
			}
		}

		public string Name
		{
			get
			{
				return name;
			}
			set
			{
				name = value;
			}
		}
	}

	public class colliser
	{
		public string name;
		public string parent;
		public Frame data;
		public int type;
		public float radius;
		public float height;

		public colliser()
		{
			type = 0; // unknown
			parent = "null";
			data = null;
			radius = 0;
			height = 0;
		}
	}
}
