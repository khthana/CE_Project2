using System;
using System.IO;
using System.Collections;

namespace Maker
{
	/// <summary>
	/// Summary description for Data3D.
	/// </summary>
	public class Data3D
	{
		private int e;
		private string error;
		private ArrayList frame;
		private FrameEx[] framex;
		private ArrayList mtrlset;
		private ArrayList anime;
		private ArrayList collide;
		private string name;
		private string filename;

		private bool readMesh(Frame data, Queue tokens)
		{
			vector3d[]	vecPos;		
			vector3d[]	vecNorm;		
			vector2d[]	texCoord0;	
			ArrayList[] mtrlList;	
			material[]	mtrlData;	
			ArrayList[]	fDuplicate;	
			ushort[][]	index;
			int 		bvert_inf	= 0;
			int 		bface_inf	= 0;
			int 		bnum		= 0;
			string[] 	bname		= new string[0];
			float[,] 	bw			= null;
			byte[,]		bi			= null;
			ArrayList[]	bindex		= null;
			ArrayList[] bweight		= null;
			float[][,]	boffset		= null;
			
			int	size;
			int element;
			int i,j;

			try 
			{

				tokens.Dequeue();	// {

				// read position
				size	= int.Parse(tokens.Dequeue().ToString());
				vecPos	= new vector3d[size];
				for (i=0; i<size; i++)
				{
					vecPos[i].x	= float.Parse(tokens.Dequeue().ToString());
					vecPos[i].y	= float.Parse(tokens.Dequeue().ToString());
					vecPos[i].z	= float.Parse(tokens.Dequeue().ToString());
				}
				// end 

				data.Mesh = true;

				// read index
				size	= int.Parse(tokens.Dequeue().ToString());
				index	= new ushort[size][];
				for (i=0; i<size; i++)
				{
					element	= int.Parse(tokens.Dequeue().ToString());
					index[i]	= new ushort[element];
					for (j=0; j<element; j++)
						index[i][j]	= ushort.Parse(tokens.Dequeue().ToString());
				}
				// end

				// read normal
				if (tokens.Dequeue().ToString()!="meshnormals")
				{
					return false;
				}
				tokens.Dequeue();	// {
				size	= int.Parse(tokens.Dequeue().ToString());
				vecNorm	= new vector3d[size];
				for (i=0; i<size; i++)
				{
					vecNorm[i].x	= float.Parse(tokens.Dequeue().ToString());
					vecNorm[i].y	= float.Parse(tokens.Dequeue().ToString());
					vecNorm[i].z	= float.Parse(tokens.Dequeue().ToString());
				}
				while (tokens.Dequeue().ToString()!="}")
					;
				// end

				// read texcoord
				if (tokens.Dequeue().ToString()!="meshtexturecoords")
				{
					return false;
				}
				tokens.Dequeue();	// {
				size	= int.Parse(tokens.Dequeue().ToString());
				texCoord0	= new vector2d[size];
				for (i=0; i<size; i++)
				{
					texCoord0[i].x	= float.Parse(tokens.Dequeue().ToString());
					texCoord0[i].y	= float.Parse(tokens.Dequeue().ToString());
				}
				tokens.Dequeue();	// }
				// end

				// read mtrllist
				if (tokens.Dequeue().ToString()!="meshmateriallist")
				{
					return false;
				}
				tokens.Dequeue();	// {
				size	= int.Parse(tokens.Dequeue().ToString());
				element	= int.Parse(tokens.Dequeue().ToString());
				mtrlList	= new ArrayList[size];
				mtrlData	= new material[size];
				for (i=0; i<size; i++)
					mtrlList[i]	= new ArrayList();
				for (i=0; i<element; i++)
				{
					uint x	= uint.Parse(tokens.Dequeue().ToString());
					mtrlList[x].Add(i);
				}
														
				// read mtrl
				for (i=0; i<size; i++)
				{
					if (tokens.Dequeue().ToString()!="material")
					{
						return false;
					}
					mtrlData[i].name		= tokens.Dequeue().ToString();
					tokens.Dequeue();	// {
					mtrlData[i].diffuse.r	= float.Parse(tokens.Dequeue().ToString());
					mtrlData[i].diffuse.g	= float.Parse(tokens.Dequeue().ToString());
					mtrlData[i].diffuse.b	= float.Parse(tokens.Dequeue().ToString());
					mtrlData[i].diffuse.a	= float.Parse(tokens.Dequeue().ToString());
					mtrlData[i].power		= float.Parse(tokens.Dequeue().ToString());
					mtrlData[i].specular.r	= float.Parse(tokens.Dequeue().ToString());
					mtrlData[i].specular.g	= float.Parse(tokens.Dequeue().ToString());
					mtrlData[i].specular.b	= float.Parse(tokens.Dequeue().ToString());
					mtrlData[i].emissive.r	= float.Parse(tokens.Dequeue().ToString());
					mtrlData[i].emissive.g	= float.Parse(tokens.Dequeue().ToString());
					mtrlData[i].emissive.b	= float.Parse(tokens.Dequeue().ToString());
					if (tokens.Peek().ToString()=="texturefilename")
					{
						while (tokens.Dequeue().ToString()!="}")
							;
					}
					tokens.Dequeue();	//}
				}
				// end
				tokens.Dequeue();	// }
				// end

				// read duplication
				if (tokens.Dequeue().ToString()!="vertexduplicationindices")
				{
					return false;
				}
				tokens.Dequeue();	// {
				element	= int.Parse(tokens.Dequeue().ToString());
				size	= int.Parse(tokens.Dequeue().ToString());
				fDuplicate	= new ArrayList[size];
				for (i=0; i<size; i++)
					fDuplicate[i]	= new ArrayList();
				for (i=0; i<element; i++)
					fDuplicate[int.Parse(tokens.Dequeue().ToString())].Add(i);
				tokens.Dequeue();	// }

				// read bone-blend weight
				if (tokens.Peek().ToString()=="xskinmeshheader")
				{
					tokens.Dequeue();
					tokens.Dequeue(); //{
					bvert_inf	= int.Parse(tokens.Dequeue().ToString());
					bface_inf	= int.Parse(tokens.Dequeue().ToString());
					bnum		= int.Parse(tokens.Dequeue().ToString());
					bname		= new string[bnum];
					bw			= new float[vecPos.Length, bvert_inf];
					bi			= new byte[vecPos.Length, bvert_inf];
					bweight		= new ArrayList[vecPos.Length];
					bindex		= new ArrayList[vecPos.Length];
					boffset		= new float[bnum][,];
					tokens.Dequeue(); //}

					for (i=0; i<bweight.Length; i++)
					{
						bweight[i] = new ArrayList();
						bindex[i] = new ArrayList();
					}

					for (i=0; i<bnum; i++)
					{
						if (tokens.Dequeue().ToString()!="skinweights")
							return false;

						tokens.Dequeue(); //{
						bname[i] = tokens.Dequeue().ToString();
						int elements = int.Parse(tokens.Dequeue().ToString());
						int[] index2	 = new int[elements];

						for (j=0; j<elements; j++)
							index2[j] = int.Parse(tokens.Dequeue().ToString());
						
						for (j=0; j<elements; j++)
						{
							bweight[index2[j]].Add(float.Parse(tokens.Dequeue().ToString()));
							bindex[index2[j]].Add((byte)i);
						}

						boffset[i]	= new float[4,4];
						for (int x=0; x<4; x++)
						{
							for (int y=0; y<4; y++)
							{
								boffset[i][x,y] = float.Parse(tokens.Dequeue().ToString());
							}
						}

						tokens.Dequeue(); //}
					}

					for (i=0; i<vecPos.Length; i++)
					{
						for (j=0; (j<bweight[i].Count) && (j<bvert_inf); j++)
						{
							bw[i,j] = float.Parse(bweight[i][j].ToString());
							bi[i,j]	= (byte)bindex[i][j];
						}
					}
				}
				// end

				tokens.Dequeue();	// }

				// post process
				uint[][]	ml	= new uint[mtrlList.Length][];
				float[][]	fd	= new float[fDuplicate.Length][];
				for (i=0; i<mtrlList.Length; i++)
				{
					ml[i]	= new uint[mtrlList[i].Count];
					for (j=0; j<mtrlList[i].Count; j++)
					{
						ml[i][j]	= uint.Parse(mtrlList[i][j].ToString());
					}
				}
				for (i=0; i<fDuplicate.Length; i++)
				{
					fd[i]	= new float[fDuplicate[i].Count];
					for (j=0; j<fDuplicate[i].Count; j++)
					{
						fd[i][j]	= float.Parse(fDuplicate[i][j].ToString());
					}
				}
				// fill data
				data.Position	= vecPos;
				data.Normal		= vecNorm;
				data.TexCoord0	= texCoord0;
				data.TexCoord1	= new vector2d[0];
				data.MtrlList	= ml;
				data.MtrlData	= mtrlData;
				data.Duplicate	= fd;
				data.Index		= index;
				data.BoneVInf	= bvert_inf;
				data.BoneFInf	= bface_inf;
				data.BoneName	= bname;
				data.BoneWeight	= bw;
				data.BoneIndex	= bi;
				data.BoneOffset	= boffset;
			}
			catch (InvalidOperationException)
			{
				e	= 1;
				return false;
			}
			catch (FormatException)
			{
				e	= 2;
				return false;
			}
			catch (ArgumentOutOfRangeException)
			{
				e	= 3;
				return false;
			}

			return true;
		}

		private bool readFrame(Frame data, Queue tokens)
		{		
			float[,]   matTran	= new float[4,4];

			try
			{
				// Frmae name
				data.Name	= tokens.Dequeue().ToString();
				tokens.Dequeue();	// {

				// Frame Transformation Matrix
				if (tokens.Dequeue().ToString()!="frametransformmatrix")
					return false;
				tokens.Dequeue();	// {

				int i,j;
				for (i=0; i<4; i++)
				{
					for (j=0; j<4; j++)
					{
						matTran[i,j] = float.Parse(tokens.Dequeue().ToString());
					}
				}
				data.MatTran = matTran;
				tokens.Dequeue();	//}

				while (true)
				{
					switch (tokens.Dequeue().ToString())
					{
						case "frame":
							// child frame , no mesh
							Frame child	= new Frame();
							frame.Add(child);
							child.Parent = data;
							data.AddChild(child);
							readFrame(child, tokens);
							break;
						case "mesh":
							// mesh
							readMesh(data, tokens);
							break;
						case "}":
							// no child, no mesh
							return true;
					}
				}
			}
			catch (InvalidOperationException)
			{
				e = 1;
				return false;
			}
			catch (FormatException)
			{
				e = 2;
				return false;
			}
		}

		private bool readAnimation(Queue tokens, AnimeSet aset)
		{
			int type;
			int num;
			int i;
			//AnimeSet aset = new AnimeSet();
			try
			{
				tokens.Dequeue(); //{
				tokens.Dequeue(); //{
			
				
				aset.name	= tokens.Dequeue().ToString();
				tokens.Dequeue(); //}
			
				while (tokens.Dequeue().ToString()=="animationkey")
				{
					tokens.Dequeue(); //{
					type = int.Parse(tokens.Dequeue().ToString());
					num	 = int.Parse(tokens.Dequeue().ToString());

					switch (type)
					{
						case 0:
							aset.nRotKey = num;
							aset.rotKeys = new AnimeKey4[num];
							for (i=0; i<num; i++)
							{
								int  numKey;
								aset.rotKeys[i].time = uint.Parse(tokens.Dequeue().ToString());
								numKey = int.Parse(tokens.Dequeue().ToString());
								if (numKey!=4)
									return false;
								aset.rotKeys[i].x = float.Parse(tokens.Dequeue().ToString());
								aset.rotKeys[i].y   = float.Parse(tokens.Dequeue().ToString());
								aset.rotKeys[i].z   = float.Parse(tokens.Dequeue().ToString());
								aset.rotKeys[i].w   = float.Parse(tokens.Dequeue().ToString());
								
							}
							break;
						case 1:
							aset.nScaleKey = num;
							aset.scaleKeys = new AnimeKey3[num];
							for (i=0; i<num; i++)
							{
								int  numKey;
								aset.scaleKeys[i].time = uint.Parse(tokens.Dequeue().ToString());
								numKey = int.Parse(tokens.Dequeue().ToString());
								if (numKey!=3)
									return false;
								aset.scaleKeys[i].x = float.Parse(tokens.Dequeue().ToString());
								aset.scaleKeys[i].y   = float.Parse(tokens.Dequeue().ToString());
								aset.scaleKeys[i].z   = float.Parse(tokens.Dequeue().ToString());	
							}
							break;
						case 2:
							aset.nTranKey = num;
							aset.tranKeys = new AnimeKey3[num];
							for (i=0; i<num; i++)
							{
								int  numKey;
								aset.tranKeys[i].time = uint.Parse(tokens.Dequeue().ToString());
								numKey = int.Parse(tokens.Dequeue().ToString());
								if (numKey!=3)
									return false;
								aset.tranKeys[i].x = float.Parse(tokens.Dequeue().ToString());
								aset.tranKeys[i].y   = float.Parse(tokens.Dequeue().ToString());
								aset.tranKeys[i].z   = float.Parse(tokens.Dequeue().ToString());	
							}
							break;							
						default:
							return false;
					}

					tokens.Dequeue(); //}
				}
			}
			catch (InvalidOperationException)
			{
				e = 1;
				return false;
			}
			catch (FormatException)
			{
				e = 2;
				return false;
			}

			//tokens.Dequeue(); //}

			return true;
		}

		private bool readAnimationSet(Queue tokens)
		{
			tokens.Dequeue(); //{
			Anime an = new Anime();

			while (tokens.Peek().ToString()!="}")
			{
				switch (tokens.Dequeue().ToString())
				{
					case "animation":
						AnimeSet aset = new AnimeSet();
						if (!readAnimation(tokens,aset))
							return false;
						an.Add(aset);
						break;
					default:
						return false;
				}
			}

			if (an.Sets.Count>0)
			{
				an.Name = name+"/anime";
				anime.Add(an);
			}
	
			return true;
		}

		public Data3D()
		{
			//
			// TODO: Add constructor logic here
			//
			e	= 0;
			frame	= new ArrayList();
			mtrlset = new ArrayList();
			anime	= new ArrayList();
			collide = new ArrayList();
		}

		public bool findMtrl()
		{
			bool found;
			for (int i=0; i<frame.Count; i++)
			{
				Frame f = (Frame)frame[i];
				if (f.MtrlData == null)
					continue;

				for (int j=0; j<f.MtrlData.Length; j++)
				{
					found = false;
					for (int k=0; k<mtrlset.Count; k++)
					{
						MtrlSet ms = (MtrlSet)mtrlset[k];
						if (ms.defmtrl.name==f.MtrlData[j].name)
							found = true;
					}
					if (!found)
					{
						MtrlSet newms = new MtrlSet();
						newms.name = f.MtrlData[j].name;
						newms.defmtrl = f.MtrlData[j];
						mtrlset.Add(newms);
					}
				}
			}
			return true;	
		}

		public bool FromX(Queue tokens, string fname)
		{
			string[] fn;
			char[]	 ch	= {'.','\\'};
			fn	= fname.Split(ch);
			filename	= fname;
			name		= fn[fn.Length-2];

			if (tokens.Peek().ToString() !="xof")
			{
				e	= 1;
				return false;
			}

			while (tokens.Count>0)
			{
				switch (tokens.Dequeue().ToString())
				{
					case "frame":
						Frame	root = new Frame();
						root.Parent	= null;
						frame.Add(root);
						if (!readFrame(root,tokens))
							return false;
						break;

					case "animationset":
						if (!readAnimationSet(tokens))
							return false;
						break;
				}
			}		
			
			findMtrl();

			return true;
		}

		public bool FromMD2(byte[] data)
		{

			return true;
		}

		public bool ToMD2(string fname)
		{
			FileStream	 fs = new FileStream(fname, FileMode.Create, FileAccess.Write);
			BinaryWriter bw = new BinaryWriter(fs);

			bw.Write(0x2032444d);
			//bw.Write(name.Length);
			bw.Write(name);
			bw.Write(frame.Count);
			bw.Write(mtrlset.Count);
			bw.Write(anime.Count);
			bw.Write(collide.Count);

			int i,j,k;
			// write framex
			framex	= new FrameEx[frame.Count];

			for (i=0; i<frame.Count; i++)
			{
				FrameEx fx	= new FrameEx();
				fx.FromFrame((Frame)frame[i]);

				for (j=0; j<fx.ChildNames.Length; j++)
				{
					for (k=0; k<frame.Count; k++)
					{
						Frame f = (Frame)frame[k];
						if (fx.ChildNames[j]==f.Name)
						{
							fx.ChildIndex[j] = k;
							break;
						}
						fx.ChildIndex[j] = -1;
					}
				}

				for (j=0; j<fx.JointNames.Length; j++)
				{
					for (k=0; k<frame.Count; k++)
					{
						Frame f = (Frame)frame[k];
						if (fx.JointNames[j]==f.Name)
						{
							fx.JointIndex[j] = k;
							break;
						}
						fx.JointIndex[j] = -1;
					}
				}

				for (k=0; k<frame.Count; k++)
				{
					Frame f = (Frame)frame[k];
					if (fx.ParentName==f.Name)
					{
						fx.ParentIndex = k;
						break;
					}
					fx.ParentIndex = -1;
				}

				for (j=0; j<fx.IndexSet.Length; j++)
				{
					for (k=0; k<mtrlset.Count; k++)
					{
						MtrlSet m = (MtrlSet)mtrlset[k];
						if (fx.IndexSet[j].mtrlname==m.name)
						{
							fx.IndexSet[j].mtrlindex = k;
							break;
						}
						fx.IndexSet[j].mtrlindex = -1;
					}
				}

				framex[i] = fx;
			}

			for (i=0; i<framex.Length; i++)
			{
				framex[i].ToBinary(bw);
			}
			
			// write mtrlset
			for (i=0; i<mtrlset.Count; i++)
			{
				MtrlSet ms = (MtrlSet)mtrlset[i];
				ms.ToBinary(bw);
			}

			// write anime
			for (i=0; i<anime.Count; i++)
			{
				Anime a = (Anime)anime[i];

				for (j=0; j<a.Sets.Count; j++)
				{
					for (k=0; k<frame.Count; k++)
					{
						Frame f = (Frame)frame[k];
						AnimeSet aset = (AnimeSet)a.Sets[j];
						if (aset.name==f.Name)
						{
							aset.findex = k;
							break;
						}
						aset.findex = -1;
					}
				}

				a.ToBinary(bw);
			}

			// write collide
			for (i=0; i<collide.Count; i++)
			{
				colliser c = (colliser)collide[i];
				bw.Write(c.type);
				bw.Write(c.name);
				bw.Write(c.parent);
				bw.Write(c.radius);
				bw.Write(c.height);
				
				if ((c.type==1)||(c.type==2))
				{
					bw.Write(c.data.Position.Length);
					for (int x=0; x<c.data.Position.Length; x++)
						c.data.Position[x].ToBinary(bw);
					
					// face
					ArrayList f3 = new ArrayList();

					for (int x=0; x<c.data.Index.Length;x++)
					{
						int m=0;
						ushort[] index = c.data.Index[x];
						do
						{
							if (index.Length-m>3)
							{
						
								face3 f1 = new face3(index[m],index[m+1],index[m+2]);
								face3 f2 = new face3(index[m+1],index[m+2],index[m+3]);
								f3.Add(f1);
								f3.Add(f2);
								m++;
								if (index.Length-m==3)
									break;
							}
							else if (index.Length-m==3)
							{
								face3 f = new face3(index[m],index[m+1],index[m+2]);
								f3.Add(f);
								break;
							}
							else
								return false;
						}
						while (true);
					}

					bw.Write(f3.Count);
					for (int x=0; x<f3.Count; x++)
					{
						bw.Write(((face3)f3[x]).f1);
						bw.Write(((face3)f3[x]).f2);
						bw.Write(((face3)f3[x]).f3);
					}
				}
			}
			fs.Close();
			return true;
		}

		public ArrayList Frames
		{
			get
			{
				return frame;
			}
		}

		public ArrayList Mtrls
		{
			get
			{
				return mtrlset;
			}
		}

		public ArrayList Animes
		{
			get
			{
				return anime;
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

		public string FileName
		{
			get
			{
				return filename;
			}
		}

		public ArrayList Colliser
		{
			get
			{
				return collide;
			}
			set
			{
				collide = value;
			}
		}
	}
}
