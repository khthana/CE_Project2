
proweb_form( nearest_place_form( PlaceType, Range ), 
	[ 
		input( type=hidden, name='fn', value='show_near_place' ),
		input( type=hidden, name='place_type', value=PlaceType ),
		input( type=hidden, name='range', value=Range ),
		table( border='1', cellpadding='1', cellspacing='1', width='100%' ),
		col( width=50 ),
		col( width=80 ),
		tr,
		td( class='headtable', align='center', valign='middle' ),
		unencoded@'ผลการวินิจฉัย',
		/td,
		/tr,
		tr,
		td( class='headtable', align='center', valign='middle'),
		unencoded@'จุดอ้างอิง',
		/td,
		/tr,
		tr,
		td( class='col1' ),
		unencoded@'ละติจูด',
		/td,
		/tr,
		tr,
		td( class='col2' ),
		input( type=text, name='cox1', value='0' ),
		/td,
		/tr,
		tr,
		td( class='col1' ),
		unencoded@'ลองติจูด', 
		/td,
		/tr,
		tr,
		td( class='col2' ),
		input( type=text, name='coy1', value='0' ),
		/td,
		/tr,
		tr,
		/table,
		br,
		center,
		input( type=submit, value='  Search  '),
		'    ',
		input( type=reset, value=' Reset ', onclick='javascript:SetPos( true, false )' ),
		/center,	
		unencoded@Script
		
	] ):- 
	default_file( File ),
	default_size( _, _ , H2, W2 ),
	create_script( File, H2, W2, 1, true, false )~>Script.

proweb_form( show_nearest_place_form( File, X, Y, PlaceTypeName, Range, String ), 
	[ 
		table( border='1', cellpadding='1', cellspacing='1', width='100%'  ),
		col( width='100' ),
		tr,
		td( class='headtable', colspan=2, align=center ),
		unencoded@'ผลการวินิจฉัย',
		/td,
		/tr,
		tr,
		td( class='col1', colspan=2 ),
		unencoded@'ตำแหน่งที่คุณอยู่', 
		/td,
		/tr,
		tr,
		td( class='col1' ),
		unencoded@'ละติจูด', 
		/td,
		/tr,
		tr,
		td( class='col2' ),
		X, 
		/td,
		/tr,
		tr,
		td( class='col1' ),
		unencoded@'ลองติจูด', 
		/td,
		/tr,
		tr,
		td( class='col2' ),
		Y, 
		/td,
		/tr,
		tr,
		td( class='col1' ),
		unencoded@'ประเภทสถานที่',
		/td,
		/tr,
		tr,
		td( class='col2' ),
		unencoded@PlaceTypeName,
		/td,
		/tr,
		tr,
		td( class='col1' ),
		unencoded@'รัศมี', 
		/td,
		/tr,
		tr,
		td( class='col2' ),
		Range, 
		unencoded@' กิโลเมตร', 
		/td,
		/tr,
		tr,
		td( valign=top, class='col1' ),
		unencoded@'สถานที่พบ', 
		/td,
		/tr,
		tr,
		td( class='col2' ),
		unencoded@ String,
		/td,
		/tr,
		/table,
		unencoded@ Script
	] ):-
	%show_placelist( PlaceList, String ),
	convertX( X, Nx ),
	convertY( Y, Ny ),
	create_script( File, Nx, Ny, 1, false, false )~>Script.

show_placelist( [] , Text ):-
	write('ไม่มีผลลัพท์. <br>')~>Text.
show_placelist( [ [ _, PlaceName ] ], Text ):-
	show_place( PlaceName , Text ).	
show_placelist( [ [ _, PlaceName ] | List ] , [ Text | OthersText ] ):-
	show_place( PlaceName , Text ),
	show_placelist( List , OthersText ).

show_place( PlaceName , Text ):-
	( write( PlaceName ),write('<br>'), nl  )~> Text.

%nearest_place( _, _, _, _, [] ).

nearest_place( X1, Y1, Range, PlaceType, PlaceList ):-
	findall( [PlaceID,PlaceName],
			( 
			place( PlaceID, X2, Y2, PlaceType, PlaceName ),
			dist_PointToPoint(  X1,Y1, X2, Y2, Dist ),
			Dist =< Range
			),
		PlaceList ).


/**************************************
*		Draw nearest place	*
***************************************/
	
draw_place( Xo, Yo, Range, PlaceList, Filename ):-
	tidy_draw,
	init_draw,	
	temp_file( Filename ),
	default_size( W, H , _, _ ),
	createMeta( Device ),
	gfx_begin( [Device] ),
	%gfx( metafile( 0, 0, W, H, soi ) ),
	gfx( metafile( 0, 0, W, H, layer ) ),
	/*Xn1 is Xo - Range,
	Yn1 is Yo - Range,
	Xn2 is Xo+ Range,
	Yn2 is Yo + Range,
	convertX( Xn1, X1 ),
	convertY( Yn1, Y1 ),
	convertX( Xn2, X2 ),
	convertY( Yn2, Y2 ),
	gfx( ( ellipse( X1, Y1, X2, Y2 ) ) ),*/
	%gfx( ( ellipse( X1, Y1, X2, Y2 ) ) ),
	draw_place( Xo, Yo, `คุณอยู่ที่นี้!`),
	draw_placelist( PlaceList ),
	gfx_end( [Device] ),
	saveMeta( Device ,Filename),
	tidy_draw.	


draw_placelist( [] ).
draw_placelist( [ [ PlaceID, _ ] | PlaceList ] ) :-
	( place( PlaceID, Ox, Oy, _, PlaceName ),
	atom_string( PlaceName, Name ),
	convertX( Ox, Nx ),
	convertY( Oy, Ny ),
	draw_place( Nx, Ny, Name ),
	X1 is Nx - 1,
	Y1 is Ny - 1,
	X2 is Nx + 1,
	Y2 is Ny + 1,
	Xt is Nx + 2,
	Yt is Ny - 1,
	gfx( ( ellipse( X1, Y1, X2, Y2 ) ) ),
	gfx( ( fore=black, font = ms_sans_serif_10 -> text( Xt, Yt, Name) ) ),
	draw_placelist( PlaceList )
	; true ).


draw_place( Xo, Yo, Text ):-
	convertX( Xo, X ),
	convertY( Yo, Y ),
	X1 is X - 1,
	Y1 is Y - 1,
	X2 is X + 1,
	Y2 is Y + 1,
	Xt is X + 2,
	gfx( ( ellipse( X1, Y1, X2, Y2 ) ) ),
	gfx( ( fore=black, font = ms_sans_serif_10 -> text( Xt, Y1, Text ) ) ).
	
 


	
