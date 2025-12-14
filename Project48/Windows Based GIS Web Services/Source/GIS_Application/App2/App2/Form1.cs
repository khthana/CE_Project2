using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Xml;
using System.IO;
//using ASV3Sharp;
namespace App2
{
    
    public partial class Form1 : Form
    {
        Form2 getPosition = new Form2();
        Form3 addLayer = new Form3();
        Form4 about = new Form4();
      
        private XmlDocument doc;
        string filename = "d:/project/app2/app2/bin/debug/svg/map.svg";
        string findFile = "d:/project/app2/app2/bin/debug/svg/findMap.svg";
        public int getPosIndex = 0;
        int pinid = 0;
        bool isKmitlMap = true;
       
        //-------------------getMap---------------------
        string fontColor = "black";
        string fontSize = "15";
        string fontFamily = "arial";
        string fontStyle = "normal";
        string fontWeight = "normal";
        string opacity = "1";
        public string[] layer;
        public Color[] fillColor;
        public Color[] strokeColor;
        public string[] txtFill;
        public string[] txtStroke;
        public double v1 = 0;
        public double v2 = 0;
        public double v3 = 0;
        public double v4 = 0;
        //----------------------createMap---------------
        int addNumber = 0;
        int totalAdd = 0;
        int currentIndex = 0;
        string createMapFontFamily = "arial";
        string createMapFontSize = "15";
        string createMapFontColor = "black";
        string createMapFontWeight = "normal";
        string createMapFontStyle = "normal";
                      
        string[] createCoordinate = new string[100];
        string[] createName = new string[100];
        string[] createReference = new string[100];
        string[] createDetail = new string[100];
        Color[] itemFill = new Color[100];
        Color[] itemStroke = new Color[100];
        string[] itemFillTxt = new string[100];
        string[] itemStrokeTxt = new string[100];
        string[] itemType = new string[100];

        string[] itemSymbol = new string[100];

        //------------------Find--------------------
     //   string[] centroidX;
     //   string[] centroidY;
        float[] centroidX;
        float[] centroidY;

        //------------------FindAddress---------------
        string[] address;
        string[] street;
        string[] district;
        string[] province;
        string[] postcode;
        //------------------Find Nearby-------------------------------
        string fFontFamily = "arial";
        string fFontWeight = "normal";
        string fFontStyle = "normal";
        string fFontColor = "black";
        string fFontSize = "15";
        //-------------------Find Nearest ----------------------------
     
        //------------------Convert To Coordinate---------------------
        double[] addressCoordinate = new double[2];
        //------------------Calculate Distance------------------------
        double[] distancePosX = new double[20];
        double[] distancePosY = new double[20];
        int distanceIndex = 0;
        int distanceAmount = 0;
        int distanceTotal = 0;

        public Form1()
        {
            InitializeComponent();
            getPosition.frm1 = this;
            addLayer.frm1 = this;
            //imageCombo.Items.AddRange(new object[] {imageList1.Images.});


            for (int i = 0; i < itemFillTxt.Length; i++)
            {
                itemFillTxt[i] = "none";
                itemStrokeTxt[i] = "black";
                itemSymbol[i] = "none";
            }
        }

        private void domainUpDown1_SelectedItemChanged(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        public void kMITLMapServerToolStripMenuItem_Click(object sender, EventArgs e)
        {
           
        }

        private void getMap_Click(object sender, EventArgs e)
        {
            try
            {
                cusGetPos.Enabled = true;
                startPointGetPosition.Enabled = true;
                getPositionButton2.Enabled = true;
                getPositionButton.Enabled = true;
                addButton.Enabled = true;
                cusGetButton.Enabled = true;
                
                v1 = Convert.ToDouble(view1TextBox.Text);
                v2 = Convert.ToDouble(view2TextBox.Text);
                v3 = Convert.ToDouble(view3TextBox.Text);
                v4 = Convert.ToDouble(view4TextBox.Text);

                GisWebService.Service service = new GisWebService.Service();

                XmlNode node;
                doc = new XmlDocument();
                
                TextWriter request = new StringWriter();
                XmlTextWriter writer = new XmlTextWriter(request);

                writer.WriteStartElement("GetMap");
                writer.WriteStartElement("viewbox");
                writer.WriteElementString("vbox1", v1.ToString());
                writer.WriteElementString("vbox2", v2.ToString());
                writer.WriteElementString("vbox3", v3.ToString());
                writer.WriteElementString("vbox4", v4.ToString());
                writer.WriteEndElement();
                
                writer.WriteElementString("width", axSVGCtl2.Width.ToString());
                writer.WriteElementString("height", axSVGCtl2.Height.ToString());
                writer.WriteElementString("opacity", opacity);
                writer.WriteStartElement("text");
                writer.WriteElementString("text-visible", checkBoxShowText.Checked.ToString());
                writer.WriteElementString("text-family", fontFamily);
                writer.WriteElementString("text-weight", fontWeight);
                writer.WriteElementString("text-style", fontStyle);
                writer.WriteElementString("text-size", fontSize);
                writer.WriteElementString("text-color", fontColor);
                writer.WriteEndElement();
                writer.WriteElementString("mouse-event", checkBoxAddEvent.Checked.ToString());
                
                for (int i = 0; i < layer.Length; i++)
                {
                    if (layerList.GetItemChecked(i) == true)
                    {
                        writer.WriteStartElement("layer");
                        writer.WriteElementString("name", layer[i]);
                        writer.WriteElementString("fill-color", txtFill[i]);
                        writer.WriteElementString("stroke-color", txtStroke[i]);
                        writer.WriteEndElement();
                    }
                }

                writer.WriteEndElement();
                writer.Flush();
                writer.Close();

                TextReader reader = new StringReader(request.ToString());
                XmlDocument xmlRequest = new XmlDocument();
                xmlRequest.Load(reader);
                xmlRequest.Save("c:/xml/requestGetMap.xml");
                

                node = service.GetMap(request.ToString());

                doc.AppendChild(doc.ImportNode(node, true));

                doc.Save(filename);


                axSVGCtl2.setSrc(filename);

                axSVGCtl2.Show();

            }
            catch(Exception exc)
            {
            }

        }


        private void button1_Click(object sender, EventArgs e)
        {
            if (colorDialog1.ShowDialog() == DialogResult.OK)
            {
                fillBox.BackColor = colorDialog1.Color;
                fillColor[layerList.SelectedIndex] = colorDialog1.Color;
                txtFill[layerList.SelectedIndex] = String.Concat("rgb(", colorDialog1.Color.R.ToString(), " ", colorDialog1.Color.G.ToString(), " ", colorDialog1.Color.B.ToString(), ")");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (colorDialog1.ShowDialog() == DialogResult.OK)
            {
                strokeBox.BackColor = colorDialog1.Color;
                strokeColor[layerList.SelectedIndex] = colorDialog1.Color;
                txtStroke[layerList.SelectedIndex] = String.Concat("rgb(", colorDialog1.Color.R.ToString(), " ", colorDialog1.Color.G.ToString(), " ", colorDialog1.Color.B.ToString(), ")");
            }
        }

        private void layerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            fillBox.BackColor = fillColor[layerList.SelectedIndex];
            strokeBox.BackColor = strokeColor[layerList.SelectedIndex];
       
            if (layerList.CheckedItems.Count == 0)
            {
                getMap.Enabled = false;
                viewMapButton.Enabled = false;
                addressViewMap.Enabled = false;
                findNearbyButton.Enabled = false;
            }
            if (layerList.CheckedItems.Count > 0)
            {
                getMap.Enabled = true;
                findNearbyButton.Enabled = true;
            }
            
        }

        private void layerlist_ItemCheck(object sender, EventArgs e)
        {           
                getMap.Enabled = true;
        }

        private void tabPage1_Click(object sender, EventArgs e)
        {
        }

        private void checkBoxAddEvent_CheckedChanged(object sender, EventArgs e)
        {
           
        }

        private void checkBoxShowText_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBoxShowText.Checked == true)
            {
                comboFontFamily.Enabled = true;
                comboFontSize.Enabled = true;
                buttonBold.Enabled = true;
                buttonItalic.Enabled = true;
                buttonFontColor.Enabled = true;
                checkBoxAddEvent.Enabled = true;
            }
            else
            {
                comboFontFamily.Enabled = false;
                comboFontSize.Enabled = false;
                buttonBold.Enabled = false;
                buttonItalic.Enabled = false;
                buttonFontColor.Enabled = false;
                checkBoxAddEvent.Enabled = false;
            }
        }

        private void buttonBold_Click(object sender, EventArgs e)
        {
            if (buttonBold.BackColor.Equals(Color.Transparent) == true && buttonBold.FlatStyle.Equals(FlatStyle.Popup))
            {
                buttonBold.BackColor = Color.LightSteelBlue;
                buttonBold.FlatStyle = FlatStyle.Flat;
                fontWeight = "bold";
            }
            else
            {
                buttonBold.BackColor = Color.Transparent;
                buttonBold.FlatStyle = FlatStyle.Popup;
                fontWeight = "normal";
            }

        }

        private void buttonItalic_Click(object sender, EventArgs e)
        {
            if (buttonItalic.BackColor.Equals(Color.Transparent) == true && buttonItalic.FlatStyle.Equals(FlatStyle.Popup) == true)
            {
                buttonItalic.BackColor = Color.LightSteelBlue;
                buttonItalic.FlatStyle = FlatStyle.Flat;
                fontStyle = "italic";
            }
            else
            {
                buttonItalic.BackColor = Color.Transparent;
                buttonItalic.FlatStyle = FlatStyle.Popup;
                fontStyle = "normal";
            }

        }

        private void buttonFontColor_Click(object sender, EventArgs e)
        {
            if (colorDialog1.ShowDialog() == DialogResult.OK)
            {
                buttonFontColor.ForeColor = colorDialog1.Color;
                fontColor = String.Concat("rgb(", colorDialog1.Color.R.ToString(), " ", colorDialog1.Color.G.ToString(), " ", colorDialog1.Color.B.ToString(), ")");
            }

        }

        private void comboFontFamily_SelectedIndexChanged(object sender, EventArgs e)
        {
            fontFamily = comboFontFamily.SelectedItem.ToString();
        }

        private void comboFontSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            fontSize = comboFontSize.SelectedItem.ToString();
        }

        

//--------------------------- CreateMap(Jack) --------------------------------------------------
        private void createMap_Click(object sender, EventArgs e)
        {
            try
            {
                v1 = Convert.ToDouble(view1TextBox.Text);
                v2 = Convert.ToDouble(view2TextBox.Text);
                v3 = Convert.ToDouble(view3TextBox.Text);
                v4 = Convert.ToDouble(view4TextBox.Text);


                GisWebService.Service service = new GisWebService.Service();

                doc = new XmlDocument();
                XmlNode node;

                TextWriter request = new StringWriter();
                XmlTextWriter writer = new XmlTextWriter(request);

                writer.WriteStartElement("CreateMap");
                writer.WriteStartElement("viewbox");
                writer.WriteElementString("vbox1", v1.ToString());
                writer.WriteElementString("vbox2", v2.ToString());
                writer.WriteElementString("vbox3", v3.ToString());
                writer.WriteElementString("vbox4", v4.ToString());
                writer.WriteEndElement();

                writer.WriteElementString("width", axSVGCtl2.Width.ToString());
                writer.WriteElementString("height", axSVGCtl2.Height.ToString());
                writer.WriteElementString("opacity", opacity);
                writer.WriteStartElement("text");
                writer.WriteElementString("text-visible", createMouseEvent.Checked.ToString());
                writer.WriteElementString("text-family", createMapFontFamily);
                writer.WriteElementString("text-weight", createMapFontWeight);
                writer.WriteElementString("text-style", createMapFontStyle);
                writer.WriteElementString("text-size", createMapFontSize);
                writer.WriteElementString("text-color", createMapFontColor);
                writer.WriteEndElement();
                writer.WriteElementString("mouse-event", createMouseEvent.Checked.ToString());
                if (layerList.Items.Count > 0)
                {
                    for (int i = 0; i < layer.Length; i++)
                    {
                        if (layerList.GetItemChecked(i) == true)
                        {
                            writer.WriteStartElement("layer");
                            writer.WriteElementString("name", layer[i]);
                            writer.WriteElementString("fill-color", txtFill[i]);
                            writer.WriteElementString("stroke-color", txtStroke[i]);
                            writer.WriteEndElement();
                        }
                    }
                }

                for (int i = 0; i < addNumber; i++)
                {
                    writer.WriteStartElement("item");
                    writer.WriteElementString("item-type", itemType[i]);
                    writer.WriteElementString("item-symbol", itemSymbol[i]);
                    writer.WriteElementString("item-coordinate", createCoordinate[i]);
                    writer.WriteElementString("item-name", createName[i]);
                    writer.WriteElementString("item-reference", createReference[i]);
                    writer.WriteElementString("item-detail", createDetail[i]);
                    writer.WriteElementString("item-fill", itemFillTxt[i]);
                    writer.WriteElementString("item-stroke", itemStrokeTxt[i]);
                    writer.WriteEndElement();
                }

                writer.WriteEndElement();
                writer.Flush();
                writer.Close();

                TextReader reader = new StringReader(request.ToString());
                XmlDocument xmlRequest = new XmlDocument();
                xmlRequest.Load(reader);
                xmlRequest.Save("c:/xml/requestCreateMap.xml");


                node = service.CreateMap(request.ToString());

                doc.AppendChild(doc.ImportNode(node, true));

                doc.Save(filename);

                axSVGCtl2.setSrc(filename);
                axSVGCtl2.Show();

                if (totalAdd != 0)
                    createMap.Enabled = true;
                else createMap.Enabled = false;

                addNumber = 0;
                totalAdd = 0;
                currentIndex = 0;

                createCoorBox.Clear();
                createNameBox.Clear();
                createRefBox.Clear();
                createDetailBox.Clear();
                
            }
            catch (Exception exc)
            {
            }

        }

        private void radioPoint_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void radioLine_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void radioPolygon_CheckedChanged(object sender, EventArgs e)
        {
            
        }

        private void buttonAddMore_Click(object sender, EventArgs e)
        {
            if (createCoorBox.Text != "")
            {
                createCoordinate[addNumber] = createCoorBox.Text;
                createName[addNumber] = createNameBox.Text;
                createReference[addNumber] = createRefBox.Text;
                createDetail[addNumber] = createDetailBox.Text;

                if (pointType.Checked)
                {
                    itemType[addNumber] = "point";
                    itemSymbol[addNumber] = imageCombo.SelectedItem.ToString();
                }
                if (lineType.Checked)
                {
                    itemType[addNumber] = "line";
                    itemSymbol[addNumber] = "none";
                }
                if (polygonType.Checked)
                {
                    itemType[addNumber] = "polygon";
                    itemSymbol[addNumber] = "none";
                }

                addNumber++;
                currentIndex = addNumber;
                totalAdd = addNumber;
                createCoorBox.Clear();
                createNameBox.Clear();
                createRefBox.Clear();
                createDetailBox.Clear();
                textBox6.Text = totalAdd.ToString();
                if (currentIndex > 0)
                    previousButton.Enabled = true;
                if (currentIndex == 0)
                    previousButton.Enabled = false;
            }
            if (totalAdd != 0)
                createMap.Enabled = true;


            createFillBox.BackColor = Color.White;
            createStrokeBox.BackColor = Color.White;
            symbolBox.Visible = false;
        }

        private void previousButton_Click(object sender, EventArgs e)
        {
            if (currentIndex > 0)
            {
                currentIndex--;
                createCoorBox.Text = createCoordinate[currentIndex];
                createNameBox.Text = createName[currentIndex];
                createRefBox.Text = createReference[currentIndex];
                createDetailBox.Text = createDetail[currentIndex];
            }
            if (currentIndex == 0)
                previousButton.Enabled = false;
            if (currentIndex < addNumber)
                nextButton.Enabled = true;
            if (currentIndex == addNumber)
                nextButton.Enabled = false;
            createFillBox.BackColor = itemFill[currentIndex];
            createStrokeBox.BackColor = itemStroke[currentIndex];
        }

        private void nextButton_Click(object sender, EventArgs e)
        {
            if (currentIndex >= 0 && currentIndex < addNumber)
            {
                currentIndex++;
                createCoorBox.Text = createCoordinate[currentIndex];
                createNameBox.Text = createName[currentIndex];
                createRefBox.Text = createReference[currentIndex];
                createDetailBox.Text = createDetail[currentIndex];
            }
            if (currentIndex == 0)
                previousButton.Enabled = false;
            if (currentIndex < addNumber)
                nextButton.Enabled = true;
            if (currentIndex > 0)
                previousButton.Enabled = true;
            if (currentIndex == addNumber)
                nextButton.Enabled = false;
            createFillBox.BackColor = itemFill[currentIndex];
            createStrokeBox.BackColor = itemStroke[currentIndex];
        }

        private void editButton_Click(object sender, EventArgs e)
        {
            createCoordinate[currentIndex] = createCoorBox.Text;
            createName[currentIndex] = createNameBox.Text;
            createReference[currentIndex] = createRefBox.Text;
            createDetail[currentIndex] = createDetailBox.Text;
            if (pointType.Checked)
                itemType[currentIndex] = "point";
            if (lineType.Checked)
                itemType[currentIndex] = "line";
            if (polygonType.Checked)
                itemType[currentIndex] = "polygon";
        }

        private void buttonCreateMapFill_Click(object sender, EventArgs e)
        {
            if (colorDialog1.ShowDialog() == DialogResult.OK)
            {
                
                createFillBox.BackColor = colorDialog1.Color;
                itemFill[currentIndex] = colorDialog1.Color;
                itemFillTxt[currentIndex] = String.Concat("rgb(", colorDialog1.Color.R.ToString(), " ", colorDialog1.Color.G.ToString(), " ", colorDialog1.Color.B.ToString(), ")");
            }
        }

        private void buttonCreateMapStroke_Click(object sender, EventArgs e)
        {
            if (colorDialog1.ShowDialog() == DialogResult.OK)
            {
                createStrokeBox.BackColor = colorDialog1.Color;
                itemStroke[currentIndex] = colorDialog1.Color;
                itemStrokeTxt[currentIndex] = String.Concat("rgb(", colorDialog1.Color.R.ToString(), " ", colorDialog1.Color.G.ToString(), " ", colorDialog1.Color.B.ToString(), ")");
            }

        }

        private void checkBoxCreate_CheckedChanged(object sender, EventArgs e)
        {
            if (createMouseEvent.Checked == true)
            {
                createFontFamily.Enabled = true;
                createFontSize.Enabled = true;
                createFontColor.Enabled = true;
                createBold.Enabled = true;
                createItalic.Enabled = true;
            }
            else
            {
                createFontFamily.Enabled = false;
                createFontSize.Enabled = false;
                createFontColor.Enabled = false;
                createBold.Enabled = false;
                createItalic.Enabled = false;
            }
                
        }

        private void createBold_Click(object sender, EventArgs e)
        {
            if (createBold.BackColor.Equals(Color.Transparent) == true && buttonBold.FlatStyle.Equals(FlatStyle.Popup))
            {
                createBold.BackColor = Color.LightSteelBlue;
                createBold.FlatStyle = FlatStyle.Flat;
                createMapFontWeight = "bold";
            }
            else
            {
                createBold.BackColor = Color.Transparent;
                createBold.FlatStyle = FlatStyle.Popup;
                createMapFontWeight = "normal";
            }
        }

        private void createItalic_Click(object sender, EventArgs e)
        {
            if (createItalic.BackColor.Equals(Color.Transparent) == true && buttonItalic.FlatStyle.Equals(FlatStyle.Popup) == true)
            {
                createItalic.BackColor = Color.LightSteelBlue;
                createItalic.FlatStyle = FlatStyle.Flat;
                createMapFontStyle = "italic";
            }
            else
            {
                createItalic.BackColor = Color.Transparent;
                createItalic.FlatStyle = FlatStyle.Popup;
                createMapFontStyle = "normal";
            }
        }

        private void createFontColor_Click(object sender, EventArgs e)
        {
            if (colorDialog1.ShowDialog() == DialogResult.OK)
            {
                createFontColor.ForeColor = colorDialog1.Color;
                createMapFontColor = String.Concat("rgb(", colorDialog1.Color.R.ToString(), " ", colorDialog1.Color.G.ToString(), " ", colorDialog1.Color.B.ToString(), ")");
            }
        }

        private void createFontFamily_SelectedIndexChanged(object sender, EventArgs e)
        {
            createMapFontFamily = createFontFamily.SelectedItem.ToString();
        }

        private void createFontSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            createMapFontSize = createFontSize.SelectedItem.ToString();
        }
        //-------------------------- End CreateMap(Jack) ----------------------------------------

        private void findButton_Click(object sender, EventArgs e)
        {
            try
            {
                foundItemsList.Items.Clear();
                coXLable.Text = ":";
                coYLable.Text = ":";

                //-------------------------------------------------
                int count = findSelectLayerList.CheckedItems.Count;
                string[] findLayer = new string[count];
                int j = 0;
                for (int i = 0; i < layer.Length; i++)
                {
                    if (j < count)
                    {
                        if (findSelectLayerList.GetItemChecked(i) == true)
                        {
                            findLayer[j] = layer[i];
                            j++;
                        }
                    }
                }
                //-------------------------------------------------

                GisWebService.Service service = new GisWebService.Service();

                string findResult = service.Find(findTextBox.Text, findLayer, v1, v2, v3, v4);


                TextReader temp = new StringReader(findResult);
                XmlTextReader tempreader = new XmlTextReader(temp);
                int tmp = 0;
                while (tempreader.Read())
                {
                    if (tempreader.NodeType == XmlNodeType.Element)
                    {
                        if (tempreader.Name == "item") tmp++;
                    }
                }

                string[] foundItems = new string[tmp];
                centroidX = new float[tmp];
                centroidY = new float[tmp];

                TextReader txtReader = new StringReader(findResult);
                XmlTextReader xmlReader = new XmlTextReader(txtReader);

                int index1 = 0;
                int index2 = 0;
                int index3 = 0;

                while (xmlReader.Read())
                {
                    if (xmlReader.NodeType == XmlNodeType.Element)
                    {
                        if (xmlReader.Name == "name")
                        {
                            foundItems[index1] = xmlReader.ReadElementString();
                            index1++;
                        }
                        if (xmlReader.Name == "coordinateX")
                        {
                            centroidX[index2] = xmlReader.ReadElementContentAsFloat();
                            index2++;
                        }
                        if (xmlReader.Name == "coordinateY")
                        {
                            centroidY[index3] = xmlReader.ReadElementContentAsFloat();
                            index3++;
                        }

                    }
                }


                for (int i = 0; i < foundItems.Length; i++)
                    foundItemsList.Items.AddRange(new object[] { foundItems[i] });

            }
            catch(Exception exc)
            {
            }
        }

        private void foundItemsList_SelectedIndexChanged(object sender, EventArgs e)
        {

            coXLable.Text = centroidX[foundItemsList.SelectedIndex].ToString();
            coYLable.Text = centroidY[foundItemsList.SelectedIndex].ToString();

            if (foundItemsList.SelectedItems.Count == 0)
            {
                viewMapButton.Enabled = false;
            }
            if (foundItemsList.SelectedItems.Count > 0)
            {
                viewMapButton.Enabled = true;
            }
        }

        private void tabPage3_Click(object sender, EventArgs e)
        {
            labelDetail1.Text = "";
            labelDetail2.Text = "";
            labelDetail3.Text = "";
            labelDetail4.Text = "";
        }

        private void viewMapButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (isKmitlMap == true)
                {
                    doc = new XmlDocument();
                    doc.Load(filename);

                    float newVbox1 = centroidX[foundItemsList.SelectedIndex] - 233;
                    float newVbox2 = centroidY[foundItemsList.SelectedIndex] + 150;

                    XmlElement rootElement = doc.DocumentElement;
                    rootElement.SetAttribute("viewBox", newVbox1.ToString() + " -" + newVbox2.ToString() + " 300 300");

                    XmlNode root = doc.DocumentElement;

                    float imageCoX = centroidX[foundItemsList.SelectedIndex] - 7;
                    float imageCoY = centroidY[foundItemsList.SelectedIndex] + 7;

                    TextWriter w = new StringWriter();
                    XmlTextWriter markerWriter = new XmlTextWriter(w);
                    markerWriter.WriteStartElement("image");
                    markerWriter.WriteAttributeString("xmlns", "http://www.w3.org/2000/svg");
                    markerWriter.WriteAttributeString("xmlns:xlink", "http://www.w3.org/1999/xlink");
                    markerWriter.WriteAttributeString("x", imageCoX.ToString());
                    markerWriter.WriteAttributeString("y", "-" + imageCoY.ToString());
                    markerWriter.WriteAttributeString("width", "15");
                    markerWriter.WriteAttributeString("height", "15");
                    markerWriter.WriteAttributeString("xlink:href", "star_red.gif");
                    markerWriter.WriteEndElement();

                    XmlElement marker = doc.CreateElement("g", root.NamespaceURI);
                    marker.InnerXml = w.ToString();

                    root.AppendChild(marker);

                    doc.Save(findFile);

                    axSVGCtl2.setSrc(findFile);
                    axSVGCtl2.Show();
                }
                else
                {

                    doc = new XmlDocument();
                    doc.Load(filename);

                    double newVbox1 = Convert.ToDouble(centroidX[foundItemsList.SelectedIndex]) - 1.43;
                    double newVbox2 = Convert.ToDouble(centroidY[foundItemsList.SelectedIndex]) + 1;

                    XmlElement rootElement = doc.DocumentElement;
                    rootElement.SetAttribute("viewBox", newVbox1.ToString() + " -" + newVbox2.ToString() + " 2 2");

                    XmlNode root = doc.DocumentElement;

                    double imageCoX = Convert.ToDouble(centroidX[foundItemsList.SelectedIndex]);
                    double imageCoY = Convert.ToDouble(centroidY[foundItemsList.SelectedIndex]);

                    TextWriter w = new StringWriter();
                    XmlTextWriter markerWriter = new XmlTextWriter(w);
                    markerWriter.WriteStartElement("image");
                    markerWriter.WriteAttributeString("xmlns", "http://www.w3.org/2000/svg");
                    markerWriter.WriteAttributeString("xmlns:xlink", "http://www.w3.org/1999/xlink");
                    markerWriter.WriteAttributeString("x", imageCoX.ToString());
                    markerWriter.WriteAttributeString("y", "-" + imageCoY.ToString());
                    markerWriter.WriteAttributeString("width", "0.15");
                    markerWriter.WriteAttributeString("height", "0.15");
                    markerWriter.WriteAttributeString("xlink:href", "find_pin.gif");
                    markerWriter.WriteEndElement();

                    XmlElement marker = doc.CreateElement("g", root.NamespaceURI);
                    marker.InnerXml = w.ToString();

                    root.AppendChild(marker);

                    doc.Save(findFile);

                    axSVGCtl2.setSrc(findFile);
                    axSVGCtl2.Show();


                }

                
            }
            catch (Exception exc)
            {

            }
        }

        private void axSVGCtl2_Enter(object sender, EventArgs e)
        {
                    
        }

        private void findNearbyButton_Click(object sender, EventArgs e)
        {
            try
            {
                double lat = 0;
                double lon = 0;
                double radius = 0;

                if (findNearbyLatBox.Text != "" && findNearbyLongBox.Text != "")
                {
                    lat = Convert.ToDouble(findNearbyLatBox.Text);
                    lon = Convert.ToDouble(findNearbyLongBox.Text);
                }

                if (findNearbyRadiusBox.SelectedItem.ToString() != "")
                    radius = Convert.ToDouble(findNearbyRadiusBox.SelectedItem.ToString());

                if (isKmitlMap)
                {
                    TextWriter request = new StringWriter();
                    XmlTextWriter writer = new XmlTextWriter(request);

                    writer.WriteStartElement("FindNearby");
                    writer.WriteElementString("width", axSVGCtl2.Width.ToString());
                    writer.WriteElementString("height", axSVGCtl2.Height.ToString());
                    writer.WriteElementString("opacity", opacity);

                    writer.WriteStartElement("text");
                    writer.WriteElementString("text-family", fFontFamily);
                    writer.WriteElementString("text-weight", fFontWeight);
                    writer.WriteElementString("text-style", fFontStyle);
                    writer.WriteElementString("text-size", fFontSize);
                    writer.WriteElementString("text-color", fFontColor);
                    writer.WriteEndElement();

                    for (int i = 0; i < layer.Length; i++)
                    {
                        if (layerList.GetItemChecked(i) == true)
                        {
                            writer.WriteStartElement("layer");
                            writer.WriteElementString("name", layer[i]);
                            writer.WriteElementString("fill-color", txtFill[i]);
                            writer.WriteElementString("stroke-color", txtStroke[i]);
                            writer.WriteEndElement();
                        }
                    }

                    writer.WriteEndElement();
                    writer.Flush();
                    writer.Close();

                    TextReader reader = new StringReader(request.ToString());
                    XmlDocument xmlRequest = new XmlDocument();
                    xmlRequest.Load(reader);
                    xmlRequest.Save("c:/xml/findNearbyRequest.xml");


                    GisWebService.Service service = new GisWebService.Service();

                    XmlNode node;
                    doc = new XmlDocument();
                    node = service.FindNearby(lat, lon, radius, request.ToString(), findNearbyShowText.Checked, v1, v2, v3, v4);

                    doc.AppendChild(doc.ImportNode(node, true));

                    doc.Save(findFile);
                    axSVGCtl2.setSrc(findFile);
                    axSVGCtl2.Show();
                }
                else
                {
                    LinuxBaseService.Gis_GetMapServicesService service = new App2.LinuxBaseService.Gis_GetMapServicesService();

                    TextWriter w = new StringWriter();
                    XmlTextWriter writer = new XmlTextWriter(w);

                    writer.WriteStartElement("maprequest");
                    for (int i = 0; i < layer.Length; i++)
                    {
                        if (layerList.GetItemChecked(i))
                        {
                            writer.WriteStartElement("layer");
                            if (layer[i] == "States [USA]")
                                writer.WriteAttributeString("id", "10016");
                            if (layer[i] == "Roads [USA]")
                                writer.WriteAttributeString("id", "10015");
                            if (layer[i] == "Parks [USA]")
                                writer.WriteAttributeString("id", "10017");
                            if (layer[i] == "Cities [USA]")
                                writer.WriteAttributeString("id", "10020");
                            if (layer[i] == "Hospitals [USA]")
                                writer.WriteAttributeString("id", "10019");
                            if (layer[i] == "Airports [USA]")
                                writer.WriteAttributeString("id", "10018");
                            writer.WriteAttributeString("fill", txtFill[i]);
                            writer.WriteAttributeString("stroke", txtStroke[i]);
                            if (findNearbyShowText.Checked)
                            {
                                writer.WriteAttributeString("showcolumn", "name");
                                writer.WriteAttributeString("textcolor", fFontColor);
                                writer.WriteAttributeString("textsize", fFontSize);
                            }
                            writer.WriteEndElement();
                        }
                    }
                                        
                    writer.WriteEndElement();//------maprequest

                    int layerID = 0;

                    string xmlMapRequest = w.ToString();

                    switch (usList.SelectedItem.ToString())
                    {
                        case "States [USA]":
                            layerID = 10016;
                            break;
                        case "Parks [USA]":
                            layerID = 10017;
                            break;
                        case "Roads [USA]":
                            layerID = 10015;
                            break;
                        case "Hospitals [USA]":
                            layerID = 10019;
                            break;
                        case "Airports [USA]":
                            layerID = 10018;
                            break;
                        case "Cities [USA]":
                            layerID = 10020;
                            break;                            
                    }
                    
                    string usNearby = service.requestNearbySVG("1111", xmlMapRequest,layerID, v1, v2, v3, v4,lat,lon, radius,"red","blue");
                    doc = new XmlDocument();
                    doc.LoadXml(usNearby);
                    doc.Save(findFile);
                    axSVGCtl2.setSrc(findFile);
                    axSVGCtl2.Show();
                }
            }
            catch (Exception exc)
            {
            }
        }

        private void findNearbyShowText_CheckedChanged(object sender, EventArgs e)
        {
            if (findNearbyShowText.Checked == true)
            {
                findNearbyFont.Enabled = true;
                findNearbyFontSize.Enabled = true;
                findNearbyFontWeight.Enabled = true;
                findNearbyFontStyle.Enabled = true;
                findNearbyFontColor.Enabled = true;
            }
            else
            {
                findNearbyFont.Enabled = false;
                findNearbyFontSize.Enabled = false;
                findNearbyFontWeight.Enabled = false;
                findNearbyFontStyle.Enabled = false;
                findNearbyFontColor.Enabled = false;
            }
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            startXBox.Text = "PictureBoxClick";
        }

        private void textBox10_TextChanged(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void Form1_MouseLeave(object sender, EventArgs e)
        {
            //this.Cursor = new Cursor(7);
        }

        private void findAddressButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (isKmitlMap)
                {
                    findAddressListBox.Items.Clear();

                    GisWebService.Service service = new GisWebService.Service();

                    string findAddressResult = service.FindAddress(addressTextBox.Text, streetTextBox.Text, districtTextBox.Text, provinceTextBox.Text, postTextBox.Text);

                    TextReader temp = new StringReader(findAddressResult);
                    XmlTextReader tempreader = new XmlTextReader(temp);
                    int tmp = 0;
                    while (tempreader.Read())
                    {
                        if (tempreader.NodeType == XmlNodeType.Element)
                        {
                            if (tempreader.Name == "item") tmp++;
                        }
                    }

                    address = new string[tmp];
                    street = new string[tmp];
                    district = new string[tmp];
                    province = new string[tmp];
                    postcode = new string[tmp];

                    string[] fullAddress = new string[tmp];


                    TextReader txtReader = new StringReader(findAddressResult);
                    XmlTextReader xmlReader = new XmlTextReader(txtReader);

                    int index1 = 0;
                    int index2 = 0;
                    int index3 = 0;
                    int index4 = 0;
                    int index5 = 0;

                    while (xmlReader.Read())
                    {
                        if (xmlReader.NodeType == XmlNodeType.Element)
                        {
                            if (xmlReader.Name == "address")
                            {
                                address[index1] = xmlReader.ReadElementString();
                                index1++;
                            }
                            if (xmlReader.Name == "street")
                            {
                                street[index2] = xmlReader.ReadElementString();
                                index2++;
                            }
                            if (xmlReader.Name == "district")
                            {
                                district[index3] = xmlReader.ReadElementString();
                                index3++;
                            }
                            if (xmlReader.Name == "province")
                            {
                                province[index4] = xmlReader.ReadElementString();
                                index4++;
                            }
                            if (xmlReader.Name == "postcode")
                            {
                                postcode[index5] = xmlReader.ReadElementString();
                                index5++;
                            }

                        }
                    }
                    xmlReader.Close();

                    for (int i = 0; i < tmp; i++)
                        fullAddress[i] = address[i] + " " + street[i] + " " + district[i] + " " + province[i] + " " + postcode[i];

                    for (int i = 0; i < fullAddress.Length; i++)
                        findAddressListBox.Items.AddRange(new object[] { fullAddress[i] });
                }
                else
                {
                    findAddressListBox.Items.Clear();
                    string address = "Your specific address not found";
                    findAddressListBox.Items.AddRange(new object[] { address }); 
                }
            }
            catch (Exception exc)
            {
            }
        }

        private void view1TextBox_TextChanged(object sender, EventArgs e)
        {
            //v1 = Convert.ToDouble(view1TextBox.Text);
        }

        private void view2TextBox_TextChanged(object sender, EventArgs e)
        {
            //v2 = Convert.ToDouble(view2TextBox.Text);
        }

        private void view3TextBox_TextChanged(object sender, EventArgs e)
        {
            //v3 = Convert.ToDouble(view3TextBox.Text);
        }

        private void view4TextBox_TextChanged(object sender, EventArgs e)
        {
            //v4 = Convert.ToDouble(view4TextBox.Text);
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            addLayer.ShowDialog();          
        }

        private void findAddressListBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            addressViewMap.Enabled = false;

            if (findAddressListBox.SelectedItems.Count == 0)
            {
                ConvertToCoordinate.Enabled = false;
            }
            if (findAddressListBox.SelectedItems.Count > 0)
            {
                ConvertToCoordinate.Enabled = true;
            }
            
        }

        private void ConvertToCoordinate_Click(object sender, EventArgs e)
        {
            try
            {
                GisWebService.Service service = new GisWebService.Service();

                addressCoordinate = service.ConvertAddressToCoordinate(address[findAddressListBox.SelectedIndex], street[findAddressListBox.SelectedIndex], district[findAddressListBox.SelectedIndex], province[findAddressListBox.SelectedIndex], postcode[findAddressListBox.SelectedIndex]);

                labelDetail1.Text = "Coordinate X";
                labelDetail3.Text = "Coordinate Y";
                labelDetail2.Text = addressCoordinate[0].ToString();
                labelDetail4.Text = addressCoordinate[1].ToString();

                addressViewMap.Enabled = true;
            }
            catch (Exception exc)
            {
            
            }
        }

        private void findNearbyFontWeight_Click(object sender, EventArgs e)
        {
            if (findNearbyFontWeight.BackColor.Equals(Color.Transparent) == true && findNearbyFontWeight.FlatStyle.Equals(FlatStyle.Popup))
            {
                findNearbyFontWeight.BackColor = Color.LightSteelBlue;
                findNearbyFontWeight.FlatStyle = FlatStyle.Flat;
                fFontWeight = "bold";
            }
            else
            {
                findNearbyFontWeight.BackColor = Color.Transparent;
                findNearbyFontWeight.FlatStyle = FlatStyle.Popup;
                fFontWeight = "normal";
            }
        }

        private void findNearbyFontStyle_Click(object sender, EventArgs e)
        {
            if (findNearbyFontStyle.BackColor.Equals(Color.Transparent) == true && findNearbyFontStyle.FlatStyle.Equals(FlatStyle.Popup) == true)
            {
                findNearbyFontStyle.BackColor = Color.LightSteelBlue;
                findNearbyFontStyle.FlatStyle = FlatStyle.Flat;
                fFontStyle = "italic";
            }
            else
            {
                findNearbyFontStyle.BackColor = Color.Transparent;
                findNearbyFontStyle.FlatStyle = FlatStyle.Popup;
                fFontStyle = "normal";
            }
        }

        private void findNearbyFontColor_Click(object sender, EventArgs e)
        {
            if (colorDialog1.ShowDialog() == DialogResult.OK)
            {
                findNearbyFontColor.ForeColor = colorDialog1.Color;
                fFontColor = String.Concat("rgb(", colorDialog1.Color.R.ToString(), " ", colorDialog1.Color.G.ToString(), " ", colorDialog1.Color.B.ToString(), ")");
            }
        }

        private void findNearbyFontSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            fFontSize = findNearbyFontSize.SelectedItem.ToString();
        }

        private void findNearbyFont_SelectedIndexChanged(object sender, EventArgs e)
        {
            fFontFamily = findNearbyFont.SelectedItem.ToString();
        }

        private void addressViewMap_Click(object sender, EventArgs e)
        {
            try
            {
                GisWebService.Service service = new GisWebService.Service();

                doc = new XmlDocument();
                XmlNode node;
                double newVbox1 = addressCoordinate[0] - 233;
                double newVbox2 = addressCoordinate[1] + 150;

                TextWriter request = new StringWriter();
                XmlTextWriter writer = new XmlTextWriter(request);

                writer.WriteStartElement("GetMap");
                writer.WriteStartElement("viewbox");
                writer.WriteElementString("vbox1", newVbox1.ToString());
                writer.WriteElementString("vbox2", newVbox2.ToString());
                writer.WriteElementString("vbox3", "300");
                writer.WriteElementString("vbox4", "300");
                writer.WriteEndElement();

                writer.WriteElementString("width", axSVGCtl2.Width.ToString());
                writer.WriteElementString("height", axSVGCtl2.Height.ToString());
                writer.WriteElementString("opacity", opacity);
                writer.WriteStartElement("text");
                writer.WriteElementString("text-visible", "True");
                writer.WriteElementString("text-family", "verdana");
                writer.WriteElementString("text-weight", "normal");
                writer.WriteElementString("text-style", "normal");
                writer.WriteElementString("text-size", "5");
                writer.WriteElementString("text-color", fontColor);
                writer.WriteEndElement();
                writer.WriteElementString("mouse-event", "False");

                for (int i = 0; i < layer.Length; i++)
                {
                    if (layerList.GetItemChecked(i) == true)
                    {
                        writer.WriteStartElement("layer");
                        writer.WriteElementString("name", layer[i]);
                        writer.WriteElementString("fill-color", txtFill[i]);
                        writer.WriteElementString("stroke-color", txtStroke[i]);
                        writer.WriteEndElement();
                    }
                }

                writer.WriteEndElement();
                writer.Flush();
                writer.Close();

                TextReader reader = new StringReader(request.ToString());
                XmlDocument xmlRequest = new XmlDocument();
                xmlRequest.Load(reader);
                xmlRequest.Save("c:/xml/request.xml");


                node = service.GetMap(request.ToString());

                doc.AppendChild(doc.ImportNode(node, true));

                XmlNode root = doc.DocumentElement;

                double imageCoX = addressCoordinate[0] - 7;
                double imageCoY = addressCoordinate[1] + 7;

                TextWriter w = new StringWriter();
                XmlTextWriter markerWriter = new XmlTextWriter(w);
                markerWriter.WriteStartElement("image");
                markerWriter.WriteAttributeString("xmlns", "http://www.w3.org/2000/svg");
                markerWriter.WriteAttributeString("xmlns:xlink", "http://www.w3.org/1999/xlink");
                markerWriter.WriteAttributeString("x", imageCoX.ToString());
                markerWriter.WriteAttributeString("y", "-" + imageCoY.ToString());
                markerWriter.WriteAttributeString("width", "15");
                markerWriter.WriteAttributeString("height", "15");
                markerWriter.WriteAttributeString("xlink:href", "star_red.gif");
                markerWriter.WriteEndElement();

                XmlElement marker = doc.CreateElement("g", root.NamespaceURI);
                marker.InnerXml = w.ToString();


                root.AppendChild(marker);

                doc.Save(findFile);

                axSVGCtl2.setSrc(findFile);
                axSVGCtl2.Show();
            }
            catch (Exception exc)
            {
            }
           
        }

        private void fNearestButton_Click(object sender, EventArgs e)
        {
            try
            {
                doc.Load(filename);
                double fNearestRefX = 0;
                double fNearestRefY = 0;
                string fNearestRefName = "";
                double itemNearestX = 0;
                double itemNearestY = 0;
                string itemNearestName = "";

                GisWebService.Service service = new GisWebService.Service();
                if (fNearestXBox.Text != "")
                    fNearestRefX = Convert.ToDouble(fNearestXBox.Text);
                if (fNearestYBox.Text != "")
                    fNearestRefY = Convert.ToDouble(fNearestYBox.Text);

                fNearestRefName = fNearestNameBox.Text;

                string findNearestResult = service.FindNearest(fNearestRefX, fNearestRefY, fNearestRefName, layer[fNearestListbox.SelectedIndex]);

                TextReader temp = new StringReader(findNearestResult);
                XmlTextReader tempreader = new XmlTextReader(temp);
                int tmp = 0;
                while (tempreader.Read())
                {
                    if (tempreader.NodeType == XmlNodeType.Element)
                    {
                        if (tempreader.Name == "item") tmp++;
                    }
                }

                TextReader txtReader = new StringReader(findNearestResult);
                XmlTextReader xmlReader = new XmlTextReader(txtReader);

                while (xmlReader.Read())
                {
                    if (xmlReader.NodeType == XmlNodeType.Element)
                    {
                        if (xmlReader.Name == "name")
                        {
                            itemNearestName = xmlReader.ReadElementString();
                        }
                        if (xmlReader.Name == "coordinateX")
                        {
                            itemNearestX = xmlReader.ReadElementContentAsDouble();
                        }
                        if (xmlReader.Name == "coordinateY")
                        {
                            itemNearestY = xmlReader.ReadElementContentAsDouble();
                        }

                    }
                }

                labelDetail1.Text = "Name";
                labelDetail2.Text = itemNearestName;
                labelDetail3.Text = "Coordinate X";
                labelDetail4.Text = itemNearestX.ToString();
                labelDetail5.Text = "Coordinate Y";
                labelDetail6.Text = itemNearestY.ToString();

                

                if (isKmitlMap == true)
                {
                    doc = new XmlDocument();
                    doc.Load(filename);

                    XmlNode root = doc.DocumentElement;

                    double imageCoX = itemNearestX - 7;
                    double imageCoY = itemNearestY + 7;

                    TextWriter w = new StringWriter();
                    XmlTextWriter markerWriter = new XmlTextWriter(w);
                    markerWriter.WriteStartElement("image");
                    markerWriter.WriteAttributeString("xmlns", "http://www.w3.org/2000/svg");
                    markerWriter.WriteAttributeString("xmlns:xlink", "http://www.w3.org/1999/xlink");
                    markerWriter.WriteAttributeString("x", imageCoX.ToString());
                    markerWriter.WriteAttributeString("y", "-" + imageCoY.ToString());
                    markerWriter.WriteAttributeString("width", "15");
                    markerWriter.WriteAttributeString("height", "15");
                    markerWriter.WriteAttributeString("xlink:href", "star_red.gif");
                    markerWriter.WriteEndElement();
                    markerWriter.WriteStartElement("circle");
                    markerWriter.WriteAttributeString("xmlns", "http://www.w3.org/2000/svg");
                    markerWriter.WriteAttributeString("cx", fNearestRefX.ToString());
                    markerWriter.WriteAttributeString("cy", "-" + fNearestRefY.ToString());
                    markerWriter.WriteAttributeString("r", "5");
                    markerWriter.WriteAttributeString("fill", "red");
                    markerWriter.WriteEndElement();

                    XmlElement marker = doc.CreateElement("g", root.NamespaceURI);
                    marker.InnerXml = w.ToString();

                    root.AppendChild(marker);

                    doc.Save(findFile);

                    axSVGCtl2.setSrc(findFile);
                    axSVGCtl2.Show();
                }
                else
                {
                    doc = new XmlDocument();
                    doc.Load(filename);

                    XmlNode root = doc.DocumentElement;

                    double imageCoX = itemNearestX;
                    double imageCoY = itemNearestY;

                    TextWriter w = new StringWriter();
                    XmlTextWriter markerWriter = new XmlTextWriter(w);
                    markerWriter.WriteStartElement("image");
                    markerWriter.WriteAttributeString("xmlns", "http://www.w3.org/2000/svg");
                    markerWriter.WriteAttributeString("xmlns:xlink", "http://www.w3.org/1999/xlink");
                    markerWriter.WriteAttributeString("x", imageCoX.ToString());
                    markerWriter.WriteAttributeString("y", "-" + imageCoY.ToString());
                    markerWriter.WriteAttributeString("width", "0.15");
                    markerWriter.WriteAttributeString("height", "0.15");
                    markerWriter.WriteAttributeString("xlink:href", "find_pin.gif");
                    markerWriter.WriteEndElement();
                   /* markerWriter.WriteStartElement("circle");
                    markerWriter.WriteAttributeString("xmlns", "http://www.w3.org/2000/svg");
                    markerWriter.WriteAttributeString("cx", fNearestRefX.ToString());
                    markerWriter.WriteAttributeString("cy", "-" + fNearestRefY.ToString());
                    markerWriter.WriteAttributeString("r", "0.02");
                    markerWriter.WriteAttributeString("fill", "red");
                    markerWriter.WriteEndElement();*/

                    XmlElement marker = doc.CreateElement("g", root.NamespaceURI);
                    marker.InnerXml = w.ToString();

                    root.AppendChild(marker);

                    doc.Save(findFile);

                    axSVGCtl2.setSrc(findFile);
                    axSVGCtl2.Show();
                   
                }

               
            }
            catch (Exception exc)
           {
           }
        }

        private void distanceButton_Click(object sender, EventArgs e)
        {
            try
            {
                doc.Load(filename);
                GisWebService.Service service = new GisWebService.Service();

                double distanceValue = 0;

                if (isKmitlMap == true)
                {
                    doc.Load(filename);

                    int j = 0;

                    for (int i = 0; i < distanceTotal; i++)
                    {
                        if (i != distanceTotal - 1)
                        {
                            j++;
                            distanceValue += service.CalculateDistance(distancePosX[i], distancePosY[i], distancePosX[j], distancePosY[j]);

                            double imageCoXStart = distancePosX[i];
                            double imageCoYStart = distancePosY[i] + 21;

                            double imageCoXEnd = distancePosX[j];
                            double imageCoYEnd = distancePosY[j] + 21;

                            XmlNode root = doc.DocumentElement;

                            TextWriter w = new StringWriter();
                            XmlTextWriter markerWriter = new XmlTextWriter(w);
                            markerWriter.WriteStartElement("path", doc.NamespaceURI);
                            markerWriter.WriteAttributeString("fill", "red");
                            markerWriter.WriteAttributeString("stroke", "red");
                            markerWriter.WriteAttributeString("stroke-width", "3");
                            markerWriter.WriteAttributeString("d", "M " + distancePosX[i].ToString() + " -" + distancePosY[i].ToString() + "," + distancePosX[j].ToString() + " -" + distancePosY[j].ToString());
                            markerWriter.WriteEndElement();
                            markerWriter.WriteStartElement("image", doc.NamespaceURI);
                            markerWriter.WriteAttributeString("xmlns:xlink", "http://www.w3.org/1999/xlink");
                            markerWriter.WriteAttributeString("x", imageCoXStart.ToString());
                            markerWriter.WriteAttributeString("y", "-" + imageCoYStart.ToString());
                            markerWriter.WriteAttributeString("width", "21");
                            markerWriter.WriteAttributeString("height", "21");
                            markerWriter.WriteAttributeString("xlink:href", "gr_pin.gif");
                            markerWriter.WriteEndElement();
                            markerWriter.WriteStartElement("image", doc.NamespaceURI);
                            markerWriter.WriteAttributeString("xmlns:xlink", "http://www.w3.org/1999/xlink");
                            markerWriter.WriteAttributeString("x", imageCoXEnd.ToString());
                            markerWriter.WriteAttributeString("y", "-" + imageCoYEnd.ToString());
                            markerWriter.WriteAttributeString("width", "21");
                            markerWriter.WriteAttributeString("height", "21");
                            markerWriter.WriteAttributeString("xlink:href", "or_pin.gif");
                            markerWriter.WriteEndElement();

                            XmlElement marker = doc.CreateElement("g", root.NamespaceURI);
                            marker.SetAttribute("xmlns", "http://www.w3.org/2000/svg");
                            marker.InnerXml = w.ToString();

                            root.AppendChild(marker);

                            doc.Save(findFile);
                            axSVGCtl2.setSrc(findFile);
                        }

                        labelDistance.Text = distanceValue.ToString();

                        groupBox13.Text = "Distance (Metres)";
                    }
                }
                else
                {
                    doc.Load(filename);

                    int j = 0;

                    for (int i = 0; i < distanceTotal; i++)
                    {
                        if (i != distanceTotal - 1)
                        {
                            j++;
                            distanceValue += service.CalculateDistance(distancePosX[i], distancePosY[i], distancePosX[j], distancePosY[j]);

                            double imageCoXStart = distancePosX[i];
                            double imageCoYStart = distancePosY[i] + 0.21;

                            double imageCoXEnd = distancePosX[j];
                            double imageCoYEnd = distancePosY[j] + 0.21;

                            XmlNode root = doc.DocumentElement;

                            TextWriter w = new StringWriter();
                            XmlTextWriter markerWriter = new XmlTextWriter(w);
                            markerWriter.WriteStartElement("path", doc.NamespaceURI);
                            markerWriter.WriteAttributeString("fill", "red");
                            markerWriter.WriteAttributeString("stroke", "red");
                            markerWriter.WriteAttributeString("stroke-width", "0.01");
                            markerWriter.WriteAttributeString("d", "M " + distancePosX[i].ToString() + " -" + distancePosY[i].ToString() + "," + distancePosX[j].ToString() + " -" + distancePosY[j].ToString());
                            markerWriter.WriteEndElement();
                            markerWriter.WriteStartElement("image", doc.NamespaceURI);
                            markerWriter.WriteAttributeString("xmlns:xlink", "http://www.w3.org/1999/xlink");
                            markerWriter.WriteAttributeString("x", imageCoXStart.ToString());
                            markerWriter.WriteAttributeString("y", "-" + imageCoYStart.ToString());
                            markerWriter.WriteAttributeString("width", "0.21");
                            markerWriter.WriteAttributeString("height", "0.21");
                            markerWriter.WriteAttributeString("xlink:href", "gr_pin.gif");
                            markerWriter.WriteEndElement();
                            markerWriter.WriteStartElement("image", doc.NamespaceURI);
                            markerWriter.WriteAttributeString("xmlns:xlink", "http://www.w3.org/1999/xlink");
                            markerWriter.WriteAttributeString("x", imageCoXEnd.ToString());
                            markerWriter.WriteAttributeString("y", "-" + imageCoYEnd.ToString());
                            markerWriter.WriteAttributeString("width", "0.21");
                            markerWriter.WriteAttributeString("height", "0.21");
                            markerWriter.WriteAttributeString("xlink:href", "or_pin.gif");
                            markerWriter.WriteEndElement();

                            XmlElement marker = doc.CreateElement("g", root.NamespaceURI);
                            marker.SetAttribute("xmlns", "http://www.w3.org/2000/svg");
                            marker.InnerXml = w.ToString();

                            root.AppendChild(marker);

                            doc.Save(findFile);
                            axSVGCtl2.setSrc(findFile);
                        }
                        double miles = distanceValue * 100;

                        labelDistance.Text = miles.ToString();

                        groupBox13.Text = "Distance (Kilometres)";
                    }
                }

                distanceIndex = 0;
                distanceAmount = 0;
                distanceTotal = 0;
                distanceBack.Enabled = false;
            }
            catch
            {
            }
        }

        private void tabControl1_SeletedIndexChange(object sender, EventArgs e)
        {
            labelDetail1.Text = "";
            labelDetail2.Text = "";
            labelDetail3.Text = "";
            labelDetail4.Text = "";
            labelDetail5.Text = "";
            labelDetail6.Text = "";
            
        }

        private void addButton_Click(object sender, EventArgs e)
        {
            double markPostX = 0;
            double markPostY = 0;
            double imageCoX = 0;
            double imageCoY = 0;
            double textCoX = 0;
            double textCoY = 0;
            double imageWidth = 0;
            double imageHeight = 0;
            string markText = "";
            string markReference = "";
            string markPath = "";
            
        //-----------------------------------------------------------
            if (cusXBox.Text != "")
                markPostX = Convert.ToDouble(cusXBox.Text);
            if (cusYBox.Text != "")
                markPostY = Convert.ToDouble(cusYBox.Text);
            markText = cusTextBox.Text;
            markReference = cusRefBox.Text;

            textCoX = markPostX;
        //----------------------Radio button check-------------------
            if (cusRadio1.Checked)
            {
                markPath = "pinpoint_blue.gif";
                if (isKmitlMap == true)
                {
                    imageCoX = markPostX;
                    imageCoY = markPostY + 20;
                    imageWidth = 20;
                    imageHeight = 20;
                    textCoY = markPostY + 20;
                }
                else
                {
                    imageCoX = markPostX;
                    imageCoY = markPostY + 0.18;
                    imageWidth = 0.18;
                    imageHeight = 0.18;
                    textCoY = markPostY + 0.18;
                }
                
            }
            if (cusRadio2.Checked)
            {
                markPath = "pinpoint_green.gif";
                if (isKmitlMap == true)
                {
                    imageCoX = markPostX;
                    imageCoY = markPostY + 20;
                    imageWidth = 20;
                    imageHeight = 20;
                    textCoY = markPostY + 20;
                }
                else
                {
                    imageCoX = markPostX;
                    imageCoY = markPostY + 0.2;
                    imageWidth = 0.2;
                    imageHeight = 0.2;
                    textCoY = markPostY + 0.2;
                }
            }
            if (cusRadio3.Checked)
            {
                markPath = "pinpoint_red.gif";
                if (isKmitlMap == true)
                {
                    imageCoX = markPostX;
                    imageCoY = markPostY + 20;
                    imageWidth = 20;
                    imageHeight = 20;
                    textCoY = markPostY + 20;
                }
                else
                {
                    imageCoX = markPostX;
                    imageCoY = markPostY + 0.2;
                    imageWidth = 0.2;
                    imageHeight = 0.2;
                    textCoY = markPostY + 0.2;
                }
            }
            if (cusRadio4.Checked)
            {
                markPath = "star_red.gif";
                if (isKmitlMap == true)
                {
                    imageCoX = markPostX - 9;
                    imageCoY = markPostY + 9;
                    imageWidth = 18;
                    imageHeight = 18;
                    textCoY = markPostY + 18;
                }
                else
                {
                    imageCoX = markPostX - 0.09;
                    imageCoY = markPostY + 0.09;
                    imageWidth = 0.18;
                    imageHeight = 0.18;
                    textCoY = markPostY + 0.18;
                }
            }
            if (cusRadio5.Checked)
            {
                markPath = "cross_yellow.gif";
                if (isKmitlMap == true)
                {
                    imageCoX = markPostX - 8;
                    imageCoY = markPostY + 8;
                    imageWidth = 16;
                    imageHeight = 16;
                    textCoY = markPostY + 16;
                }
                else
                {
                    imageCoX = markPostX - 0.08;
                    imageCoY = markPostY + 0.08;
                    imageWidth = 0.16;
                    imageHeight = 0.16;
                    textCoY = markPostY + 0.16;
                }
            }
            if (cusRadio6.Checked)
            {
                markPath = "cross_red.gif";
                if (isKmitlMap == true)
                {
                    imageCoX = markPostX - 8;
                    imageCoY = markPostY + 8;
                    imageWidth = 16;
                    imageHeight = 16;
                    textCoY = markPostY + 16;
                }
                else
                {
                    imageCoX = markPostX - 0.08;
                    imageCoY = markPostY + 0.08;
                    imageWidth = 0.16;
                    imageHeight = 0.16;
                    textCoY = markPostY + 0.16;
                }
            }
            if (cusRadio7.Checked)
            {
                markPath = "home_yellow.gif";
                if (isKmitlMap == true)
                {
                    imageCoX = markPostX - 8;
                    imageCoY = markPostY + 8;
                    imageWidth = 16;
                    imageHeight = 16;
                    textCoY = markPostY + 16;
                }
                else
                {
                    imageCoX = markPostX - 0.08;
                    imageCoY = markPostY + 0.08;
                    imageWidth = 0.16;
                    imageHeight = 0.16;
                    textCoY = markPostY + 0.16;
                }
            }
            if (cusRadio8.Checked)
            {
                markPath = "museum.gif";
                if (isKmitlMap == true)
                {
                    imageCoX = markPostX - 11;
                    imageCoY = markPostY + 9.5;
                    imageWidth = 22;
                    imageHeight = 19;
                    textCoY = markPostY + 19;
                }
                else
                {
                    imageCoX = markPostX - 0.11;
                    imageCoY = markPostY + 0.095;
                    imageWidth = 0.22;
                    imageHeight = 0.19;
                    textCoY = markPostY + 0.19;
                }
            }
            if (cusRadio9.Checked)
            {
                markPath = "briefcase.gif";
                if (isKmitlMap == true)
                {
                    imageCoX = markPostX - 8.5;
                    imageCoY = markPostY + 8.5;
                    imageWidth = 17;
                    imageHeight = 17;
                    textCoY = markPostY + 17;
                }
                else
                {
                    imageCoX = markPostX - 0.085;
                    imageCoY = markPostY + 0.085;
                    imageWidth = 0.17;
                    imageHeight = 0.17;
                    textCoY = markPostY + 0.17;
                }
            }
            if (cusRadio10.Checked)
            {
                markPath = "book.gif";
                if (isKmitlMap == true)
                {
                    imageCoX = markPostX - 10;
                    imageCoY = markPostY + 10;
                    imageWidth = 20;
                    imageHeight = 20;
                    textCoY = markPostY + 20;
                }
                else
                {
                    imageCoX = markPostX - 0.1;
                    imageCoY = markPostY + 0.1;
                    imageWidth = 0.20;
                    imageHeight = 0.20;
                    textCoY = markPostY + 0.20;
                }
            }
            if (cusRadio11.Checked)
            {
                markPath = "school.gif";
                if (isKmitlMap == true)
                {
                    imageCoX = markPostX - 7.5;
                    imageCoY = markPostY + 9;
                    imageWidth = 15;
                    imageHeight = 18;
                    textCoY = markPostY + 18;
                }
                else
                {
                    imageCoX = markPostX - 0.075;
                    imageCoY = markPostY + 0.09;
                    imageWidth = 0.15;
                    imageHeight = 0.18;
                    textCoY = markPostY + 0.18;
                }
            }
            if (cusRadio12.Checked)
            {
                markPath = "bank.gif";
                if (isKmitlMap == true)
                {
                    imageCoX = markPostX - 6.5;
                    imageCoY = markPostY + 6.5;
                    imageWidth = 13;
                    imageHeight = 13;
                    textCoY = markPostY + 14;
                }
                else
                {
                    imageCoX = markPostX - 0.065;
                    imageCoY = markPostY + 0.065;
                    imageWidth = 0.13;
                    imageHeight = 0.13;
                    textCoY = markPostY + 0.13;
                }
            }
            if (cusRadio13.Checked)
            {
                markPath = "rd_pin.gif";
                if (isKmitlMap == true)
                {
                    imageCoX = markPostX;
                    imageCoY = markPostY + 21;
                    imageWidth = 21;
                    imageHeight = 21;
                    textCoY = markPostY + 21;
                }
                else
                {
                    imageCoX = markPostX;
                    imageCoY = markPostY + 0.21;
                    imageWidth = 0.21;
                    imageHeight = 0.21;
                    textCoY = markPostY + 0.21;
                }
            }
            if (cusRadio14.Checked)
            {
                markPath = "gr_pin.gif";
                if (isKmitlMap == true)
                {
                    imageCoX = markPostX;
                    imageCoY = markPostY + 21;
                    imageWidth = 21;
                    imageHeight = 21;
                    textCoY = markPostY + 21;
                }
                else 
                {
                    imageCoX = markPostX;
                    imageCoY = markPostY + 0.21;
                    imageWidth = 0.21;
                    imageHeight = 0.21;
                    textCoY = markPostY + 0.21;
                }
            }
            if (cusRadio15.Checked)
            {
                markPath = "or_pin.gif";
                if (isKmitlMap == true)
                {
                    imageCoX = markPostX;
                    imageCoY = markPostY + 21;
                    imageWidth = 21;
                    imageHeight = 21;
                    textCoY = markPostY + 21;
                }
                else
                {
                    imageCoX = markPostX;
                    imageCoY = markPostY + 0.21;
                    imageWidth = 0.21;
                    imageHeight = 0.21;
                    textCoY = markPostY + 0.21;
                }
            }
        //------------------------------------------------------------
            
   
        //------------------------------------------------------------
            XmlNode root = doc.DocumentElement;

            TextWriter w = new StringWriter();
            XmlTextWriter markerWriter = new XmlTextWriter(w);
            if(cusRadio1.Checked || cusRadio2.Checked || cusRadio3.Checked || cusRadio4.Checked || cusRadio5.Checked || cusRadio6.Checked || cusRadio7.Checked || cusRadio8.Checked || cusRadio9.Checked || cusRadio10.Checked || cusRadio11.Checked || cusRadio12.Checked || cusRadio13.Checked || cusRadio14.Checked || cusRadio15.Checked)
            {

                if (markReference != "")
                {
                    markerWriter.WriteStartElement("a",doc.NamespaceURI);
                    markerWriter.WriteAttributeString("xmlns", "http://www.w3.org/2000/svg");
                    markerWriter.WriteAttributeString("xmlns:xlink", "http://www.w3.org/1999/xlink");
                    markerWriter.WriteAttributeString("xlink:href", markReference);
                }
                markerWriter.WriteStartElement("g",doc.NamespaceURI);
                markerWriter.WriteStartElement("image",doc.NamespaceURI);
                markerWriter.WriteAttributeString("xmlns:xlink", "http://www.w3.org/1999/xlink");
                markerWriter.WriteAttributeString("x", imageCoX.ToString());
                markerWriter.WriteAttributeString("y", "-" + imageCoY.ToString());
                markerWriter.WriteAttributeString("width", imageWidth.ToString());
                markerWriter.WriteAttributeString("height", imageHeight.ToString());
                markerWriter.WriteAttributeString("xlink:href", markPath);
                markerWriter.WriteEndElement();
                markerWriter.WriteEndElement();

                if (markReference != "")
                    markerWriter.WriteEndElement();

                if (markText != "")
                {
                    markerWriter.WriteStartElement("text", doc.NamespaceURI);
                    markerWriter.WriteAttributeString("x", textCoX.ToString());
                    markerWriter.WriteAttributeString("y", "-" + textCoY.ToString());
                    markerWriter.WriteAttributeString("fill", fontColor);
                    if (isKmitlMap == false)
                        markerWriter.WriteAttributeString("font-size", "0.2");
                    markerWriter.WriteString(markText);
                    markerWriter.WriteEndElement();
                }
           
            XmlElement marker = doc.CreateElement("g");
            marker.SetAttribute("xmlns", "http://www.w3.org/2000/svg");
            marker.SetAttribute("id", "pin"+pinid.ToString());
            marker.InnerXml = w.ToString();

            root.AppendChild(marker);
            doc.Save(filename);
            pinid++;
            }
            axSVGCtl2.setSrc(filename);
            axSVGCtl2.Show();
        }

        private void cusGetButton_Click(object sender, EventArgs e)
        {
            try
            {
                
                GisWebService.Service service = new GisWebService.Service();

                doc = new XmlDocument();
                XmlNode node;

                TextWriter request = new StringWriter();
                XmlTextWriter writer = new XmlTextWriter(request);

                writer.WriteStartElement("GetMap");
                writer.WriteStartElement("viewbox");
                writer.WriteElementString("vbox1", v1.ToString());
                writer.WriteElementString("vbox2", v2.ToString());
                writer.WriteElementString("vbox3", v3.ToString());
                writer.WriteElementString("vbox4", v4.ToString());
                writer.WriteEndElement();

                writer.WriteElementString("width", axSVGCtl2.Width.ToString());
                writer.WriteElementString("height", axSVGCtl2.Height.ToString());
                writer.WriteElementString("opacity", opacity);
                writer.WriteStartElement("text");
                writer.WriteElementString("text-visible", checkBoxShowText.Checked.ToString());
                writer.WriteElementString("text-family", fontFamily);
                writer.WriteElementString("text-weight", fontWeight);
                writer.WriteElementString("text-style", fontStyle);
                writer.WriteElementString("text-size", fontSize);
                writer.WriteElementString("text-color", fontColor);
                writer.WriteEndElement();
                writer.WriteElementString("mouse-event", checkBoxAddEvent.Checked.ToString());

                for (int i = 0; i < layer.Length; i++)
                {
                    if (layerList.GetItemChecked(i) == true)
                    {
                        writer.WriteStartElement("layer");
                        writer.WriteElementString("name", layer[i]);
                        writer.WriteElementString("fill-color", txtFill[i]);
                        writer.WriteElementString("stroke-color", txtStroke[i]);
                        writer.WriteEndElement();
                    }
                }

                writer.WriteEndElement();
                writer.Flush();
                writer.Close();

                TextReader reader = new StringReader(request.ToString());
                XmlDocument xmlRequest = new XmlDocument();
                xmlRequest.Load(reader);
                xmlRequest.Save("c:/xml/requestGetMap.xml");

                node = service.GetMap(request.ToString());

                doc.AppendChild(doc.ImportNode(node, true));

                doc.Save(filename);

                axSVGCtl2.setSrc(filename);
                axSVGCtl2.Show();
               
            }
            catch (Exception exc)
            {
            }
        }       

        private void fillOpacity_SelectedIndexChange(object sender, EventArgs e)
        {
            opacity = fillOpacityCombo.SelectedItem.ToString();
        }

        private void deleteButton_Click(object sender, EventArgs e)
        {
            
        }

        private void getPositionButton_Click(object sender, EventArgs e)
        {
            getPosIndex = 0;
            getPosition.ShowDialog();
        }

        private void getPositionButton2_Click(object sender, EventArgs e)
        {
            getPosIndex = 0;
            getPosition.ShowDialog();
        }

        private void startPointGetPosition_Click(object sender, EventArgs e)
        {
            getPosIndex = 1;
            getPosition.ShowDialog();
        }

        private void endPointGetPosition_Click(object sender, EventArgs e)
        {
            getPosIndex = 2;
            getPosition.ShowDialog();
        }

        private void cusGetPos_Click(object sender, EventArgs e)
        {
            getPosIndex = 3;
            getPosition.ShowDialog();
        }

        private void uSAMapToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }
       

        private void defaultKMITL_Click(object sender, EventArgs e)
        {
            view1TextBox.Text = "691233.4485149225";
            view2TextBox.Text = "1518982.9054361853623";
            view3TextBox.Text = "1814.3496121307835";
            view4TextBox.Text = "1217.9520893853623";
            isKmitlMap = true;
            usList.Visible = false;
        }

        private void defaultUSA_Click(object sender, EventArgs e)
        {
            view1TextBox.Text = "-78";
            view2TextBox.Text = "40";
            view3TextBox.Text = "6";
            view4TextBox.Text = "6";
            isKmitlMap = false;
            usList.Visible = true;
        }

        private void toolStripButton4_Click(object sender, EventArgs e)
        {
            try
            {
                saveFileDialog1.Filter = "svg file (*.svg)|*.svg";
                if (saveFileDialog1.ShowDialog() == DialogResult.OK)
                {
                    doc.Save(saveFileDialog1.FileName);
                }
            }
            catch (Exception exc)
            {

            }
        }

        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            try
            {
                openFileDialog1.Filter = "svg file (*.svg)|*.svg";
                if (openFileDialog1.ShowDialog() == DialogResult.OK)
                {
                    doc = new XmlDocument();
                    doc.Load(openFileDialog1.FileName);
                    axSVGCtl2.setSrc(openFileDialog1.FileName);
                }
            }
            catch (Exception exc)
            {
            }
        }

        private void distanceAdd_Click(object sender, EventArgs e)
        {
            if (startXBox.Text != "" && startYBox.Text != "")
            {
                distancePosX[distanceIndex] = Convert.ToDouble(startXBox.Text);
                distancePosY[distanceIndex] = Convert.ToDouble(startYBox.Text);
                distanceAmount++;
                distanceIndex = distanceAmount;
                distanceTotal = distanceAmount;
                startXBox.Text = "";
                startYBox.Text = "";
                //distanceTest.Text = distanceAmount.ToString();

                if (distanceIndex > 0)
                    distanceBack.Enabled = true;
                if (distanceIndex == 0)
                    distanceBack.Enabled = false;

               // if (distanceAmount != 0)
               //     distanceButton.Enabled = true;            
                
            }
            
        }

        private void distanceNext_Click(object sender, EventArgs e)
        {
            if (distanceIndex >= 0 && distanceIndex < distanceAmount)
            {
                distanceIndex++;
                startXBox.Text = distancePosX[distanceIndex].ToString();
                startYBox.Text = distancePosY[distanceIndex].ToString();

            }
            if (distanceIndex == 0)
                distanceBack.Enabled = false;
            if (distanceIndex < distanceTotal)
                distanceNext.Enabled = true;
            if (distanceIndex > 0)
                distanceBack.Enabled = true;
            if (distanceIndex == distanceTotal)
                distanceNext.Enabled = false;

        }

        private void distanceBack_Click(object sender, EventArgs e)
        {
            if (distanceIndex > 0)
            {
                distanceIndex--;
                startXBox.Text = distancePosX[distanceIndex].ToString();
                startYBox.Text = distancePosY[distanceIndex].ToString();
            }
            if (distanceIndex == 0)
                distanceBack.Enabled = false;
            if (distanceIndex < distanceTotal)
                distanceNext.Enabled = true;
            if (distanceIndex == distanceTotal)
                distanceNext.Enabled = false;
            }

        private void distanceEdit_Click(object sender, EventArgs e)
        {
            distancePosX[distanceIndex] = Convert.ToDouble(startXBox.Text);
            distancePosY[distanceIndex] = Convert.ToDouble(startYBox.Text);
        }

        private void selectMapServerToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            addLayer.ShowDialog();
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void toolStripProgressBar1_Click(object sender, EventArgs e)
        {

        }

        private void pointType_CheckedChanged(object sender, EventArgs e)
        {
            buttonAddMore.Enabled = true;
        }

        private void lineType_CheckedChanged(object sender, EventArgs e)
        {
            buttonAddMore.Enabled = true;
        }

        private void polygonType_CheckedChanged(object sender, EventArgs e)
        {
            buttonAddMore.Enabled = true;
        }

        private void aboutGisApplicationToolStripMenuItem_Click(object sender, EventArgs e)
        {
            about.ShowDialog();
        }

        private void creditToolStripMenuItem_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("./SVGHelp.html");

        }

        private void toolStripButton5_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("./SVGHelp.html");
        }

        private void imageCombo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (imageCombo.SelectedIndex == 0)
            {
                symbolBox.Visible = false;
            }

            if (imageCombo.SelectedIndex == 1)
            {
                symbolBox.Visible = true;
                symbolBox.Image = Image.FromFile("./images/bus.jpg");
            }

            if (imageCombo.SelectedIndex == 2)
            {
                symbolBox.Visible = true;
                symbolBox.Image = Image.FromFile("./images/entertain.jpg");
            }

            if (imageCombo.SelectedIndex == 3)
            {
                symbolBox.Visible = true;
                symbolBox.Image = Image.FromFile("./images/home.gif");
            }

            if (imageCombo.SelectedIndex == 4)
            {
                symbolBox.Visible = true;
                symbolBox.Image = Image.FromFile("./images/shop.gif");
            }


        }

        private void imageButton_Click(object sender, EventArgs e)
        {
            
        }

        private void fillBox_Click(object sender, EventArgs e)
        {

        }

        
                          
    }
}