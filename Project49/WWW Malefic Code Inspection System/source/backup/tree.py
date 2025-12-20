#!/usr/local/bin/python2.5

class Treenode:
	def __init__(self,index,data):
		self._leave = []
		self._data = data
		self._index = index

	def __str__(self):
		return str(self._data)

class Tree:
	def __init__(self):
		self._rootNode = []

	def insertNode( self, index, index1, data ):
		if self._rootNode == []:
			self._rootNode.append(Treenode(index,data))
		else:
			self.insertNodeHelper(self._rootNode,index,index1,data)

	def insertNodeHelper(self,inode,index,index1,data):
		for node in inode:
			if node._index == index1 : 
				node._leave.append(Treenode(index,data))
			else: self.insertNodeHelper(node._leave,index,index1,data)
	
	def CalTotal(self,pnode,inode):
		if inode != []:
			sumt = 0
			for node in inode:
				self.CalTotal(node,node._leave)
				try:
					sumt = sumt+node._data
				except TypeError:
					sumt = sumt+0
			pnode._data = ((2*pnode._data) + (sumt/len(inode))) / 3
	def Traversal( self, inode ):
		if inode != []:
			for node in inode:
				print node._index,node._data
				self.Traversal(node._leave)
#tree = Tree()
