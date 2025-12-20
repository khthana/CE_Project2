	
  //process(img);
	
  FImgProc falcon;
  CImgProc Cimgproc;

//  int hImg;//[IMAGE_COUNT];
  FImage Images[3];//[IMAGE_COUNT];
  F_RGBRANGE range;
  FILE *file = fopen( "dd.dat" , "wt" );

  range.red_min = 20;
  range.red_max = 255;
  range.green_min = 0;
  range.green_max = 100;
  range.blue_min = 0;
  range.blue_max = 100;

  F_BLOB tmpblob;
  int cc = 0;
  int *size = new int [100];
  CPoint topleft[100];
  CPoint botright[100]; ////

  char *filename = "test_1.bmp";

  IplImage *img = cvLoadImage( filename , 1);
 // IplImage *double_g  = cvCloneImage( img );
  //IplImage *thres = cvCreateImage( cvGetSize(img), 8, 1 );
  //IplImage *gray__ = cvCreateImage( cvGetSize(img), 8, 1 );
  //IplImage *thresrgb = cvCreateImage( cvGetSize(img), 8, 3 );

  //cvCvtColor( img, gray__, CV_RGB2GRAY );
  //cvNamedWindow( "A" , CV_WINDOW_AUTOSIZE );
  //cvShowImage( "A", gray__ );
  //cvThreshold(gray__ , thres , 215 , 255 , CV_THRESH_BINARY_INV);//CV_ADAPTIVE_THRESH_GAUSSIAN_C , CV_THRESH_BINARY , 21 , 0);
  //cvCvtColor( thres , thresrgb , CV_GRAY2RGB );

  unsigned char *_data  = reinterpret_cast<unsigned char *>(img->imageData);
  CImg source((TBCOLOR *)_data, &CSize(img->width, img->height));  
  CImg tt((TBCOLOR *)_data, &CSize(img->width, img->height));

  Cimgproc.Rgb2Gray(&tt,&tt);
  Images[0].Create((F_PIXEL*)tt.m_pImgDat, tt.GetWidth() , tt.GetHeight() );
  Images[1].Create((F_PIXEL*)tt.m_pImgDat, tt.GetWidth() , tt.GetHeight() );

  falcon.Threshold(Images[0], Images[1], 215 );
  CImg dst((TBCOLOR *)Images[1].m_data , &CSize( Images[1].m_width , Images[1].m_height ));
  Cimgproc.binRemoveSalt(&dst,&dst);

  Images[2].Create((F_PIXEL*)dst.m_pImgDat , dst.GetWidth() , dst.GetHeight() );
  falcon.PutFloodfillBorder(Images[2]);
  falcon.AnalyseBlob(Images[2]);
  falcon.BlobMoveFirst();
  while (falcon.BlobGetNext(tmpblob))
  {
		size[cc] = tmpblob.size;
		if(size[cc] >= 10)
		{
			topleft[cc] = CPoint( tmpblob.xmin ,  Images[2].m_height - tmpblob.ymin - 1);
			botright[cc] = CPoint( tmpblob.xmax , Images[2].m_height - tmpblob.ymax - 1);	    
			fprintf( file , " %d %d %d %d %d %d \n " ,size[cc],cc,topleft[cc].x,topleft[cc].y,botright[cc].x,botright[cc].y);
			cc++;
		}
  }

  for(int i = 0 ; i < cc ; i++) 
  {
		source.PutMark(&topleft[i],&botright[i],TBCOLOR(0,255,0));
  }
  unsigned char *data__1 = reinterpret_cast<unsigned char *>(source.m_pImgDat);
  //img->imageData = (char *)data__1;
  IplImage *onlytest = cvCreateImage( cvSize( source.GetWidth() , source.GetHeight() ) , 8 , 3);
  onlytest->imageData = (char *)data__1;

  cvNamedWindow( "After" , CV_WINDOW_AUTOSIZE );
  cvShowImage( "After", onlytest );
    			
//	PtQCol1.Add(&CPoint((tmpblob.xmin + tmpblob.xmax) / 2, Video->GetHeight() - ((tmpblob.ymin + tmpblob.ymax) / 2) - 1));
//  if (PtQCol1.GetAverage(&ptTmp)) pFd->SetBallPoint(ptTmp , 0);

  IplImage *blur = cvCloneImage( img );
    cvSmooth( blur, blur );
    IplImage *small_blur = cvCreateImage( cvSize(blur->width/2,blur->height/2), 8, 3 );
    cvResize( blur, small_blur );
    ///cvResize( small_blur, blur );
  IplImage *gray = cvCreateImage( cvGetSize(img), 8, 1 );
  IplImage *gray_small = cvCreateImage( cvGetSize(small_blur) , 8 , 1 );

  //////IplImage *double_s = cvCreateImage( cvSize(img->width/2,img->height/2), 8, 1 ); 
  //cvResize( double_g , double_s , CV_INTER_NN );
  //cvResize( img_t1 , img_1 );

  cvCvtColor( img, gray, CV_RGB2GRAY );
  cvCvtColor( small_blur , gray_small , CV_RGB2GRAY );

  //cvSmooth( gray , gray );
  //cvSmooth( gray_small , gray_small );

  cvNamedWindow( "Image N13" , CV_WINDOW_AUTOSIZE );
  cvShowImage( "Image N13", gray );
    
  cvNamedWindow( "Image" , CV_WINDOW_AUTOSIZE );
  cvShowImage( "Image", small_blur );

  cvNamedWindow( "Image__" , CV_WINDOW_AUTOSIZE );
  cvShowImage( "Image__", gray_small );

  unsigned char *gray_data  = reinterpret_cast<unsigned char *>(gray->imageData);
  unsigned char *aa = new unsigned char [9];
  unsigned char temp;

  int hei = gray->height;
  int wid = gray->width;
  int step = gray->widthStep;
  int count = 0;
  int flag = 0;
  for( int r = 0 ; r < hei ; r++ )
  {
      for( int c = 0 ; c < wid ; c++ )
      {
		  if( (r > 0) && (c > 0) && (r < (hei-1)) && (c < (wid-1)) )
		  {
			   if(flag == 0)
			   {
					for( int ii = -1 ; ii < 2 ; ii++)
					{
						for( int jj = -1 ; jj < 2 ; jj++)
						{ 
							aa[count] = gray_data[((r + ii) * step) + (c + jj)];
							printf(" %d ",aa[count]);
							count++;
						}
						printf(" \n ");
					}
					flag = 1;
			   }
			   count = 0;
		  }
	  }
  }
//  temp = gray_data[(90 * step) + 90];
//  printf("\n\n\n\n %d ",temp);
  printf("Number of channel is %d",gray->nChannels);
  printf("Number of channel is %d",small_blur->nChannels);
  printf("Number of channel is %d",gray_small->nChannels);
  fclose(file);
//  cvWaitKey(-1);

