
%proweb_form( show_road_list_form( List ) , [List]).
proweb_form( show_road_list_form( List ) , 
	[	
		table( border='1', cellpadding='0', cellspacing='0', width='100%'  ),
		tr,
		td( class='headtable', align=center ),
		unencoded@ 'ผลการวินิจฉัย',
		/td,
		/tr,
		tr,
		td( class='col1' ),
		unencoded@List,
		/td,
		/tr,
		/table,
		br,
		center,
		input( type=hidden, name='fn', value='show_road' ),
		input( type=submit, value='  Show  '),
		/center,
		unencoded@ Script		
	] ):-
	%hyperListRoad( List, Link ),
	default_file( File ),
	default_size( _, _ , H2, W2 ),
	create_script( File, H2, W2, 1, false, false )~>Script.

proweb_form( show_road_form( Filename, Roadname ) , 
	[ 
		table( border='1', cellpadding='0', cellspacing='0', width='100%'  ),
		tr,
		td( class='headtable', align=center ),
		unencoded@ 'ผลการวินิจฉัย',
		/td,
		/tr,
		tr,
		td( class='col1', align=center ),
		%unencoded@ 'ถนน',
		unencoded@ Roadname, 
		/td,
		/tr,
		/table,
		unencoded@ Script
	] ):-
	default_size( _, _ , H2, W2 ),
	create_script( Filename, H2, W2, 1, false, false )~>Script.
/*
hyperListRoad( [] , Link ):-
	write('no result. <br>')~> Link.
hyperListRoad( [ Elem ] ,Link ):-
	hyperlinkRoad( Elem )~> Link.
hyperListRoad( [ Elem | List ] ,Links ):-
	hyperlinkRoad( Elem )~> Link,
	hyperListRoad( List , OthersLink ),
	!,
	concat( Link, OthersLink, Links).
*/
hyperlinkRoad( RoadID,RoadName ):-
	write('<input type=radio name="road_id" value="'),write(RoadID),write('">'),write( RoadName ),write('<br>'),nl,!.







/**************************************
*	Search by Road Name		*
***************************************/
search_RoadList( Sub, List ):-
	findall( Link ,
		(
		road( RoadID, RoadName, _, _, _ ),
		sub_string( Sub, RoadName ),
		hyperlinkRoad( RoadID,RoadName )~> Link
		),
		List ).


/**************************************
*		Draw  road	path		*
***************************************/

draw_paths( Filename, RoadID ,ShowName ):-
	tidy_draw,
	init_draw,							%proweb_trace('Init'),
	temp_file( Filename ),
	default_size( W, H , _, _ ),
	createMeta( Device ),				%proweb_trace('Create'),
	gfx_begin( [Device] ),				%proweb_trace('Begin'),
	gfx( metafile( 0, 0, W, H, layer ) ),		%proweb_trace('Draw Layer'),
	road( RoadID, RoadName, _, Cx, Cy ),
	atom_string( RoadName, Name ),
	concat( 'ถนน', Name, Name1 ),
	atom_string( Name1, ShowName ),
	convertX( Cx, Cnx ),
	convertY( Cy, Cny ),
	gfx( ( fore=black,font = ms_sans_serif_10 -> text( Cnx, Cny, ShowName) ) ),
	draw_road( RoadID ),
	%draw_route( Paths ), 
	gfx_end( [Device] ),					%proweb_trace('End'),
	saveMeta( Device ,Filename),		%proweb_trace('Save'),
	tidy_draw.	

draw_road( RoadID ):-
	forall(	(
			pathroad( PathId, P1, P2, RoadID ),
			position( P1, Xo1, Yo1 ),
			position( P2, Xo2, Yo2 ),
			convertX( Xo1, X1 ),
			convertX( Xo2, X2 ),
			convertY( Yo1, Y1 ),
			convertY( Yo2, Y2 ) 
			),
		gfx( ( pen=blue ->polyline( X1, Y1, X2, Y2 ) ) ) 
		).

