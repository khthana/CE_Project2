/////////////////////////////////////////////////////////////////////////////
//
//	Copyright (c) 2001, Maetee Supreanruey and Anusorn Krasantisuk
//	All Rights Reserved.
//
//	This is UNPUBLISHED PROPRIETARY SOURCE CODE of Maetee Supreanruey 
//	and Anusorn Krasantisuk, the contents of this file may not be 
//	disclosed to third parties, copied or duplicated in any form, 
//	in whole or in part, without the prior written permission of 
//	Maetee Supreanruey and Anusorn Krasantisuk.
//
/////////////////////////////////////////////////////////////////////////////

#pragma once

#include "Texture.h"


const float Const_ScreenWidth   = 1600.0f;
const float Const_ScreenHeight  = 1200.0f;

const float Const_HeightChar	= 50.0f/Const_ScreenHeight;
const float Const_WidthChar	    = 50.0f/Const_ScreenWidth;
const float Const_Space			= 7.0f/Const_ScreenWidth;

class CText2D
{
private:
	// use to create surface for text
	static CUseTexture    Texture[6];

public:
	static void CreateCharSurface();


	static void Putstring( 
				    const CString& strString ,         // Number to put on screen 
					float X,               // Position on X Axis
					float Y,               // Position on Y Axis
					float Z,          // Position on Z Axis
					DWORD color  // color of fonts
					);	      


	// Function Get Width of String
	static float GetWidthStr(char string[80]);

private:

	// put char
	static void PutChar(		int ascii,
						float X1,//Start Position of picture on X Axis
						float Y1,//Start Position of picture on Y Axis
						float Z //Position of z
						);

	static inline bool isBigThai(int ascii)
	{
		if ( (ascii==187)||(ascii==189)||(ascii==191)) return true; else return false;
	};

	static inline bool isUpperThai1(int ascii)
	{
		if ( 
				(ascii==209)||
				(  (ascii>=211) && (ascii<=215) )	                   
			) 
		return true; else return false;
	};

	static inline bool isUpperThai2(int ascii)
	{
		if  (  (ascii>=231) && (ascii<=236) )return true; else return false;
	};


	static inline bool isLowerThai1(int ascii)
	{
		if ((ascii==216)||(ascii==217))return true; else return false;
	};

public:

	// Public function for to putpicture in 2d
	static void PutPictureIn2D(   
					CUseTexture * pTexture,//surface of picture
					float X1,//Start Position of picture on X Axis
					float Y1,//Start Position of picture on Y Axis
					float X2,//End Position of picture on X Axis
					float Y2,//End Position of picture on Y Axis
					float Z, //Position of z
					float TU_1,// start TU
					float TV_1,// start TU
					float TU_2,// start TU
					float TV_2// start TU
					);



	static inline float Value3D_H(long pixel){return (pixel/Const_ScreenHeight);};
	static inline float Value3D_W(long pixel){return (pixel/Const_ScreenWidth);};

//Font Information
// Tool Font Function
public:

	struct FontType{
		float Width;
		float X;  float Y;
	};

	static inline FontType Font(float _Width,float _X=0.0f,float _Y=0.0f){
		FontType Character;
		Character.Width=_Width;
		Character.X=_X;
		Character.Y=_Y;
	};

};


const CText2D::FontType aryFont[]={

	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   000
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   001
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   002
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   003
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   004
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   005
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   006
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   007
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   008
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   009

	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   010
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   011
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   012
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   013
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   014
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   015
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   016
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   017
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   018
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   019

	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   020
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   021
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   022
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   023
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   024
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   025
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   026
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   027
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   028
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   029

	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   030
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   031
	(27.0f/Const_ScreenWidth),0.0f,0.0f,                             //spacebar // ascii   032
	(13.0f/Const_ScreenWidth),0.0f,0.0f,                             //!        // ascii   033
	(24.0f/Const_ScreenWidth),0.0f,0.0f,                             //"        // ascii   034
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   035
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   036
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   037
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   038
	(13.0f/Const_ScreenWidth),0.0f,0.0f,                             //'        // ascii   039

	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   040
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   041
	(28.0f/Const_ScreenWidth),0.0f,0.0f,                             //*        // ascii   042
	(30.0f/Const_ScreenWidth),0.0f,0.0f,                             //+        // ascii   043
	(16.0f/Const_ScreenWidth),0.0f,0.0f,                             //,        // ascii   044
	(28.0f/Const_ScreenWidth),0.0f,0.0f,                             //-        // ascii   045
	(12.0f/Const_ScreenWidth),0.0f,0.0f,                             //.        // ascii   046
	(27.0f/Const_ScreenWidth),0.0f,0.0f,                             //  /      // ascii   047
	(28.0f/Const_ScreenWidth),0.0f,0.0f,                             //0        // ascii   048
	(26.0f/Const_ScreenWidth),0.0f,0.0f,                             //1        // ascii   049

	(29.0f/Const_ScreenWidth),0.0f,0.0f,                             //2        // ascii   050
	(28.0f/Const_ScreenWidth),0.0f,0.0f,                             //3        // ascii   051
	(28.0f/Const_ScreenWidth),0.0f,0.0f,                             //4        // ascii   052
	(28.0f/Const_ScreenWidth),0.0f,0.0f,                             //5        // ascii   053
	(28.0f/Const_ScreenWidth),0.0f,0.0f,                             //6        // ascii   054
	(30.0f/Const_ScreenWidth),0.0f,0.0f,                             //7        // ascii   055
	(28.0f/Const_ScreenWidth),0.0f,0.0f,                             //8        // ascii   056
	(29.0f/Const_ScreenWidth),0.0f,0.0f,                             //9        // ascii   057
	(12.0f/Const_ScreenWidth),0.0f,0.0f,                             //:        // ascii   058
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   059

	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   060
	(28.0f/Const_ScreenWidth),0.0f,0.0f,                             //=        // ascii   061
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   062
	(23.0f/Const_ScreenWidth),0.0f,0.0f,                             //?        // ascii   063
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   064
	(40.0f/Const_ScreenWidth),0.0f,0.0f,                             //A        // ascii   065
	(31.0f/Const_ScreenWidth),0.0f,0.0f,                             //B        // ascii   066
	(36.0f/Const_ScreenWidth),0.0f,0.0f,                             //C        // ascii   067
	(39.0f/Const_ScreenWidth),0.0f,0.0f,                             //D        // ascii   068
	(31.0f/Const_ScreenWidth),0.0f,0.0f,                             //E        // ascii   069

	(29.0f/Const_ScreenWidth),0.0f,0.0f,                             //F        // ascii   070
	(37.0f/Const_ScreenWidth),0.0f,0.0f,                             //G        // ascii   071
	(43.0f/Const_ScreenWidth),0.0f,0.0f,                             //H        // ascii   072
	(19.0f/Const_ScreenWidth),0.0f,0.0f,                             //I        // ascii   073
	(19.0f/Const_ScreenWidth),0.0f,0.0f,                             //J        // ascii   074
	(38.0f/Const_ScreenWidth),0.0f,0.0f,                             //K        // ascii   075
	(32.0f/Const_ScreenWidth),0.0f,0.0f,                             //L        // ascii   076
	(48.0f/Const_ScreenWidth),0.0f,0.0f,                             //M        // ascii   077
	(43.0f/Const_ScreenWidth),0.0f,0.0f,                             //N        // ascii   078
	(40.0f/Const_ScreenWidth),0.0f,0.0f,                             //O        // ascii   079

	(31.0f/Const_ScreenWidth),0.0f,0.0f,                             //P        // ascii   080
	(41.0f/Const_ScreenWidth),0.0f,0.0f,                             //Q        // ascii   081
	(35.0f/Const_ScreenWidth),0.0f,0.0f,                             //R        // ascii   082
	(26.0f/Const_ScreenWidth),0.0f,0.0f,                             //S        // ascii   083
	(32.0f/Const_ScreenWidth),0.0f,0.0f,                             //T        // ascii   084
	(41.0f/Const_ScreenWidth),0.0f,0.0f,                             //U        // ascii   085
	(38.0f/Const_ScreenWidth),0.0f,0.0f,                             //V        // ascii   086
	(50.0f/Const_ScreenWidth),0.0f,0.0f,                             //W        // ascii   087
	(35.0f/Const_ScreenWidth),0.0f,0.0f,                             //X        // ascii   088
	(38.0f/Const_ScreenWidth),0.0f,0.0f,                             //Y        // ascii   089

	(34.0f/Const_ScreenWidth),0.0f,0.0f,                             //Z        // ascii   090
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   091
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   092
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   093
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   094
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   095
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   096
	(27.0f/Const_ScreenWidth),0.0f,0.0f,                             //a        // ascii   097
	(30.0f/Const_ScreenWidth),0.0f,0.0f,                             //b        // ascii   098
	(23.0f/Const_ScreenWidth),0.0f,0.0f,                             //c        // ascii   099

	(32.0f/Const_ScreenWidth),0.0f,0.0f,                             //d        // ascii   100
	(27.0f/Const_ScreenWidth),0.0f,0.0f,                             //e        // ascii   101
	(22.0f/Const_ScreenWidth),0.0f,0.0f,                             //f        // ascii   102
	(30.0f/Const_ScreenWidth),0.0f,0.0f,                             //g        // ascii   103
	(32.0f/Const_ScreenWidth),0.0f,0.0f,                             //h        // ascii   104
	(17.0f/Const_ScreenWidth),0.0f,0.0f,                             //i        // ascii   105
	(13.0f/Const_ScreenWidth),0.0f,0.0f,                             //j        // ascii   106
	(31.0f/Const_ScreenWidth),0.0f,0.0f,                             //k        // ascii   107
	(17.0f/Const_ScreenWidth),0.0f,0.0f,                             //l        // ascii   108
	(45.0f/Const_ScreenWidth),0.0f,0.0f,                             //m        // ascii   109

	(32.0f/Const_ScreenWidth),0.0f,0.0f,                             //n        // ascii   110
	(28.0f/Const_ScreenWidth),0.0f,0.0f,                             //o        // ascii   111
	(31.0f/Const_ScreenWidth),0.0f,0.0f,                             //p        // ascii   112
	(30.0f/Const_ScreenWidth),0.0f,0.0f,                             //q        // ascii   113
	(22.0f/Const_ScreenWidth),0.0f,0.0f,                             //r        // ascii   114
	(22.0f/Const_ScreenWidth),0.0f,0.0f,                             //s        // ascii   115
	(20.0f/Const_ScreenWidth),0.0f,0.0f,                             //t        // ascii   116
	(32.0f/Const_ScreenWidth),0.0f,0.0f,                             //u        // ascii   117
	(30.0f/Const_ScreenWidth),0.0f,0.0f,                             //v        // ascii   118
	(44.0f/Const_ScreenWidth),0.0f,0.0f,                             //w        // ascii   119

	(28.0f/Const_ScreenWidth),0.0f,0.0f,                             //x        // ascii   120
	(29.0f/Const_ScreenWidth),0.0f,0.0f,                             //y        // ascii   121
	(27.0f/Const_ScreenWidth),0.0f,0.0f,                             //z        // ascii   122
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   123
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   124
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   125
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   126
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   127
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   128
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   129

	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   130
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   131
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   132
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   133
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   134
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   135
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   136
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   137
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   138
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   139

	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   140
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   141
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   142
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   143
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   144
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   145
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   146
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   147
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   148
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   149

	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   150
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   151
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   152
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   153
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   154
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   155
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   156
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   157
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   158
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   159

	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   160
	(21.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//¡				// ascii   161
	(22.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//¢				// ascii   162
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   163
	(22.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//¤				// ascii   164
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   165
	(27.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//¦				// ascii   166
	(16.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//§				// ascii   167
	(18.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//¨				// ascii   168
	(24.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//©				// ascii   169

	(25.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//ª				// ascii   170
	(28.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//«				// ascii   171
	(29.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//¬				// ascii   172
	(30.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//­				// ascii   173
	(23.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//®				// ascii   174
	(24.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//¯				// ascii   175
	(21.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//°				// ascii   176
	(31.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//±				// ascii   177
	(30.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//²				// ascii   178
	(33.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//³				// ascii   179

	(22.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//´				// ascii   180
	(22.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//µ				// ascii   181
	(21.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//¶				// ascii   182
	(25.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//·				// ascii   183
	(20.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//¸				// ascii   184
	(28.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//¹				// ascii   185
	(26.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//º				// ascii   186
	(26.0f/Const_ScreenWidth)+Const_Space,0.0f,CText2D::Value3D_H(-9),   //»				// ascii   187
	(21.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//¼				// ascii   188
	(21.0f/Const_ScreenWidth)+Const_Space,0.0f,CText2D::Value3D_H(-10),  //½				// ascii   189

	(27.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//¾				// ascii   190
	(27.0f/Const_ScreenWidth)+Const_Space,0.0f,CText2D::Value3D_H(-9),   //¿				// ascii   191
	(23.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//À				// ascii   192
	(22.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//Á				// ascii   193
	(18.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//Â				// ascii   194
	(18.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//Ã				// ascii   195
	(21.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//Ä				// ascii   196
	(20.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//Å			        // ascii   197
	(23.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//Æ			        // ascii   198
	(19.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//Ç				// ascii   199

	(24.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//È				// ascii   200
	(26.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//É				// ascii   201
	(26.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//Ê				// ascii   202
	(27.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//Ë				// ascii   203
	(31.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//Ì				// ascii   204
	(21.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//Í				 // ascii   205
	(20.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//Î				 // ascii   206
	(20.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//Ï				 // ascii   207
	(19.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,			//Ğ				// ascii   208
	(0.00f/Const_ScreenWidth),CText2D::Value3D_W(-13)-Const_Space,CText2D::Value3D_H(-8),   //ÍÑ  // ascii   209

	(14.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,      //Ò                   // ascii   210
	(14.0f/Const_ScreenWidth)+Const_Space,CText2D::Value3D_W(-16),CText2D::Value3D_H(-6), //ÍÓ    // ascii   211
	(0.00f/Const_ScreenWidth),CText2D::Value3D_W(-20)-Const_Space,CText2D::Value3D_H(-8),   //ÍÔ  // ascii   212
	(0.00f/Const_ScreenWidth),CText2D::Value3D_W(-22)-Const_Space,CText2D::Value3D_H(-10),  //ÍÕ  // ascii   213
	(0.00f/Const_ScreenWidth),CText2D::Value3D_W(-20)-Const_Space,CText2D::Value3D_H(-13),  //ÍÖ  // ascii   214
	(0.00f/Const_ScreenWidth),CText2D::Value3D_W(-20)-Const_Space,CText2D::Value3D_H(-11),  //Í×  // ascii   215
	(0.00f/Const_ScreenWidth),CText2D::Value3D_W(-9)-Const_Space,CText2D::Value3D_H(1),     //ÍØ  // ascii   216
	(0.00f/Const_ScreenWidth),CText2D::Value3D_W(-16)-Const_Space,CText2D::Value3D_H(1),    //ÍÙ  // ascii   217
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   218
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   219

	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   220
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   221
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   222
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   223
	(9.00f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,      //àÍ                  // ascii   224
	(22.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,      //áÍ                  // ascii   225
	(19.0f/Const_ScreenWidth)+Const_Space,0.0f,CText2D::Value3D_H(-10),  //â             // ascii   226
	(17.0f/Const_ScreenWidth)+Const_Space,0.0f,CText2D::Value3D_H(-10),  //ã             // ascii   227
	(19.0f/Const_ScreenWidth)+Const_Space,0.0f,CText2D::Value3D_H(-12),  //ä             // ascii   228
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   229

	(22.0f/Const_ScreenWidth)+Const_Space,0.0f,0.0f,      //æ                   // ascii   230
	(0.00f/Const_ScreenWidth),CText2D::Value3D_W(-18)-Const_Space,CText2D::Value3D_H(-15),  //Íç  // ascii   231
	(0.00f/Const_ScreenWidth),CText2D::Value3D_W(-5)-Const_Space,CText2D::Value3D_H(-9),    //Íè  // ascii   232
	(0.00f/Const_ScreenWidth),CText2D::Value3D_W(-12)-Const_Space,CText2D::Value3D_H(-14),  //Íé  // ascii   233
	(0.00f/Const_ScreenWidth),CText2D::Value3D_W(-16)-Const_Space,CText2D::Value3D_H(-14),  //Íê  // ascii   234
	(0.00f/Const_ScreenWidth),CText2D::Value3D_W(-10)-Const_Space,CText2D::Value3D_H(-12),  //Íë  // ascii   235
	(0.00f/Const_ScreenWidth),CText2D::Value3D_W(-11)-Const_Space,CText2D::Value3D_H(-14),  //Íì  // ascii   236
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   237
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   238
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   239

	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   240
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   241
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   242
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   243
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   244
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   245
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   246
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   247
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   248
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   249

	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   250
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   251
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   252
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   253
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   254
	(0.00f/Const_ScreenWidth),0.0f,0.0f,                                        // ascii   255

};


