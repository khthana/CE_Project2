#include <iostream>
#include <stdlib.h>
#include <string>
#include <cstring>
#include <stdio.h>
#include <time.h>

#include "MATRIX.h"
#include "RIFF.h"
#include "WAVE.h"
#include "FFT.h"	
#include "PROCESS.h"
#include "NEURAL.h"

#ifndef _NO_NAMESPACE
using namespace math;
#endif
#ifndef _NO_TEMPLATE
typedef matrix<double> Matrix;
#else
typedef matrix Matrix;
#endif

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

//--------------------------------------MAIN-----------------------------------

void main(void){

	int Rows = 1;

	if (Rows > 0)
	{		
		// Find Maximum length of all wave;

		long		MaxLengthWave = 0;
		char*		NameofWave;
		WaveFile	myWave;
		bool		Res;

		//char		wavename[256];

		bool AreAllWaveCompleted = true;

	//	printf("Name of Wave = ");
	//	scanf("%s",wavename);

	//	sprintf(NameofWave,"%s.wav",wavename);

		for (int p=0;p<Rows;p++){	
			NameofWave = "wavetest.wav";

	//		sprintf(NameofWave,"%s.wav",wavename);

			Res = myWave.OpenRead(NameofWave);
			AreAllWaveCompleted = AreAllWaveCompleted && Res;

			if (MaxLengthWave < myWave.GetNumSamples()){
				MaxLengthWave = myWave.GetNumSamples();
			}

			myWave.Close();
		}

		if (!AreAllWaveCompleted){
			cout << "Some voices not completely...\nYour trainning might not right !","Warnning";
		}
		else{		//if All wave completely

			Matrix matrix_AllWave(MaxLengthWave,Rows);					//
			
			for (int c=0;c<Rows;c++){	// Rows = Commands
				NameofWave = "wavetest.wav";
			//	sprintf(NameofWave,"%s.wav",wavename);

				myWave.OpenRead(NameofWave);
				double m_sample;
				double zero = 0.0001;

				for (int s=0; s<MaxLengthWave; s++){					//
					if (s<myWave.GetNumSamples()){
						myWave.ReadSample(m_sample);
						matrix_AllWave(s,c) = m_sample;
					}
					else {
						matrix_AllWave(s,c) = zero;
					}
				}			

				myWave.Close();
				
			}

			//--------------------------- save wave ---------------------------

			stream = fopen( "sound_wave.txt", "w+" );
   
			if( stream == NULL )printf( "The file fscanf.out was not opened\n" );
			else{
				for (int a=0;a<matrix_AllWave.RowNo();a++){
					for(int b=0;b<matrix_AllWave.ColNo();b++){
						fprintf( stream, "%f", matrix_AllWave(a,b));
						fprintf( stream, "%s","\t");
					}
					fprintf( stream, "%s","\n");
				}
				fclose( stream );
			}

			//**************************
			cout << "Start Recording sound... \n";
			cout << "     Length of Sound            = " << MaxLengthWave << " Hz\n";
			cout << "End Recording sound !! \n\n";
			//**************************

			//-----------------------------------------------------------------

			PROCESS RecognitionModule;

			Matrix temp(10000,1);
			Matrix matrix_input(38,17);

			//----------------------- PRE-PROCESSCING -------------------------

			cout << "Start Pre - Processing... \n";

			temp = RecognitionModule.ENDPOINT(matrix_AllWave);

			cout << "End Pre - Processing !! \n\n";

			//--------------------- save Endpoint Wave ------------------------

			stream = fopen( "Endpoint.txt", "w+" );
   
			if( stream == NULL )printf( "The file fscanf.out was not opened\n" );
			else{
				for (int a=0;a<temp.RowNo();a++){
					for(int b=0;b<temp.ColNo();b++){
						fprintf( stream, "%f", temp(a,b));
						fprintf( stream, "%s","\t");
					}
					fprintf( stream, "%s","\n");
				}
				fclose( stream );
			}

			//-----------------------------------------------------------------

			//-------------------------- EXTRACTION ---------------------------

			cout << "Start Feature Extraction... \n";

			matrix_input = RecognitionModule.EXTRACT(temp,10000,Rows);

			cout << "End Feature Extraction !! \n\n";

			//-----------------------------------------------------------------

			//------------------------- save Ceptrum --------------------------

			stream = fopen( "Ceptrum.txt", "w+" );
   
			if( stream == NULL )printf( "The file fscanf.out was not opened\n" );
			else{
				for (int a=0;a<matrix_input.RowNo();a++){
					for(int b=0;b<matrix_input.ColNo();b++){
						fprintf( stream, "%f", matrix_input(a,b));
						fprintf( stream, "%s","\t");
					}
					fprintf( stream, "%s","\n");
				}
				fclose( stream );
			}

			//-----------------------------------------------------------------

			//------------------------- RECOGNITION ---------------------------

				RECOGNITION(matrix_input);

			//-----------------------------------------------------------------

		}
	}

}
