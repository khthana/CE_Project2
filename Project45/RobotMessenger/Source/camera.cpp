
long resize(bool size){//0==160 x 120     1==320 x 240
	
	if(size) return SetVideoFormat(320,240,24,0);
	return  SetVideoFormat(160,120,24,0);
}

void snap(bool size,int &no){//0==160 x 120     1==320 x 240(number)
	
	CString filname;

	if(size) filename.format("C:\picture\path%d" ,no)
	else  filename.format("C:\picture\roomNo%d" ,no)
	return PictureToFile(24,24,filename,NULL);
}
//Don't forget to create folder "C:\picture"