///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory
using System;
using System.Xml;
using System.Xml.Schema;
using System.CodeDom;
using System.CodeDom.Compiler;
using System.Collections;

namespace GeoCon.Data
{
	/// <summary>
	/// A Collection of Field (column), including the geometry field.
	/// </summary>
	
	[Serializable]
	public class FieldCollection : CollectionBase
	{
		public FieldCollection(){}

		#region basic props & methods
		/// <summary>
		/// Gets or sets Field at colIndex.
		/// </summary>
		public Field this[int colIndex]
		{
			get	{ return (Field) List[colIndex];}
			set { List[colIndex] = value;}
		}
		/// <summary>
		/// Gets a Field with a certain name.
		/// </summary>
		public Field this[string name]
		{
			get
			{
				for(int i=0;i<this.Count;i++)
				{
					if(this[i].Name==name) return this[i];
				}
				return null;
			}
		}
		/// <summary>
		/// Add a Field into this collection
		/// </summary>
		/// <param name="field"></param>
		/// <returns>The position of the newly added field.</returns>
		public int Add(Field field)
		{
			int idx=List.Add(field);
			//field.Index=idx;
			return idx;
		}
		/// <summary>
		/// 
		/// </summary>
		/// <param name="isNumericOnly"></param>
		/// <returns></returns>
		public int getActiveCount(bool isNumericOnly)
		{
			int count=0;
			for(int i=0;i<this.Count;i++)
			{
				if(!this[i].isActive) continue;
				if(isNumericOnly && !this[i].isNumeric) continue;
				count++;
			}
			return count;
		}
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public GeometryField GetGeometryField()
		{
			for(int i=0;i<this.Count;i++)
			{
				if(this[i].isGeometry) 
				{
					return (GeometryField)(this[i]);
				}
			}
			return null;
		}
		/// <summary>
		/// 
		/// </summary>
		/// <param name="isActiveOnly"></param>
		/// <param name="isNumericOnly"></param>
		/// <returns></returns>
		public Field[] getFields(bool isActiveOnly, bool isNumericOnly)
		{
			Field[] fields = new Field[getActiveCount(isNumericOnly)]; 
			int k=0;
			for(int i=0;i<this.Count;i++)
			{
				if(isActiveOnly && !this[i].isActive) continue;
				if(isNumericOnly && !this[i].isNumeric) continue;
				fields[k]=this[i]; 
				k++;
			}
			return fields;
		}
		/// <summary>
		/// 
		/// </summary>
		/// <param name="isActiveOnly">whether to get only active fields</param>
		/// <param name="isNumericOnly">whether to get only numeric fields</param>
		/// <returns></returns>
		public string[] getFieldNames(bool isActiveOnly, bool isNumericOnly)
		{
			string[] names = new string[getActiveCount(isNumericOnly)];
			int k=0;
			for(int i=0;i<this.Count;i++)
			{
				if(isActiveOnly && !this[i].isActive) continue;
				if(isNumericOnly && !this[i].isNumeric) continue;
				names[k]=this[i].Name;
				k++;
			}
			return names;
		}

		private string _filter="";
		/// <summary>
		/// Gets or sets filter to be used as RowFilter on MapData DataView.
		/// </summary>
		public string FilterString
		{
			get{return _filter;}
			set{_filter=value;}
		}

		private ArrayList _findexes;
		/// <summary>
		/// Collection of indexes after filter applied.
		/// </summary>
		public ArrayList ActiveIndexes
		{
			get
			{
				return _findexes;
			}
			set
			{
				_findexes=value;
			}
		}
        
		#endregion

		#region codebuilder stuffs
		/// <summary>
		/// Creates code declaration for fields in this collection, represents fields in a class declaration.
		/// </summary>
		/// <returns></returns>
		public CodeTypeMemberCollection getCodeMemberCollection()
		{
			CodeTypeMemberCollection ctmc = new CodeTypeMemberCollection();
			for(int i=0;i<this.Count;i++)
			{
				if(!this[i].isActive) continue;
				ctmc.Add(this[i].CreateCodeType());
			}
			//add default constructor
			CodeConstructor defcon = new CodeConstructor();
			defcon.Attributes = MemberAttributes.Public; 
			ctmc.Add(defcon);

			return ctmc;
		}
		#endregion

		#region xml schema stuffs

		/// <summary>
		/// Creates a complex type declaration for a feature type.
		/// </summary>
		/// <param name="name">the name for this complex type</param>
		/// <param name="theBase">the qualified name of the base type</param>
		/// <returns>the complex type declaration</returns>
		public XmlSchemaComplexType getSchemaComplexType(string name,XmlQualifiedName theBase)
		{
			XmlSchemaComplexContentExtension xsContExt = new XmlSchemaComplexContentExtension();
			xsContExt.BaseTypeName = theBase;
			xsContExt.Particle = getSequenceElements();

			XmlSchemaComplexType xsct = new XmlSchemaComplexType();
			xsct.ContentModel = new XmlSchemaComplexContent();
			xsct.ContentModel.Content = xsContExt;
			xsct.Name = name+"_Type";
			return xsct;
		}

		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		private XmlSchemaSequence getSequenceElements()
		{
			XmlSchemaSequence xsSeq = new XmlSchemaSequence(); 
			for(int i=0;i<this.Count;i++)
			{
				if(!this[i].isActive) continue;
				xsSeq.Items.Add(this[i].CreateSchemaElement()); 
			}
			return xsSeq;
		}
		#endregion

		#region gml stuffs
		/// <summary>
		/// Creates array of FeatureAssociation from custom objects
		/// </summary>
		/// <param name="members">instances of custom type(s) which will act as feature members</param>
		/// <returns>new FeatureAssociation for this FieldCollection</returns>
		public gml.FeatureAssociationType[] CreateFeatureAssociations(object[] members)
		{
			if(this.getActiveCount(false)==0) 
			{
				throw new System.Exception("At least one field must also active."); 
				//return new gml.FeatureAssociationType[0];
			}
			gml.FeatureAssociationType[] fass;
			if(this.ActiveIndexes == null) //no filter
			{
				fass = new gml.FeatureAssociationType[this[0].Count];
				for(int row=0;row<fass.Length;row++) 
				{
					//wrapped in a feature association
					fass[row]=new gml.FeatureAssociationType((gml.AbstractFeatureType)members[row]);
				}
			}
			else
			{
				fass = new gml.FeatureAssociationType[ActiveIndexes.Count];
				for(int row=0;row<ActiveIndexes.Count;row++) 
				{
					//wrapped in a feature association
					fass[row]=new gml.FeatureAssociationType((gml.AbstractFeatureType)members[(int)ActiveIndexes[row]]);
				}			
			}
			return fass;
		}

		#endregion

		#region dataTable stuffs
		/// <summary>
		/// whether there's have been changes in FieldCollection since the last time a DataTable created.
		/// </summary>
		public bool isUpToDate
		{
			get
			{
				for(int i=0;i<this.Count;i++) if(!this[i].isUpToDate) return false;
				return true;
			}
			set
			{
				for(int i=0;i<this.Count;i++) this[i].isUpToDate=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public System.Data.DataTable CreateDataTable()
		{
			System.Data.DataTable table = new System.Data.DataTable();
			for(int icol=0;icol<this.Count;icol++)
			{
				if(!this[icol].isActive) continue;
				//if(this[icol].isGeometry) continue;
				table.Columns.Add(new System.Data.DataColumn(this[icol].Name,this[icol].Type));
			}
			table.Columns.Add("",typeof(int)); //add table index

			//add DataRow;
			if(table.Columns.Count==0) return table;
			for(int irow=0;irow<this[0].Count;irow++ )
			{
				System.Data.DataRow newrow = table.NewRow();
				table.Rows.Add(newrow);
				for(int icol=0;icol<this.Count;icol++)
				{
					if(!this[icol].isActive) continue;
					//if(this[icol].isGeometry) continue;
					newrow[this[icol].Name]=this[icol][irow]; 
				}
				newrow[table.Columns.Count-1]=irow; //last column is index
			}
			//add handler for data editing
			table.RowChanged+=new System.Data.DataRowChangeEventHandler(table_RowChanged);

			//set the uptodate status
			this.isUpToDate=true;
			return table;
		}
		/// <summary>
		/// 
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void table_RowChanged(object sender, System.Data.DataRowChangeEventArgs e)
		{
			int row=(int)(e.Row[e.Row.Table.Columns.Count - 1]);
			for(int i=0;i<this.Count;i++)
			{
				this[i][row] = e.Row[this[i].Name];
			}
		}
		#endregion
	}
}
