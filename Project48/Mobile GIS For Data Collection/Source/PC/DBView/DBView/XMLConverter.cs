using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.IO;

namespace DBView
{
    class XMLConverter
    {
        
        private string DATA;
        private int AttributeNum;
        private string ListAttrib;
        private string ListDesc;
        private int NumOfOBJ;
        private string ListOBJ;
        private int SymID;
        private string SymStr;
        private string LatLon;

        SVGDATA SVGdat = new SVGDATA();
        XmlDocument doc = new XmlDocument();
        XmlTextWriter WR = new XmlTextWriter("C:\\MapView\\XMLDAT.xml", Encoding.UTF8);

        public XMLConverter() {
            WR.Formatting = Formatting.Indented;
            WR.WriteProcessingInstruction("xml", "version='1.0' encoding='UTF-8'");
            WR.WriteStartElement("Xml_Data");
            WR.Close();
            doc.Load("C:\\MapView\\XMLDAT.xml");

            FileStream _File = new FileStream("save.dat",FileMode.Open);
            StreamReader SR = new StreamReader(_File);
            DATA = SR.ReadLine();
            AttributeNum = NumberOfAttribute();
            FindDesc();
            FindNumOfOBJ();

            SymID = FindSymbolID();
            
            /*
            //Create Symbol Element
            
            XmlAttribute Att = doc.CreateAttribute("ID");
            Att.Value = "red";
            XmlNode root1 = doc.DocumentElement;
            XmlElement SYMBOL = doc.CreateElement("symbol");
            SYMBOL.SetAttributeNode(Att);

            XmlText text = doc.CreateTextNode("k");
            text.Value = SVGdat.GetYello();
            SYMBOL.AppendChild(text);
            root1.AppendChild(SYMBOL);
            //
            */


        }
        public void ConvertNow(int X,int Y,int SX,int SY) { 
            //Get OBJ String
            int a = DATA.IndexOf(">")+1;
            ListOBJ = DATA.Substring(a,DATA.Length-a);
            for (int i = 0; i < NumOfOBJ; i++) {
                string s1 = FindPri(i);
                string s2 = FindLat(i);
                string s3 = FindLon(i);
                Convert(s1, s2, s3);
            }

            //Insert ViewBox Data
            CreateViewBox(X, Y, SX, SY);


            //End Insert ViewBox Data
            FileStream _F = new FileStream("C:\\MapView\\XMLDat.xml", FileMode.Open);
            StreamReader SR1 = new StreamReader(_F);
            string sss = SR1.ReadToEnd();
            SR1.Close();
            _F.Close();

            if(SymID==1)//red
            sss = sss.Insert(sss.IndexOf("<Xml_Data>") + 10, SVGdat.GetRed());
            if (SymID == 2)//blue
            sss = sss.Insert(sss.IndexOf("<Xml_Data>") + 10, SVGdat.GetBlue());
            if (SymID == 3)//yellow
            sss = sss.Insert(sss.IndexOf("<Xml_Data>") + 10, SVGdat.GetYello());

        FileStream _F1 = new FileStream("C:\\MapView\\XMLDAT.xml", FileMode.Open);
            StreamWriter SW1 = new StreamWriter(_F1);

            SW1.Write(sss);
            SW1.Close();
            _F1.Close();
        }
        
        public void SetLatLon(string SS){
            LatLon = SS;
        }
        private string FindLon(int n)
        {
            n = n + 1;
            char CC = ' ';
            bool Stop = false;
            int count = 0; int k = 0;
            while (!Stop)
            {
                CC = ListOBJ[k];
                k++;
                if (CC == '*') count++;
                if (count == n) Stop = true;
            }
            k = k + 5;
            string s = "[PRIMARY]";
            int a = k;
            int temp = a;
            //Find First ';'
            char _ch = ' ';
            int b = 0;
            while (_ch != ';')
            {
                _ch = ListOBJ[temp];
                temp++;
                b++;
            }

            s = ListOBJ.Substring(a, b - 1);
            return s;
        }

        private string FindLat(int n)
        {
            n = n + 1;
            char CC = ' ';
            bool Stop = false;
            int count = 0; int k = 0;
            while (!Stop)
            {
                CC = ListOBJ[k];
                k++;
                if (CC == '+') count++;
                if (count == n) Stop = true;
            }
            k = k + 5;
            string s = "[PRIMARY]";
            int a = k;
            int temp = a;
            //Find First ';'
            char _ch = ' ';
            int b = 0;
            while (_ch != ';')
            {
                _ch = ListOBJ[temp];
                temp++;
                b++;
            }

            s = ListOBJ.Substring(a, b - 1);
            return s;
        }
        private string FindPri(int n)             
        {
            n = n + 1;
            char CC = ' ';
            bool Stop = false;
            int count = 0;int k=0;
            while (!Stop) {
                CC = ListOBJ[k];
                k++;
                if (CC == '-') count++;
                if (count == n) Stop = true;
            }
            k = k + 9;
            string s = "[PRIMARY]";
            int a = k;
            int temp = a;
            //Find First ';'
            char  _ch = ' ';
            int b = 0;
            while(_ch != ';'){
                _ch = ListOBJ[temp];
                temp++;
                b++;
            }

            s = ListOBJ.Substring(a, b-1);
            return s;
        }
        private int FindSymbolID()
        {
            int a = DATA.IndexOf("[SYMBOL]")+8;
            char _ch = DATA[a];
            if (_ch == '1') {
                SymStr = "RedHouse";
                return /*"redhouse"*/1; }else
                if (_ch == '2') {
                    SymStr = "BlueHouse";
                    return /*"bluehouse"*/2; } else {
                        SymStr = "YellowHouse";
                    return /*"yellowhouse"*/3;
                }
           

        }

        private void FindNumOfOBJ()
        {
            //count "_";
            int count = 0;char _ch = ' ' ;
            for (int i = 0; i < DATA.Length; i++) { 
                _ch = DATA[i];
                if (_ch == '_') count++;
            }

            NumOfOBJ = count;
        }

        private void FindDesc()
        {
            int a = DATA.IndexOf("[DESCRIPTION]");
            int b = a;
            char _ch = ' ';
            int count = 0;
            while (_ch != ';')
            {
                b++;
                _ch = DATA[b];
                if (_ch == ',') count++;
            }
            a = a + 13;

            ListDesc = DATA.Substring(a, b - a);
            
        }
        private void CreateViewBox(int X, int Y, int SX, int SY)
        {
            XmlNode root = doc.DocumentElement;

            XmlElement ViewBox = doc.CreateElement("viewbox");

            XmlElement V1 = doc.CreateElement("v1");

            XmlElement V2 = doc.CreateElement("v2");

            XmlElement V3 = doc.CreateElement("v3");

            XmlElement V4 = doc.CreateElement("v4");

            XmlText V1_TextNode = doc.CreateTextNode("xx");
            V1_TextNode.Value = X.ToString();
            V1.AppendChild(V1_TextNode);

            XmlText V2_TextNode = doc.CreateTextNode("xx");
            V2_TextNode.Value = Y.ToString();
            V2.AppendChild(V2_TextNode);

            XmlText V3_TextNode = doc.CreateTextNode("xx");
            V3_TextNode.Value = SX.ToString();
            V3.AppendChild(V3_TextNode);

            XmlText V4_TextNode = doc.CreateTextNode("xx");
            V4_TextNode.Value = SY.ToString();
            V4.AppendChild(V4_TextNode);
            //

            root.AppendChild(ViewBox);
            ViewBox.AppendChild(V1);
            ViewBox.AppendChild(V2);
            ViewBox.AppendChild(V3);
            ViewBox.AppendChild(V4);

            doc.Save("C:\\MapView\\XMLDAT.xml");

        }
        private void Convert(string Pri,string Lat,string Lon){
           
            XmlNode root = doc.DocumentElement;
            
            //<Object1>
            XmlElement OBJECT1 = doc.CreateElement("Object1");

            XmlElement OBJECT_ID = doc.CreateElement("Object_ID");

            XmlElement SYMBOL_ID = doc.CreateElement("Symbol_ID");

            XmlElement POSITION = doc.CreateElement("Position");

            XmlElement LAT = doc.CreateElement("Lat");

            XmlElement LON = doc.CreateElement("Lon");

            XmlElement ATTRIBUTE = doc.CreateElement("Attribute");

            XmlText OBJECT_ID_TextNode = doc.CreateTextNode("Object_ID");
            OBJECT_ID_TextNode.Value = Pri;//Primary Key
            OBJECT_ID.AppendChild(OBJECT_ID_TextNode);

            XmlText symbol_ID_TextNode = doc.CreateTextNode("symbol_ID");
            symbol_ID_TextNode.Value = SymStr;
            SYMBOL_ID.AppendChild(symbol_ID_TextNode);

            XmlText Lat_TextNode = doc.CreateTextNode("Lat");
            Lat_TextNode.Value = Lat;//Latitude
            LAT.AppendChild(Lat_TextNode);

            XmlText Lon_TextNode = doc.CreateTextNode("Lon");
            Lon_TextNode.Value = Lon;//Longitude
            LON.AppendChild(Lon_TextNode);


            int temp = 0;

            for (int i = 0; i < AttributeNum; i++) { 
                temp = i+1;
                XmlElement Attrib = doc.CreateElement("Att" + temp.ToString());

                XmlElement NAME = doc.CreateElement("Name");

                XmlElement DES = doc.CreateElement("Description");

                XmlText NAME_TextNode = doc.CreateTextNode("aaa");
                NAME_TextNode.Value = GetAttrib(i);
                NAME.AppendChild(NAME_TextNode);
                
                Attrib.AppendChild(NAME);


                XmlText DES_TextNode = doc.CreateTextNode("as");
                DES_TextNode.Value = GetDes(i);
                DES.AppendChild(DES_TextNode);

               
                Attrib.AppendChild(DES);

                ATTRIBUTE.AppendChild(Attrib);
                
            }


            root.AppendChild(OBJECT1);
            OBJECT1.AppendChild(OBJECT_ID);
            OBJECT1.AppendChild(SYMBOL_ID);
            OBJECT1.AppendChild(POSITION);
            OBJECT1.AppendChild(ATTRIBUTE);
 
            POSITION.AppendChild(LAT);
            POSITION.AppendChild(LON);
            //root.AppendChild(childNode);

            doc.Save("C:\\Program Files\\MapView\\XMLDAT.xml");
        }

        private string GetDes(int p)
        {

            p = p + 1;
            string ss = ListDesc;
            string ss1 = "";
            int k = 0;
            int count = 0;
            for (int a = 0; a < ss.Length; a++)
            {
                if (ss[a] == ',')
                {
                    count++;
                    if (count == p)
                    {
                        ss1 = (ss.Substring(k, a - k));

                    }
                    k = a + 1;
                }
            }
            return ss1;
            //return "xxx";
        }

        private string GetAttrib(int p)
        {
            p = p + 1;
            string ss = ListAttrib;
            string ss1 = "";
            int k = 0;
            int count = 0;
            for (int a = 0; a < ss.Length; a++)
            {
                if (ss[a] == ',')
                {
                    count++;
                    if (count == p)
                    {
                        ss1 = (ss.Substring(k, a - k));

                    }
                    k = a + 1;
                }
            }
            return ss1;
            //return "yyy";
        }

        private int NumberOfAttribute() {
            int a = DATA.IndexOf("[ATTRIBUTE]");
            int b = a;
            char _ch = ' ';
            int count = 0;
            while(_ch!=';'){
                b++;
                _ch = DATA[b];
                if (_ch==',')count++;
            }
            a = a + 11;

            ListAttrib = DATA.Substring(a, b - a);
            return count;
        }
        
    }
}
