
<%@Language=VBScript%>
<%Function ConnectToServer()
	' check if we already have a connection
    	if Not IsObject(Session("ADODBConnection")) then 
	  ' get the connection params
 	  szServer = Request.QueryString("server")
	  szDatabase = Request.QueryString("database")

	  ' create and open ADODB Connection
    	  set C = Server.CreateObject("ADODB.Connection")
    	  C.Provider = "msolap"
    	  C.Open "provider=msolap;data source=" & szServer & ";user id=;password=;Connect timeout=120;Initial catalog=" & szDatabase

	  ' set the session object
    	  Set Session("ADODBConnection") = C
    	end if
End Function
Function CreateCellset(szMDX)
	' connect to the OLAP server
	ConnectToServer

	' create the cellset	
	set cs = Server.CreateObject("adomd.Cellset")
	set cs.ActiveConnection = Session("ADODBConnection")
	cs.Open szMDX

	Set CreateCellset = cs
End Function
%>
<%

Response.Buffer = true  'enable buffering so that ALL browsers will save image as a JPEG when
						'  a user right-clicks over it and saves it to disk
%>
<!-- #INCLUDE FILE ="ChartConst.inc" -->
<%
dim szMDX
szMDX = Request.QueryString("szMDX")
' create a cellset
Set cs = CreateCellset(szMDX)
 
%>

<%
'chart chart======================================================================================================================
dim objChart			'Dundas Chart 2D object

'Step 1: Create a Dundas Chart 2D object
set objChart = Server.CreateObject("Dundas.ChartServer2D.1")

'Step 2: Add ALL data to be used by all charts
i=0
crow=0

szPos=cs.Axes(1).positions.count-1
'Axis x
for each px in cs.Axes(0).Positions
    Color=511111
	for j=0 to szPos
	if j=0 then
		if cs(crow,j).FormattedValue="" then
			objChart.AddData 0,0,px.Members(i).Caption
			 objChart.SetSeriesColor j, Color 'first series
		else
			objChart.AddData cs(crow,j).FormattedValue,0,px.Members(i).Caption
          objChart.SetSeriesColor j, Color 'first series
		end if
	else
	    if  cs(crow,j).FormattedValue="" then
		objChart.AddData 0,j
		objChart.SetSeriesColor j, Color
		else
		objChart.AddData cs(crow,j).FormattedValue,j
		objChart.SetSeriesColor j,Color
	    end if
	end if
	Color=Color+10000
	'Color=Random(10000)
	next
	crow=crow+1
next
objChart.Legend.Enabled = true  'enable the legend (it is disabled by default)

countmember=cs.Axes(1).Positions(0).members.count-1
countpos=cs.Axes(1).Positions.Count-1

for i=0 to countpos 
stringcon=""
for j=0 to countmember 
      stringcon=stringcon & cs.Axes(1).Positions(i).members(j).Caption & " | "
next
      objChart.SetSeriesLabel i, stringcon
next



objChart.Legend.FontSize = 12
objChart.Legend.BorderColor = RGB(110,0,0)
objChart.Legend.BackgroundColor = RGB(230,230,230)
objChart.Legend.FontColor = RGB(0,0,110)
objChart.Legend.Transparent = false 
objChart.ChartArea(0).Transparent=true    'make the chart background transparent
objChart.ChartArea(0).LineWidth = 2        'setup the line width, for line charts
objChart.Rectangle3DEffect                'give column and bar charts 3D effects
objChart.AntiAlias                        'turn on anti aliasing
objChart.ChartArea(0).GridVEnabled= false  'disable chart grid lines
objChart.ChartArea(0).GridHEnabled = false 'disable chart grid lines

'Set up the chart axes (0-left, 1-bottom,2-right, 3-top)
objChart.ChartArea(0).Axis(LEFT_AXIS).SetNumberFormat 2,0
objChart.ChartArea(0).Axis(LEFT_AXIS).TickMarks = true
objChart.ChartArea(0).Axis(BOTTOM_AXIS).FontSize = 8
objChart.ChartArea(0).Axis(BOTTOM_AXIS).OffsetLabels = true
objChart.ChartArea(0).Axis(TOP_AXIS).Weight = 0
objChart.ChartArea(0).Axis(RIGHT_AXIS).Weight = 0	 
'setNumberFormat
objChart.ChartArea(0).Axis(0).setNumberFormat 1,0
'grid
'horizontal grid and vertical grid
objChart.ChartArea(0).GridVEnabled=true
objChart.ChartArea(0).GridHEnabled = true
objChart.ChartArea(0).GridColor = rgb(200,200,200)
'set shadow
'objChart.ChartArea(0).SetShadow 
'set alias
objChart.AntiAlias  
'set areachar backgroundcolor
objchart.chartArea(0).backgroundColor=rgb(164,237,255)
'set Backgroundcolor
'objChart.BackgroundColor=123456
'Step 3: Uses data in Data Series 0 and 1 to make a Area chart, then
'		 adds this chart to ChartArea 0. The constant "BAR_CHART" has been
'		 defined in ChartConst.inc file.

objChart.ChartArea(0).AddChart 6,0,szPos
'set Legend and  Chart Area Position
legendCount = countpos
if countpos <10 then
countpos=10 
end if
newcountpos=countpos*60
newlegendcount=legendcount*20
if newcountpos>1200 then
    newcountpos=1200
end if
if newlegendcount>1200 then
  newlegendcount=1200
 end if
objChart.ChartArea(0).SetPosition 60, 15, newcountpos, 300
objChart.Legend.FontSize=8
objChart.Legend.SetPosition 60,350,newcountpos,350+newlegendcount
objChart.SendJpeg newcountpos,370+newlegendcount
set objChart = nothing

%>
