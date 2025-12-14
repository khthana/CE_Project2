using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Windows.Forms;
using Intesis.eSVG;
using System.Drawing;

namespace MapView
{
    class ReadAttributeX
    {
        public Element node2;
        public XmlElement[] Attr = new XmlElement[20];
        public string[] column = new string[20];
        public string[] value = new string[20];

        public string[] node_ID = new string[20];
        public int numberofnode;
        public string[] sym_ID = new string[20];
        public string[] latn = new string[20];
        public string[] lonn = new string[20];

        public int numberofatt;
        public string nodeCheckxx;
        private int check = 0;
        private int i = 0;
        private int j = 0;
        public string symbolid;
        public string lat;
        public string lon;
        public string Name;
        public int row;
        public string Description;
        public XmlElement noden;
        private String path = "\\My Documents\\Personal\\XMLDAT.xml";
        public String path2 = "\\Program files\\mapview\\rxmldat.xml";
        public ReadAttributeX()
        {
            
        }

        public void read(string node)
        {
            nodeCheckxx = node;
            //nodeCheckxx = node.getAttribute("id");
            XmlDocument xDocf = new XmlDocument();
            XmlTextReader reader = new XmlTextReader(path);
            reader.Read();
            xDocf.Load(reader);

            XmlNodeList d = xDocf.GetElementsByTagName("Attribute");
            XmlNodeList att = d.Item(0).ChildNodes;
            numberofatt = att.Count;
            //
            //column = new string[numberofatt];
            //value = new string[numberofatt];
            //
            XmlTextReader reader1 = new XmlTextReader(path);
            while (reader1.Read())
            {
                reader1.MoveToElement();
                if (reader1.ReadString() == nodeCheckxx)
                {
                    check = 1;
                    //MessageBox.Show(nodeCheckxx);
                }
                if (check == 1)
                {
                    if (reader1.LocalName.Equals("Symbol_ID"))
                    {
                        symbolid = reader1.ReadString();
                    }
                    if (reader1.LocalName.Equals("Lat"))
                    {
                        lat = reader1.ReadString();
                    }
                    if (reader1.LocalName.Equals("Lon"))
                    {
                        lon = reader1.ReadString();
                    }
                    if (reader1.LocalName.Equals("Name"))
                    {
                        
                        column[i] = reader1.ReadString();
                        i++;
                        //MessageBox.Show(reader1.ReadString());
                    }
                    if (reader1.LocalName.Equals("Description"))
                    {
                        value[j] = reader1.ReadString();
                        j++;
                    }
                    if (i == numberofatt && j == numberofatt)
                    {
                        i = 0;
                        check = 0;
                    }

                }

            }
            /*for (int k = 0; k < numberofatt; k++)
            {
                MessageBox.Show(column[k] + " : "+ value[k]);
            }*/

        }
        public void updatenode(string node)
        {
            XmlDocument docn = new XmlDocument();
            //getdate();
            //string path3 = path2 + ".xml";
            try
            {
                docn.Load(path2);
            }
            catch (System.IO.FileNotFoundException)
            {
                XmlTextWriter xmlWriter = new XmlTextWriter(path2, System.Text.Encoding.UTF8);
                xmlWriter.Formatting = Formatting.Indented;
                xmlWriter.WriteProcessingInstruction("xml", "version='1.0' encoding='UTF-8'");
                xmlWriter.WriteStartElement("Xml_Data");
                //If WriteProcessingInstruction is used as above,
                //Do not use WriteEndElement() here
                //xmlWriter.WriteEndElement();
                //it will cause the <Root></Root> to be <Root />
                xmlWriter.Close();
                docn.Load(path2);

            }
            XmlNode root = docn.DocumentElement;
            XmlElement childNode = docn.CreateElement("Object1");
            XmlElement childNodeOid = docn.CreateElement("Object_ID");
            XmlElement childNodeSid = docn.CreateElement("Symbol_ID");
            XmlElement childNodeP = docn.CreateElement("Position");
            XmlElement childNodelat = docn.CreateElement("Lat");
            XmlElement childNodeLon = docn.CreateElement("Lon");
            XmlElement childNodeAttr = docn.CreateElement("Attribute");

            XmlText textNodeOid = docn.CreateTextNode(nodeCheckxx);
            XmlText textNodeSid = docn.CreateTextNode(symbolid);
            XmlText textNodelat = docn.CreateTextNode(lat);
            XmlText textNodelon = docn.CreateTextNode(lon);
            XmlText textNodeAttrName = docn.CreateTextNode("");
            XmlText textNodeAttrDescription = docn.CreateTextNode("");

            textNodelat.Value = lat;
            textNodelon.Value = lon;
            textNodeOid.Value = nodeCheckxx;
            textNodeSid.Value = symbolid;
            /////////////////appendChildNode//////////////
            root.AppendChild(childNode);
            childNode.AppendChild(childNodeOid);
            childNode.AppendChild(childNodeSid);
            childNode.AppendChild(childNodeP);
            childNodeP.AppendChild(childNodelat);
            childNodeP.AppendChild(childNodeLon);
            childNode.AppendChild(childNodeAttr);
            /////////////for Attribute///////////////////
            for (int m = 0; m < numberofatt; m++)
            {
                Attr[m] = docn.CreateElement("Attr" + m.ToString());
                childNode.AppendChild(Attr[m]);
                XmlElement Name = docn.CreateElement("Name");
                XmlElement Description = docn.CreateElement("Description");
                XmlText textName = docn.CreateTextNode(column[m]);
                XmlText textDescription = docn.CreateTextNode(value[m]);
                textName.Value = column[m];
                textDescription.Value = value[m];
                Attr[m].AppendChild(Name);
                Attr[m].AppendChild(Description);
                Name.AppendChild(textName);
                Description.AppendChild(textDescription);
            }
            ///////////////////////////////////////////////
            ///////////////////////////////////////////////
            //childNode2.SetAttribute("Name", "Value");
            //////////////////////appendtext////////////////
            childNodeOid.AppendChild(textNodeOid);
            childNodeSid.AppendChild(textNodeSid);
            childNodelat.AppendChild(textNodelat);
            childNodeLon.AppendChild(textNodelon);
            ///////////////////////////////////////////////
            //textNode.Value = symbolid;
            docn.Save(path2);
            //XmlTextReader reader3 = new XmlTextReader(path);
            //reader3.Read();
            //docn.Load(reader3);
            //docn.GetElementsByTagName("use");
        }

        public void Read_Node()
        {
            XmlDocument xDocf = new XmlDocument();
            XmlTextReader reader = new XmlTextReader(path);
            reader.Read();
            xDocf.Load(reader);
            XmlNodeList d = xDocf.GetElementsByTagName("Object1");
            numberofnode = d.Count;
            for (int i = 0; i < numberofnode; i++)
            {
                XmlElement e = (XmlElement)d.Item(i);
                XmlElement ob_id =(XmlElement)e.ChildNodes.Item(0);
                XmlElement sym = (XmlElement)e.ChildNodes.Item(1);
                XmlElement pos = (XmlElement)e.ChildNodes.Item(2);
                XmlElement lat = (XmlElement)pos.ChildNodes.Item(0);
                XmlElement lon = (XmlElement)pos.ChildNodes.Item(1);
                //string s = pos.InnerXml;
                node_ID[i] = ob_id.InnerText;
                sym_ID[i] = sym.InnerText;
                latn[i] = lat.InnerText;
                lonn[i] = lon.InnerText;

            }

        }
        public void getdate()
        {
            string namefile = System.DateTime.Today.ToString();
            string date = namefile.Substring(0, 2);
            string mo = namefile.Substring(3, 2);
            string year = namefile.Substring(6, 4);
             path2 = path2 + date + "_"+mo+"_"+year+".xml";
        }

    }
}
