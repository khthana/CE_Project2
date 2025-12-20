# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#  										      #
#  World Wide Web malefic code inspection system.                                     #
#  **** CalWeight Pocess ****                                                         #
#  Programer : Paktoon Jaithong & Pichanee Tassanasatien                              #
#  King Mongkut's Institute of Technology Ladkrabang				      #
#  Interface : Command Line Interface                                                 #
#  connect to Web server : urllib2 & Htmllib                                          #
#  Save links in page : Database MySQL                                                #
#  program OK successful                                                              #
#  Require AccessDB1.py, tree.py			                              #
#  Combine with porn_web.py							      #
#                                                                                     #
#  Ctrl-C to stop program                                                             ##                        							      #
#                                                                                     #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#!/usr/local/bin/python2.5

from AccessDB1 import AccessDB
from tree import Tree
import time

# function to create TREE
def totalWeight(URLlist,index,link_list):

	# create Database object
	DB = AccessDB()

	# find list of ID that is child of root
	row = DB.findlist('select ID from ALLURL where URL_ID = %d and DATE_TIME is not NULL and URL_TIMESTAMP is not NULL'%URLlist[index])

	# close Database object
	DB.close()

	# if return row 
	if row:
		templist = []
		DB = AccessDB()
		for i in range(len(row)):
			for j in range(len(row[0])):

				# each ID check 3 condition
				# condition 1 : page has image and detected already
				# condition 2 : page has image but not detected yet
				# condition 3 : page doesn't have image

				# number of image in page
				emp1 = DB.findj('select count(*) from HAS where PAGE_ID = %d'%row[i][j])
				# TEXT_WEIGHT of page
				data1 = DB.findj('select TEXT_WEIGHT from ALLURL where ID = %d'%row[i][j])
				if not(data1):
					data1 = 0
				# check condition 3
				if emp1:

					# have image
					# number of image that had detected
					emp2 = DB.findj('select count(*) from IMAGE a, HAS b where b.PAGE_ID = %d and a.DATE_TIME is NULL and a.ID = b.IMAGE_ID'%row[i][j])
					
					# check condition 1 and 2
					if emp1 != emp2:

						# condition 1 find avg
						data2 = DB.findj('select avg(a.IMAGE_WEIGHT) from IMAGE a,HAS b where b.PAGE_ID = %d and a.ID = b.IMAGE_ID'%row[i][j])
						# Image can't access
						if not(data2):
							data2 = 0

						# text:image = 3:7
						data = ((3*data1)+(7*data2))/10
						
						# insert node to TREE
						link_list.insertNode(row[i][j],URLlist[index],data)
						templist.append(row[i][j])
					else: 
						# condition 2 image but not detected yet
						data = (3*data1)/10

						# insert node to TREE
						link_list.insertNode(row[i][j],URLlist[index],data)
						templist.append(row[i][j])

				# doesn't have image
				else:

					#image = None
					data = data1

					# insert node to TREE
					link_list.insertNode(row[i][j],URLlist[index],data)
					templist.append(row[i][j])
		DB.close()

		#Call recursive function
		for k in range(len(templist)):
			totalWeight(templist,k,link_list)
	else : 
		#base case
		del DB
		return
		
# Function to find root node
def totalHelp(startID):

	#Create TREE object
	link_list = Tree()
	DB = AccessDB()

	#check 3 condition
	emp1 = DB.findj('select count(*) from HAS where PAGE_ID = %s'%startID)
	data1 = DB.findj('select TEXT_WEIGHT from ALLURL where ID = %s'%startID)
	if not(data1):
		data1 = 0
        if emp1:
            emp2 = DB.findj('select count(*) from IMAGE a, HAS b where b.PAGE_ID = %s and a.DATE_TIME is NULL and a.ID = b.IMAGE_ID'%startID)
            if emp1 != emp2:
                data2 = DB.findj('select avg(a.IMAGE_WEIGHT) from IMAGE a,HAS b where b.PAGE_ID = %s and a.ID = b.IMAGE_ID'%startID)
                if not(data2):
                        data2 = 0
                data = ((3*data1)+(7*data2))/10
                link_list.insertNode(int(startID),0,data)
            else:
                data = (3*data1)/10
                link_list.insertNode(int(startID),0,data)
        else:
            #image = None
            data = data1
            link_list.insertNode(int(startID),0,data)

	DB.close()
	del DB

	#Call totalWeight with root node
	totalWeight([int(startID)],0,link_list)

	#print "start :"+time.ctime()
	#Call function CallTotal find Total_weight from tree
	link_list.CalTotal(link_list._rootNode[0],link_list._rootNode)
	#print "############"
	link_list.Traversal(link_list._rootNode)
	child=link_list._child
	#print "############"
	#print link_list._rootNode[0]._index,link_list._rootNode[0]._data
	cmd = link_list._rootNode[0]._data
	#print "finish :"+time.ctime()
	del link_list
	return cmd,child

def main():
	
	# Test function
	startID = raw_input("Your first ID id :")
	cmd = totalHelp(startID)

if __name__ == "__main__":
   	main()
