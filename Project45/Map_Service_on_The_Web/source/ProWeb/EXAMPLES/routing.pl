/**************************************************************************************

						ROUTING

***************************************************************************************/

/**************
  routing form
***************/
proweb_form( routing_form, 
	[ 
		input( type=hidden, name='fn', value='show_routing' ),
		table( border='1', cellpadding='1', cellspacing='1', width='100%'),
		col( width=40 ),
		tr,
		td( class='headtable', align=center, colspan=2 ),
		unencoded@'ผลการวินิจฉัย',
		/td,
		/tr,
		tr,
		td( class='col1', align=center, colspan=2 ),
		unencoded@'จุดเริ่มต้น',
		/td,
		/tr,
		tr,
		td( class='col2' ),
		unencoded@'ละติจูด', 
		/td,
		td( class='foot' ),
		input( type=text, name='cox1', value='0', size='15'),
		/td,
		/tr,
		tr,
		td( class='col2' ),
		unencoded@'ลองติจูด', 
		/td,
		td( class='foot'),
		input( type=text, name='coy1', value='0', size='15' ),
		/td,
		/tr,
		tr,
		td( class='col1', align=center, colspan=2 ),
		unencoded@'จุดหมาย',
		/td,
		/tr,
		tr,
		td( class='col2' ),
		unencoded@'ละติจูด', 
		/td,
		td( class='foot' ),
		input( type=text, name='cox2', value='0', size='15' ),
		/td,
		/tr,
		tr,
		td( class='col2' ),
		unencoded@'ลองติจูด', 
		/td,
		td( class='foot' ),
		input( type=text, name='coy2', value='0', size='15' ),
		/td,
		/tr,
		tr,
		/table,
		br,
		center,
		input( type=submit, value='  Search  '),
		input( type=reset, value='  Reset  ', onclick='javascript:SetPos( true, true )' ),
		/center,
		unencoded@Script
		
	] ):-
	default_file( File ),
	default_size( _, _ , H2, W2 ),
	create_script( File, H2, W2, 1, true, true )~>Script.

/**********************
  show routing form
***********************/

proweb_form( show_routing_form( Filename, X1, Y1, X2, Y2, Distance ) , 
	[ 
		table( border='1', cellpadding='1', cellspacing='1', width='100%'),
		col( width='40' ),
		tr,
		td( class='headtable', align=center, colspan=2 ),
		unencoded@'ผลการวินิจฉัย',
		/td,
		/tr,
		tr,
		td( class='col1', align=center, colspan=2 ),
		unencoded@'จุดเริ่มต้น',
		/td,
		/tr,
		tr,
		td( class='col2' ),
		unencoded@'ละติจูด', 
		/td,
		td( class='foot' ),
		X1,
		/td,
		/tr,
		tr,
		td( class='col2' ),
		unencoded@'ลองติจูด', 
		/td,
		td( class='foot'),
		Y1,
		/td,
		/tr,
		tr,
		td( class='col1', align=center, colspan=2 ),
		unencoded@'จุดหมาย',
		/td,
		/tr,
		tr,
		td( class='col2' ),
		unencoded@'ละติจูด', 
		/td,
		td( class='foot' ),
		X2,
		/td,
		/tr,
		tr,
		td( class='col2' ),
		unencoded@'ลองติจูด', 
		/td,
		td( class='foot' ),
		Y2,
		/td,
		/tr,
		tr,
		td( class='col1',colspan='2',align='center' ),
		unencoded@'ระยะทาง',
		/td,
		/tr,
		tr,
		td( class='foot', colspan='2', align='center' ),
		Distance,
		/td,
		/tr,
		/table,
		unencoded@ Script
	] ):-
	default_size( _, _ , H2, W2 ),
	create_script( Filename, H2, W2, 1, false, false )~>Script.



/******************************************************************************
  routing( X1, Y1, X2, Y2, Solution, Distance ) 
	เป็น rule ที่ใช้หาเส้นทางจากจุดหนึ่งไปยังอีกจุดหนึ่ง

X1, Y1  => จุดเริ่มต้น
X2, Y2  => จุดสุดท้าย
Solution => ผลลัพท์เป็น List ของ PointID
Distance => ระยะทางทั้งหมดของระยะทาง

***********************/
routing( X1, Y1, X2, Y2, Solution, Total ):-
	nearest_PointID( X1, Y1, StartPointID, Dist1 ),
	nearest_PointID( X2, Y2, GoalPointID, Dist2 ),
	searchNode( StartPointID, GoalPointID, Solution, Dist ),
	Total is Dist + Dist1 + Dist2.


/********************************************
  nearest_PointID( X1, Y1, PointID, Dist )

********************************************/
nearest_PointID( X1, Y1, PointID, Dist ):-
	near_point( X1, Y1, none, 999999, PointID, Dist ).	

near_point( X1, Y1, OldID, OldDist, GoalID, GoalDist ):-
	(
		position( NewID, X2, Y2 ),
		dist_PointToPoint(  X1,Y1, X2, Y2, NewDist ),
		NewDist < OldDist,
		near_point( X1, Y1, NewID, NewDist, GoalID, GoalDist )
	;	OldID = GoalID,
		OldDist = GoalDist
	).

/**********************/
/*  A Star Serach      */
/**********************/
searchNode( PointID, PointID, [] , 0 ).
searchNode( StartPointID, GoalPointID, Solution, Distance ):-
      	astar_node( [ [ 0, 0, StartPointID ] ], Solution, GoalPointID, Distance ), 
	!.
searchNode( _, _, [] , 0).

astar_node( [ [ _, Distance, Goal|Path ] | _ ], [ Goal|Path ],  Goal, Distance ).
astar_node( [ Path|Paths ], Solution, GoalNode, Distance ) :-  
	extendNode( Path, NewPaths, GoalNode ),
	insertAll( NewPaths, Paths, Paths2 ),
	!,
	astar_node( Paths2, Solution, GoalNode, Distance ).


% Find next node for each path.

extendNode( [ F, G, ThisPointID|Path ], NewPaths, GoalPoinID ) :- 
	setof( 	[Fn, Gn, NewPointID, ThisPointID|Path],
			( 	
				linked( ThisPointID, NewPointID ),
				not member( NewPointID, [ ThisPointID|Path ] ),
				dist_PtIDToPtID( ThisPointID, NewPointID, Dist ),
				Gn is G+Dist, 
				%heuristicFn( NewPointID, GoalPoinID, H ), % Heuristic Funtion 
				dist_PtIDToPtID( NewPointID, GoalPoinID, H ),
				Fn is Gn+H
			),
			NewPaths ).

%path/3 in pw_demo.pl
linked( A, B ):-
	path( _, A, B );
	path( _, B, A ).

% position/3 and dist_PointToPoint/5 in pw_demo.pl
dist_PtIDToPtID( PtId1, PtId2, Dist ):-
	position( PtId1,  X1, Y1  ),
	position( PtId2,  X2, Y2  ),
	dist_PointToPoint(  X1,Y1, X2, Y2, Dist ),
	!.

% Heuristic Funtion 
%heuristicFn( PtId, PtId, 0 ).
heuristicFn( PtId1, PtId2, Dist ):-
	dist_PtIDToPtID( PtId1, PtId2, Dist ).
	%position( PtId1,  X1, Y1  ),
	%position( PtId2,  X2, Y2  ),
	%dist_PointToPoint(  X1,Y1, X2, Y2, Dist ).

% Sort Path
insertAll( [ ], Paths, Paths ).
insertAll( [ Path|Paths ], Paths2, Paths3 ) :-  
	insertOne( Path, Paths2 , Paths4 ),
	!,
	insertAll(Paths,Paths4,Paths3).

insertOne( Path, [ ], [ Path ] ).
insertOne( [ F|Path ], [ [ F2|Path2 ]|Paths ], [ [ F|Path ], [ F2|Path2 ]|Paths ] ):- 
	F < F2.% G < G2 ; true ).

insertOne( [ F|Path ], [ [ F2|Path2 ]|Paths ], [ [ F2|Path2 ]|Paths2 ] ):- 
	insertOne( [ F|Path ], Paths, Paths2).

/*************
  Draw  path		
**************/
	
draw_paths( Xs, Ys, Xg, Yg, [ PointID | Paths ], Filename ):-
	tidy_draw,
	init_draw,							
	temp_file( Filename ),			
	default_size( W, H , _, _ ),
	createMeta( Device ),
	gfx_begin( [Device] ),
	gfx( metafile( 0, 0, W, H, layer ) ),
	draw_place( Xs, Ys, `จุดเริ่มต้น` ),
	draw_place( Xg, Yg, `เป้าหมาย` ),
	convertX( Xg, Xgn ),
	convertY( Yg, Ygn ),
	position( PointID, X2, Y2 ),
	convertX( X2, X2n ),
	convertY( Y2, Y2n ),
	gfx( ( pen = blue -> polyline(  Xgn, Ygn, X2n,Y2n ) ) ),
	draw_paths( [ PointID | Paths ], Point ),
	convertX( Xs, Xsn ),
	convertY( Ys, Ysn ),
	position( Point, X1, Y1 ),
	convertX( X1, X1n ),
	convertY( Y1, Y1n ),
	gfx( ( pen = blue -> polyline(  Xsn, Ysn, X1n,Y1n ) ) ),
	gfx_end( [Device] ),
	saveMeta( Device ,Filename),
	tidy_draw.


draw_paths( [ Node ], Node ).
draw_paths( [ Node1, Node2|Nodes ], EndNode ) :-
	position( Node1, Xp1, Yp1 ), 
	convertX( Xp1, Xp1n ),
	convertY( Yp1, Yp1n ),
	position( Node2, Xp2, Yp2 ), 
	convertX( Xp2, Xp2n ),
	convertY( Yp2, Yp2n ),
	gfx( ( pen = blue -> polyline(  Xp1n,Yp1n,  Xp2n,Yp2n ) ) ),
	!,
	( 
		draw_paths( [Node2|Nodes], EndNode)
	;	true 
	).
	
draw_paths( _ , _ ).