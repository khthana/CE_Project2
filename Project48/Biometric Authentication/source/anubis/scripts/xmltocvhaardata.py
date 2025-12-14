#!/usr/bin/python

import string
import xml.sax
from xml.sax.handler import *
import sys
import Image

class AnubisXMLHandler(ContentHandler):
    def __init__(self, input_image_dir, partsnames, width, height):
        self.input_image_dir= input_image_dir
        self.partsnames= partsnames
        self.width= width
        self.height= height
        self.image_fnames= []
        self.parts_boxes= []
        self.char= ""
        self.data= []

            
        parts_pairs= []
        if partsnames:
            for i in range (len(partsnames) / 2):
                parts_pairs.append((partsnames[i*2], partsnames[i*2 + 1]))

        self.parts_pairs= parts_pairs

    def startElement(self, name, attrs):
        if name == 'Template':
            self.image_fname= attrs["fg_image_fname"]
            self.parts_pairs_co= []
            for i in range (len(self.parts_pairs)):
                self.parts_pairs_co.append([None,None]) # parts_pairs_co= [[xy,xy],[xy,xy]...]

            self.parts_boxes.append({})
            self.parts_boxes[-1]['fname']= attrs["fg_image_fname"]

        if name == 'Cells':
            i= 0
            for pair in self.parts_pairs:
                j= 0
                for partsname in pair:
                    if attrs["parts"] == partsname:
                        x= int( string.atof(attrs["x"]) )
                        y= int( string.atof(attrs["y"]) )
                        self.parts_pairs_co[i][j]= (x, y)
                    j+= 1
                i+= 1
        return

    def parts_pair_center(self, parts_pair):
        """
        @parts_pair: [xy, xy]  #e.g left_eye_l_edge, right_eye_r_edge
        """
        center= (((parts_pair[0][0] + parts_pair[1][0]) / 2),
                 ((parts_pair[0][1] + parts_pair[1][1]) / 2))
        return center

    def endElement(self,name):
        if name == 'Template':
            co_num= 0
            co_string= ""
            #coordinate data formating to self.data
            #pair_co = [xy, xy]
            for parts_pair in self.parts_pairs_co:
                if parts_pair[0] and parts_pair[1]:
                    center= self.parts_pair_center(parts_pair)
                    x0= center[0] - self.width / 2
                    y0= center[1] - self.height / 2
                    co_string= "%s %s %s %s %s" % (co_string, x0, y0, self.width, self.height)
                    co_num+= 1

            fname= "%s/%s" % (self.input_image_dir, self.image_fname)
            str= "%s %s%s" % (fname, co_num, co_string)
            self.data.append(str)

    def output_data(self):
        for i in self.data:
            sys.stdout.write("%s\n" % i)

class AnubisBGImageHandler(AnubisXMLHandler):
    def __init__(self, input_image_dir= "./", partsnames= None, \
                 width= 50, height= 50, bg_image_output_dir= "./", offset_xy= (0,0)):
        AnubisXMLHandler.__init__(self, input_image_dir, partsnames, width, height)
        self.bgImageFnameAndBox = []
        self.bg_image_output_dir= bg_image_output_dir
        self.offset_xy= offset_xy
        
    def startElement(self, name, attrs):
        AnubisXMLHandler.startElement(self, name, attrs)
        
    def endElement(self, name):
        if name == 'Template':
            bgImageFnameAndBox={}
            co_num= 0
            co_string= ""
            #coordinate data formating to self.data
            #pair_co = [xy, xy]
            parts_boxes= []
            for parts_pair in self.parts_pairs_co:
                if parts_pair[0] and parts_pair[1]:
                    center= self.parts_pair_center(parts_pair)
                    center= (center[0] + self.offset_xy[0], center[1] + self.offset_xy[1])
                    
                    x0= center[0] - self.width / 2 
                    y0= center[1] - self.height / 2 
                    x1= x0 + self.width
                    y1= y0 + self.height
                    parts_boxes.append((x0, y0, x1, y1))
                    co_num+= 1
            fname= "%s/%s" % (self.input_image_dir, self.image_fname)
            bgImageFnameAndBox['image_fname']= fname
            bgImageFnameAndBox['boxes']= parts_boxes
            self.data.append(bgImageFnameAndBox)
            return
        
    def output_data(self):
        count= 0
        for fname_and_box in self.data:
            fname= fname_and_box['image_fname']
            im= Image.open(fname)
            for box in fname_and_box['boxes']:
                bg_im= im.crop(box)
                fname= "%s/bg_image%.6d.jpg" % (self.bg_image_output_dir, count)
                print fname
                bg_im.save(fname)
                count+= 1
    

class AnubisBGRandImageHandler (AnubisXMLHandler):
    def __init__(self, input_image_dir= "./", partsnames= None, \
                 width= 50, height= 50, bg_image_output_dir= "./", bg_image_num_from_onefile= 1):
        AnubisXMLHandler.__init__(self,input_image_dir, partsnames, width, height)

        self.bgImageFnameAndBox       = []
        self.bg_image_output_dir      = bg_image_output_dir
        self.bg_image_num_from_onefile= bg_image_num_from_onefile
        self.parts_boxes= []

    def startElement (self, name, attrs):
        AnubisXMLHandler.startElement(self, name, attrs)
        if name == 'Template':
            try:
                attrs['face_rect']
            except KeyError:
                self.face_box= None
                return

            self.parts_boxes.append({})
            self.parts_boxes[-1]['fname']= attrs["fg_image_fname"]
            
            face_rect= [None] * 4
            tmp= string.split(attrs['face_rect'])
            i= 0;
            for val_str in tmp:
                face_rect[i]= int(val_str)
                i+= 1
            self.face_box= [face_rect[0], face_rect[1],\
                            face_rect[0] + face_rect[2], face_rect[1] + face_rect[3]]
    def create_box (self, center, width, height):
        x0= center[0] - width / 2
        y0= center[1] - height / 2
        x1= center[0] + width / 2
        y1= center[1] + height / 2

        return (x0,y0,x1,y1)
    
    def endElement (self, name):
        AnubisXMLHandler.endElement(self,name)
        if name == 'Template':
            boxes= []
            for parts_pair in self.parts_pairs_co:
                if self.face_box and parts_pair[0] and parts_pair[1]:
                    center= self.parts_pair_center(parts_pair)
                    boxes.append(self.create_box(center, self.width, self.height))
            self.parts_boxes[-1]['box']= boxes

            if len(boxes):
                for i in range (self.bg_image_num_from_onefile):
                    box= None
                    fname= "%s/%s" % (self.input_image_dir, self.image_fname)
                    im= Image.open(fname)
                    while(not box):
                        box= self.__randCropBoxWithNegBox(self.face_box, boxes, \
                                                          self.width, self.height, im.size)
                        
                    
                    self.bgImageFnameAndBox.append({'image_fname': fname, 'box': box})
        return
    def __randCropBoxWithNegBox(self, face_box, neg_boxes, width, height, image_size):
        """
        chose random box from source_box which not overlap neg_box
        """
        #huristic
        x0= face_box[0] - int(width * 0.2)
        x1= face_box[2] + int(width * 0.2)
        y0= face_box[1] - int(height)
        y1= face_box[3] + int(height * 0.2)

        x_range= range(x0, x1)
        y_range= range(y0, y1)

        #x_range= (face_box[0], face_box[2])
        #y_range= (face_box[1], face_box[3])

        import random
        x= random.choice(x_range)
        y= random.choice(y_range)
        center= (x,y)

        def is_negative (box, xy, w= 0, h= 0):
            """
            @box: negative box
            @xy:  check coordinate
            @w: box in xy arrowed width
            """
            return ((xy[0] > box[0] + w) and (xy[0] < box[2] - w) and \
                    (xy[1] > box[1] + h) and (xy[1] < box[3] - h))
                
        # huristic
        w= int(width * 0.2)
        h= int(height * 0.2)

        for box in neg_boxes:
            if is_negative(box, center, w, h): 
                return None

        x0= center[0] - width / 2
        y0= center[1] - height / 2
        x1= x0 + width
        y1= y0 + height

        if x0 < 0 or y0 < 0 or x1 > image_size[0] or y1 > image_size[1]:
            return None

        return (x0,y0,x1,y1)

    def output_data(self):
        count= 0
        for fname_and_box in self.bgImageFnameAndBox:
            fname= fname_and_box['image_fname']
            im= Image.open(fname)
            bg_im= im.crop(fname_and_box['box'])
            fname= "%s/bg_image%.6d.jpg" % (self.bg_image_output_dir, count)
            print fname
            bg_im.save(fname)
            count+= 1

    
if __name__ == '__main__':
    import sys, glob, operator, getopt

    def usage_and_exit():
        print "-?, --help\n\t show this message \n",\
              "-f, --xmlfilename= xmlfilename\n\t xmlfilename which include face vert data\n",\
              "-i, --input_image_dir= input_image_directory_name\n",\
              "\tdirectory name which exist input image\n",\
              "-p, --partsnames=\"leftparts1 rightperts1, leftperts2,...\"\n",\
              "\t set face parts names which generate or not generate images\n",\
              "-w, --width= num\n\t set width\n",\
              "-h, --height= num\n\t set height\n",\
              "-d, --bg_image_output_dir= dirname\n\t set bgimage (XXXXX.jpg) output dir\n",\
              "-n, --bg_image_num_from_onefile= num\n\t set bgimage num from one file (with -r option)\n",\
              "--xoffset= num\n\t set xoffset width (with -b option)\n",\
              "--yoffset= num\n\t set yoffset height (with -b option)\n",\
              "-b\n\t generate bgimage\n",\
              "-r\n\t generate random selection image (with -b option)\n",\
              "-ex\n\t show example"
        
        sys.exit(0)

    def show_example_and_exit():
        print "xmltocvhaardata.py example (written 2005/12/06)"
        print "generate positive eye image info file\n",\
              "\t$ xmltocvhaardata.py -f ./img/vertdata.xml -i ./img \\\n",\
              "\t-p \"left_eye_l_edge left_eye_r_edge right_eye_l_edge right_eye_r_edge\"\\\n",\
              "\t-w 25 -h 25\\\n",\
              "\t> eyeinfo.dat"
        
        print "generate negative random image and info file of eye (not include eye image)\n",\
              "\t$ xmltocvhaardata.py -f ./img/vertdata.xml -i ./img \\\n",\
              "\t-p \"left_eye_l_edge left_eye_r_edge right_eye_l_edge right_eye_r_edge\"\\\n",\
              "\t-b -r -d ./eye_bgimg -w 50 -h 50 -n 3 > eye_bg_info.dat"
        print "generate eye image as negative\n",\
              "\t$ xmltocvhaardata.py -f ./img/vertdata.xml -i ./img \\\n",\
              "\t-p \"left_eye_l_edge left_eye_r_edge right_eye_l_edge right_eye_r_edge\"\\\n",\
              "\t-b -d ./eye_bgimg -w 50 -h 50 > eye_as_bg_info.dat"

        print "\nnow anubis has forrow face parts attributes\n",\
              "\tl_eyebrow_l_edge, l_eyebrow_r_edge, r_eyebrow_l_edge, r_eyebrow_r_edge,"\
              "left_eye_l_edge, left_eye_r_edge, right_eye_l_edge, right_eye_r_edge,"\
              "nose_l_edge, nose_r_edge, mouse_left_edge, mouse_right_edge"
        
        
        sys.exit(0)

        
    try:
        opts, args = getopt.getopt(sys.argv[1:], "?:f:i:p:w:h:brd:n:", \
                                   ["help","xmlfilename=","input_image_dir=",\
                                    "partsnames="\
                                    "width=", "height=", "bgimage", "random",\
                                    "bg_image_output_dir=", "bg_image_num_from_onefile=",\
                                    "xoffset=", "yoffset=", "ex"])
        pass
    except getopt.GetoptError:
        usage_and_exit()

    fname= partsnames= bg_image= bg_random= None
    input_image_dir    = "./"
    bg_image_output_dir= "./"
    bg_image_num_from_onefile= 1
    width= 25
    height= 25
    xoffset= yoffset= 0

    for (k, v) in opts:
        if   k in ("-?", "--help") : usage_and_exit()
        elif k in ("-f", "--xmlfilename")     : fname= v
        elif k in ("-i", "--input_image_dir") : input_image_dir= v
        elif k in ("-p", "--partsnames")      : partsnames= v
        elif k in ("-w", "--width")  : width= string.atoi(v)
        elif k in ("-h", "--height") : height= string.atoi(v)
        elif k in ("-d", "--bg_image_output_dir")       : bg_image_output_dir= v
        elif k in ("-n", "--bg_image_num_from_onefile" ): bg_image_num_from_onefile= int(v)
        elif k == "--xoffset" : xoffset= int(v)
        elif k == "--yoffset" : yoffset= int(v)
        elif k == "-b" : bg_image= True
        elif k == "-r" : bg_random= True
        elif k == "--ex" : show_example_and_exit()
        
    if partsnames:
        partsnames= string.split(partsnames)
        if (len(partsnames) % 2):
            sys.exit(8)

        
    parser= xml.sax.make_parser()
    
    if bg_image:
        if bg_random:
            handler= AnubisBGRandImageHandler(input_image_dir, partsnames, width, height,\
                                             bg_image_output_dir, bg_image_num_from_onefile)
        else:
            offset_xy= (xoffset, yoffset);
            handler= AnubisBGImageHandler(input_image_dir, partsnames, width, height,\
                                         bg_image_output_dir, offset_xy)
    else:
        handler= AnubisXMLHandler(input_image_dir, partsnames, width, height)

    parser.setContentHandler(handler)
    parser.parse(fname)
    handler.output_data()

