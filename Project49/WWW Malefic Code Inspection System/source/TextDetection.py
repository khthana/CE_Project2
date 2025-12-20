#!/usr/local/bin/python2.5

import re
import urllib2
import sys

def DetectPool(htmlSource):
    i = 0
    poolword = 0
    index = 0
    index1 = 0
    pool = "^adulter$|(.*)amateurcouple(.*)|^anal$|^anilingus(.*)|^anus$|^ass$|(.*)bdsm(.*)|(.*)blowjob(.*)|^bondage$|^boob(s)?$|^boobie(s)?$|(.*)borrachas(.*)|(.*)bulldoglist(.*)|^busty$|^cam(s)?$|(.*)cfnm(.*)|^cock(s)?$|(.*)creampie(.*)|^cum$|^cumshot(s)?$|^cunt$|(.*)cybersex(.*)|(.*)cybersexual(.*)|^dildo(s)?$|(.*)femdom(.*)|(.*)fuck(.*)|(.*)handjob(.*)|(.*)hentai(.*)|(.*)interracial(.*)|(.*)maledom(.*)|(.*)malestripper(.*)|(.*)masturbat(.*)|^mature(.*)|(.*)milf(.*)|^nude(.*)|^nudism(.*)|(.*)nudistas(.*)|^nudity(.*)|^oral(.*)|(.*)orgasm(.*)|^pantie(.*)|(.*)penis(.*)|^piss(.*)|(.*)porn(.*)|(.*)pued(.*)|(.*)purecfnm(.*)|^puss(.*)|^putas(.*)|^rimjob(.*)|^rimming(.*)|(.*)rubias(.*)|(.*)shemale(.*)|(.*)tetazas(.*)|(.*)tgp(.*)|^tit(s)?$|(.*)titworld(.*)|(.*)upskirt(.*)|(.*)xnxx(.*)|(.*)xxx(.*)|(.*)yobt(.*)|(.*)ztod(.*)|(.*)gangbang(.*)|(.*)hardcore(.*)|^babe(s)?$|^amateur(s)?$|^DVDA$|^pussy$"
    a = pool.split("|")
    findmeta = re.findall("(<[\s]*meta[\s]+)([^>]+)(>)",htmlSource,re.I)
    if findmeta:
    	for i in findmeta:
        	if index<len(findmeta):
            		for j in findmeta[index]:
                		findd = re.findall("([^a-z0-9]*)([a-z0-9]+)([^a-z0-9]*)",j,re.I)
                		for k in findd:
                    			for m in range(len(a)):
                        			searchpool = re.findall(a[m],k[1],re.I)
						if searchpool:
							poolword = poolword+len(searchpool)
        	index = index+1

    findtitle = re.findall("(<[\s]*title[\s]*>)([^<]+)(<[\s]*/[\s]*title[\s]*>)",htmlSource,re.I)
    if findtitle:
    	for ii in findtitle:
        	if index1<len(findtitle):
            		for jj in findtitle[index1]:
                		findd1 = re.findall("([^a-z0-9]*)([a-z0-9]+)([^a-z0-9]*)",jj,re.I)
                		for kk in findd1:
                    			for mm in range(len(a)):
                        			searchpool1 = re.findall(a[mm],kk[1],re.I)
                        			if searchpool1:
							poolword = poolword+len(searchpool1)
        	index1 = index1+1
    return poolword

def imglink(htmlSource):
    numlinkimg = 0
    a = htmlSource.split("\n")
    imglink = '(<a[\s]+)([^>]*)([\s]*href[\s]*=[\s]*[\"]?)([^\">]+)([\"]?)([^>]*>)((.|\n)*)'
    img = '[\s]*(<img[\s]+)([^>]*)(src[\s]*=[\s]*[\"]?)([^\">]+)([^>]*>)((.|\n)*)'
    for i in a:
    	findimg = re.search(imglink,i,re.I)
    	if findimg:
		findimglink = re.search(img,findimg.group(7),re.I)
    		if findimglink:
			numlinkimg = numlinkimg+1
    		else:
			numlinkimg = 0
    	else:
		numlinkimg = 0
    return numlinkimg

def DetectText(htmlSource):
    result = []
    lenghtA = 0
    numoutlink = 0
    index = 0
    index1 = 0
    indexe = 0
    indexf = 0
    lenimg = 0
    lenimg1 = 0
    lenghtimg = 0
    numpool = 0
    numimg = 0
    numscript = 0
    nummeta = 0
    numalllink = 0
    numlinkimg = 0
    numlinktext = 0
    numinlink = 0
    numoutlink = 0
    numparam = 0

    ####### Image Tag ###############
    img = "<(\s)*img"
    find = re.findall(img,htmlSource,re.I)
    if find:
        numimg = len(find)
    else:
        numimg = 0

    ####### Meta Tag ################
    meta = "<(\s)*meta"
    find1 = re.findall(meta,htmlSource,re.I)
    if find1:
        nummeta = len(find1)
    else:
        nummeta = 0

    ####### Pool ###################
    a = DetectPool(htmlSource)
    if a != 0:
        numpool = a
    else:
        numpool = 0

    ########## Script Tag ###########
    script = "<(\s)*script"
    find2 = re.findall(script,htmlSource,re.I)
    if find2:
        numscript = len(find2)
    else:
        numscript = 0
 
    ########## All Link ############
    link = "<(\s)*a((\s)?)(.*)href"
    linkclose = "<(\s)*/(\s)*a(\s)*>"
    findlink = re.findall(linkclose,htmlSource,re.I)
    find4 = re.findall(link,htmlSource,re.I)
    lenghtL = len(find4)
    lenghtC = len(findlink)
    if find4:
        if lenghtC >= lenghtL:
            lenghtA = len(findlink)
            numalllink = lenghtA
        else:
            lenghtA = len(find4)
            numalllink = lenghtA
    else:
        numalllink = 0

    ######### Image Link ##############
    #linkimg = "<((\s)?)+a((\s)?)(.*)href(.*)>((\s)?)+<((\s)?)+img(.*)>((\s)?)+<((\s)?)+/((\s)?)+a((\s)?)+>"
    #linkimg1 = "((\s)?)+<((\s)?)+img(.*)>((\s)?)+<((\s)?)+/((\s)?)+a((\s)?)+>" 
    #find3 = re.findall(linkimg,htmlSource,re.I)
    #print 'xxx'
    #findimg = re.findall(linkimg1,htmlSource,re.I)
    #lenimg = len(findimg)
    #lenimg1 = len(find3)
    #for e in find3:
    #    if indexe<len(find3):
    #        for ee in find3[indexe]:
    #            closetage = "<((\s)?)+/((\s)?)+a((\s)?)+>"
    #            searchtage = re.findall(closetage,ee,re.I)
    #            lens1 = len(searchtage)
    #            if searchtage:
    #                lenimg1 = lenimg1+lens1
    #        indexe = indexe+1
    #print "ggg1"
    #for f in findimg:
    #    if indexf<len(findimg):
    #        for ff in findimg[indexf]:
    #            closetagef = "<((\s)?)+/((\s)?)+a((\s)?)+>"
    #            searchtagef = re.findall(closetagef,ff,re.I)
    #            lens = len(searchtagef)
    #            if searchtagef:
    #                lenimg = lenimg+lens
    #        indexf = indexf+1
    #print "ggg2"
    #if lenimg !=0 or lenimg1 !=0:
    #    if lenimg>lenimg1:
    #        lenghtimg = lenimg
    #        numlinkimg = lenghtimg
    #    else:
    #        lenghtimg = lenimg1
    #        numlinkimg = lenghtimg
    #else:
    #    numlinkimg = 0
#    numlinkimg = imglink(htmlSource)
######### Image Link ##################
    linkimg = "(<a[\s]+)([^>]*)([\s]*href[\s]*=[\s]*[\"]?)([^\">]+)([\"]?)([^>]*>)[\s]*(<img[\s]+)([^>]*)(src[\s]*=[\s]*[\"]?)([^\">]+)([^>]*>)"
    #linkimg = "<(\s)*a((\s)?)(.*)href(.*)>(\s)*<(\s)*img(.*)>(\s)*<(\s)*/(\s)*a(\s)*>"
    #linkimg = "<((\s)?)+a((\s)?)(.*)href"
    find3 = re.findall(linkimg,htmlSource,re.I)
    if find3:
	numlinkimg = len(find3)
#	print "numlinkimg"+str(numlinkimg)
    	for e in find3:
		if indexe<len(find3):
			for ee in find3[indexe]:
				closetage = "<((\s)?)+/((\s)?)+a((\s)?)+>"	
				searchtage = re.findall(closetage,ee,re.I)
				if searchtage:
					numlinkimg = numlinkimg+len(searchtage)
			indexe = indexe+1
    else:
	numlinkimg = 0

 #   print "numlink"+str(numlinkimg)
    ######### Text Link ##################
    linktext = numalllink-numlinkimg
    if linktext > 0:
        numlinktext = linktext
    else:
        numlinktext = 0

    ######### Outside Link ###############
    outlink = '(<a[\s]+)([^>]*)([\s]*href[\s]*=[\s]*[\"]?)([\s]*(http:\/\/))'
    find5 = re.findall(outlink,htmlSource,re.I)
    if find5:
        numoutlink = len(find5)
    for i in find5:
        if index<len(find5):
            for j in find5[index]:
                closetag = "<((\s)?)+/((\s)?)+a((\s)?)+>"
                searchtag = re.findall(closetag,j,re.I)
                if searchtag:
                    numoutlink = numoutlink+len(searchtag)
            index = index+1

    outlink1 = '(<a[\s]+)([^>]*)([\s]*href[\s]*=[\s]*[\"]?)([\s]*(https:\/\/))'
    find6 = re.findall(outlink1,htmlSource,re.I)
    if find6:
        numoutlink = numoutlink+len(find6)
    for m in find6:
        if index1<len(find6):
            for n in find6[index1]:
                closetag1 = "<((\s)?)+/((\s)?)+a((\s)?)+>"
                searchtag1 = re.findall(closetag1,n,re.I)
                if searchtag1:
                    numoutlink = numoutlink+len(searchtag1)
            index1 = index1+1

    if numoutlink > 0:
        numoutlink = numoutlink
    else:
        numoutlink = 0
 
    ######### Inside Link #############
    inlink = numalllink-numoutlink
    if inlink > 0:
        numinlink = inlink
    else:
        numinlink = 0

    ######### Param Tag ################3
    param = "<(\s)*param"
    find7 = re.findall(param,htmlSource,re.I)
    if find7:
        numparam = len(find7)
    else:
        numparam = 0

    result.append([numimg])
    result.append([nummeta])
    result.append([numpool])
    result.append([numscript])
    result.append([numalllink])
    result.append([numlinkimg])
    result.append([numlinktext])
    result.append([numoutlink])
    result.append([numinlink])
    result.append([numparam])
    result.append([numpool])
    result.append([numpool])
    return result

