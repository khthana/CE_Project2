

:- multifile( proweb_page/2 ).
:- multifile( proweb_form/2 ).
:- multifile( proweb_question / 2 ).
:- multifile( temp_road/1 ).
:- multifile( temp_place/1 ).
:- multifile( temp_near_place/1 ).
:- multifile( temp_routing/1 ).
/******************
 * ProWeb Clauses *
 ******************/
/*********************************************************************************************************************************/

%Search Road
main_goal:-
	proweb_returned_input( fn, 'search_road' ),
	proweb_returned_input( roadname, SubRoadName ),
	ensure_loaded( examples( search_road ) ),
	init_db,
	search_RoadList( SubRoadName, List ),
	finish_db,
	proweb_send_form( show_road_list_form( List ) ).

main_goal:-
	proweb_returned_input( fn, 'show_road' ),
	proweb_returned_input( road_id, RoadID ),
	init_db,
	ensure_loaded( examples( search_road ) ),
	%search_Road( RoadName, RoadID, Paths),
	draw_paths( Filename ,RoadID, RoadName ),
	finish_db,
	proweb_send_form( show_road_form( Filename, RoadName ) ).

/*********************************************************************************************************************************/

%Seach Place 
main_goal:-
	proweb_returned_input( fn, 'search_place' ),
	proweb_returned_input( place_type, PlaceType ),
	proweb_returned_input( placename, PlaceName ),
	ensure_loaded( examples( search_place ) ),
	init_db,
	search_PlaceList( PlaceType, PlaceName, List ),
	finish_db,
	proweb_send_form( show_place_list_form( List ) ).
	
main_goal:-
	proweb_returned_input( fn, 'show_place' ),
	proweb_returned_input( place_id, PlaceID ),
	init_db,
	draw_place( PlaceID, Filename ),
	place( PlaceID, Ox, Oy, _, PlaceName ),
	convertX( Ox, Nx ),
	convertY( Oy, Ny ),
	%default_file( Filename ),
	finish_db,
	proweb_send_form( show_place_form( Filename, PlaceName, Nx, Ny ) ).

/*********************************************************************************************************************************/


%Search Nearest Place
main_goal:-
	proweb_returned_input( fn, 'near_place' ),
	proweb_returned_input( place_type, PlaceType ),
	proweb_returned_input( range, Range ),
	ensure_loaded( examples( nearest_place ) ),
	proweb_send_form( nearest_place_form( PlaceType, Range ) ).

main_goal:-
	proweb_returned_input( fn, 'show_near_place' ),
	proweb_returned_input( cox1, X ),
	proweb_returned_input( coy1, Y ),
	proweb_returned_input( place_type, PlaceType ),
	proweb_returned_input( range, Range ),
	init_db,
	number_atom( Place, PlaceType ),
	number_atom( R, Range ),
	number_atom( X1, X ),
	number_atom( Y1, Y ),
	placetype( Place, PlaceTypeName ),
	nearest_place( X1, Y1, R, Place, PlaceList ),
	draw_place( X1, Y1, R, PlaceList, Filename ),
	show_placelist( PlaceList, String ),
	finish_db,
	proweb_send_form( show_nearest_place_form( Filename, X1, Y1, PlaceTypeName, Range, String ) ).

/*********************************************************************************************************************************/

% Routing 
main_goal:-
	proweb_returned_input( fn, 'routing' ),
	ensure_loaded( examples( routing ) ),
	proweb_send_form( routing_form ).

main_goal:-
	proweb_returned_input( fn, 'show_routing' ),
	proweb_returned_input( cox1, Cox1 ),
	proweb_returned_input( coy1, Coy1 ),
	proweb_returned_input( cox2, Cox2 ),
	proweb_returned_input( coy2, Coy2 ),
	init_db,
	number_atom( X1, Cox1 ),
	number_atom( Y1, Coy1 ),
	number_atom( X2, Cox2 ),
	number_atom( Y2, Coy2 ),
	routing( X1, Y1, X2, Y2, Solution, Distance ),
	draw_paths( X1, Y1, X2, Y2, Solution, Filename ),
	finish_db,
	%default_file( Filename ),
	proweb_send_form( show_routing_form( Filename, X1, Y1, X2, Y2, Distance ) ).

/*********************************************************************************************************************************/

% Default Form %
main_goal:-
	proweb_returned_input( fn, 'default' ),
	proweb_send_form( default_form ).

proweb_form( default_form, 
	[	
		table( border='0', cellpadding='2', cellspacing='2', width='100%'  ),
		tr,
		td( class='headtable', align=center ),
		unencoded@'ผลการวินิจฉัย',
		/td,
		/tr,
		tr,
		td( class='col1', align=center ),
		unencoded@'ระบบให้บริการแผนที่บนเว็บ',
		br,
		unencoded@'Map service on Web',
		/td,
		/tr,
		/table,
		unencoded@ Script 
	] ):-
	default_file( File ),
	default_size( _, _ , H2, W2 ),
	create_script( File, H2, W2, 1, false, false )~>Script.

proweb_page( _, 
	[ 
		include('html/head.html'),
		include('html/body.html'),
		proweb(form),
		include('html/foot.html')
	] ).

/*******************************
		UTILITIES
*******************************/
default_size( 332, 220 , 166, 110 ).

create_script( Filename , X, Y, Size, Pos1, Pos2):-
	%File = encoFilename,
	default_size( W, H, _, _ ),
	Host = '161.246.5.54:8080',
	write('<script language="javaScript">' ),nl,
	write('<!--'),nl,
	write('var NS4 = (document.layers) ? true : false;'), nl,
	write('var IE4 = (document.all) ? true : false;'), nl,
	write('var File = "'), write(Filename), write('";'), nl,
	write('var getpos1 = '), write(Pos1), write(';'), nl,
	write('var getpos2 = '), write(Pos2), write(';'), nl,
	write('var Step = 10;'), nl,
	write('var W = '), write( W ), write(';'),nl,
	write('var H = '), write( H ), write(';'),nl,
	write('var X = '), write( X ), write(';'),nl,
	write('var Y= '), write( Y ), write(';'),nl,
	write('var Size ='), write( Size ), write(';'), nl,

	write('function setRect( x, y, size)'), nl,
	write('{'), nl,
	write('	document.showmap.setXY( x/2, y/2 );'), nl,
	write('	document.showmap.setSize( size );'), nl,
	write('}'), nl,

	write('function Move( e )'),nl,
	write('{'),nl,
	write('	X = (e.x - docjslib_getImageXfromLeft( document.showmap )) * 2 ;'),nl,
	write('	Y = (e.y - docjslib_getImageYfromTop( document.showmap )) * 2;'),nl,
	write('	ReloadSrc();'),nl,
	write('}'),nl,
	
	write('function ShowCoMove( e )'),nl,
	write('{'),nl,
	write('	var x = e.x - docjslib_getImageXfromLeft( document.showmap );'),nl,
	write('	var y = e.y - docjslib_getImageYfromTop( document.showmap );'),nl,
	write('	status = "Latitude : 13:" + (x/10 +32.74) + ", Longtitude : 100:" + (53.95-(y/10));'),nl,
	write('}'),nl,

	write('function ShowCoMap( e )'),nl,
	write('{'),nl,
	write('	var x = e.x - docjslib_getImageXfromLeft( document.map );'),nl,
	write('	var y = e.y - docjslib_getImageYfromTop( document.map );'),nl,
	write('	var nx =  ( ( X - ( 200 - x )/Size )/ 20 ) + 32.749; '),nl,
	write('	var nx1 =  parseInt(String(nx));'),nl,
	write('	var ny =  53.956 - ( (Y - ( 200 - y )/ Size)/20 ); '),nl,
	write('	var ny1 =  parseInt(String(ny));'),nl,
	write('	status = "Latitude : 100:" + nx1 + ":" + (nx - nx1)*100 + ", Longtitude : 13:" + ny1 + ":" + (ny - ny1)*100 ;'),nl,
	write('}'),nl,
	
	write('function MoveMap( e )'),nl,
	write('{'),nl,
	write('	var x = e.x - docjslib_getImageXfromLeft( document.map );'),nl,
	write('	var y = e.y - docjslib_getImageYfromTop( document.map );'),nl,
	write('	var nx =  ( ( X - ( 200 - x )/Size )/ 20 ) + 32.749; '),nl,
	write('	var ny =  53.956 - ( (Y - ( 200 - y )/ Size)/20 ); '),nl,
	write('	if(getpos1)'),nl,
	write('	{'),nl,
	write('		document.forms[0].cox1.value = nx; '),nl,
	write('		document.forms[0].coy1.value = ny; '),nl,
	write('		getpos1 = false'),nl,
	write('	}'),nl,
	write('	else if(getpos2)'),nl,
	write('	{'),nl,
	write('		document.forms[0].cox2.value = nx; '),nl,
	write('		document.forms[0].coy2.value = ny; '),nl,
	write('		getpos2 = false'),nl,
	write('	}'),nl,
	write('}'),nl,
	
	write('function SetPos( pos1, pos2 )'),nl,
	write('{'),nl,
	write('	getpos1 = pos1;'),nl,
	write('	getpos2 = pos2;'),nl,
	write('}'),nl,

	write('function docjslib_getImageXfromLeft(imgID) '),nl,
	write('{'),nl,
	write('  if (NS4) return eval(imgID).x;'),nl,
	write('  else return docjslib_getRealLeft(imgID);'),nl,
	write('}'),nl,
	write('function docjslib_getImageYfromTop(imgID) '),nl,
	write('{'),nl,
	write('  if (NS4) return eval(imgID).y;'),nl,
	write('  else return docjslib_getRealTop(imgID);'),nl,
	write('}'),nl,

	write('function docjslib_getRealLeft(imgElem) '),nl,
	write('{'),nl,
	write('	xPos = eval(imgElem).offsetLeft;'),nl,
	write('	tempEl = eval(imgElem).offsetParent;'),nl,
	write('  	while (tempEl != null) {'),nl,
	write('  		xPos += tempEl.offsetLeft;'),nl,
	write('  		tempEl = tempEl.offsetParent;'),nl,
	write('  	}'),nl,
	write('	return xPos;'),nl,
	write('}'),nl,
	write('function docjslib_getRealTop(imgElem) '),nl,
	write('{'),nl,
	write('	yPos = eval(imgElem).offsetTop;'),nl,
	write('	tempEl = eval(imgElem).offsetParent;'),nl,
	write('	while (tempEl != null) '),nl,
	write('	{'),nl,
	write('  		yPos += tempEl.offsetTop;'),nl,
	write('  		tempEl = tempEl.offsetParent;'),nl,
	write('  	}'),nl,
	write('	return yPos;'),nl,
	write('}'),nl,
	write('function MoveNE()'),nl,
	write('{'),nl,
	write('	X  -= Step;'),nl,
	write('	Y  -= Step;'),nl,
	write('	ReloadSrc();'),nl,
	write('}'),nl,
	write('function MoveN()'),nl,
	write('{'),nl,
	write('	Y  -= Step;'),nl,
	write('	ReloadSrc();'),nl,
	write('}'),nl,
	write('function MoveNW()'),nl,
	write('{'),nl,
	write('	X  += Step;'),nl,
	write('	Y  -= Step;'),nl,
	write('	ReloadSrc();'),nl,
	write('}'),nl,
	write('function MoveE()'),nl,
	write('{'),nl,
	write('	X  -= Step;'),nl,
	write('	ReloadSrc();'),nl,
	write('}'),nl,
	write('function MoveW()'),nl,
	write('{'),nl,
	write('	X  += Step;'),nl,
	write('	ReloadSrc();'),nl,
	write('}'),nl,
	write(''),nl,
	write('function MoveSW()'),nl,
	write('{'),nl,
	write('	X  += Step;'),nl,
	write('	Y  += Step;'),nl,
	write('	ReloadSrc();'),nl,
	write('}'),nl,

	write('function MoveS()'),nl,
	write('{'),nl,
	write('	Y  += Step;'),nl,
	%write('	setRect( X, Y, Size);'),nl,
	write('	ReloadSrc();'),nl,
	write('}'),nl,
	write('function MoveSE()'),nl,
	write('{'),nl,
	write('	X  -= Step;'),nl,
	write('	Y  += Step;'),nl,
	%write('	setRect( X, Y, Size);'),nl,
	write('	ReloadSrc();'),nl,
	write('}'),nl,

	write('function ZoomIn()'),nl,
	write('{'),nl,
	write('	if( Size < 7 )'),nl,
	write('	{ '),nl,
	write('		Size ++;'),nl,
	%write('		setRect( X, Y, Size);'),nl,
	write('		ReloadSrc();'),nl,
	write('	}'),nl,
	write('}'),nl,

	write('function ZoomOut()'),nl,
	write('{'),nl,
	write('	if( Size > 1 ) '),nl,
	write('	{'),nl,
	write('		Size --;'),nl,
	%write('		setRect( X, Y, Size);'),nl,
	write('		ReloadSrc();'),nl,
	write('	}'),nl,
	write('}'),nl,

	write('function ResetSize()'),nl,
	write('{'),nl,
	write('	Size = 1;'),nl,
	%write('	setRect( X, Y, Size);'),nl,
	write('	ReloadSrc();'),nl,
	write('}'),nl,
/*
	write('function ShowStatusBar( str )'),nl,
	write('{'),nl,
	write('	status = str';),nl,
	write('}'),nl,
*/
	write('function ReloadSrc()'),nl,
	write('{'),nl,
	write('	setRect( X, Y, Size);'),nl,
	write('	var Xt = (X * Size) - 200;'),nl,
	write('	var Yt = (Y * Size) - 200;'),nl,
	write('	var Ht =  H * Size;'),nl,
	write('	var Wt = W * Size;'),nl,
	%write('	var Ht =  H * Size;'),nl,
	write('	document.map.src = "http://'),write(Host),write('/servlet/ImageViewer?file=" + File + "&x=" + Xt + "&y=" + Yt + "&w=" + Wt + "&h=" + Ht + "&ws=400&hs=400&dw='),write( W ),write('&dh='),write( H ),write('";'),nl,
	write('}'),nl,

	write('//-->'),nl,
	write('</script>').

/*******************************
		ODBC
data source name : map
path : c:\map\map.mdb

*******************************/


init_db:-
	ensure_loaded( system(dblink) ),
	db_connect( map ).

finish_db:-
	db_disconnect.

position( PointID, X, Y ):-
	db_tuple( 'POSITION', [ PointID, X, Y ] ).

path( PathID, PointID1, PointID2 ):-
	db_tuple( 'PATH', [ PathID, PointID1, PointID2 ] ).

place( PlaceID, X , Y, PlaceType, PlaceName ):-
	db_tuple( 'PLACE', [ PlaceID, X , Y, PlaceType, PlaceName ] ).

placetype( Param1, Param2 ):-
	db_tuple( 'PLACETYPE', [ Param1, Param2 ] ).

road( Param1, Param2 , Param3, Param4, Param5 ):-
	db_tuple( 'ROAD', [ Param1, Param2, Param3, Param4, Param5 ] ).

pathroad( PathID, PointID1, PointID2 , RoadID ):-
	db_tuple( 'P1', [ PathID, PointID1, PointID2 , RoadID ] ).

roadpath( Param1, Param2, Param3 ):-
	db_tuple( 'ROADPATH', [ Param1, Param2, Param3 ] ).

roadtype( Param1, Param2 ):-
	db_tuple( 'ROADTYPE', [ Param1, Param2 ] ).

crossroad( Param1, Param2 ):-
	db_tuple( 'CROSSROAD', [ Param1, Param2 ] ).

/*********************************
*	 Convert Coordinate		*
**********************************/

convertX( X, NewX ):-
	Xn is (  X - 32.749 ) * 20,
	NewX is int(  Xn + 0.5 ),
	!.

convertY( Y, NewY ):-
	Yn is ( 53.956 - Y )  * 20,
	NewY is int( Yn + 0.5 ),
	!.

%dist. point to point
dist_PointToPoint(  X, Y, X, Y, 0 ).
dist_PointToPoint(  X1,Y1, X2, Y2, Dist ):-
	X is X1-X2,
	Xpow is X*X,
	Y is Y1-Y2,
	Ypow is Y*Y,
	Dist is sqrt( Xpow+Ypow ),
	!.

/*********************************
*   Random Temporary File	*
**********************************/
default_file('C:\\Map\\Map_ttt.wmf').
temp_file( FileStr ) :-
	%absolute_file_name( prolog('temp'), TempDir ),
	proweb_data_uco( UCOForCurrentConversation ),
	%time(0,X),
	%X = (A,B),
	(
	 write('c:/winnt/temp/'),
	 write('m'),
	 write(UCOForCurrentConversation),
	 write('.wmf')
	)~>FileStr.
	/*(
		write(TempDir),
		write('\'),
		write( UCOForCurrentConversation ),
		write('.wmf')
	)~> FileStr.*/
	

/************************************************
*	Create and Save File temporary		*
*************************************************/
%create a metafile consisting of a blue square containing a red circle
createMeta( Device ):-
	winapi( (gdi32,'CreateMetaFileA'), [0], Device ).	 

saveMeta( Device, File ):-
	winapi( (gdi32,'CloseMetaFile'), [Device], Handle ),
	winapi( (gdi32,'CopyMetaFileA'), [Handle, File ], _ ),
	winapi( (gdi32,'DeleteMetaFile'), [Device], _ ).

% tidy up dynamic data and graphics objects
tidy_draw:-
	catch( _, gfx_metafile_close(layer) ),
	%catch( _, gfx_brush_close( white ) ),
	%catch( _, gfx_brush_close( blue ) ),
	%catch( _, gfx_brush_close( red ) ),
	catch( _, gfx_pen_close( red ) ),
	%catch( _, gfx_pen_close( green ) ),
	catch( _, gfx_pen_close( blue ) ),
	%catch( _, gfx_fore_close( red ) ),
	%catch( _, gfx_fore_close( yellow ) ),
	catch( _, gfx_fore_close( black ) ),
	catch( _, gfx_font_close(ms_sans_serif_14b) ),
	catch( _, gfx_font_close(ms_sans_serif_10) ),
   	!.

% initialise dynamic data and graphics objects
init_draw:-
	%ensure_loaded( examples( pos ) ),
	default_file( File ),
   	gfx_metafile_load( layer, File ),
	%gfx_metafile_load( soi, 'C:/WIN-PROLOG4040/PROWEB/IMAGES/soi.wmf' ),
 	%gfx_brush_create( white, 255, 255, 255, solid ),
	%gfx_brush_create( blue ,   0,   0, 255, solid ),
	%gfx_brush_create( red  , 255,   0,   0, solid ),
	gfx_pen_create( red  , 255,   0,   0, solid ),
	%gfx_pen_create( green  , 0, 255,   0, solid ),
	gfx_pen_create( blue ,   0,   0, 255, solid ),
	%gfx_fore_create( green, 0, 255, 0 ),
	%gfx_fore_create( yellow, 255, 255, 0 ),
	gfx_fore_create( black, 0, 0, 0),
	gfx_font_create( ms_sans_serif_14b ,'MS Sans Serif', 14, bold ),
	gfx_font_create( ms_sans_serif_10 ,'MS Sans Serif', 10, normal ),
	!.

draw_place( Xo, Yo, Text ):-
	convertX( Xo, Xn ),
	convertY( Yo, Yn ),
	X1 is Xn - 1,
	Y1 is Yn - 1,
	X2 is Xn + 1,
	Y2 is Yn + 1,
	Xt is Xn + 2,
	gfx( ( ellipse( X1, Y1, X2, Y2 ) ) ),
	gfx( ( fore=black, font = ms_sans_serif_10 -> text( Xt, Y1, Text ) ) ).

/********************************
*  Sub String & Concatenate	 *	
*********************************/
sub_string( Sub, String ):-
	name( Sub, SubList ),
	name( String, StringList ),
	sub( SubList, StringList ),
	!.

sub( [ A | Sub ], [ A |List ] ):-
	subs( Sub, List );
	sub( [ A|Sub ], List ).

 sub( [ A | Sub ], [ B |List ] ):-
	sub( [ A|Sub ], List ).

subs( [ A ], [ A|List ] ).
subs( [ A|Sub ], [ A|List ] ):-
	subs( Sub, List ).

concat( Str1, Str2, Cat ):-
	name( Str1, List1 ),
	name( Str2, List2 ),
	append( List1, List2, List3 ),
	name( Cat, List3 ),
	!.

