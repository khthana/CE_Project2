


import math

def makefile(point_file, sql_file, delta=0):
	
    fpt = open(point_file)
    lines = fpt.readlines()
    busstop = {}
    min_dist = 99999
    max_dist = 0
    last_id = -1
    for line in lines:
        if line:
            id, x, y = line.split(',')
            id = int(id)
            x = float(x)
            y = float(y)
            #dist = -1
            #last_id = -1
            if last_id >= 0:
                lx, ly, dist, lb = busstop[last_id]
                dist = math.hypot( x-lx, y-ly)
                busstop[last_id][2] = dist
                busstop[last_id][3] = id
                min_dist = min( min_dist, dist)
                max_dist = max( max_dist, dist)
                busstop[id] = [x, y, -1, -1]
            else:
                busstop[id] = [x, y, -1, -1]
            last_id = id

    lx, ly, dist, lb = busstop[89] 
    x, y, dist, lb = busstop[0]
    dist = math.hypot( x-lx, y-ly)

    #print last_id
    busstop[89][2] = dist
    busstop[89][3] = 0
    del busstop[90]
    print min_dist, max_dist
    print busstop


    fout = open(sql_file,'w')
    for k in busstop.keys():
        x, y, dist, next = busstop[k]
        k += delta
        next += delta
        fout.write("INSERT INTO busstop( bsid, point, distance, next_bsid) VALUES( %(k)d, GeometryFromText('POINT( %(x)f %(y)f)', 32647), %(dist)f, %(next)d );\n"%locals())
        
makefile('temp-mon.txt', 'bus-mon.sql', 0)
makefile('temp-sun.txt', 'bus-sun.sql', 100)