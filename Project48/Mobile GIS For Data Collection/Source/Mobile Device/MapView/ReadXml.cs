using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.IO;
using System.Data;
using System.Windows.Forms;
using Intesis.eSVG;

namespace MapView
{
    class ReadXml
    {
        public String filepath = "\\My Documents\\Personal\\maptest3.svg";
        public String pathxml = "\\My Documents\\Personal\\XMLDAT.xml";

        public void create_symbol(XmlDocument doc)
        {
            XmlTextReader reader = new XmlTextReader(pathxml);
            reader.Read();
            XmlDocument xDoc = new XmlDocument();
            xDoc.Load(reader);
            XmlNodeList ss = xDoc.GetElementsByTagName("symbol");
            for (int i = 0; i < ss.Count; i++)
            {
                XmlNode s = ss.Item(i);
                //XmlNode s = xDoc.GetElementsByTagName("symbol").Item(i);
                doc.GetElementsByTagName("defs").Item(0).AppendChild(doc.ImportNode(s, true));
                //doc.LastChild.AppendChild(doc.ImportNode(node3,true));
            }
                //doc.Save(filepath);
            
        }

        public void Function_GPS_Click(string MyPath)
        {
            try
            {
                XmlDocument doc = new XmlDocument();
                String function;
                String path = MyPath;
                function = "var target;" +
                            "var fromid;" +
                            "var id;" +
                            "var position;" +
                            "var svgDoc;" +
                            "var name;" +
                            "var latitude;" +
                            "var longitude;" +
                            "var tx;" +
                            "var ty;" +
                            "var check;" +
                            "function initMap(evt) {" +
                            "target = evt.getCurrentTarget();" +
                            "name =  target.getAttribute(" + "'id'" + ");" +
                            "target.setAttribute(" + "'check'" + "," + "1" + ");" +
                            "target.setAttribute(" + "'xlink:href'" + "," + "'#Click'" + ");" +
                            "check = target.getAttribute(" + "'check'" + ");" +
                            "position = target.getAttribute(" + "'transform'" + ");" +
                    "latitude = position.substring(10, 17);"+
                    "longitude = position.substring(17, 24);"+
                    "var str1 = 'Latitude: ';"+
                    "var str2 = 'Longitude: ';"+
                    //"target.setAttribute(" + "'style'" + "," + "'fill: rgb(221,0,0)'" + ");"+
                            //"alert(str1 + latitude + str2 + longitude);"+
                    "}";
                doc.Load(MyPath);
                TextWriter wf = new StringWriter();
                TextWriter wg = new StringWriter();
                TextWriter wc = new StringWriter();
                XmlTextWriter writerf = new XmlTextWriter(wf);
                XmlTextWriter writerg = new XmlTextWriter(wg);
                XmlTextWriter writerc = new XmlTextWriter(wc);
                //function
                writerf.WriteStartElement("script");
                writerf.WriteAttributeString("type", "text/javascript");
                //writer.WriteCData("var redVal=0;var greenVal=0;var blueVal=0;function changeCol(evt){var targetshape = evt.getTarget();redVal = Math.round(Math.random()*255);greenVal = Math.round(Math.random()*255);blueVal = Math.round(Math.random()*255); targetshape.setAttribute(" + "'fill'" + ", " + "'rgb('" + " + redVal + " + "','" + " + greenVal + " + "','" + " + blueVal + " + "')'" + ");alert("+"'kean'"+");}//");
                writerf.WriteCData(function);
                writerf.WriteEndElement();
                writerf.Flush();
                writerf.Close();
                //GPS
                writerg.WriteStartElement("use");
                writerg.WriteStartElement("circle");
                writerg.WriteAttributeString("id", "GPS");
                //writerg.WriteAttributeString("transform", "translate("+ gps.getlat() +" "+ gps.getlon() +")");
                writerg.WriteAttributeString("transform", "translate(691865, -1518614)");
                writerg.WriteAttributeString("cx", "0");
                writerg.WriteAttributeString("cy", "0");
                writerg.WriteAttributeString("r", "18");
                writerg.WriteAttributeString("style", "fill: rgb(221,0,0);stroke:black;stroke-width:1");
                //writerg.WriteAttributeString("visibility", "visible");
                writerg.WriteAttributeString("visibility", "hidden");
                writerg.WriteEndElement();
                writerg.WriteEndElement();
                writerg.Flush();
                writerg.Close();
                //Click
                writerc.WriteStartElement("defs");
                writerc.WriteStartElement("symbol");
                writerc.WriteAttributeString("overflow", "visible");
                writerc.WriteAttributeString("preserveAspectRatio", "xMidYMid meet");
                writerc.WriteAttributeString("id", "Click");
                writerc.WriteStartElement("g");
                writerc.WriteAttributeString("id", "layer1");
                writerc.WriteStartElement("path");
                writerc.WriteAttributeString("d", "M -0.090099011,0.090099011 C 15.909901,16.090099 16,16 16,16");
                writerc.WriteAttributeString("style", "fill:none;fill-opacity:0.75;fill-rule:evenodd;stroke:#000000;stroke-width:5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1");

                writerc.WriteAttributeString("id", "path2190");
                writerc.WriteEndElement();
                writerc.WriteStartElement("path");
                writerc.WriteAttributeString("d", "M 16,0 C 0,16 0,16 0,16");
                writerc.WriteAttributeString("style", "fill:none;fill-opacity:0.75;fill-rule:evenodd;stroke:#000000;stroke-width:5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1");
                writerc.WriteAttributeString("id", "path2192");
                writerc.WriteEndElement();
                writerc.WriteEndElement();
                writerc.Flush();
                writerc.Close();

                TextReader r = new StringReader(wf.ToString());
                TextReader rr = new StringReader(wg.ToString());
                TextReader rrr = new StringReader(wc.ToString());

                XmlDocument docf = new XmlDocument();
                XmlDocument docg = new XmlDocument();
                XmlDocument docc = new XmlDocument();

                docg.Load(rr);
                docf.Load(r);
                docc.Load(rrr);

                XmlElement node1 = (XmlElement)docf.ChildNodes.Item(0);
                XmlElement node2 = (XmlElement)docg.ChildNodes.Item(0);
                XmlElement node3 = (XmlElement)docc.ChildNodes.Item(0);

                doc.FirstChild.PrependChild(doc.ImportNode(node3, true));
                doc.FirstChild.PrependChild(doc.ImportNode(node1, true));
                doc.LastChild.AppendChild(doc.ImportNode(node2, true));
                create_symbol(doc);
                //Create_Node(objectidd, symbolidd, la, lo, docx);
                Cre(doc);
                XmlNodeList ccc = doc.GetElementsByTagName("use");
                int dd = ccc.Count;
                for (int i = 0; i < dd; i++)
                {
                    //create attributes
                    XmlElement cc = (XmlElement)doc.GetElementsByTagName("use").Item(i);
                    XmlAttribute z = doc.CreateAttribute("onclick");
                    XmlAttribute zz = cc.Attributes.Append(z);
                    cc.SetAttribute("onclick", "initMap(evt)");
                    XmlAttribute a = doc.CreateAttribute("check");
                    XmlAttribute aa = cc.Attributes.Append(a);
                    cc.SetAttribute("check", "0");
                    XmlAttribute s = doc.CreateAttribute("symbolid");
                    XmlAttribute ss = cc.Attributes.Append(s);
                    //create attribute symbolid keep style
                    String zzz = cc.GetAttribute("xlink:href");
                    cc.SetAttribute("symbolid", zzz);
                }
                doc.Save(filepath);
            }
            catch (Exception e)
            {
                MessageBox.Show("No Map");
            }

        }
        //public void Create_Node(XmlDocument doc, XmlDocument xDoc)
        public void Cre(XmlDocument docx)
        {
            String la = null;
            String lo = null;
            String objectidd = null;
            String symbolidd = null;
            int i = 0;
            try
            {
                XmlTextReader reader = new XmlTextReader(pathxml);
                while (reader.Read())
                {
                    // Move to fist element
                    reader.MoveToElement();
                    if (reader.LocalName.Equals("Object_ID"))
                    {
                        i++;
                        objectidd = reader.ReadString();
                        //MessageBox.Show(objectidd);
                    }
                    if (reader.LocalName.Equals("Symbol_ID"))
                    {
                        i++;
                        symbolidd = reader.ReadString();
                        //MessageBox.Show(symbolidd);
                    }
                    if (reader.LocalName.Equals("Lat"))
                    {
                        i++;
                        la = reader.ReadString();
                        //MessageBox.Show(la);
                    }
                    if (reader.LocalName.Equals("Lon"))
                    {
                        i++;
                        lo = reader.ReadString();
                        //MessageBox.Show(lo);
                    }
                    if (i == 4)
                    {
                        i = 0;
                        Create_Node(objectidd, symbolidd, la, lo, docx);

                    }
                    }
            }
            catch (Exception ei)
            {
                MessageBox.Show("Exception: {0}", ei.ToString());
            }

            
        }
        public void Create_Node(String objectid, String symbolid, String lat, String lon, XmlDocument docx)
        {
            //XmlDocument docx = new XmlDocument();
            //docx.Load(filepath);
            String newtransform = "translate(" + lat + " " + "-"+lon + ")";
            String xlink = "#"+symbolid;
            TextWriter wn = new StringWriter();
            XmlTextWriter writern = new XmlTextWriter(wn);
            writern.WriteStartElement("use");
            writern.WriteAttributeString("transform", newtransform);
            writern.WriteAttributeString("xlink", "href", "http://www.w3.org/1999/xlink", xlink);
            //writern.WriteAttributeString("xlink","type", "simple");
            //writern.WriteAttributeString("xlink","actuate", "onRequest");
            //writern.WriteAttributeString("xlink","show", "replace");
            writern.WriteAttributeString("id", objectid);
            writern.WriteEndElement();
            writern.Flush();
            writern.Close();
            
            TextReader m = new StringReader(wn.ToString());
            XmlDocument docn = new XmlDocument();
            docn.Load(m);
            XmlElement node1 = (XmlElement)docn.ChildNodes.Item(0);
            docx.LastChild.AppendChild(docx.ImportNode(node1, true));
            docx.Save(filepath);
        }
        public int readnumberattr(Element node)
        {
            string nodeCheckxx = node.getAttribute("id");
            XmlDocument xDocf = new XmlDocument();
            XmlTextReader reader = new XmlTextReader(pathxml);
            reader.Read();
            xDocf.Load(reader);
            XmlNodeList d = xDocf.GetElementsByTagName("Attribute");
            XmlNodeList att = d.Item(0).ChildNodes;
            int numberofatt = att.Count;
            return numberofatt;
        }
    }
}
