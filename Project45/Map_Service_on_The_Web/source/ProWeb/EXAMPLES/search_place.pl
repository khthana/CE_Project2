
proweb_form( show_place_list_form( Link ) , 
	[	
		table( border='1', cellpadding='0', cellspacing='0', width='100%'  ),
		tr,
		td( class='headtable', align=center ),
		unencoded@'ผลการวินิจฉัย',
		/td,
		/tr,
		tr,
		td( class='col1' ),
		unencoded@Link,
		/td,
		/tr,
		/table,
		br,
		center,
		input( type=hidden, name='fn', value='show_place' ),
		input( type=submit, value='  Show  '),
		/center,
		unencoded@ Script
	] ):-
	default_file( File ),
	default_size( _, _ , H2, W2 ),
	create_script( File, H2, W2, 1, false, false )~>Script.
	

proweb_form( show_place_form( File, PlaceName , Nx, Ny ) , 
	[ 
		table( border='1', cellpadding='0', cellspacing='0', width='100%'  ),
		tr,
		td( class='headtable', align=center ),
		unencoded@'ผลการวินิจฉัย',
		/td,
		/tr,
		tr,
		td( class='col1', align=center ),
		unencoded@ PlaceName,
		/td,
		/tr,
		/table,
		unencoded@ Script
	] ):-
	create_script( File, Nx, Ny, 5, false, false )~>Script.
	
hyperlinkPlace( PlaceID, PlaceName ):-
	write('<input type=radio name="place_id" value="'),write(PlaceID),write('">'),write( PlaceName ),write('<br>'),nl.



search_PlaceList( PlaceType, Name , List ):-
	number_atom( Type, PlaceType),
	findall( Link ,
		( 
		place( PlaceID, _, _, Type, PlaceName),
		sub_string( Name, PlaceName ),
		hyperlinkPlace( PlaceID, PlaceName )~> Link
		),
		List).
/*
search_PlaceList( PlaceType, Name , SubList ):-
	number_atom( Type, PlaceType),
	findall( [ PlaceID, PlaceName ] ,
		( 
		place( PlaceID, _, _, Type, PlaceName),
		sub_string( Name, PlaceName ),
		hyperlinkPlace( PlaceID, PlaceName )~> Link
		),
		List),
	%proweb_asserta( temp_place( List ) ),
	split( List, 10, SubList).

split( [], _, [] ).
split( [Elem| Src ], 0, [] ).
split( [Elem| Src ], Length, [Elem|List] ):-
	L is Length - 1,
	split( Src, L, List ).
*/
/**************************************
*		Draw  road	path		*
***************************************/

draw_place( PlaceID, Filename ):-
	tidy_draw,
	init_draw,			
	temp_file( Filename ),
	default_size( W, H , _, _ ),
	createMeta( Device ),
	gfx_begin( [Device] ),
	gfx( metafile( 0, 0, W, H, layer ) ),
	place( PlaceID, X, Y, _, PlaceName ),
	atom_string( PlaceName, Name ),
	draw_place( X, Y, Name ),
	gfx_end( [Device] ),
	saveMeta( Device ,Filename ),
	tidy_draw.



