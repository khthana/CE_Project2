using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml;
using System.IO;
using System.Data.Odbc;


[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class Service : System.Web.Services.WebService
{
    public Service () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    public static void writeSVG(string table,string color,string stroke,XmlTextWriter writer,OdbcConnection conn,string visible,string opacity,string mouseevent,string vboxRect)
    {
        if (table == "tb_road" || table == "tb_water" || table == "tb_rail")
        {
            string mySelectQuery = String.Concat("SELECT gid,assvg(the_geom),x(centroid(the_geom)),y(centroid(the_geom)) FROM ", table , " Where the_geom && ",vboxRect,";");
            OdbcCommand myCommand = new OdbcCommand(mySelectQuery, conn);

            OdbcDataReader myReader;
            myReader = myCommand.ExecuteReader();

            writer.WriteStartElement("g");
            writer.WriteAttributeString("layer", table);
        
            while (myReader.Read())
            {
                try
                {
                    writer.WriteStartElement("path");
                    writer.WriteAttributeString("gid", myReader.GetInt32(0).ToString());
                    writer.WriteAttributeString("style",String.Concat("stroke:",stroke,";fill:",color,";fill-opacity:",opacity,";"));
                    writer.WriteAttributeString("d", myReader.GetString(1));
                    writer.WriteEndElement();
                }
                catch (OdbcException e)
                {
                    string errorMessages = "";

                    for (int i = 0; i < e.Errors.Count; i++)
                    {
                        errorMessages += "Index #" + i + "\n" +
                                         "Message: " + e.Errors[i].Message + "\n" +
                                         "NativeError: " + e.Errors[i].NativeError.ToString() + "\n" +
                                         "Source: " + e.Errors[i].Source + "\n" +
                                         "SQL: " + e.Errors[i].SQLState + "\n";
                    }

                    System.Diagnostics.EventLog log = new System.Diagnostics.EventLog();
                    log.Source = "My Application";
                    log.WriteEntry(errorMessages);

                    writer.WriteElementString("Error", "Error ODBC Exeption");
                    log.Clear();
                }
            }

            writer.WriteEndElement();

            myReader.Close();
            
        }
        else if(table == "tb_atm")
        {
            string mySelectQuery = String.Concat("SELECT gid,name,x(the_geom),y(the_geom) FROM ", table, " Where the_geom && ", vboxRect, ";");

            OdbcCommand myCommand = new OdbcCommand(mySelectQuery, conn);

            OdbcDataReader myReader;
            myReader = myCommand.ExecuteReader();

            writer.WriteStartElement("g");
            writer.WriteAttributeString("layer", table);

            while (myReader.Read())
            {
                try
                {
                    writer.WriteStartElement("circle");
                    writer.WriteAttributeString("gid", myReader.GetInt32(0).ToString());
                    writer.WriteAttributeString("id", myReader.GetString(1));
                    writer.WriteAttributeString("style", String.Concat("stroke:", stroke, ";fill:", color, ";fill-opacity:", opacity, ";"));
                    if (visible == "True" && mouseevent == "True")
                    {
                        writer.WriteAttributeString("onmouseover", "over(evt)");
                        writer.WriteAttributeString("onmouseout", "out(evt)");
                    }
                    writer.WriteAttributeString("cx", myReader.GetFloat(2).ToString());
                    writer.WriteAttributeString("cy", "-" + myReader.GetFloat(3).ToString());
                    writer.WriteAttributeString("r", "6");
                    writer.WriteEndElement();
                }
                catch (OdbcException e)
                {
                    string errorMessages = "";

                    for (int i = 0; i < e.Errors.Count; i++)
                    {
                        errorMessages += "Index #" + i + "\n" +
                                         "Message: " + e.Errors[i].Message + "\n" +
                                         "NativeError: " + e.Errors[i].NativeError.ToString() + "\n" +
                                         "Source: " + e.Errors[i].Source + "\n" +
                                         "SQL: " + e.Errors[i].SQLState + "\n";
                    }

                    System.Diagnostics.EventLog log = new System.Diagnostics.EventLog();
                    log.Source = "My Application";
                    log.WriteEntry(errorMessages);

                    writer.WriteElementString("Error", "Error ODBC Exeption");
                }
            }

            writer.WriteEndElement();

            myReader.Close();
                
        }
        else
            {
                string mySelectQuery = String.Concat("SELECT gid,name,assvg(the_geom),x(centroid(the_geom)),y(centroid(the_geom)) FROM ", table, " Where the_geom && ", vboxRect, ";");

                OdbcCommand myCommand = new OdbcCommand(mySelectQuery, conn);

                OdbcDataReader myReader;
                myReader = myCommand.ExecuteReader();

                writer.WriteStartElement("g");
                writer.WriteAttributeString("layer", table);

                while (myReader.Read())
                {
                    try
                    {
                        writer.WriteStartElement("path");
                        writer.WriteAttributeString("gid", myReader.GetInt32(0).ToString());
                        writer.WriteAttributeString("id", myReader.GetString(1));
                        writer.WriteAttributeString("style", String.Concat("stroke:",stroke,";fill:", color, ";fill-opacity:",opacity,";"));
                        if (visible == "True" && mouseevent == "True")
                        {
                            writer.WriteAttributeString("onmouseover", "over(evt)");
                            writer.WriteAttributeString("onmouseout", "out(evt)");
                        }
                        writer.WriteAttributeString("d", myReader.GetString(2));
                        writer.WriteEndElement();
                    }
                    catch (OdbcException e)
                    {
                        string errorMessages = "";

                        for (int i = 0; i < e.Errors.Count; i++)
                        {
                            errorMessages += "Index #" + i + "\n" +
                                             "Message: " + e.Errors[i].Message + "\n" +
                                             "NativeError: " + e.Errors[i].NativeError.ToString() + "\n" +
                                             "Source: " + e.Errors[i].Source + "\n" +
                                             "SQL: " + e.Errors[i].SQLState + "\n";
                        }

                        System.Diagnostics.EventLog log = new System.Diagnostics.EventLog();
                        log.Source = "My Application";
                        log.WriteEntry(errorMessages);

                        writer.WriteElementString("Error", "Error ODBC Exeption");
                    }
                }

                writer.WriteEndElement();

                myReader.Close();
 
            }
    
    }
    public static void writeSvgUS(XmlWriter writer,OdbcConnection conn,string table,string stroke,string color,string opacity,string vboxRect,string visible,string mouseevent)
    {
        string mySelectQuery = String.Concat("SELECT gid,x(the_geom),y(the_geom),name FROM ", table, " Where the_geom && ", vboxRect, ";");
        OdbcCommand myCommand = new OdbcCommand(mySelectQuery, conn);

        OdbcDataReader myReader;
        myReader = myCommand.ExecuteReader();

        writer.WriteStartElement("g");
        writer.WriteAttributeString("layer", table);
        while (myReader.Read())
        {
            try
            {
                writer.WriteStartElement("circle");
                writer.WriteAttributeString("gid", myReader.GetInt32(0).ToString());
                writer.WriteAttributeString("id", myReader.GetString(3));
                writer.WriteAttributeString("cx", myReader.GetDouble(1).ToString());
                writer.WriteAttributeString("cy", "-"+myReader.GetDouble(2).ToString());
                writer.WriteAttributeString("r", "0.02");
                writer.WriteAttributeString("style", String.Concat("stroke:", stroke, ";stroke-width:0.001;fill:", color, ";fill-opacity:", opacity, ";"));
                if (visible == "True" && mouseevent == "True")
                {
                    writer.WriteAttributeString("onmouseover", "over(evt)");
                    writer.WriteAttributeString("onmouseout", "out(evt)");
                }
                writer.WriteEndElement();
            }
            catch (OdbcException e)
            {
                string errorMessages = "";

                for (int i = 0; i < e.Errors.Count; i++)
                {
                    errorMessages += "Index #" + i + "\n" +
                                     "Message: " + e.Errors[i].Message + "\n" +
                                     "NativeError: " + e.Errors[i].NativeError.ToString() + "\n" +
                                     "Source: " + e.Errors[i].Source + "\n" +
                                     "SQL: " + e.Errors[i].SQLState + "\n";
                }

                System.Diagnostics.EventLog log = new System.Diagnostics.EventLog();
                log.Source = "My Application";
                log.WriteEntry(errorMessages);

                writer.WriteElementString("Error", "Error ODBC Exeption");
            }
        }

        writer.WriteEndElement();

        myReader.Close();

    }

   public static void writeText(OdbcConnection conn,string table,XmlTextWriter writer, string textsize, string textcolor, string fontfamily, string fontstyle, string fontweight,string vboxRect)
    {
        string mySelectQuery = String.Concat("SELECT gid,x(centroid(the_geom)),y(centroid(the_geom)),name FROM ", table, " Where the_geom && ", vboxRect, ";");
        OdbcCommand myCommand = new OdbcCommand(mySelectQuery, conn);

        OdbcDataReader myReader;
        myReader = myCommand.ExecuteReader();

        string style = "stroke:black;stroke-width:0.001"+";fill:"+textcolor+";font-size:"+textsize+";font-family:"+fontfamily+";font-weight:"+fontweight+";font-style:"+fontstyle+";text-anchor:middle;";

   
        while (myReader.Read())
        {
            writer.WriteStartElement("text");
            writer.WriteAttributeString("gid", myReader.GetInt32(0).ToString());
            writer.WriteAttributeString("transform", "translate("+myReader.GetFloat(1).ToString()+","+"-"+myReader.GetFloat(2).ToString()+")");
            writer.WriteAttributeString("style",style);
            writer.WriteString(myReader.GetString(3));
            writer.WriteEndElement();
        }
        myReader.Close();
    }

    public static void writeScript(XmlWriter writer,string textsize,string textcolor,string fontfamily,string fontstyle,string fontweight,string offset)
    {
        //string cdata = String.Concat("var label = '';var style;var offset = 0.05;var x0 = 0;var y0 = 0;var vboxW = 0;var vboxH = 0;var svgW = 0;var svgH = 0;function on_load(e){svgdoc = evt.target.getOwnerDocument();svgroot = svgdoc.getDocumentElement();var vbox = (svgroot.getAttribute('viewBox')).split(' ');x0 = parseFloat(vbox[0]);y0 = parseFloat(vbox[1]);vboxW = parseFloat(vbox[2]);vboxH = parseFloat(vbox[3]);svgW = parseFloat(svgroot.getAttribute('width'));svgH = parseFloat(svgroot.getAttribute('height'));var data = svgdoc.createTextNode('');var text = svgdoc.createElement('text');text.setAttribute('transform','translate('+ x0 + ',' + y0 + ')');text.setAttribute('style', 'stroke:black;stroke-width:0.001;fill:",textcolor,";font-size:",textsize,";font-family:",fontfamily,";font-style:",fontstyle,";font-weight:",fontweight,";text-anchor:middle;');text.setAttribute('id', 'label');text.appendChild(data);svgroot.appendChild(text);}function over(e) {target = e.currentTarget;var id = target.id;var cenX = target.getAttribute('cenX');var cenY = target.getAttribute('cenY');label =  svgdoc.getElementById('label');label.setAttribute('transform','translate('+ cenX + ',' + cenY + ')');if (id!='') {label =  svgdoc.getElementById('label');label.firstChild.setData(id);  var svgstyle = e.currentTarget.style;style = svgstyle.getPropertyValue('fill');svgstyle.setProperty ('fill','lightyellow');}}function out(e) {var label =  svgdoc.getElementById('label');label.firstChild.setData(' ');var svgstyle = e.currentTarget.style;svgstyle.setProperty('fill',style); }");
        string style = String.Concat("text.setAttribute('style', 'stroke:",textcolor,"stroke-width:0.001;fill:",textcolor,";font-size:",textsize,";font-family:",fontfamily,";font-weight:",fontweight,";font-style:",fontstyle,";');");
        string script0 = "var offset = " + offset+";";
        string script1 = @" var label = '';
        var style;
        // must be calculated from viewbox to w x h
        var x0 = 0;
        var y0 = 0;
        var vboxW = 0;
        var vboxH = 0;
        var svgW = 0;
        var svgH = 0;
        function on_load(e)
        {
            svgdoc = evt.target.getOwnerDocument();
            svgroot = svgdoc.getDocumentElement();
            //initialize cursor parameters
            var vbox = (svgroot.getAttribute('viewBox')).split(' ');
            x0 = parseFloat(vbox[0]);
            y0 = parseFloat(vbox[1]);
            vboxW = parseFloat(vbox[2]);
            vboxH = parseFloat(vbox[3]);
            svgW = parseFloat(svgroot.getAttribute('width'));
            svgH = parseFloat(svgroot.getAttribute('height'));
            // initialize label text
            var data = svgdoc.createTextNode('');
            var text = svgdoc.createElement('text');
            text.setAttribute('transform','translate('+ x0 + ',' + y0 + ')');";

        string script2 = @"      text.setAttribute('id', 'label');
            text.appendChild(data);
            svgroot.appendChild(text);
            }
            function DoOnMouseMove(e) 
            {
                var X =  (e.clientX - svgroot.currentTranslate.x) * (vboxW/(svgW*svgroot.currentScale)) + x0;
                var Y =  (e.clientY - svgroot.currentTranslate.y) * (vboxH/(svgH*svgroot.currentScale)) + y0 - offset;
                label =  svgdoc.getElementById('label');
                label.setAttribute('transform','translate('+ X + ',' + Y + ')');
            }
            // mouse_over
            function over(e) 
            {
                target = e.currentTarget;
                var id = target.id;
                if (id!='') 
                   {
                      //rollover label on
                      label =  svgdoc.getElementById('label');
                      label.firstChild.setData(id);
                      var svgstyle = e.currentTarget.style;
                      style = svgstyle.getPropertyValue('fill');
                      svgstyle.setProperty ('fill','yellow');
                   }
            }
            //mouse_out
            function out(e) 
            {
                //rollover label off
                var label =  svgdoc.getElementById('label');
                label.firstChild.setData(' ');
                var svgstyle = e.currentTarget.style;
                svgstyle.setProperty('fill',style);      
            }";
        string cdata = String.Concat(script0,script1, style, script2);     
        //writer.WriteStartElement("script");
        //writer.WriteAttributeString("language", "JavaScript");
        writer.WriteCData(cdata);
        //writer.WriteEndElement();
       
    }

    public static string[] X_Y(string coor)
    {
        string[] temp = new string[] { "", "" };
        int check = 0;
        for (int i = 0; i < coor.Length; i++)
        {
            if (coor[i] != ' ' && (check == 0 || check == 1))
            {
                temp[0] += coor[i];
                check = 1;
            }
            if (coor[i] == ' ' && check == 2)
                check = 3;
            if (coor[i] == ' ' && check == 1)
                check = 2;
            if (coor[i] != ' ' && check == 2)
                temp[1] += coor[i];
            
        }
        return temp;
    }

    public static string subCoor(string coor)
    {
        string temp;
        temp = "";
        int check = 0;
        for (int i = 0; i < coor.Length; i++)
        {
            temp = temp + coor[i];

            if (coor[i] != ' ' && check == 0)
                check = 1;

            if (check == 2 && coor[i] == ',')
                check = 0;

            if (check == 1)
            {
                if (coor[i] == ' ' && coor[i + 1] != ' ')
                {
                    temp = temp + '-';
                    check = 2;
                }
            }
        }
        return temp;
    }

    public static string writeSymbol()
    {
        string symbol = @"<symbol overflow='visible' id='shop'>
      <g style='display:inline' id='layer1'>
        <path
           d='M 31.97056,15.970068 A 16.029932,16.029932 0 1 1 31.968609,15.719966'
           transform='translate(0.52944,4.417315e-3)'
           style='opacity:1;fill:#b6beeb;fill-opacity:1;fill-rule:evenodd;stroke:#2a41d0;stroke-width:1;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;display:inline'
           id='path2301' />
      </g>
      <g
         style='display:inline'
         id='layer3'>
        <path
           d='M 12.502454,22.980373 A 1.875368,1.875368 0 1 1 12.498401,22.857144 L 10.627086,22.980373 z'
           transform='translate(-1.002454,0.644259)'
           style='opacity:1;fill:#2d3c95;fill-opacity:1;fill-rule:evenodd;stroke:#3f52c5;stroke-width:1;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;display:inline'
           id='path2263' />
        <path
           d='M 23.665359,22.891069 A 1.875368,1.875368 0 1 1 23.661306,22.76784 L 21.789991,22.891069 z'
           transform='translate(0.585377,0.733563)'
           style='opacity:1;fill:#273bae;fill-opacity:1;fill-rule:evenodd;stroke:#2a41d0;stroke-width:1;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;display:inline'
           id='path2265' />
        <path
           d='M 9.4641806,20.928361 L 21.196271,20.839058 L 24.571148,15.910697 L 25.017664,9 L 28,9 L 28.73209,8.9823356 L 28.464181,7.8930324 L 25.089303,7.7144259 L 24.446516,8.357213 L 23.642787,15.910697 L 21,20 L 10,20 L 6.6251227,16 L 6,12 L 5,12 L 4.8037292,13.424926 L 5.7860648,16.213935 L 9.4641806,20.928361 z '
           style='fill:#3846b8;fill-opacity:1;fill-rule:evenodd;stroke:#273b9f;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;display:inline'
           id='path2267' />
        <path
           d='M 6.8763495,12.893032 L 23.196271,12.982336 L 23.553484,13 L 6.5191365,13 L 6.8763495,12.893032 z '
           style='fill:none;fill-opacity:0.75;fill-rule:evenodd;stroke:#1736c4;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;display:inline'
           id='path2269' />
        <path
           d='M 7.1609421,15 L 22.928361,15 L 22.928361,15.106968 L 7.1442593,15.017664 L 6.9656527,15 L 7.1609421,15 z '
           style='fill:none;fill-opacity:0.75;fill-rule:evenodd;stroke:#1736c4;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;display:inline'
           id='path2271' />
        <path
           d='M 8.6265948,17.571639 L 21.964181,17.482336 L 21.964181,17.5 L 8.5,17.410697 L 8.6265948,17.571639 z '
           style='fill:none;fill-opacity:0.75;fill-rule:evenodd;stroke:#1736c4;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;display:inline'
           id='path2273' />
        <path
           d='M 7.9283611,13 L 10.571148,19.017664 L 10.499509,19.106968 L 8.0353287,13 L 7.9283611,13 z '
           style='fill:none;fill-opacity:0.75;fill-rule:evenodd;stroke:#1736c4;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;display:inline'
           id='path2275' />
        <path
           d='M 10.877821,13 L 12.303729,19.196271 L 12.678606,19.106968 L 10.785574,13 L 10.877821,13 z '
           style='fill:none;fill-opacity:0.75;fill-rule:evenodd;stroke:#1736c4;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;display:inline'
           id='path2277' />
        <path
           d='M 22.03631,13.445584 L 21.03631,18.70996 L 20.875368,19.018583 L 22.053974,13.445584 L 22.03631,13.445584 z '
           style='fill:none;fill-opacity:0.75;fill-rule:evenodd;stroke:#1736c4;stroke-width:0.99999976px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;display:inline'
           id='path2279' />
        <path
           d='M 20.035819,13.391182 L 19.035819,19.102074 L 19.053483,19.5 L 20.053483,13.391182 L 20.035819,13.391182 z '
           style='fill:none;fill-opacity:0.75;fill-rule:evenodd;stroke:#3449c6;stroke-width:0.99999976px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;display:inline'
           id='path2282' />
        <path
           d='M 17.5,13.391182 L 16.5,19.102074 L 16.517664,19.5 L 17.517664,13.391182 L 17.5,13.391182 z '
           style='fill:none;fill-opacity:0.75;fill-rule:evenodd;stroke:#334fbc;stroke-width:0.99999976px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;display:inline'
           id='path2284' />
        <path
           d='M 14.518715,13.460991 L 14.508775,19.258765 L 14.594141,19.647828 L 14.536119,13.457974 L 14.518715,13.460991 z '
           style='fill:#253cf0;fill-opacity:1;fill-rule:evenodd;stroke:#2e48c4;stroke-width:0.99999976px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;display:inline'
           id='path2286' />
      </g> 
    </symbol>
    <symbol id='entertain'>
      <g
     style='display:inline'
     id='layer2'>
        <path
           d='M 29.380766,16.104023 A 13.395486,13.127576 0 1 1 29.364053,15.448463 L 15.98528,16.104023 z'
           transform='translate(-1.089794,-0.476447)'
           style='opacity:1;fill:#2e4af2;fill-opacity:1;fill-rule:evenodd;stroke:#1b38e6;stroke-width:1;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;display:inline'
           id='path2251' />
      </g>
      <g
         style='display:inline'
         id='layer1'>
        <path
           d='M 12.770364,21.417566 A 2.3665359,2.3665359 0 1 1 12.765249,21.262062 L 10.403828,21.417566 z'
           transform='translate(-2.537292,-2.284102)'
           style='opacity:1;fill:#1c37f3;fill-opacity:1;fill-rule:evenodd;stroke:#fff6f6;stroke-width:1;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1'
           id='path2240' />
        <path
           d='M 25.63003,23.828754 A 2.3665359,2.3665359 0 1 1 25.627078,23.710575 L 23.263494,23.828754 z'
           transform='translate(-3.13003,-0.962219)'
           style='opacity:1;fill:#304df8;fill-opacity:1;fill-rule:evenodd;stroke:#f0f0e3;stroke-width:1;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1'
           id='path2242' />
        <path
           d='M 9.950003,20.188432 L 9.950003,13.287313 L 21.550007,17.121268 L 21.550007,22.488805 L 22.516674,22.488805 L 22.516674,10.98694 L 8.983336,6.3861935 L 8.983336,20.188432 L 9.950003,20.188432 z '
           style='fill:#fdfdf5;fill-opacity:1;fill-rule:evenodd;stroke:#fcf9f9;stroke-width:1.00000012px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1'
           id='path2244' />
        <path
           d='M 10.357213,8.6563727 L 10.357213,11.665266 L 21,15.46875 L 21,12.28125 L 10.357213,8.6563727 z '
           style='fill:#2241f9;fill-opacity:1;fill-rule:evenodd;stroke:#fbf4f4;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1'
           id='path2246' />
      </g>
    </symbol>
    <symbol id='bus'>
      <g
     id='layer1'>
        <path
           d='M 5,22 L 26.553484,22 C 27.089303,20.333333 27.096592,19.49955 27.446516,19.232581 L 26,16 L 26,9 L 23.106968,5.1962708 L 20,4 L 10,4 L 6.8930324,5.2855741 L 4,9 L 4,16 L 2.9106968,18.786065 L 3.7144259,22 L 5,22 z '
           style='fill:#494947;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1'
           id='path1319' />
        <path
           d='M 4,23.4375 L 9,23.4375 L 9,25.1875 L 8,26.0625 L 5,26.0625 L 4,25.1875 L 4,23.4375 z '
           style='fill:none;fill-opacity:0.75;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1'
           id='path1321' />
        <path
           d='M 26,23.4375 L 21,23.4375 L 21,25.1875 L 22,26.0625 L 25,26.0625 L 26,25.1875 L 26,23.4375 z '
           style='fill:none;fill-opacity:0.75;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1'
           id='path1323' />
        <path
           d='M 24,17 L 25,18 L 25,19 L 24,20 L 23,20 L 22,19 L 22,18 L 23,17 L 24,17 z '
           style='fill:#ededdf;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1'
           id='path1327' />
        <path
           d='M 5,18 L 6,17 L 7,17 L 8,18 L 8,19 L 7,20 L 6,20 L 5,19 L 5,18 z '
           style='fill:#ededdf;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1'
           id='path1329' />
        <path
           d='M 6,14 L 14,14 L 14,8.4641806 L 8,8.4641806 L 6,10.309454 L 6,14 z '
           style='fill:#fff6f6;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1'
           id='path1331' />
        <path
           d='M 16,8.4641806 L 16,14 L 24,14 L 24,10.309454 L 22,8.4641806 L 16,8.4641806 z '
           style='fill:#fff6f6;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1'
           id='path1335' />
        <path
           d='M 10,8 L 20,8 L 20,5 L 10,5 L 10,8 z '
           style='fill:#f0f0b1;fill-opacity:1;fill-rule:evenodd;stroke:#605c08;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1'
           id='path1337' />
      </g>
    </symbol>
    <symbol id='home'>
      <g
     id='layer1'>
    <path
       d='M 16,11 L 5,17 L 3,17 L 16,10 L 29,17 L 27,17 L 16,11 z '
       style='fill:none;fill-opacity:0.75;fill-rule:evenodd;stroke:#b5310e;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1'
       id='path1321' />
    <path
       d='M 16,10.477919 L 16.357213,2.5358194 L 27,8 L 28,17 L 16,10.477919 z '
       style='fill:#ea641a;fill-opacity:1;fill-rule:evenodd;stroke:#d71a0d;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1'
       id='path1323' />
    <path
       d='M 15.553484,10.477919 L 15.553484,2.5358194 L 5,8 L 3,17 L 15.553484,10.477919 z '
       style='fill:#ea871a;fill-opacity:1;fill-rule:evenodd;stroke:#d7611b;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1'
       id='path1325' />
    <path
       d='M 16,12.160942 L 25.910697,17.428852 L 26,29 L 6,29 L 6,17.518155 L 16,12.160942 z '
       style='fill:#e7dfd6;fill-opacity:1;fill-rule:evenodd;stroke:#7f5f5f;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1'
       id='path1327' />
    <path
       d='M 13,29 L 13,22 L 13.931305,21.464181 L 18.932287,21.374877 L 20,22 L 20,28.96369 L 13,29 z '
       style='fill:#ed932b;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1'
       id='path1329' />
    <path
       d='M 12,29 L 12,30 L 21,30 L 21,29 L 12,29 z '
       style='fill:none;fill-opacity:0.75;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1'
       id='path1331' />
    <path
       d='M 12.357213,15.178606 L 19.73209,15.178606 L 20.821394,16.26791 L 21,18.336604 L 20.464181,18.73209 L 19.914623,19 L 12.055937,19 L 11.535819,18.374877 L 11,18.068695 L 10.821394,16.446516 L 12.357213,15.178606 z '
       style='fill:#bd7524;fill-opacity:1;fill-rule:evenodd;stroke:#de6626;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1'
       id='path1333' />
    </g>  
    </symbol>";

        return symbol;           
    }
//------------------------Get Capabilities Service --------------------------------
    [WebMethod]
    public string GetCapabilities() 
    {

        string connection = "DSN=PostgreSQL;SERVER=localhost;Trusted_connection=yes;DATABASE=gis;USER=postgres;PASSWORD=1234;";
        OdbcConnection conn = new OdbcConnection(connection);

        conn.Open();
        
        string mySelectQuery = "SELECT description,name FROM tb_layer";
        OdbcCommand myCommand = new OdbcCommand(mySelectQuery, conn);
        OdbcDataReader myReader;
        myReader = myCommand.ExecuteReader();
    
        TextWriter w = new StringWriter();
        XmlTextWriter writer = new XmlTextWriter(w);

        writer.WriteStartDocument();
        writer.WriteStartElement("Capabilities");

        writer.WriteStartElement("Services");
        //--------------------------------------------------
        writer.WriteStartElement("Service");
        writer.WriteElementString("Method", "GetCapabilities");
        writer.WriteElementString("Format", "object/xmldocument");
        writer.WriteElementString("Abstract", "details");
        writer.WriteEndElement();
        //--------------------------------------------------
        writer.WriteStartElement("Service");
        writer.WriteElementString("Method", "GetMap");
        writer.WriteElementString("Format", "object/xmldocument");
        writer.WriteElementString("Abstract", "details");
        writer.WriteEndElement();
        //--------------------------------------------------
        writer.WriteStartElement("Service");
        writer.WriteElementString("Method", "CreateMap");
        writer.WriteElementString("Format", "object/xmldocument");
        writer.WriteElementString("Abstract", "details");
        writer.WriteEndElement();
        //--------------------------------------------------
        writer.WriteStartElement("Service");
        writer.WriteElementString("Method", "Find");
        writer.WriteElementString("Format", "string/xml");
        writer.WriteElementString("Abstract", "details");
        writer.WriteEndElement();
        //--------------------------------------------------
        writer.WriteStartElement("Service");
        writer.WriteElementString("Method", "FindAddress");
        writer.WriteElementString("Format", "string/xml");
        writer.WriteElementString("Abstract", "details");
        writer.WriteEndElement();
        //--------------------------------------------------
        writer.WriteStartElement("Service");
        writer.WriteElementString("Method", "FindNearby");
        writer.WriteElementString("Format", "object/xmldocument");
        writer.WriteElementString("Abstract", "details");
        writer.WriteEndElement();
        //--------------------------------------------------
        writer.WriteStartElement("Service");
        writer.WriteElementString("Method", "FindNearest");
        writer.WriteElementString("Format", "string/xml");
        writer.WriteElementString("Abstract", "details");
        writer.WriteEndElement();
        //--------------------------------------------------
        writer.WriteStartElement("Service");
        writer.WriteElementString("Method", "ConvertAddressToCoordinate");
        writer.WriteElementString("Format", "double");
        writer.WriteElementString("Abstract", "details");
        writer.WriteEndElement();
        //--------------------------------------------------
        writer.WriteStartElement("Service");
        writer.WriteElementString("Method", "ConvertCoordinateToAddress");
        writer.WriteElementString("Format", "string");
        writer.WriteElementString("Abstract", "details");
        writer.WriteEndElement();
        //--------------------------------------------------
        
        writer.WriteEndElement();

        writer.WriteStartElement("LayerAvailable");

        while (myReader.Read())
        {
            writer.WriteStartElement("Layer");
            writer.WriteElementString("LayerName", myReader.GetString(1));
            writer.WriteElementString("Decription", myReader.GetString(0));
            writer.WriteEndElement();
        }
        
        writer.WriteEndElement();
        
        writer.WriteEndElement();
        writer.Flush();
        writer.Close();

        myReader.Close();
        conn.Close();

  
        return w.ToString();        

    }

//**----------------------- GetMap Service -------------------------**

    [WebMethod]
    public XmlDocument GetMap(string request)
    {
            XmlDocument doc = new XmlDocument();
            XmlDocument anotherDoc = new XmlDocument();

      //  try
      //  {
            string connection = "DSN=PostgreSQL;SERVER=localhost;Trusted_connection=yes;DATABASE=gis;USER=postgres;PASSWORD=1234;";
            OdbcConnection conn = new OdbcConnection(connection);

            conn.Open();

            TextReader temp = new StringReader(request);
            XmlTextReader tempReader = new XmlTextReader(temp);
            int tmp = 0;
            int elementcount = 0;
            while (tempReader.Read())
            {
                if (tempReader.NodeType == XmlNodeType.Element)
                {
                    elementcount++;
                    if (tempReader.Name == "name") tmp++;
                }
            }

            string[] layer = new string[tmp];
            string[] table = new string[tmp];
            int[] server = new int[tmp];
            string[] color = new string[tmp];
            string[] stroke = new string[tmp];
            string mouseevent = "False";
            string visible = "False";
            string textsize = "15";
            string textcolor = "black";
            string fontfamily = "arial";
            string fontstyle = "normal";
            string fontweight = "normal";
            string width = "508";
            string height = "345";
            string opacity = "1";
            double vbox1 = 0;
            double vbox2 = 0;
            double vbox3 = 0;
            double vbox4 = 0;
            double xw = 0;
            double yh = 0;
            bool callAnother = false;


            TextReader txtReader = new StringReader(request);
            XmlTextReader xmlreader = new XmlTextReader(txtReader);
            xmlreader.WhitespaceHandling = WhitespaceHandling.All;
            
            int i = 0;
            int j = 0;
            int z = 0;

            //------------------------------------------------------------

            while (xmlreader.Read())
            {
                if (xmlreader.NodeType.Equals(XmlNodeType.Element))
                {
                    if (xmlreader.Name == "vbox1")
                        vbox1 = xmlreader.ReadElementContentAsDouble();
                    if (xmlreader.Name == "vbox2")
                        vbox2 = xmlreader.ReadElementContentAsDouble();
                    if (xmlreader.Name == "vbox3")
                        vbox3 = xmlreader.ReadElementContentAsDouble();
                    if (xmlreader.Name == "vbox4")
                        vbox4 = xmlreader.ReadElementContentAsDouble();
                    if (xmlreader.Name == "width")
                        width = xmlreader.ReadElementString();
                    if (xmlreader.Name == "height")
                        height = xmlreader.ReadElementString();
                    if (xmlreader.Name == "opacity")
                        opacity = xmlreader.ReadElementString();
                    if (xmlreader.Name == "text-visible")
                        visible = xmlreader.ReadElementString();
                    if (xmlreader.Name == "text-family")
                        fontfamily = xmlreader.ReadElementString();
                    if (xmlreader.Name == "text-weight")
                        fontweight = xmlreader.ReadElementString();
                    if (xmlreader.Name == "text-style")
                        fontstyle = xmlreader.ReadElementString();
                    if (xmlreader.Name == "text-size")
                        textsize = xmlreader.ReadElementString();
                    if (xmlreader.Name == "text-color")
                        textcolor = xmlreader.ReadElementString();
                    if (xmlreader.Name == "mouse-event")
                        mouseevent = xmlreader.ReadElementString();
                    if (xmlreader.Name == "name")
                    {
                        layer[i] = xmlreader.ReadElementString();
                        i++;
                    }
                    if (xmlreader.Name == "fill-color")
                    {
                        color[j] = xmlreader.ReadElementString();
                        j++;
                    }
                    if (xmlreader.Name == "stroke-color")
                    {
                        stroke[z] = xmlreader.ReadElementString();
                        z++;
                    }

                }
            }

            xw = vbox1 + vbox3;
            yh = vbox2 - vbox4;


            double txtsize = Convert.ToDouble(textsize);
            string callAnotherMapRequest = "";

            string vboxRect = "GeometryFromText('POLYGON((" + vbox1.ToString() + " " + vbox2.ToString() + "," + xw.ToString() + " " + vbox2.ToString() + "," + xw.ToString() + " " + yh.ToString() + "," + vbox1.ToString() + " " + yh.ToString() + "," + vbox1.ToString() + " " + vbox2.ToString() + "))',-1)";

            //--------------------------------------------------------

            for (int count = 0; count < table.Length; count++)
            {
                string tablequery = String.Concat("Select tablename,server From tb_layer Where name='", layer[count], "';");
                OdbcCommand myCommand = new OdbcCommand(tablequery, conn);
                OdbcDataReader myReader;
                myReader = myCommand.ExecuteReader();
                while (myReader.Read())
                {
                    table[count] = myReader.GetString(0);
                    server[count] = myReader.GetInt32(1);
                }
                myReader.Close();
            }

            TextWriter mapRequest = new StringWriter();
            XmlTextWriter requestWriter = new XmlTextWriter(mapRequest);

            requestWriter.WriteStartElement("maprequest");

            double tsize = 0;
            for (int k = 0; k < table.Length; k++)
            {
                if (server[k] == 2)
                {
                    tsize = txtsize / 100;

                    callAnother = true;

                    requestWriter.WriteStartElement("layer");
                    if (table[k] == "tb_roads")
                        requestWriter.WriteAttributeString("id", "10015");
                    if (table[k] == "tb_states")
                        requestWriter.WriteAttributeString("id", "10016");
                    if (table[k] == "tb_parks")
                        requestWriter.WriteAttributeString("id", "10017");
                    requestWriter.WriteAttributeString("fill", color[k]);
                    requestWriter.WriteAttributeString("stroke", stroke[k]);
                    if (visible == "True")
                    {
                        requestWriter.WriteAttributeString("showcolumn", "name");
                        requestWriter.WriteAttributeString("textcolor", textcolor);
                        if (table[k] == "tb_parks")
                            requestWriter.WriteAttributeString("textsize", "0.01");
                        else
                            requestWriter.WriteAttributeString("textsize", tsize.ToString());
                    }
                        requestWriter.WriteEndElement();
                }

            }

            requestWriter.WriteEndElement();

            callAnotherMapRequest = mapRequest.ToString();
            String anotherSvg = "";

            WebReference.Gis_GetMapServicesService service = new WebReference.Gis_GetMapServicesService();

            TextWriter w = new StringWriter();
            XmlTextWriter writer = new XmlTextWriter(w);

            writer.WriteStartElement("svg");
            writer.WriteAttributeString("xmlns", "http://www.w3.org/2000/svg");
            writer.WriteAttributeString("xmlns:xlink", "http://www.w3.org/1999/xlink");
            writer.WriteAttributeString("width", width);
            writer.WriteAttributeString("height", height);
            writer.WriteAttributeString("viewBox", String.Concat(vbox1, " -", vbox2, " ", vbox3, " ", vbox4));
            writer.WriteAttributeString("preserveAspectRatio", "xMinYMin");
            if (visible == "True" && mouseevent == "True")
                writer.WriteAttributeString("onload", "on_load(evt)");

            writer.WriteAttributeString("version", "1.0");
            /*writer.WriteStartElement("g");
            if (visible == "True" && mouseevent == "True")
                writer.WriteAttributeString("onmousemove", "DoOnMouseMove(evt)");
            writer.WriteEndElement(); */
            writer.WriteEndElement();
            writer.Close();
           // writer.Flush();
           // writer.Close();

            TextReader r = new StringReader(w.ToString());
            doc.Load(r);
            //********************************************************************
              XmlNode root = doc.DocumentElement;
        if (callAnother == true)
            {
                anotherSvg = service.getSvgG("1111", callAnotherMapRequest, vbox1, vbox2, vbox3, vbox4);
                //anotherDoc.LoadXml(anotherSvg);
            
                XmlElement usElement = doc.CreateElement("g", root.NamespaceURI);
                usElement.SetAttribute("xmlns", "http://www.w3.org/2000/svg");
                usElement.InnerXml = anotherSvg;
                root.AppendChild(usElement);

                TextWriter additionTxt = new StringWriter();
                XmlTextWriter additionWriter = new XmlTextWriter(additionTxt);

                bool isAddition = false;

                for (int k = 0; k < table.Length; k++)
                {
                    if (server[k] == 1)
                    {
                        isAddition = true;
                        writeSvgUS(additionWriter, conn, table[k], stroke[k], color[k], opacity, vboxRect, visible, mouseevent);
                    }
                }

                if (isAddition == true)
                {
                    XmlElement addElement = doc.CreateElement("g", root.NamespaceURI);
                    if (visible == "True" && mouseevent == "True")
                        addElement.SetAttribute("onmousemove", "DoOnMouseMove(evt)");
                    addElement.SetAttribute("xmlns", "http://www.w3.org/2000/svg");
                    addElement.InnerXml = additionTxt.ToString();
                    root.AppendChild(addElement);
                }

                TextWriter scriptText = new StringWriter();
                XmlTextWriter scriptWriter = new XmlTextWriter(scriptText);

                if (visible == "True" && mouseevent == "True")
                {
                    writeScript(scriptWriter, tsize.ToString(), textcolor, fontfamily, fontstyle, fontweight,"0.05");
                    XmlElement scriptElement = doc.CreateElement("script", root.NamespaceURI);
                    scriptElement.SetAttribute("language", "javascript");
                    scriptElement.SetAttribute("xmlns", "http://www.w3.org/2000/svg");
                    scriptElement.InnerXml = scriptText.ToString();
                    root.AppendChild(scriptElement);
                }
                scriptWriter.Close();
                TextWriter textWriter = new StringWriter();
                XmlTextWriter txWriter = new XmlTextWriter(textWriter);
                bool isWriteText = false;
                
                if (visible == "True" && mouseevent == "False")
                {
                    for (int k = 0; k < table.Length; k++)
                    {
                        if (server[k] == 1)
                        {
                            isWriteText = true;
                            writeText(conn, table[k], txWriter, tsize.ToString(), textcolor, fontfamily, fontstyle, fontweight, vboxRect);
                        }
                    }
                }
                txWriter.Close();
                if (isWriteText == true)
                {
                    XmlElement textElement = doc.CreateElement("g", root.NamespaceURI);
                    textElement.SetAttribute("xmlns", "http://www.w3.org/2000/svg");
                    textElement.InnerXml = textWriter.ToString();
                    root.AppendChild(textElement);
                }
            
            }
            //********************************************************************
            if (callAnother == false)
            {
               //writer.WriteStartDocument();
                TextWriter kWriter = new StringWriter();
                XmlTextWriter xkWriter = new XmlTextWriter(kWriter);

                //xkWriter.WriteStartElement("g");
                //if (visible == "True" && mouseevent == "True")
                //xkWriter.WriteAttributeString("onmousemove", "DoOnMouseMove(evt)");
                //xkWriter.WriteEndElement(); 

                for (int k = 0; k < table.Length; k++)
                {                    
                        writeSVG(table[k], color[k], stroke[k], xkWriter, conn, visible, opacity, mouseevent, vboxRect);
                }

                if (visible == "True" && mouseevent != "True")
                {
                    for (int k = 0; k < table.Length; k++)
                        writeText(conn, table[k], xkWriter, textsize, textcolor, fontfamily, fontstyle, fontweight, vboxRect);
                }
                xkWriter.WriteStartElement("script");
                xkWriter.WriteAttributeString("language","JavaScript");
                if (visible == "True" && mouseevent == "True")
                    writeScript(xkWriter, textsize, textcolor, fontfamily, fontstyle, fontweight ,"25");
                //xkWriter.WriteEndElement();                
                //xkWriter.WriteEndElement();
                xkWriter.Close();

                XmlElement kmElement = doc.CreateElement("g", root.NamespaceURI);
                kmElement.SetAttribute("xmlns", "http://www.w3.org/2000/svg");
                if (visible=="True" && mouseevent=="True") 
                    kmElement.SetAttribute("onmousemove", "DoOnMouseMove(evt)");
                kmElement.InnerXml = kWriter.ToString();
                root.AppendChild(kmElement);

            }
            conn.Close();
       // }
     //   catch (Exception e)
     //   {
    //    }
        return doc;
    }


    //-------------------------- CreateMap Service ----------------------------
    [WebMethod]
    public XmlDocument CreateMap(string request)
    {
        string connection = "DSN=PostgreSQL;SERVER=localhost;Trusted_connection=yes;DATABASE=gis;USER=postgres;PASSWORD=1234;";
        OdbcConnection conn = new OdbcConnection(connection);

        conn.Open();

        TextReader temp = new StringReader(request);
        XmlTextReader tempReader = new XmlTextReader(temp);
        int tmp = 0;
        int dataCount = 0;
        int elementcount = 0;
        while (tempReader.Read())
        {
            if (tempReader.NodeType == XmlNodeType.Element)
            {
                elementcount++;
                if (tempReader.Name == "name") tmp++;
                if (tempReader.Name == "item") dataCount++;
            }
        }

        string[] dataCoordinate = new string[dataCount];
        string[] dataName = new string[dataCount];
        string[] dataReference = new string[dataCount];
        string[] dataDetail = new string[dataCount];
        string[] dataFill = new string[dataCount];
        string[] dataStroke = new string[dataCount];
        string[] layer = new string[tmp];
        string[] table = new string[tmp];
        string[] color = new string[tmp];
        string[] stroke = new string[tmp];
        string[] symbol = new string[dataCount];
        string mouseevent = "";
        string visible = "";
        string textsize = "";
        string textcolor = "";
        string fontfamily = "";
        string fontstyle = "";
        string fontweight = "";
        string width = "";
        string height = "";
        string opacity = "";
        string[] type = new string[dataCount];//////////////////////////////
        double vbox1 = 0;
        double vbox2 = 0;
        double vbox3 = 0;
        double vbox4 = 0;
        double xw = 0;
        double yh = 0;

        TextReader txtReader = new StringReader(request);
        XmlTextReader xmlreader = new XmlTextReader(txtReader);
        xmlreader.WhitespaceHandling = WhitespaceHandling.All;
        
        int i = 0;
        int j = 0;
        int z = 0;
        int l = 0;
        int m = 0;
        int n = 0;
        int o = 0;
        int p = 0;
        int q = 0;
        int s = 0;
        int t = 0;

        //------------------------------------------------------------

        while (xmlreader.Read())
        {
            if (xmlreader.NodeType.Equals(XmlNodeType.Element))
            {
                if (xmlreader.Name == "vbox1")
                    vbox1 = xmlreader.ReadElementContentAsDouble();
                if (xmlreader.Name == "vbox2")
                    vbox2 = xmlreader.ReadElementContentAsDouble();
                if (xmlreader.Name == "vbox3")
                    vbox3 = xmlreader.ReadElementContentAsDouble();
                if (xmlreader.Name == "vbox4")
                    vbox4 = xmlreader.ReadElementContentAsDouble();
                if (xmlreader.Name == "width")
                    width = xmlreader.ReadElementString();
                if (xmlreader.Name == "height")
                    height = xmlreader.ReadElementString();
                if (xmlreader.Name == "opacity")
                    opacity = xmlreader.ReadElementString();
                if (xmlreader.Name == "text-visible")
                    visible = xmlreader.ReadElementString();
                if (xmlreader.Name == "text-family")
                    fontfamily = xmlreader.ReadElementString();
                if (xmlreader.Name == "text-weight")
                    fontweight = xmlreader.ReadElementString();
                if (xmlreader.Name == "text-style")
                    fontstyle = xmlreader.ReadElementString();
                if (xmlreader.Name == "text-size")
                    textsize = xmlreader.ReadElementString();
                if (xmlreader.Name == "text-color")
                    textcolor = xmlreader.ReadElementString();
                if (xmlreader.Name == "mouse-event")
                    mouseevent = xmlreader.ReadElementString();
                if (xmlreader.Name == "name")
                {
                    layer[i] = xmlreader.ReadElementString();
                    i++;
                }
                if (xmlreader.Name == "fill-color")
                {
                    color[j] = xmlreader.ReadElementString();
                    j++;
                }
                if (xmlreader.Name == "stroke-color")
                {
                    stroke[z] = xmlreader.ReadElementString();
                    z++;
                }
                if (xmlreader.Name == "item-type")
                {
                    type[s] = xmlreader.ReadElementString();
                    s++;
                }
                if (xmlreader.Name == "item-symbol")
                {
                    symbol[t] = xmlreader.ReadElementString();
                    t++;
                }
                if (xmlreader.Name == "item-coordinate")
                {
                    dataCoordinate[l] = subCoor(xmlreader.ReadElementString());
                    l++;
                }
                if (xmlreader.Name == "item-name")
                {
                    dataName[m] = xmlreader.ReadElementString();
                    m++;
                }
                if (xmlreader.Name == "item-reference")
                {
                    dataReference[n] = xmlreader.ReadElementString();
                    n++;
                }
                if (xmlreader.Name == "item-detail")
                {
                    dataDetail[o] = xmlreader.ReadElementString();
                    o++;
                }
                if (xmlreader.Name == "item-fill")
                {
                    dataFill[p] = xmlreader.ReadElementString();
                    p++;
                }
                if (xmlreader.Name == "item-stroke")
                {
                    dataStroke[q] = xmlreader.ReadElementString();
                    q++;
                }
            }
        }

        xw = vbox1 + vbox3;
        yh = vbox2 - vbox4;

        string vboxRect = "GeometryFromText('POLYGON((" + vbox1.ToString() + " " + vbox2.ToString() + "," + xw.ToString() + " " + vbox2.ToString() + "," + xw.ToString() + " " + yh.ToString() + "," + vbox1.ToString() + " " + yh.ToString() + "," + vbox1.ToString() + " " + vbox2.ToString() + "))',-1)";

        //--------------------------------------------------------

        for (int count = 0; count < table.Length; count++)
        {
            string tablequery = String.Concat("Select tablename From tb_layer Where name='", layer[count], "';");
            OdbcCommand myCommand = new OdbcCommand(tablequery, conn);
            OdbcDataReader myReader;
            myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                table[count] = myReader.GetString(0);
            }
            myReader.Close();
        }

        TextWriter w = new StringWriter();
        XmlTextWriter writer = new XmlTextWriter(w);

        writer.WriteStartDocument();
        writer.WriteStartElement("svg");
        writer.WriteAttributeString("xmlns", "http://www.w3.org/2000/svg");
        writer.WriteAttributeString("xmlns:xlink", "http://www.w3.org/1999/xlink");
        writer.WriteAttributeString("width", width);
        writer.WriteAttributeString("height", height);
        writer.WriteAttributeString("viewBox", String.Concat(vbox1, " -", vbox2, " ", vbox3, " ", vbox4));
        writer.WriteAttributeString("preserveAspectRatio", "xMidYMid");
        if (visible == "True" && mouseevent == "True")
            writer.WriteAttributeString("onload", "on_load(evt)");

        writer.WriteAttributeString("version", "1.0");
        //--------------------------------------------------
        //writeSymbol(writer);
        //--------------------------------------------------
        writer.WriteStartElement("g");
        if (visible == "True" && mouseevent == "True")
            writer.WriteAttributeString("onmousemove", "DoOnMouseMove(evt)");
        if (layer.Length > 0)
        {
            for (int k = 0; k < table.Length; k++)
                writeSVG(table[k], color[k], stroke[k], writer, conn, visible, opacity, mouseevent, vboxRect);
        }
        for (int ii = 0; ii < dataCount; ii++)
        {
            if (dataReference[ii] != "")
            {
                writer.WriteStartElement("a");
                writer.WriteAttributeString("xlink:href", dataReference[ii]);
                writer.WriteAttributeString("xmlns", "http://www.w3.org/2000/svg");
                writer.WriteAttributeString("xmlns:xlink", "http://www.w3.org/1999/xlink");
            }
            writer.WriteStartElement("g");
            writer.WriteAttributeString("layer", "created items");
            if (type[ii] != "point")
            {
                writer.WriteStartElement("path");
                writer.WriteAttributeString("gid", ii.ToString());
                writer.WriteAttributeString("id", dataName[ii]);
                writer.WriteAttributeString("style", String.Concat("stroke:", dataStroke[ii], ";fill:", dataFill[ii], ";fill-opacity:", opacity, ";"));
                writer.WriteAttributeString("detail", dataDetail[ii]);


                if (visible == "True" && mouseevent == "True")
                {
                    writer.WriteAttributeString("onmouseover", "over(evt)");
                    writer.WriteAttributeString("onmouseout", "out(evt)");
                }
                writer.WriteAttributeString("d", "M " + dataCoordinate[ii]);
                writer.WriteEndElement();
            }
            else
            {
                if (symbol[ii] == "none")
                {
                    writer.WriteStartElement("circle");
                    writer.WriteAttributeString("gid", ii.ToString());
                    writer.WriteAttributeString("id", dataName[ii]);
                    writer.WriteAttributeString("cx", X_Y(dataCoordinate[ii])[0]);
                    writer.WriteAttributeString("cy", X_Y(dataCoordinate[ii])[1]);
                    writer.WriteAttributeString("r", "4");
                    writer.WriteAttributeString("style", String.Concat("stroke:", dataStroke[ii], ";fill:", dataFill[ii], ";fill-opacity:", opacity, ";"));
                    
                    if (visible == "True" && mouseevent == "True")
                    {
                        writer.WriteAttributeString("onmouseover", "over(evt)");
                        writer.WriteAttributeString("onmouseout", "out(evt)");
                    }
                    
                    writer.WriteEndElement();
                }
                else
                {
                    writer.WriteStartElement("g");
                    writer.WriteStartElement("use");
                    writer.WriteAttributeString("transform", "translate(" + X_Y(dataCoordinate[ii])[0] + " " + X_Y(dataCoordinate[ii])[1] + ")");
                    writer.WriteAttributeString("xlink:href", "#" + symbol[ii]);
                    writer.WriteEndElement();
                    writer.WriteStartElement("text");
                    writer.WriteAttributeString("x", X_Y(dataCoordinate[ii])[0]);
                    writer.WriteAttributeString("y", X_Y(dataCoordinate[ii])[1]);
                    writer.WriteAttributeString("style", "fill:" + textcolor + ";font-size:" + textsize + ";font-family:" + fontfamily + ";font-weight:" + fontweight + ";font-style:" + fontstyle + ";");
                    writer.WriteString(dataName[ii]);
                    writer.WriteEndElement();
                    writer.WriteEndElement();

                }
                              
            }
            writer.WriteEndElement();

            if (dataReference[ii] != "")
                writer.WriteEndElement();
        }
        writer.WriteEndElement();


        if (visible == "True" && mouseevent == "True")
        {
            writer.WriteStartElement("script");
            writer.WriteAttributeString("language", "JavaScript");
            writeScript(writer, textsize, textcolor, fontfamily, fontstyle, fontweight, "25");
            
            writer.WriteEndElement();
        }
        writer.WriteEndElement();
        writer.Flush();
        writer.Close();

        conn.Close();


        TextReader r = new StringReader(w.ToString());

        XmlDocument doc = new XmlDocument();
        doc.Load(r);

        XmlNode root = doc.DocumentElement;
        XmlElement def = doc.CreateElement("defs");
        def.SetAttribute("xmlns", "http://www.w3.org/2000/svg");
        def.InnerXml = writeSymbol();

        root.AppendChild(def);

        return doc;

    }

   
//-----------------------Find Service-----------------------------//   
    [WebMethod]
    public string Find(string name,string[] layer,double startX,double startY,double width,double height)
    {
        string connection = "DSN=PostgreSQL;SERVER=localhost;Trusted_connection=yes;DATABASE=gis;USER=postgres;PASSWORD=1234;";
        OdbcConnection conn = new OdbcConnection(connection);
        conn.Open();

        double xw = startX+width;
        double yh = startY-height;

        string vboxRect = "GeometryFromText('POLYGON((" + startX.ToString() + " " + startY.ToString() + "," + xw.ToString() + " " + startY.ToString() + "," + xw.ToString() + " " + yh.ToString() + "," + startX.ToString() + " " + yh.ToString() + "," + startX.ToString() + " " + startY.ToString() + "))',-1)";


        TextWriter w = new StringWriter();
        XmlTextWriter writer = new XmlTextWriter(w);
        
        int noTable = 0;
        string[] table = new string[layer.Length];

        for (int i = 0; i < layer.Length; i++)
        {
            string tablequery = String.Concat("Select tablename From tb_layer where name = '", layer[i], "';");
            OdbcCommand myCommand = new OdbcCommand(tablequery, conn);
            OdbcDataReader myReader;
            myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                table[noTable] = myReader.GetString(0);
                noTable++;
            }
            myReader.Close();
        }

        writer.WriteStartDocument();
        writer.WriteStartElement("FindResult");
        for (int i = 0; i < table.Length; i++)
        {
            string myquery = String.Concat("Select name,x(centroid(the_geom)),y(centroid(the_geom)) From ", table[i]," Where the_geom && ",vboxRect," and lower(name) like '%",name.ToLower(),"%' and name != '';");
            OdbcCommand mySelectCommand = new OdbcCommand(myquery, conn);
            OdbcDataReader reader;
            reader = mySelectCommand.ExecuteReader();

            
            while (reader.Read())
            {
              writer.WriteStartElement("item");
              writer.WriteElementString("name", reader.GetString(0));
              writer.WriteElementString("coordinateX", reader.GetFloat(1).ToString());
              writer.WriteElementString("coordinateY", reader.GetFloat(2).ToString());
              writer.WriteEndElement();
            }
            reader.Close();        
        }
        writer.WriteEndElement();
        writer.Flush();
        writer.Close();
        conn.Close();

        return w.ToString();

    }

    
    //------------------------ Find Address Service ----------------//
    [WebMethod]
    public string FindAddress(string address,string street,string district,string province,string postcode)
    {
        string connection = "DSN=PostgreSQL;SERVER=localhost;Trusted_connection=yes;DATABASE=gis;USER=postgres;PASSWORD=1234;";
        OdbcConnection conn = new OdbcConnection(connection);
        conn.Open();

        int rowReturn = 0;
        string addressQuery = "Select address,street,district,province,postcode,x(centroid(the_geom)),y(centroid(the_geom)) From tb_building where lower(address) = '"+address.ToLower()+"' and lower(street) like '%"+street.ToLower()+"%' and lower(district) like '%"+district.ToLower()+"%' and lower(province) like '%"+province.ToLower()+"%' and postcode like '%"+postcode+"%';";
        OdbcCommand myCommand = new OdbcCommand(addressQuery, conn);
        OdbcDataReader myReader;
        myReader = myCommand.ExecuteReader();

        TextWriter w = new StringWriter();
        XmlTextWriter writer = new XmlTextWriter(w);

        writer.WriteStartElement("FindAddress-ItemsFound");
        while (myReader.Read())
        {
            writer.WriteStartElement("item");
            writer.WriteElementString("address", myReader.GetString(0));
            writer.WriteElementString("street", myReader.GetString(1));
            writer.WriteElementString("district", myReader.GetString(2));
            writer.WriteElementString("province", myReader.GetString(3));
            writer.WriteElementString("postcode", myReader.GetString(4));
            writer.WriteEndElement();
            rowReturn++;
        }

        if (rowReturn == 0)
        {
            writer.WriteStartElement("item");
            writer.WriteElementString("address", "Your");
            writer.WriteElementString("street", " specific");
            writer.WriteElementString("district", " address");
            writer.WriteElementString("province", " not");
            writer.WriteElementString("postcode", " found");
            writer.WriteEndElement();
        }
        writer.WriteEndElement();
        myReader.Close();
        conn.Close();
        return w.ToString();
    }
    //------------------------End Find Address Service ------------//

   
    //------------------------Find Nearby Service -----------------//
    [WebMethod]
    public XmlDocument FindNearby(double CoordinateX, double CoordinateY, double radius,string request,bool showText,double startX,double startY,double vwidth,double vheight)
    {
        if (CoordinateY > 0)
            CoordinateY = -1 * CoordinateY;

        string connection = "DSN=PostgreSQL;SERVER=localhost;Trusted_connection=yes;DATABASE=gis;USER=postgres;PASSWORD=1234;";
        OdbcConnection conn = new OdbcConnection(connection);
        conn.Open();

        TextReader temp = new StringReader(request);
        XmlTextReader tempReader = new XmlTextReader(temp);
        int tmp = 0;
        while (tempReader.Read())
        {
            if (tempReader.NodeType == XmlNodeType.Element)
            {
                if (tempReader.Name == "name") tmp++;
            }
        }

        string[] layer = new string[tmp];
        string[] table = new string[tmp];
        string[] color = new string[tmp];
        string[] stroke = new string[tmp];
      
        double newLong = 0;
        if (CoordinateY < 0)
            newLong = -1 * CoordinateY;       
        string textsize = "";
        string textcolor = "";
        string fontfamily = "";
        string fontstyle = "";
        string fontweight = "";
        string width = "";
        string height = "";
        string opacity = "";
        
        TextReader txtReader = new StringReader(request);
        XmlTextReader xmlreader = new XmlTextReader(txtReader);
        xmlreader.WhitespaceHandling = WhitespaceHandling.All;
        int i = 0;
        int j = 0;
        int z = 0;

        //------------------------------------------------------------

        while (xmlreader.Read())
        {
            if (xmlreader.NodeType.Equals(XmlNodeType.Element))
            {
                if (xmlreader.Name == "width")
                    width = xmlreader.ReadElementString();
                if (xmlreader.Name == "height")
                    height = xmlreader.ReadElementString();
                if (xmlreader.Name == "opacity")
                    opacity = xmlreader.ReadElementString();
                if (xmlreader.Name == "text-family")
                    fontfamily = xmlreader.ReadElementString();
                if (xmlreader.Name == "text-weight")
                    fontweight = xmlreader.ReadElementString();
                if (xmlreader.Name == "text-style")
                    fontstyle = xmlreader.ReadElementString();
                if (xmlreader.Name == "text-size")
                    textsize = xmlreader.ReadElementString();
                if (xmlreader.Name == "text-color")
                    textcolor = xmlreader.ReadElementString();
                if (xmlreader.Name == "name")
                {
                    layer[i] = xmlreader.ReadElementString();
                    i++;
                }
                if (xmlreader.Name == "fill-color")
                {
                    color[j] = xmlreader.ReadElementString();
                    j++;
                }
                if (xmlreader.Name == "stroke-color")
                {
                    stroke[z] = xmlreader.ReadElementString();
                    z++;
                }

            }
        }


        //--------------------------------------------------------

        for (int count = 0; count < table.Length; count++)
        {
            string tablequery = String.Concat("Select tablename From tb_layer Where name='", layer[count], "';");
            OdbcCommand myCommand = new OdbcCommand(tablequery, conn);
            OdbcDataReader myReader;
            myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                table[count] = myReader.GetString(0);
            }
            myReader.Close();
        }

        TextWriter w = new StringWriter();
        XmlTextWriter writer = new XmlTextWriter(w);

        writer.WriteStartDocument();
        writer.WriteStartElement("svg");
        writer.WriteAttributeString("xmlns", "http://www.w3.org/2000/svg");
        writer.WriteAttributeString("width", width);
        writer.WriteAttributeString("height", height);
        writer.WriteAttributeString("viewBox", startX.ToString()+" -"+startY.ToString()+" "+vwidth.ToString()+" "+vheight.ToString());
        writer.WriteAttributeString("preserveAspectRatio", "xMinYMin");
        if (showText == true)
            writer.WriteAttributeString("onload", "on_load(evt)");

        writer.WriteAttributeString("version", "1.0");
        writer.WriteStartElement("g");
        if (showText == true)
            writer.WriteAttributeString("onmousemove", "DoOnMouseMove(evt)");

       

        for (int k = 0; k < table.Length; k++)
        {
            if (table[k] == "tb_road" || table[k] == "tb_water" || table[k] == "tb_rail")
            {
                string findNearbyQuery = "SELECT gid,assvg(the_geom) FROM " + table[k] + " WHERE distance(the_geom,GeometryFromText('POINT(" + CoordinateX.ToString() + " " + newLong.ToString() + ")',-1)) < " + radius.ToString() + ";";
                OdbcCommand findNearbyCommand = new OdbcCommand(findNearbyQuery, conn);
                OdbcDataReader findNearbyReader;
                findNearbyReader = findNearbyCommand.ExecuteReader();

                writer.WriteStartElement("g");
                writer.WriteAttributeString("layer", table[k]);

                while (findNearbyReader.Read())
                {
                    try
                    {
                        writer.WriteStartElement("path");
                        writer.WriteAttributeString("gid", findNearbyReader.GetInt32(0).ToString());
                        writer.WriteAttributeString("style", String.Concat("stroke:", stroke[k], ";fill:", color[k], ";fill-opacity:", opacity, ";"));
                        writer.WriteAttributeString("d", findNearbyReader.GetString(1));
                        writer.WriteEndElement();
                    }
                    catch (OdbcException e)
                    {
                        string errorMessages = "";

                        for (int a = 0; a < e.Errors.Count; a++)
                        {
                            errorMessages += "Index #" + i + "\n" +
                                         "Message: " + e.Errors[a].Message + "\n" +
                                         "NativeError: " + e.Errors[a].NativeError.ToString() + "\n" +
                                         "Source: " + e.Errors[a].Source + "\n" +
                                         "SQL: " + e.Errors[a].SQLState + "\n";
                        }

                        System.Diagnostics.EventLog log = new System.Diagnostics.EventLog();
                        log.Source = "My Application";
                        log.WriteEntry(errorMessages);

                        writer.WriteElementString("Error", "Error ODBC Exeption");
                    }
                }

                writer.WriteEndElement();

                findNearbyReader.Close();
            }
            else if (table[k] == "tb_atm")
            {
                string mySelectQuery = "SELECT gid,name,x(the_geom),y(the_geom) FROM " + table[k] + " WHERE distance(the_geom,GeometryFromText('POINT(" + CoordinateX.ToString() + " " + newLong.ToString() + ")',-1)) < " + radius.ToString() + ";";

                OdbcCommand myCommand = new OdbcCommand(mySelectQuery, conn);

                OdbcDataReader myReader;
                myReader = myCommand.ExecuteReader();

                writer.WriteStartElement("g");
                writer.WriteAttributeString("layer", table[k]);

                while (myReader.Read())
                {
                    try
                    {
                        writer.WriteStartElement("circle");
                        writer.WriteAttributeString("gid", myReader.GetInt32(0).ToString());
                        writer.WriteAttributeString("id", myReader.GetString(1));
                        writer.WriteAttributeString("style", String.Concat("stroke:", stroke[k], ";fill:", color[k], ";fill-opacity:", opacity, ";"));
                        if (showText == true)
                        {
                            writer.WriteAttributeString("onmouseover", "over(evt)");
                            writer.WriteAttributeString("onmouseout", "out(evt)");
                        }
                        writer.WriteAttributeString("cx", myReader.GetFloat(2).ToString());
                        writer.WriteAttributeString("cy", "-" + myReader.GetFloat(3).ToString());
                        writer.WriteAttributeString("r", "6");
                        writer.WriteEndElement();
                    }
                    catch (OdbcException e)
                    {
                        string errorMessages = "";

                        for (int a = 0; a < e.Errors.Count; a++)
                        {
                            errorMessages += "Index #" + i + "\n" +
                                             "Message: " + e.Errors[a].Message + "\n" +
                                             "NativeError: " + e.Errors[a].NativeError.ToString() + "\n" +
                                             "Source: " + e.Errors[a].Source + "\n" +
                                             "SQL: " + e.Errors[a].SQLState + "\n";
                        }

                        System.Diagnostics.EventLog log = new System.Diagnostics.EventLog();
                        log.Source = "My Application";
                        log.WriteEntry(errorMessages);

                        writer.WriteElementString("Error", "Error ODBC Exeption");
                    }
                }

                writer.WriteEndElement();

                myReader.Close();

            }

            else
            {
                string findNearbyQuery = "SELECT gid,name,assvg(the_geom) FROM " + table[k] + " WHERE distance(the_geom,GeometryFromText('POINT(" + CoordinateX.ToString() + " " + newLong.ToString() + ")',-1)) < " + radius.ToString() + ";";

                OdbcCommand findNearbyCommand = new OdbcCommand(findNearbyQuery, conn);
                OdbcDataReader findNearbyReader;
                findNearbyReader = findNearbyCommand.ExecuteReader();

                writer.WriteStartElement("g");
                writer.WriteAttributeString("layer", table[k]);

                while (findNearbyReader.Read()) 
                {
                    try
                    {
                        writer.WriteStartElement("path");
                        writer.WriteAttributeString("gid", findNearbyReader.GetInt32(0).ToString());
                        writer.WriteAttributeString("id", findNearbyReader.GetString(1));
                        writer.WriteAttributeString("style", String.Concat("stroke:", stroke[k], ";fill:", color[k], ";fill-opacity:", opacity, ";"));
                        if (showText == true)
                        {
                            writer.WriteAttributeString("onmouseover", "over(evt)");
                            writer.WriteAttributeString("onmouseout", "out(evt)");
                        }
                        writer.WriteAttributeString("d", findNearbyReader.GetString(2));
                        writer.WriteEndElement();
                    }
                    catch (OdbcException e)
                    {
                        string errorMessages = "";

                        for (int a = 0; a < e.Errors.Count; a++)
                        {
                            errorMessages += "Index #" + a + "\n" +
                                             "Message: " + e.Errors[a].Message + "\n" +
                                             "NativeError: " + e.Errors[a].NativeError.ToString() + "\n" +
                                             "Source: " + e.Errors[a].Source + "\n" +
                                             "SQL: " + e.Errors[a].SQLState + "\n";
                        }

                        System.Diagnostics.EventLog log = new System.Diagnostics.EventLog();
                        log.Source = "My Application";
                        log.WriteEntry(errorMessages);

                        writer.WriteElementString("Error", "Error ODBC Exeption");
                    }
                }

                writer.WriteEndElement();

                findNearbyReader.Close();
            }
        }

        writer.WriteStartElement("circle");
        writer.WriteAttributeString("cx", CoordinateX.ToString());
        writer.WriteAttributeString("cy", CoordinateY.ToString());
        writer.WriteAttributeString("r", "3");
        writer.WriteAttributeString("fill", "red");
        writer.WriteAttributeString("stroke", "blue");
        writer.WriteEndElement();

        writer.WriteStartElement("circle");
        writer.WriteAttributeString("cx", CoordinateX.ToString());
        writer.WriteAttributeString("cy", CoordinateY.ToString());
        writer.WriteAttributeString("r", radius.ToString());
        writer.WriteAttributeString("fill", "none");
        writer.WriteAttributeString("stroke", "red");
        writer.WriteEndElement();

        writer.WriteStartElement("text");
        writer.WriteAttributeString("x", CoordinateX.ToString());
        writer.WriteAttributeString("y", CoordinateY.ToString());
        writer.WriteAttributeString("style", "fill:blue;font-family:arial;font-size:15;text-anchor:middle;");
        writer.WriteString("Reference Point");
        writer.WriteEndElement();

        writer.WriteEndElement();

        if (showText == true)
        {
            writer.WriteStartElement("script");
            writer.WriteAttributeString("language", "JavaScript");
            writeScript(writer, textsize, textcolor, fontfamily, fontstyle, fontweight, "25");
            writer.WriteEndElement(); 
        }
        writer.WriteEndElement();
        writer.Flush();
        writer.Close();

        conn.Close();


        TextReader r = new StringReader(w.ToString());

        XmlDocument doc = new XmlDocument();
        doc.Load(r);

        return doc;          
    
    }

    //--------------------------Find Nearest ----------------------//
    [WebMethod]
    public string FindNearest(double CooridinateX, double CoordinateY, string name, string layer,double startX,double startY,double width,double height)
    {
        string connection = "DSN=PostgreSQL;SERVER=localhost;Trusted_connection=yes;DATABASE=gis;USER=postgres;PASSWORD=1234;";
        OdbcConnection conn = new OdbcConnection(connection);
        conn.Open();

        double xw = startX + width;
        double yh = startY - height;

        string vboxRect = "GeometryFromText('POLYGON((" + startX.ToString() + " " + startY.ToString() + "," + xw.ToString() + " " + startY.ToString() + "," + xw.ToString() + " " + yh.ToString() + "," + startX.ToString() + " " + yh.ToString() + "," + startX.ToString() + " " + startY.ToString() + "))',-1)";

        TextWriter w = new StringWriter();
        XmlTextWriter writer = new XmlTextWriter(w);
        string table = "";

        string tablequery = String.Concat("Select tablename From tb_layer where name = '", layer, "';");
        OdbcCommand myCommand = new OdbcCommand(tablequery, conn);
        OdbcDataReader myReader;
        myReader = myCommand.ExecuteReader();
        while (myReader.Read())
        {
             table = myReader.GetString(0);
        }
        myReader.Close();
       
        writer.WriteStartDocument();
        writer.WriteStartElement("FindNearestResult");

        string myquery = String.Concat("SELECT name,x(centroid(the_geom)),y(centroid(the_geom)) FROM ", table, " WHERE lower(name) like '%", name.ToLower(), "%' and Distance('POINT(", CooridinateX.ToString(), " ", CoordinateY.ToString(), ")',the_geom) <= ALL(SELECT Distance('POINT(", CooridinateX.ToString(), " ", CoordinateY.ToString(), ")',the_geom) FROM ", table, " WHERE lower(name) like '%", name.ToLower(), "%');");
        OdbcCommand mySelectCommand = new OdbcCommand(myquery, conn);
        OdbcDataReader reader;
        reader = mySelectCommand.ExecuteReader();
        
        while (reader.Read())
            {
                writer.WriteStartElement("item");
                writer.WriteElementString("name", reader.GetString(0));
                writer.WriteElementString("coordinateX", reader.GetFloat(1).ToString());
                writer.WriteElementString("coordinateY", reader.GetFloat(2).ToString());
                writer.WriteEndElement();
            }
            reader.Close();
        
        writer.WriteEndElement();
        writer.Flush();
        writer.Close();
        
        conn.Close();

        return w.ToString();

    }
    
    //------------------------Calculate Distance ------------------//
    [WebMethod]
    public double CalculateDistance(double beginX, double beginY, double endX, double endY)
    {
        double distanceResult = 0;

        string connection = "DSN=PostgreSQL;SERVER=localhost;Trusted_connection=yes;DATABASE=gis;USER=postgres;PASSWORD=1234;";
        OdbcConnection conn = new OdbcConnection(connection);
        conn.Open();

        string myQuery = "select * from tb_layer;";
        OdbcCommand myQueryCommand = new OdbcCommand(myQuery, conn);
        OdbcDataReader myReader;
        myReader = myQueryCommand.ExecuteReader();
        int count = 0;
        while (myReader.Read())
        {
            count++;
        }
        myReader.Close();

        string[] table = new string[count];
        string tablequery = "Select tablename From tb_layer;";
        OdbcCommand command = new OdbcCommand(tablequery, conn);
        OdbcDataReader tableReader;
        tableReader = command.ExecuteReader();
        int tableIndex = 0;
        while (tableReader.Read())
        {
            table[tableIndex] = tableReader.GetString(0);
            tableIndex++;
        }
        myReader.Close();

        string distanceOuery = "Select Distance('GEOMETRYCOLLECTION(POINT(" + beginX.ToString() + " " + beginY.ToString() + ")','GEOMETRYCOLLECTION(POINT(" + endX.ToString() + " " + endY.ToString() + ")')";
        OdbcCommand distanceCommand = new OdbcCommand(distanceOuery, conn);
        OdbcDataReader distanceReader;
        distanceReader = distanceCommand.ExecuteReader();
        while (distanceReader.Read())
        {
            distanceResult = distanceReader.GetDouble(0);
        }
        
        conn.Close();
        return distanceResult;
    }
    //---------------------End Calculate Distance-------------------//
    //---------------------Convert Address to Coordinate -------------
    [WebMethod]
    public double[] ConvertAddressToCoordinate(string address,string street,string district,string province,string postcode)
    {
        double[] coor = new double[2];
        string connection = "DSN=PostgreSQL;SERVER=localhost;Trusted_connection=yes;DATABASE=gis;USER=postgres;PASSWORD=1234;";
        OdbcConnection conn = new OdbcConnection(connection);
        conn.Open();

        string mySelectQuery = "Select x(centroid(the_geom)),y(centroid(the_geom)) From tb_building Where lower(address) ='"+address.ToLower()+"' and lower(street) = '"+street.ToLower()+"' and lower(district) = '"+district.ToLower()+"' and lower(province) = '"+province.ToLower()+"' and lower(postcode) = '"+postcode.ToLower()+"';";

        OdbcCommand myCommand = new OdbcCommand(mySelectQuery, conn);
        OdbcDataReader myReader;
        myReader = myCommand.ExecuteReader();

        while (myReader.Read())
        {
            coor[0] = Convert.ToDouble(myReader.GetFloat(0));
            coor[1] = Convert.ToDouble(myReader.GetFloat(1));
        }
        myReader.Close();
        conn.Close();

        return coor;
    }
  
}
