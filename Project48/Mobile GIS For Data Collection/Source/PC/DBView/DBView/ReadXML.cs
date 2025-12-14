using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Xml;
using System.Windows.Forms;

namespace DBView
{
    class ReadXML
    {
        private string DATA;
        public ReadXML(string FilePath) { 
            /*FileStream _File = new FileStream("RXMLDAT.xml",FileMode.Open)
            StreamReader SR = new StreamReader(_File);
            DATA = SR.ReadToEnd();
*/
            XmlDocument doc = new XmlDocument();
            XmlTextReader RD = new XmlTextReader(FilePath);//("RXMLDAT.xml");
            
            string sdf = "";
            try
            {
                while (RD.Read())
                {
                    if (RD.NodeType == XmlNodeType.Element)
                    {

                        if (RD.Name == "Object_ID")
                        {
                            RD.Read();
                            sdf += "_" + RD.Value + ";";
                        }

                        if (RD.Name == "Name")
                        {
                            RD.Read();
                            sdf += "+" + RD.Value + ";";
                        }

                        if (RD.Name == "Description")
                        {
                            RD.Read();
                            sdf += "*" + RD.Value + ";";
                        }

                    }


                }
            
            DATA = sdf;
        }
        catch (Exception EX)
        {
            MessageBox.Show("Data Not Found !");
        }
            
            
        }
        public string GetData() {
            return DATA;
        }

        public int GetNumberObj() {
            //Find number of "_";
            int count = 0; char _CH = ' ';
            for (int i = 0; i < DATA.Length; i++) {
                _CH = DATA[i];
                if (_CH == '_') count++;
            }
                return count;
        }

        public int GetNumberAttr() {
            return 1;
        }


    }
}
