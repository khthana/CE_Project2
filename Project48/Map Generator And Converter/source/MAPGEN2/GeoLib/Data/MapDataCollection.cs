///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada 
///Distributed under GNU-LGPL, see a copy of the license in root directory

using System;
using System.Collections;
using System.Reflection;
using System.CodeDom;
using System.CodeDom.Compiler;
using System.Xml;
using System.Xml.Schema;
using System.Xml.Serialization;
using System.Globalization;
using System.Drawing;

using GeoCon.Classification;

namespace GeoCon.Data
{
	/// <summary>
	/// Collection of MapData.
	/// </summary>
	[Serializable]
	public class MapDataCollection : CollectionBase
	{

		/// <summary>
		/// Constructs empty collection.
		/// </summary>
		public MapDataCollection()
		{
			initNamespaces();
		}


		#region private fields
		private System.Collections.Hashtable _ns=new Hashtable();  //XmlNamespaceManager can't cross appdomain boundary
		private System.AppDomain dynoDomain; //domain where the dynamic assembly loaded
		private string dynoAssName;	//name of the dynamic assembly
		private string targetfile; //export target file name
		#endregion

		#region basic props & methods

		/// <summary>
		/// Gets MapData at specified index.
		/// </summary>
		public MapData this[int index]
		{
			get{return (MapData)List[index];}
		}

		/// <summary>
		/// Adds new MapData into the collection
		/// </summary>
		/// <param name="map">MapData to add</param>
		/// <returns>index of the newly added mapdata</returns>
		public int Add(MapData map)
		{
			//add default prefix:namespacename
			map.NamespacePrefix ="gc";
			map.NamespaceName = getNS(map.NamespacePrefix);
			return this.List.Add(map);
		}

		/// <summary>
		/// do some minor clean up. currently unused
		/// </summary>
		public void CleanUp()
		{
			dynoAssName=null;
			targetfile=null;
		}

		private string desc="description for FeatureCollection.";
		/// <summary>
		/// Gets or sets description about this MapDataCollection.
		/// </summary>
		public string Description
		{
			get{return desc;}
			set{desc=value;}
		}

		/// <summary>
		/// Gets the number of active MapData in this collection
		/// </summary>
		/// <returns>number of active MapData in this collection</returns>
		private int getActiveCount()
		{
			int count=0;
			for(int i=0;i<this.Count;i++)
			{
				if(this[i].isActive) count++;
			}
			return count;
		}

		/// <summary>
		/// Changes the item position in this collection.
		/// </summary>
		/// <param name="idxfrom">Index of the item to move</param>
		/// <param name="idxto">Index to where the item should be moved.</param>
		public void MoveItem(int idxfrom,int idxto)
		{
			MapData temp = this[idxfrom];
			this.List.RemoveAt(idxfrom);
			this.List.Insert(idxto,temp);
			temp=null;
		}


		/// <summary>
		/// Initializes namespaces for SVG and GML
		/// </summary>
		private void initNamespaces()
		{
			_ns.Add("", "http://www.mycgiserver.com/~amri/percobaan"); 
			_ns.Add("gc", "http://www.mycgiserver.com/~amri/percobaan");
			_ns.Add("gml", "http://www.opengis.net/gml"); 
			_ns.Add("wfs", "http://www.opengis.net/wfs");
			_ns.Add("xs", "http://www.w3.org/2001/XMLSchema");
			_ns.Add("xsi", "http://www.w3.org/2001/XMLSchema-instance");
			_ns.Add("xlink", "http://www.w3.org/1999/xlink");
			_ns.Add("svg", "http://www.w3.org/2000/svg");
		}


		/// <summary>
		/// Gets a namespace name
		/// </summary>
		/// <param name="prefix">prefix of the namespace</param>
		/// <returns>Namespace name corresponds to the prefix</returns>
		private string getNS(string prefix)
		{
			return _ns[prefix].ToString();
		}

		/// <summary>
		/// Gets the Bounding Box which is the union of all Bounding Box of each map.
		/// </summary>
		/// <returns></returns>
		public gml.BoxType GetBoundingBox()
		{
			//TODO : check if map contain valid bound, else return box null
			gml.BoxType box = new gml.BoxType(double.MaxValue,double.MinValue,double.MinValue,double.MaxValue);
			for(int i=0;i<this.Count;i++) box.UnionWith(this[i].BoundingBox);
			return box;
		}
		#endregion

		#region codebuilder stuff
		/// <summary>
		/// Compiles the dynamic code for this MapDataCollection.
		/// </summary>
		/// <returns>File path to the new assembly.</returns>
		public string CompileCode()
		{
			CompilerResults crs = GetCompilerResult();
			if(crs.Errors.Count>0)
			{
				System.Text.StringBuilder sb=new System.Text.StringBuilder();
				sb.Append("ERRORs in compiling dynamic assembly :\n"); 
				for(int k=0;k<crs.Errors.Count;k++  )	
				{
					sb.Append(crs.Errors[k].ToString() + "\t");
				}
				throw new Exception(sb.ToString());
			}
			return crs.PathToAssembly;
		}

		/// <summary>
		/// Creates a compile unit and compile the code compile unit.
		/// </summary>
		/// <returns>results of the compilation</returns>
		private CompilerResults GetCompilerResult()
		{
			CodeCompileUnit ccu = new CodeCompileUnit(); 
			ccu.Namespaces.Add(CreateCodeNamespace());

			CodeDomProvider provider = new Microsoft.CSharp.CSharpCodeProvider(); 
			string basedir=System.AppDomain.CurrentDomain.BaseDirectory; 
			string savedir=basedir;
			if(!System.IO.Directory.Exists(savedir)) System.IO.Directory.CreateDirectory(savedir);

			ICodeCompiler comp = provider.CreateCompiler();
			CompilerParameters options = new CompilerParameters();
			options.ReferencedAssemblies.AddRange(referCurrentAssemblies()); 

			options.OutputAssembly = savedir+"\\dyno.dll";

			options.GenerateInMemory=false;
			options.TreatWarningsAsErrors=true;
			options.GenerateExecutable=false;
			options.TempFiles = new TempFileCollection(savedir,false);
			options.Evidence = System.AppDomain.CurrentDomain.Evidence;

			return comp.CompileAssemblyFromDom(options,ccu);
		}
		/// <summary>
		/// Gets references to assemblies needed for compilation.
		/// </summary>
		/// <returns>array of paths to the assembly files</returns>
		private static string[] referCurrentAssemblies()
		{
			Assembly[] ass = System.AppDomain.CurrentDomain.GetAssemblies();
			string[] ss = new string[ass.Length];
			for (int i = 0; i<ass.Length;i++)
			{
				if(ass[i].GetName().Name=="GeoLib" || ass[i].GetName().Name=="System.Xml")
				{
					ss[i]=ass[i].Location;		//break;
				}
			}
			ass=null;
			return ss;
		}

		/// <summary>
		/// Creates code namespace for the dynamic code
		/// </summary>
		/// <returns>codenamespace for this MapDataCollection</returns>
		private CodeNamespace CreateCodeNamespace()
		{
			string CLRNamespace="Dyno";
			CodeNamespace cns=new CodeNamespace(CLRNamespace);
			cns.Imports.Add(new CodeNamespaceImport("System"));  
			cns.Imports.Add(new CodeNamespaceImport("System.Xml.Serialization"));  
			cns.Imports.Add(new CodeNamespaceImport("GeoCon.Data"));  

			//add each MapData codetypedeclaration into this codenamespace
			for(int i=0;i<Count;i++)
			{
				if(!this[i].isActive) continue;
				cns.Types.Add(this[i].getCodeType());
			}

			//add factory class
			cns.Types.Add(CreateFactoryCodeType());

			return cns;
		}

		/// <summary>
		/// Creates dynamic code declaration for this MapDataCollection.
		/// </summary>
		/// <returns>new CodeTypeDeclaration</returns>
		private CodeTypeDeclaration CreateFactoryCodeType()
		{
			//create new factory class
			CodeTypeDeclaration ctDecl = new CodeTypeDeclaration("DynoFactory");

			//add default constructor
			CodeConstructor defcon = new CodeConstructor();
			defcon.Attributes = MemberAttributes.Public; 
			ctDecl.Members.Add(defcon);

			//add factory method for each mapdata
			for(int i=0;i<this.Count;i++)
			{
				if(!this[i].isActive) continue;
				System.Text.StringBuilder snip = new System.Text.StringBuilder();
				snip.Append("public object[] Create"+this[i].Name+"Array(int count, FieldCollection fs)\r");
				snip.Append("{\r"); 
				snip.Append("object[] objs=new object[count];\r");
					snip.Append("for(int i=0;i<count;i++)\r");
					snip.Append("{\r"); 
					snip.Append(""+this[i].Name+" obj=new "+this[i].Name+"();\r");
					snip.Append("obj.fid = \"" + this[i].Name + "\"+\"_\"" + "+i.ToString()"+";\r");
				for(int j=0;j<this[i].Fields.Count;j++)
				{
					if(!this[i].Fields[j].isActive) continue;
					snip.Append("if( fs["+j.ToString()+"][i] != fs["+j.ToString()+"].NullSymbol )"+"obj."+this[i].Fields[j].Name+"=("+ this[i].Fields[j].Type.ToString()+")fs["+j.ToString()+"][i];\r" );
				}
					snip.Append("objs[i]=obj;\r");
					snip.Append("}\r");

				snip.Append("return objs;\r");
				snip.Append("}\r"); 
				ctDecl.Members.Add(new CodeSnippetTypeMember(snip.ToString()));
				snip=null;
			}
			return ctDecl;
		}

		#endregion

		#region schema stuff
		/// <summary>
		/// Write application schema associated with this MapDataCollection.
		/// </summary>
		/// <param name="SchemaFileString">path to schema file to create</param>
		/// <param name="CompileSchema">value indicating whether to compile schema</param>
		public void writeApplicationSchema(string SchemaFileString, bool CompileSchema)
		{
			UpdateStatus("writing application schema...",0);

			XmlSchema xs = new XmlSchema();
			xs.TargetNamespace=getNS("gc");

			xs.Version="1.0";
			xs.ElementFormDefault = XmlSchemaForm.Qualified; 
			xs.AttributeFormDefault = XmlSchemaForm.Unqualified; 

			xs.Namespaces.Add("gc", getNS("gc"));
			xs.Namespaces.Add("gml", getNS("gml"));
			xs.Namespaces.Add("xs", getNS("xs"));

			System.Xml.Schema.XmlSchemaImport ximport = new XmlSchemaImport();
			ximport.Namespace = getNS("gml");
			ximport.SchemaLocation = "feature.xsd";
			xs.Includes.Add(ximport);
			
			XmlQualifiedName thebase = new XmlQualifiedName("AbstractFeatureType", getNS("gml"));
			XmlQualifiedName thesub  = new XmlQualifiedName("_Feature", getNS("gml"));
			for(int i=0;i<this.Count;i++)
			{
				if(!this[i].isActive) continue;
				this[i].createSchemaType(ref xs,thebase,thesub);
			}
			if(CompileSchema) xs.Compile(new ValidationEventHandler(XSCompileCallback));

			System.IO.FileStream fs = new System.IO.FileStream(SchemaFileString,System.IO.FileMode.Create);
			xs.Write(fs);
			fs.Close();

			xs=null;
			thebase=null;
			thesub=null;
		}
		/// <summary>
		/// Callback method for schema compilation.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="args"></param>
		public static void XSCompileCallback(object sender, ValidationEventArgs args)
		{
			System.Diagnostics.Debug.WriteLine(args.Message);
		}
		#endregion

		#region gml stuff
		/// <summary>
		/// Export this MapDataCollection to GML document.
		/// </summary>
		/// <param name="gmlfilename">path to GML file to create</param>
		/// <param name="validateOutput">value indicating whether the output should be validated</param>
		public void ExportGML(string gmlfilename, bool validateOutput)
		{
			this.targetfile=gmlfilename;
			//create and save dynamic assembly code
			UpdateStatus("processing dynamic assembly...",10);
			string asspath = this.CompileCode();
			try
			{
				//create new appdomain
				ProcessAssembly(asspath);	
				//load dynamic assembly into the new appdomain; execute callback
				dynoDomain.DoCallBack(new CrossAppDomainDelegate(LoaderCallBack));
				//serialize the dynamic class
				UpdateStatus("constructing feature members...",30);
				dynoDomain.DoCallBack(new CrossAppDomainDelegate(SerializeCallBack));
			}
			catch (System.Exception exc)
			{
				UpdateStatus("export to GML failed.",0);
				throw new Exception("Export to GML failed :\r"+exc.Message +"\rinner exception : "+exc.InnerException.Message );
			}
			finally
			{
//				System.Delegate[] hds = StatusChange.GetInvocationList();
//				Console.WriteLine("delegatesA {0}",hds.Length);
//				for(int i=0;i<hds.Length;i++)
//				{
//					this.StatusChange-=(StatusEventHandler)hds[i];
//				}
//				hds=null;

				UnloadDynoDomain(validateOutput);
			}
		}

		
		private void UnloadDynoDomain(bool validateOutput)
		{
			try
			{
				System.AppDomain.Unload(dynoDomain);
				dynoDomain=null;
			}
			catch (System.Exception exc)
			{
				throw new Exception("Unloading dynamic domain failed :\r"+exc.Message);
			}
			if(validateOutput) ValidateGML();
		}

		/// <summary>
		/// Validates the output GML file.  
		/// The necessary schemas should be accessible, or else.
		/// </summary>
		private void ValidateGML()
		{
			XmlTextReader tr = new XmlTextReader(this.targetfile);
			XmlValidatingReader vr = new XmlValidatingReader(tr);
			vr.ValidationType = ValidationType.Schema;
			vr.Schemas.Add(getNS("gml"),"feature.xsd");
			vr.ValidationEventHandler += new ValidationEventHandler (ValidationHandler);
			while(vr.Read())
			{
				//TODO : do something with validation result;
			}
		}

		/// <summary>
		/// Method which handles the validation process.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="args"></param>
		public static void ValidationHandler(object sender, ValidationEventArgs args)
		{
			Console.WriteLine("Severity:{0}\tMessage:{1}", args.Severity,args.Message);
		}

		/// <summary>
		/// Creates new domain for dynamic assembly.
		/// </summary>
		/// <param name="filename">path to the assembly file.</param>
		private void ProcessAssembly(string filename)
		{	
			System.IO.FileInfo fileInfo = new System.IO.FileInfo(filename);
			AppDomainSetup setup = new AppDomainSetup();
			setup.ApplicationBase = fileInfo.DirectoryName;
			setup.PrivateBinPath = AppDomain.CurrentDomain.BaseDirectory;
			setup.ApplicationName = "Dynomain";
			setup.ShadowCopyFiles = "true";

			dynoDomain = AppDomain.CreateDomain("Dynomain", null, setup);
			dynoAssName = fileInfo.Name.Replace(fileInfo.Extension, "");
		}

		/// <summary>
		/// Load assembly to dynamic domain. Invoked by dynamic domain.
		/// </summary>
		public void LoaderCallBack() 
		{
			AppDomain.CurrentDomain.Load(dynoAssName);
		}

		/// <summary>
		/// A callback method invoked from dynamic domain that prepares the serialization data.
		/// </summary>
		public void SerializeCallBack() 
		{
			//if this method invoked from current app domain, it will load it's dynamic assembly into
			//the current app domain, and we won't be able to unload the dynamic assembly later.
			System.Reflection.Assembly[] ass = AppDomain.CurrentDomain.GetAssemblies();
			object[][] members = new object[this.Count][];
			for(int i=0;i<ass.Length;i++)
			{
				if(ass[i].GetName().Name!="dyno") continue;
				System.Type factoryType = ass[i].GetType("Dyno."+"DynoFactory"); 		 
				object factory=factoryType.GetConstructor(System.Type.EmptyTypes).Invoke(null);
				for(int j=0;j<this.Count;j++ )
				{
					this[j].customType=ass[i].GetType("Dyno."+this[j].Name);
					MethodInfo mi = factoryType.GetMethod("Create"+this[j].Name+"Array"); 
					int objcount = this[j].Fields[0].Count;
					members[j]=(object[])( mi.Invoke(factory,new object[]{(int)objcount,this[j].Fields}) );
				}
				factoryType=null;
				factory=null;
				break;
			}
			this.SerializeGML(this.targetfile, members);
			members=null;
		}


		/// <summary>
		/// Serialize this MapDataCollection to GML.
		/// </summary>
		/// <param name="GMLFileString">path to GML file to create.</param>
		/// <param name="members">Array of gml.FeatureAssociationType of each map, as feature members of the collection</param>
		private void SerializeGML(string GMLFileString, object[][] members)
		{
			UpdateStatus("processing feature members...",70);
			wfs.FeatureCollectionType features = new wfs.FeatureCollectionType(new gml.BoundingShapeType(this.GetBoundingBox()));
			features.description=this.Description;
			string xsfile = System.IO.Path.GetFileNameWithoutExtension(GMLFileString)+".xsd";
			string xsloc = getNS("gc")+" "+xsfile+"   " + getNS("wfs")+" WFS-basic.xsd";
			features.schemaLocation = xsloc;
			xsloc=null;
			xsfile=null;

			XmlAttributes xatts = new XmlAttributes();
			XmlSerializerNamespaces nsnames = createSerializerNamespaces();
			string targetNS=getNS("gc");

			System.Type[] customTypes = new Type[this.getActiveCount()];
			int ctc = -1;
			for(int i=0;i<this.Count;i++)
			{
				if(!this[i].isActive) continue;
				ctc++;
				customTypes[ctc]=this[i].customType;
				features.addMembers(this[i].Fields.CreateFeatureAssociations(members[i])); 
				xatts.XmlElements.Add(this[i].getElementAttribute(this[i].customType,ref nsnames,targetNS));
			}
			XmlAttributeOverrides xovs = new XmlAttributeOverrides();
			xovs.Add(typeof(gml.FeatureAssociationType),"Item",xatts); 

			XmlRootAttribute xra = new XmlRootAttribute(); //because root element is wfs.featurecollection
			xra.Namespace = getNS("wfs");

			UpdateStatus("serializing to "+GMLFileString+"...",75);
			System.IO.FileStream fs = new System.IO.FileStream( GMLFileString,System.IO.FileMode.Create); 
			XmlSerializer ser = new XmlSerializer( typeof(wfs.FeatureCollectionType), xovs, customTypes, xra, "");
			ser.Serialize(fs,features,nsnames);
			fs.Close();
			UpdateStatus("Done exporting to "+GMLFileString+".",100);

			for(int i=0;i<this.Count;i++) this[i].customType=null;
			xatts=null;
			xovs=null;
			xra=null;
			customTypes=null;
			features=null;
			targetNS=null;
			nsnames=null;
			ser=null;
		}



		public void ImportGML(string GMLFileString)
		{		
			//XmlSerializerNamespaces nsnames = createSerializerNamespaces();
			System.Type[] customTypes = new Type[this.getActiveCount()];
			XmlAttributeOverrides xovs = new XmlAttributeOverrides();
			XmlAttributes xatts = new XmlAttributes();
			xovs.Add(typeof(gml.FeatureAssociationType),"Item",xatts);

			wfs.FeatureCollectionType features;// = new wfs.FeatureCollectionType(new gml.BoundingShapeType(this.GetBoundingBox()));

			XmlRootAttribute xra = new XmlRootAttribute(); //because root element is wfs.featurecollection
			xra.Namespace = getNS("wfs");

			System.IO.FileStream fs = new System.IO.FileStream( GMLFileString,System.IO.FileMode.Create); 
			XmlSerializer ser = new XmlSerializer(( typeof(wfs.FeatureCollectionType)), xovs, customTypes, xra, "");
			//XmlSerializer ser = new XmlSerializer(( typeof(wfs.FeatureCollectionType)),
	
			features = (wfs.FeatureCollectionType)ser.Deserialize(fs);
			//features
			fs.Close();
		}

		/// <summary>
		/// Creates namespaces for gml serialization.
		/// </summary>
		/// <returns>the namespaces needed for serializing this mapDataCollection to gml file.</returns>
		private XmlSerializerNamespaces createSerializerNamespaces()
		{
			XmlSerializerNamespaces nsnames = new XmlSerializerNamespaces();
			nsnames.Add("",getNS("gc"));
			nsnames.Add("gml",getNS("gml"));
			nsnames.Add("wfs",getNS("wfs"));
			nsnames.Add("xs",getNS("xs"));
			nsnames.Add("xsi",getNS("xsi"));
			nsnames.Add("xlink",getNS("xlink"));
			return nsnames;
			//layer's specific nsnames added later
		}
		#endregion

		#region svg stuff
		private int totalcount = 0;
		private int currentcount = 0;
		/// <summary>
		/// Exports MapDataCollection to plain SVG file.
		/// </summary>
		/// <param name="SVGFilename">path of the SVG file to create</param>
		public void ExportSVG(string SVGFilename)
		{
			UpdateStatus("constructing svg objects...",0);

			svg.svg rootSVG = new svg.svg();
			rootSVG.setDimension("0","0","100%","100%");
			rootSVG.Items=new svg.group[this.getActiveCount()];
			gml.BoxType box = this.GetBoundingBox();
			rootSVG.viewBox = CreateViewBoxString(box);
			svg.group rootGroup = new svg.group();
			rootGroup.transform = "matrix(1 0 0 -1 0 " + ((double)( box.Top+box.Bottom)).ToString()+ " )";
			rootGroup.Items = new svg.group[this.getActiveCount()];

			float l = (float)box.Left; 
			float b = (float)box.Bottom; 
			float r = (float)box.Right; 
			float t = (float)box.Top; 
			float diagonal = (float)Math.Sqrt((r-l)*(r-l)+(t-b)*(t-b));

			totalcount = 0;
			for(int i=0;i<this.Count;i++)
			{
				if(!this[i].isActive) continue;
				totalcount+= this[i].Bins.GetTotalContentsCount();
			}

			int gcount=0;
			for(int i=this.Count-1;i>=0;i-- )
			{
				if(!this[i].isActive) continue;
				rootGroup.Items[gcount]=CreateSvgGroup(this[i],diagonal);
				gcount++;
			}	
			rootSVG.Items=new svg.SvgElement[2]{CreateSvgStyle(diagonal),rootGroup};

			XmlSerializerNamespaces nsnames = new XmlSerializerNamespaces();
			nsnames.Add("",getNS("svg"));
			nsnames.Add("xlink",getNS("xlink"));

			XmlRootAttribute xra = new XmlRootAttribute(); 
			xra.Namespace = getNS("svg");

			UpdateStatus("serializing to "+SVGFilename+"...",85);
			XmlSerializer ser = new XmlSerializer( typeof(svg.svg), null, System.Type.EmptyTypes, xra, "");
			System.IO.FileStream fs = new System.IO.FileStream( SVGFilename,System.IO.FileMode.Create);
			ser.Serialize(fs,rootSVG,nsnames);
			fs.Close();
			UpdateStatus("Done.",100);
			box=null;
			nsnames=null;
			xra=null;
			rootGroup=null;
			rootSVG=null;
			ser=null;
		}

		public void ImportSVG(string SVGFilename)
		{
			XmlRootAttribute xra = new XmlRootAttribute(); 
			xra.Namespace = getNS("svg");
			XmlSerializer ser = new XmlSerializer( typeof(svg.svg), null, System.Type.EmptyTypes, xra, "");
			System.IO.FileStream fs = new System.IO.FileStream( SVGFilename,System.IO.FileMode.Open);
			svg.svg rootSVG = (svg.svg)ser.Deserialize(fs);

			svg.group rootGroup = (svg.group)rootSVG.Items[1];
			for(int i=0;i<rootGroup.Items.Length;i++)
			{
				svg.group g = (svg.group)rootGroup.Items[i];

				svg.SvgElement[] e = g.Items;

				MapData mapdata = new MapData();
				mapdata.Name = g.id;
				mapdata.Info.FileVersion = "1.1";
				string [] x = rootSVG.viewBox.Trim().Split(new char[] {' ',','});
				double l =Convert.ToDouble(x[0]);
				double r =l+Convert.ToDouble(x[2]);
				double b = Convert.ToDouble(x[1]);
				double t= b+Convert.ToDouble(x[3]);

				mapdata.BoundingBox = new gml.BoxType(l,t,r,b);
				mapdata.Info.BoundsLeft = l;
				mapdata.Info.BoundsBottom = b;
				mapdata.Info.BoundsRight = r;
				mapdata.Info.BoundsTop = t;
				mapdata.BoundingBox  = new gml.BoxType(new double[4]{mapdata.Info.BoundsLeft,mapdata.Info.BoundsTop,mapdata.Info.BoundsRight,mapdata.Info.BoundsBottom});
				mapdata.Info.FileDirectory = System.Environment.CurrentDirectory;
				mapdata.Info.FileGeometry  = mapdata.Name+".svg";
				mapdata.Info.FileData =mapdata.Name+".svg";
				mapdata.Info.FileIndex = mapdata.Name+".svg";
				mapdata.Info.RecordsCount =e.Length;

				bool addfield = false;

				GeoCon.Data.Field fi0 = new GeoCon.Data.StringField();
				fi0.Name2 = "Name";
				mapdata.Fields.Add(fi0);

				for(int j=0;j<e.Length;j++)
				{
					GeometryField fgeo = new Data.GeometryField();
					GeoCon.Classification.Bin bin = new Bin();
					//bin.
					if (e[j].GetType() == typeof(svg.circle))
					{
						if (addfield==false)
						{
							GeoCon.Data.Field fi = new GeoCon.Data.GeometryField();
							fi.Name2 = "pointdata";
							fi.Type = typeof(gml.PointPropertyType);
							mapdata.Fields.Add(fi);
							addfield=true;
						}
					}
					else if (e[j].GetType() == typeof(svg.polyline))
					{
						if (addfield==false)
						{
							GeoCon.Data.Field fi = new GeoCon.Data.GeometryField();
							fi.Name2 = "polylinedata";
							fi.Type = typeof(gml.LineStringType);
							mapdata.Fields.Add(fi);
							addfield=true;
						}						
					}
					else if (e[j].GetType() == typeof(svg.path))
					{
						if (addfield==false)
						{
							GeoCon.Data.Field fi = new GeoCon.Data.GeometryField();
							fi.Name2 = "polygondata";
							fi.Type = typeof(gml.PolygonType);
							mapdata.Fields.Add(fi);
							addfield=true;
						}		
					}
					else
					{
						int xxx=0;
					}
					
				}
		
				mapdata.isActive = true;
				this.Add(mapdata);
			}

			for(int i=0;i<rootGroup.Items.Length;i++)
			{
				svg.group g = (svg.group)rootGroup.Items[i];
				svg.SvgElement[] e = g.Items;

				for(int j=0;j<e.Length;j++)
				{
					if (e[j].GetType() == typeof(svg.circle))
					{

						svg.circle c0 = (svg.circle)(e[j]);	
						string data = c0.cx+","+c0.cy;
						string[] data2 = data.Trim().Split(new char[]{' ',','});
						double[] data3 = new double[data2.Length];
						for(int d=0;d<data2.Length;d++) data3[d] = Convert.ToDouble(data2[d]);
							
						gml.CoordinatesType c = new gml.CoordinatesType(data3);
						gml.PointType data4 = new gml.PointType(c);
			
						this[i].Fields[0].Add(c0.id.ToString());
						this[i].Fields[1].Add(new gml.PointPropertyType(data4));
					}
					else if (e[j].GetType() == typeof(svg.polyline))
					{					
						svg.polyline c0 = (svg.polyline)(e[j]);

						string data = c0.points;
						string[] data2 = data.Trim().Split(new char[]{' ',','});
						double[] data3 = new double[data2.Length];
						for(int d=0;d<data2.Length;d++) data3[d] = Convert.ToDouble(data2[d]);
							
						gml.CoordinatesType c = new gml.CoordinatesType(data3);
						gml.LineStringType data4 = new gml.LineStringType(c);
			
						this[i].Fields[0].Add(c0.id.ToString());
						this[i].Fields[1].Add(new gml.LineStringPropertyType(data4));
					}
					else if (e[j].GetType() == typeof(svg.path))
					{	

						svg.path c0 = (svg.path)(e[j]);
						string data = c0.d;

						string[] data2 = data.Replace("M","").Replace("L","").Replace("z","").Trim().Split(new char[]{' ',','});
						double[] data3 = new double[data2.Length];
						int d=0;
						int dd=0;
						while(dd<data2.Length)
						{
							try
							{
								data3[d] = Convert.ToDouble(data2[dd]);
								d++;
							}
							catch{}
							dd++;
						}						

						gml.CoordinatesType c = new gml.CoordinatesType(data3);
						gml.PolygonType data4 = new gml.PolygonType(c);
						this[i].Fields[0].Add(c0.id.ToString());			
						this[i].Fields[1].Add(new gml.PolygonPropertyType(data4));
					}
					else
					{
						int xxx=0;
					}
					
				}
			}


		}

		/// <summary>
		/// Creates CSS style element for the svg output.
		/// </summary>
		/// <param name="diagonal">diagonal of the svg bounding box</param>
		/// <returns>SVG Style object</returns>
		private svg.style CreateSvgStyle(float diagonal)
		{
			svg.style st = new svg.style();
			System.Text.StringBuilder sb=new System.Text.StringBuilder();
			for(int i=0;i<this.Count;i++)
			{
				if(!this[i].isActive) continue;
				sb.Append(this[i].Bins.GetCSSText(this[i].Name,diagonal)+"\r");
			}
			st.Item=sb.ToString();
			sb=null;
			return st;
		}
		/// <summary>
		/// Creates svg Group for a specified map in this collection
		/// </summary>
		/// <param name="map">map to be enclosed in the group</param>
		/// <param name="diagonal">diagonal of the svg bounding box</param>
		/// <returns>svg group for the specified map</returns>
		private svg.group CreateSvgGroup(MapData map, double diagonal)
		{
			FieldCollection fields=map.Fields;
			GeometryField fgeo = map.Fields.GetGeometryField();
			svg.SvgElement[] elems=new svg.SvgElement[fgeo.Count];

			for(int k=0;k<map.Bins.Count;k++ )
			{
				Bin bin = map.Bins[k];

				//scale point radius for svg document
				double pr = bin.Symbol.PointRadiusMap*diagonal/100;

				foreach (int ci in bin.ContentsIndex)
				{
					currentcount+=1;
					UpdateStatus("",80*currentcount/totalcount);

					if(fgeo[ci]==fgeo.NullSymbol ) continue;
					gml.GeometryPropertyType gpt =(gml.GeometryPropertyType)fgeo[ci];
					if(gpt.Item==null) continue;
					gpt.Item.PointRadius = pr;
					elems[ci] = gpt.Item.createSvgObject(); 
					elems[ci].id = map.Name+"_f"+ci.ToString();
					elems[ci].@class = "style-"+map.Name.Replace("_","-")+"-"+k.ToString();
					gpt=null;
				}
				bin=null;
			}

			svg.group g = new svg.group(elems);
			g.id=map.Name;							//

			fields=null;
			fgeo=null;
			elems=null;

			return g;
		}
		/// <summary>
		/// Creates value for viewBox attribute of root SVG.
		/// </summary>
		/// <param name="box">bounding box of the root svg</param>
		/// <returns>attribute value for viewBox</returns>
		private static string CreateViewBoxString(gml.BoxType box)
		{
			string str = box.Left.ToString() +" ";
			str+= box.Bottom.ToString()+" ";
			str+= (box.Right-box.Left).ToString()+" "; 
			str+= (box.Top-box.Bottom).ToString();
			return str;
		}

		#endregion

		#region utilities
		/// <summary>
		/// Occurs when there's noticable change in the export progress.
		/// </summary>
//		public event StatusEventHandler StatusChange;
//		private StatusEventArgs StatusArgs = new StatusEventArgs("",0);
		private void UpdateStatus(string message, int progressvalue)
		{
//			if(StatusChange==null) return;
//			if(progressvalue>0 && progressvalue-StatusArgs.statusValue<5) return;
//			StatusArgs.setCurrentStatus(message, progressvalue);
//			StatusChange(this,StatusArgs);
			//Console.WriteLine("{0} status:{1}% ",message,progressvalue);

//			this.StatusMessage = message;
//			this.StatusValue = progressvalue;
		}

//		private string statmsg="";
//		public string StatusMessage
//		{
//			get{return statmsg;}
//			set{statmsg=value;}
//		}
//		private int statval=0;
//		public int StatusValue
//		{
//			get{return statval;}
//			set{statval=value;}
//		}
		#endregion
	}
}
