#include <stdio.h>
#include <conio.h>
#include <math.h>
#include <jni.h>
#include "Passpos.h"
#include "GetLogin.h"
#include "ColorSkin.h"
#include "d:\\sang\\MyProject\\mrft_api.h"

int init_stuff(void);

void move_player(JNIEnv *env, jobject obj, jclass cls);
void move_camera(void);
void set_vector(double vector[3], double x, double y, double z);
void get_intersection_with_terrain(double location[3], double intersection[3]);
void get_intersection_with_terrain1(double location[3], double intersection[3]);
void set_other_player(DWORD player,DWORD other_skin,double other_location[3]);
void get_location(double location[3]);
void set_advertisement(int color);
void set_advertisement2(int color);


void send_me(JNIEnv *env, jobject obj, jclass cls);

void recieve_player(void);

DWORD gl_player, gl_camera; // the gl denotes a global variable
DWORD gl_run_sequence, gl_stand_sequence;
DWORD run_sequence, stand_sequence;
	
double gl_player_height;
double x[255],y[255],z[255];
double www[3];
DWORD player1[255];

DWORD skin,ad_skin,ad_skin1,ad_skin2,adver,adver1,adver2;
DWORD otherskin[255];
const char *name[255];
const char *his_name;
const char *my_name;
const char *chatname[255];

int skina,colo,java_adver;
int boo;
int num,count;
int command;
int detect_key;
int initbit = 0;
int diff = 1;
int sdiff = 1;
int ndiff = 1;
int nsdiff = 1;
CRITICAL_SECTION CriticalSection; 

int a=1;


JNIEXPORT void JNICALL Java_Passpos_CallMain
  (JNIEnv *env, jobject obj)
{
	if (initbit == 0 )
	{
		if(init_stuff()==VR_ERROR) 
		{
			printf("failed setting world\nPress any key");
			getch();
			return;
		}
		initbit =1;
	}
	jclass cls = env -> GetObjectClass(obj);
	send_me(env, obj, cls);
	EnterCriticalSection(&CriticalSection);

	move_player(env, obj, cls);
	move_camera();
	LeaveCriticalSection(&CriticalSection);

	if (a==1)
	{	a=0;
		Morfit_engine_render(NULL,NULL);
		a=1;
	}

	//Lets render till we press the escape key on the keyboard.
	/*while( (GetAsyncKeyState(VK_ESCAPE)&1) ==0 ) //GetAsyncKeyState() is a WIN32 function API (not Morfit)
	{										
		move_player(env, obj, cls);								
		move_camera();	
		Morfit_engine_render(NULL,NULL);
			
	}
	Morfit_engine_close();*/

}

JNIEXPORT void JNICALL Java_Passpos_CallMove
  (JNIEnv *env, jobject obj, jintArray arr)
{	
	jclass cls = env -> GetObjectClass(obj);

	jsize len = env->GetArrayLength(arr);
	jint *body = env->GetIntArrayElements(arr, 0);
	command = body[0];
	env->ReleaseIntArrayElements(arr, body, 0);

	if (command == -1)
	{	send_me(env, obj, cls);
		Morfit_engine_close();

		DeleteCriticalSection(&CriticalSection);
	}	
	else
	{
		EnterCriticalSection(&CriticalSection); 

		move_player(env, obj, cls);
		move_camera();
		LeaveCriticalSection(&CriticalSection);

		if(a==1)
		{	a=0;
			Morfit_engine_render(NULL,NULL);
			a=1;
		}
	}
}


void move_player(JNIEnv *env, jobject obj, jclass cls)
{    
	double save_location[3];
	Morfit_object_get_location(gl_player, &save_location[0], &save_location[1], &save_location[2]);
    
	//move_forward
	//if(GetAsyncKeyState(VK_UP) < 0) 
	if (command == 1)
	{
		Morfit_object_move(gl_player,OBJECT_SPACE, -15,0,0);
		Morfit_object_set_3D_sequence(gl_player, gl_run_sequence, 0);	
		Morfit_3D_sequence_backwards_play(gl_run_sequence,NO);
		//command = 1;
		detect_key = 1;
		send_me(env, obj, cls);
	}
	//else if(GetAsyncKeyState(VK_DOWN) < 0) //move backwards
	else if (command == 2)
	{
		Morfit_object_move(gl_player,OBJECT_SPACE, 15,0,0);
		Morfit_object_set_3D_sequence(gl_player, gl_run_sequence, 0);
		Morfit_3D_sequence_backwards_play(gl_run_sequence,YES);
		//command = 2;
		detect_key = 1;
		send_me(env, obj, cls);	
	}
	else if (command == 0)//stand
	{
		Morfit_object_set_3D_sequence(gl_player, gl_stand_sequence, 400);	
		if (detect_key==1)
		{
			//command = 0;
			detect_key = 0;
			send_me(env, obj, cls);
		}
	}
	
	//Move left
	//if(GetAsyncKeyState(VK_LEFT) < 0) 
	else if (command == 3)
	{
		Morfit_object_rotate_z(gl_player, 6, WORLD_SPACE);
		detect_key = 1;
		//command = 3;
		send_me(env, obj, cls);
	}

	//Move right
	//if(GetAsyncKeyState(VK_RIGHT) < 0) 
	else if (command == 4)
	{
		Morfit_object_rotate_z(gl_player, -6, WORLD_SPACE);
		detect_key = 1;
		//command = 4;
		send_me(env, obj, cls);
	}

	double location[3];
	Morfit_object_get_location(gl_player, &location[0], &location[1], &location[2]);
	double intersection[3];
	get_intersection_with_terrain(location, intersection);

	double new_altitude = intersection[2] + gl_player_height / 2;	

	if(new_altitude > save_location[2] + gl_player_height / 3)  
	{
		Morfit_object_set_location(gl_player, save_location[0], save_location[1], save_location[2]);
	}
	else 
	{
		Morfit_object_set_location(gl_player, location[0], location[1], new_altitude);
	}
    
}

void move_camera(void)
{
	Morfit_camera_advance_all();

	double location[3], intersection[3];
	Morfit_camera_get_location(gl_camera, &location[0], &location[1], &location[2]);
	get_intersection_with_terrain(location, intersection);

	if(location[2] - intersection[2] > 20) 
		return; //No need to raise camera

	double new_altitude = intersection[2] + 20;
	Morfit_camera_set_location(gl_camera, location[0], location[1], new_altitude);
}


int init_stuff(void) 
{
	
    InitializeCriticalSection(&CriticalSection); 

	command = 0;
	boo = 0;
	count = 0;
	diff = skina;
	sdiff = colo;
	for (int j=0; j<255; j++)
		{ name[j] = ""; }
	detect_key=0;

	int rc = Morfit_engine_load_world("d:\\sang\\MyProject\\worlds\\littlezone-A.wld",
									  NULL,
									  "d:\\sang\\MyProject\\worlds\\bitmaps", 
									  USER_DEFINED_BEHAVIOR);
	if(rc != OK) 
		return(VR_ERROR);


	if(diff == 1){
		gl_player = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badgirl\\player.md2");
		if(gl_player == NULL) 
			return(VR_ERROR);
	
		if (sdiff ==1){
			skin = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badgirl\\skin1.bmp",-1);
		}//close sdiff
		if (sdiff ==2){
			skin = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badgirl\\ctf_b1.bmp",-1);
		}//close sdiff
		if (sdiff ==3){
			skin = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badgirl\\ctf_g1.bmp",-1);
		}//close sdiff
		if (sdiff ==4){
			skin = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badgirl\\ctf_r1.bmp",-1);
		}//close sdiff

	} //close diff

	if(diff == 2){
		gl_player = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badboy\\player.md2");
		if(gl_player == NULL) 
			return(VR_ERROR);
	
		if (sdiff ==1){
			skin = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badboy\\skin1.bmp",-1);
		}
		if (sdiff ==2){
			skin = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badboy\\ctf_b1.bmp",-1);
		}
		if (sdiff ==3){
			skin = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badboy\\ctf_g1.bmp",-1);
		}
		if (sdiff ==4){
			skin = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badboy\\ctf_r1.bmp",-1);
		}
	} //close diff
			
	if(diff == 3){
		gl_player = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\hellogirl\\player.md2");
		if(gl_player == NULL) 
			return(VR_ERROR);
	
		if (sdiff ==1){
			skin = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\hellogirl\\skin1.bmp",-1);
		}
		if (sdiff ==2){
			skin = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\hellogirl\\ctf_b1.bmp",-1);
		}
		if (sdiff ==3){
			skin = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\hellogirl\\ctf_g1.bmp",-1);
		}
		if (sdiff ==4){
			skin = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\hellogirl\\ctf_r1.bmp",-1);
		}
	} //close diff

	if(diff == 4){
		gl_player = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badwoman\\player.md2");
		if(gl_player == NULL) 
			return(VR_ERROR);
	
		if (sdiff ==1){
			skin = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badwoman\\skin1.bmp",-1);
		}
		if (sdiff ==2){
			skin = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badwoman\\ctf_b1.bmp",-1);
		}
		if (sdiff ==3){
			skin = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badwoman\\ctf_g1.bmp",-1);
		}
		if (sdiff ==4){
			skin = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badwoman\\ctf_r1.bmp",-1);
		}
	} //close diff

	//Set the skin
	Morfit_object_set_bitmap(gl_player, skin);

	double scale[3] = {3,3,3};
	Morfit_object_set_scale(gl_player, scale);

	//calculate the player height
	double box[2][3];
	Morfit_object_get_bounding_box(gl_player, box);

	gl_player_height = box[1][2] - box[0][2]; 

	Morfit_object_move(gl_player,OBJECT_SPACE, -1000,0,10000); 
																
	gl_camera = Morfit_camera_get_default_camera();
	Morfit_camera_set_object_to_chase(gl_camera, gl_player);
	
	Morfit_engine_advance_cameras_automatically(NO);
	
	DWORD anim3d = Morfit_object_get_3D_animation(gl_player);
	if(anim3d == NULL) 
		return(VR_ERROR);
	
	gl_run_sequence = Morfit_3D_sequence_get_using_name(anim3d, "run");
	gl_stand_sequence = Morfit_3D_sequence_get_using_name(anim3d, "stand"); 
	
	if(gl_run_sequence == NULL || gl_stand_sequence == NULL ) 
		return(VR_ERROR);
		
	Morfit_engine_set_picture_quality(640*480);
	Morfit_engine_maximize_default_rendering_window();
	Morfit_engine_set_default_rendering_window_title("Morfit basic sample for 3D animation. Use arrow keys. ESC to exit");

	//if(Morfit_3D_card_set_window_mode()==VR_ERROR) 
	//{
	//	if(Morfit_3D_card_check_hardware_support()==YES) 
	//	{
	//		MessageBox(NULL, "Failed to initialize your 3D card.\n This sample only works with hardware rendering\nPlease check that you have a 3D card and DirectX 6.1 and above\n","No 3D card", MB_OK);
	//	}
			
		Morfit_engine_set_default_rendering_window_size(240,180,400,400);
	//}
 
	int color=1;
	set_advertisement(color);

	Morfit_engine_hide_log_window();

	return(OK);
}

void set_vector(double vector[3], double x, double y, double z)
{
	vector[0]=x;
	vector[1]=y;
	vector[2]=z;
}


void get_intersection_with_terrain(double location[3], double intersection[3])
{
	double up_location[3], down_location[3];
	set_vector(up_location,   location[0], location[1],1000);
	set_vector(down_location, location[0], location[1],-1000);
	DWORD terrain_poly, blocking_object;
	int flag = Morfit_object_is_movement_possible(gl_player, up_location, down_location, &terrain_poly, intersection, &blocking_object);
	
	if(flag == YES) 
	{
		printf("An error occurred, there is now ground below !!!\n");
		return;
	}
}


void get_intersection_with_terrain1(double location[3], double intersection[3])
{
	double up_location[3], down_location[3];
	set_vector(up_location,   location[0], location[1],1000);
	set_vector(down_location, location[0], location[1],-1000);
	DWORD terrain_poly, blocking_object;
	int flag = Morfit_object_is_movement_possible(player1[num], up_location, down_location, &terrain_poly, intersection, &blocking_object);
	
	if(flag == YES) 
	{
		printf("An error occurred, there is now ground below !!!\n");
		return;
	}
}

// make new player when receive data
void set_other_player(DWORD player,DWORD other_skin,double other_location[3])
{
	Morfit_object_set_bitmap(player,other_skin);
	double scale[3] = {3,3,3};
	Morfit_object_set_scale(player, scale);
	double box[2][3];
	Morfit_object_get_bounding_box(player, box);

	Morfit_object_set_location(player,other_location[0],other_location[1],other_location[2]);
	
	DWORD anim3d = Morfit_object_get_3D_animation(player);
	if(anim3d == NULL) 
	{
		printf("++++++++++++++ Error +++++++++++");
	}

	run_sequence = Morfit_3D_sequence_get_using_name(anim3d, "run");
	stand_sequence = Morfit_3D_sequence_get_using_name(anim3d, "stand"); 
	if(run_sequence == NULL || stand_sequence == NULL ) 
	{
		printf("++++++++++++++ Error Sequence +++++++++++");
	}
}

void set_advertisement(int color)
{
	adver = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\screen.md2");

	if(color==1)
	{
		ad_skin = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\sample.jpg",-1);
	}

	Morfit_object_set_bitmap(adver,ad_skin);

	double scale[3] = {3,3,3};
	Morfit_object_set_scale(adver, scale);
	double box[2][3];
	Morfit_object_get_bounding_box(adver, box);

	Morfit_object_set_location(adver,-700,-2654,23);

	adver1 = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\screen1.md2");
	
	if(color==1)
	{
		ad_skin1 = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\sample.jpg",-1);
	}

	Morfit_object_set_bitmap(adver1,ad_skin1);

	Morfit_object_set_scale(adver1, scale);

	Morfit_object_get_bounding_box(adver1, box);

	Morfit_object_set_location(adver1,-80,-2654,23);

	adver2 = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\bigscreen.md2");
	
	if(color==1)
	{
		ad_skin2 = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\sample.jpg",-1);
	}

	Morfit_object_set_bitmap(adver2,ad_skin2);

	Morfit_object_set_scale(adver2, scale);

	Morfit_object_get_bounding_box(adver2 ,box);

	Morfit_object_set_location(adver2,-513,1061,400);
}


void set_advertisement2(int color)
{
	if(color==1)
	{
		DWORD ad_skin3 = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\sample.jpg",-1);

		Morfit_object_set_bitmap(adver,ad_skin3);

		DWORD ad_skin4 = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\sample.jpg",-1);

		Morfit_object_set_bitmap(adver1,ad_skin4);

		DWORD ad_skin5 = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\sample.jpg",-1);

		Morfit_object_set_bitmap(adver2,ad_skin5);	
	}
	
	if(color==2)
	{
		DWORD ad_skin6 = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\rag.bmp",-1);

		Morfit_object_set_bitmap(adver,ad_skin6);

		DWORD ad_skin7 = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\rag.bmp",-1);

		Morfit_object_set_bitmap(adver1,ad_skin7);

		DWORD ad_skin8 = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\rag.bmp",-1);

		Morfit_object_set_bitmap(adver2,ad_skin8);	
	}
}


// save current location to update table
void get_location(double location[3])
{
	double save_location[3];
	Morfit_object_get_location(gl_player, &save_location[0], &save_location[1], &save_location[2]);

	location[0]=save_location[0];
	location[1]=save_location[1];
	location[2]=save_location[2];
}


JNIEXPORT void JNICALL Java_GetLogin_sendmyname
  (JNIEnv *env, jobject obj, jstring prompt)
{
	const char *st = env->GetStringUTFChars(prompt, 0);
	my_name = st;
	//env->ReleaseStringUTFChars(prompt, str);
}

JNIEXPORT void JNICALL Java_ColorSkin_sendskin
  (JNIEnv *env, jobject obj, jintArray arr)
{
	jsize len = env -> GetArrayLength(arr);
	jint *body = env -> GetIntArrayElements(arr, 0);
	skina = body[0];
	colo = body[1];
	env->ReleaseIntArrayElements(arr, body, 0);
}

JNIEXPORT void JNICALL Java_Passpos_sendname
  (JNIEnv *env, jobject obj, jstring prompt)
{
	const char *str = env->GetStringUTFChars(prompt, 0);
	his_name = str;
	//env->ReleaseStringUTFChars(prompt, str);
}

JNIEXPORT jstring JNICALL Java_Passpos_getname
  (JNIEnv *env, jobject obj)
{
	return env -> NewStringUTF(my_name);
}

void send_me(JNIEnv *env, jobject obj, jclass cls)
{ 
	
    
        
	double my_location[3];
	get_location(my_location);
	//gl_player,skin;

	jmethodID mid4 = env -> GetMethodID(cls,"get_skin","(I)V");
	if (mid4 == 0) {
		return;
	}
	env -> CallVoidMethod(obj,mid4,skina);

	jmethodID mid5 = env -> GetMethodID(cls,"get_color","(I)V");
	if (mid5 == 0) {
		return;
	}
	env -> CallVoidMethod(obj,mid5,colo);
	
	jmethodID mid = env -> GetMethodID(cls,"get_command","(I)V");
	if (mid == 0) {
		return;
	}
	int a = command;
	env -> CallVoidMethod(obj,mid,a);

	jmethodID mid1 = env -> GetMethodID(cls,"get_position_x","(D)V");
	if (mid1 == 0) {
		return;
	}
	double xx = my_location[0];
	env -> CallVoidMethod(obj,mid1,xx);

	jmethodID mid2 = env -> GetMethodID(cls,"get_position_y","(D)V");
	if (mid2 == 0) {
		return;
	}
	double yy = my_location[1];
	env -> CallVoidMethod(obj,mid2,yy);

	jmethodID mid3 = env -> GetMethodID(cls,"get_position_z","(D)V");
	if (mid3 == 0) {
		return;
	}
	double z = my_location[2];
	env -> CallVoidMethod(obj,mid3,z);

}

JNIEXPORT void JNICALL Java_Passpos_sendposition
  (JNIEnv *env, jobject obj)
{   
 EnterCriticalSection(&CriticalSection);

	if (initbit ==1 )
	{

	jclass cls = env -> GetObjectClass(obj);
	jmethodID mid4 = env -> GetMethodID(cls,"send_skin","()I");
	if (mid4 == 0) {
		return;
	}
	int his_skin = env -> CallIntMethod(obj,mid4);

	jmethodID mid5 = env -> GetMethodID(cls,"send_color","()I");
	if (mid5 == 0) {
		return;
	}
	int his_col = env -> CallIntMethod(obj,mid5);
	
	jmethodID mid = env -> GetMethodID(cls,"send_command","()I");
	if (mid == 0) {
		return;
	}
	int his_a = env -> CallIntMethod(obj,mid);
	
	jmethodID mid1 = env -> GetMethodID(cls,"send_position_x","()D");
	if (mid1 == 0) {
		return;
	}
	double his_x = env -> CallDoubleMethod(obj,mid1);
	
	jmethodID mid2 = env -> GetMethodID(cls,"send_position_y","()D");
	if (mid2 == 0) {
		return;
	}
	double his_y = env -> CallDoubleMethod(obj,mid2);

	jmethodID mid3 = env -> GetMethodID(cls,"send_position_z","()D");
	if (mid3 == 0) {
		return;
	}
	double his_z = env -> CallDoubleMethod(obj,mid3);
	//Call receive

	int i=0;
	while ((i<count) && (boo == 0)) {
		if (strcmp(name[i],his_name)==0)
		{
			boo = 1;	
			num = i;
		}
		i++;
	}


	if (boo == 1)
	{ 
		Morfit_object_enable(player1[num]);
		double save_location[3];
		Morfit_object_get_location(player1[num],&save_location[0], &save_location[1], &save_location[2]);
	 
		if (his_a == -1)
		{	
			name[num] = "xxxxxxxxxxxxx";
			Morfit_object_disable(player1[num]);
			//Morfit_object_delete(player1[num]);
		}

		if (his_a == 0)
		{	
			Morfit_object_set_3D_sequence(player1[num],stand_sequence, 10);	
		}
	
		if (his_a == 1) 
		{
			Morfit_object_move(player1[num],OBJECT_SPACE, -15,0,0);
			Morfit_object_set_3D_sequence(player1[num],run_sequence,0);	
			Morfit_3D_sequence_backwards_play(run_sequence,NO);
		}
		
		if (his_a == 2) //move backwards
		{
			Morfit_object_move(player1[num],OBJECT_SPACE, 15,0,0);
			Morfit_object_set_3D_sequence(player1[num],run_sequence,0);
			Morfit_3D_sequence_backwards_play(run_sequence,YES);
		}
	
		//Move left
		if (his_a == 3) 
		{
			Morfit_object_rotate_z(player1[num],6, WORLD_SPACE);
		}

		//Move right
		if(his_a==4) 
		{
			Morfit_object_rotate_z(player1[num],-6, WORLD_SPACE);
		}

		double location[3];
		Morfit_object_get_location(player1[num], &location[0], &location[1], &location[2]);
		double intersection[3];
		get_intersection_with_terrain1(location, intersection);

		double new_altitude = intersection[2] + gl_player_height / 2;
	
		if(new_altitude > save_location[2] + gl_player_height / 3)  
		{
			Morfit_object_set_location(player1[num], save_location[0], save_location[1], save_location[2]);
		}
		else 
		{
			Morfit_object_set_location(player1[num], location[0], location[1], new_altitude);
		}

		boo = 0;	
	}// end if cause*/

	else if (boo==0)
	{   
		ndiff = his_skin;
		nsdiff = his_col;
		num = count;
		count++;
		double hlocation[3];

		if(ndiff == 1){
			if (num==0)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badgirl\\player1.md2");
			}
			if (num==1)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badgirl\\player2.md2");
			}
			if (num==2)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badgirl\\player3.md2");
			}
			if (num==3)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badgirl\\player4.md2");
			}
			if (num==4)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badgirl\\player5.md2");
			}
			if (num==5)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badgirl\\player6.md2");
			}
			if (num==6)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badgirl\\player7.md2");
			}
			if (num==7)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badgirl\\player8.md2");
			}
			if (num==8)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badgirl\\player9.md2");
			}
			if (num==9)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badgirl\\player10.md2");
			}


			if (nsdiff==1){
				otherskin[num] = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badgirl\\skin.bmp",-1);
			}	 
			if (nsdiff ==2){
				otherskin[num] = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badgirl\\ctf_b.bmp",-1);
			}
			if (nsdiff ==3){
				otherskin[num] = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badgirl\\ctf_g.bmp",-1);
			}
			if (nsdiff ==4){
				otherskin[num] = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badgirl\\ctf_r.bmp",-1);
			}//close nsdiff

		} // close ndiff


		if(ndiff == 2){
			if (num==0)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badboy\\player1.md2");
			}
			if (num==1)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badboy\\player2.md2");
			}
			if (num==2)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badboy\\player3.md2");
			}
			if (num==3)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badboy\\player4.md2");
			}
			if (num==4)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badboy\\player5.md2");
			}
			if (num==5)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badboy\\player6.md2");
			}
			if (num==6)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badboy\\player7.md2");
			}
			if (num==7)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badboy\\player8.md2");
			}
			if (num==8)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badboy\\player9.md2");
			}
			if (num==9)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badboy\\player10.md2");
			}

			if (nsdiff==1){
				otherskin[num] = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badboy\\skin.bmp",-1);
			} 
			if (nsdiff ==2){
				otherskin[num] = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badboy\\ctf_b.bmp",-1);
			}
			if (nsdiff ==3){
				otherskin[num] = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badboy\\ctf_g.bmp",-1);
			}
			if (nsdiff ==4){
				otherskin[num] = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badboy\\ctf_r.bmp",-1);
			}

		} // close ndiff

		if(ndiff == 3){
			if (num==0)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\hellogirl\\player1.md2");
			}
			if (num==1)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\hellogirl\\player2.md2");
			}
			if (num==2)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\hellogirl\\player3.md2");
			}
			if (num==3)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\hellogirl\\player4.md2");
			}
			if (num==4)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\hellogirl\\player5.md2");
			}
			if (num==5)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\hellogirl\\player6.md2");
			}
			if (num==6)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\hellogirl\\player7.md2");
			}
			if (num==7)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\hellogirl\\player8.md2");
			}
			if (num==8)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\hellogirl\\player9.md2");
			}
			if (num==9)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\hellogirl\\player10.md2");
			}

			if (nsdiff==1){
				otherskin[num] = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\hellogirl\\skin.bmp",-1);
			}	 
			if (nsdiff ==2){
				otherskin[num] = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\hellogirl\\ctf_b.bmp",-1);
			}
			if (nsdiff ==3){
				otherskin[num] = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\hellogirl\\ctf_g.bmp",-1);
			}
			if (nsdiff ==4){
				otherskin[num]= Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\hellogirl\\ctf_r.bmp",-1);
			}//close nsdiff

		} // close ndiff

		if(ndiff == 4){
			if (num==0)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badwoman\\player1.md2");
			}
			if (num==1)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badwoman\\player2.md2");
			}
			if (num==2)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badwoman\\player3.md2");
			}
			if (num==3)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badwoman\\player4.md2");
			}
			if (num==4)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badwoman\\player5.md2");
			}
			if (num==5)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badwoman\\player6.md2");
			}
			if (num==6)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badwoman\\player7.md2");
			}
			if (num==7)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badwoman\\player8.md2");
			}
			if (num==8)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badwoman\\player9.md2");
			}
			if (num==9)
			{
				player1[num] = Morfit_object_create_from_file("d:\\sang\\MyProject\\worlds\\player1\\badwoman\\player10.md2");
			}

			if (nsdiff==1){
				otherskin[num] = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badwoman\\skin.bmp",-1);
			} 
			if (nsdiff ==2){
				otherskin[num] = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badwoman\\ctf_b.bmp",-1);
			}
			if (nsdiff ==3){
				otherskin[num] = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badwoman\\ctf_g.bmp",-1);
			}
			if (nsdiff ==4){
				otherskin[num] = Morfit_bitmap_load("d:\\sang\\MyProject\\worlds\\player1\\badwoman\\ctf_r.bmp",-1);
			}//close nsdiff

		} // close ndiff

		set_vector(hlocation,  his_x, his_y, his_z);
		set_other_player(player1[num],otherskin[num],hlocation); // load new user

		Morfit_object_set_direction(gl_player,-1,0,0);

		x[num]=his_x;
		y[num]=his_y;
		z[num]=his_z;

		//boo = 1;
		name[num] = his_name;
		Morfit_object_enable(player1[num]);

	} //end if cause
	if (a==1)
	{	a=0;
		Morfit_engine_render(NULL,NULL);	
		a=1;
	}
	}//cose initbit
	 LeaveCriticalSection(&CriticalSection);

}

JNIEXPORT void JNICALL Java_Passpos_getposition
  (JNIEnv *env, jobject obj)
{
	jclass cls = env -> GetObjectClass(obj);
	send_me(env,obj,cls);
}

JNIEXPORT void JNICALL Java_Passpos_sendadver
  (JNIEnv *env, jobject obj, jintArray arr)
{
	jsize len = env -> GetArrayLength(arr);
	jint *body = env -> GetIntArrayElements(arr, 0);
	java_adver = body[0];
	set_advertisement2(java_adver);
	env->ReleaseIntArrayElements(arr, body, 0);
}