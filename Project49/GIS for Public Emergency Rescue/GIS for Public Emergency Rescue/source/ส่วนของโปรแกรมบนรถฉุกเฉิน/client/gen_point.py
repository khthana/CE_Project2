

from gdal import ogr


i=0
last_id=0
id = 0

points = open('points.txt','w')
paths = open('paths.txt','w')

check_list = {}
#point_list = {}
path_list = {}

start = True
for filename in ('./map/road-cl-utm.tab',):
    ds = ogr.Open(filename)
    layer = ds.GetLayer(0)
    #print layer.GetExtent()
    feature = layer.GetNextFeature()
    while feature:
        geom = feature.GetGeometryRef()
        start = True
        for j in range(geom.GetPointCount()):
            x = round(geom.GetX(j),2)
            y = round(geom.GetY(j),2)

            if check_list.has_key((x,y)):
                last_id, id = id, check_list[(x,y)]    
            else:
                check_list[(x,y)] = i
                #point_list[i] = (x,y)
                last_id, id = id, i
                i += 1
                points.write("%(id)d, %(x).2f, %(y).2f\n"%locals())

            if start:
                start = False
            else:
                paths.write("%(last_id)d, %(id)d\n"%locals())
                #pass
                if not path_list.has_key(last_id):
                    path_list[last_id] = {id:1}
                else:
                    path_list[last_id][id] = 1

                if not path_list.has_key(id):
                    path_list[id] = {last_id:1}
                else:
                    path_list[id][last_id] = 1

            #fpt.write("%(i)d, %(x).2f, %(y).2f\n"%locals())
            
        feature = layer.GetNextFeature()
    #return i






	
	