--CREATE DATABASE
create database nuvo_hospital;

--CREATE ROW TYPE
create row type row_char(char_at char(50),t_st datetime year to minute ,t_sp datetime year to minute);
create row type row_int(int_at int,t_st datetime year to minute ,t_sp datetime year to minute);
create row type row_char_s(char_at char(15),t_st datetime year to minute ,t_sp datetime year to minute);
create row type address(house_id int,road char(40),district char(40),amphur char(40),province char(40),zip_code char(5),t_st datetime year to minute,t_sp datetime year to minute);

--CREATE TABLE
create table medicine(
	med_code serial primary key,
	comm_name set(row_char not null),		-->TEMPORAL
	sci_name char(50),
	use char(20),
	mft_name char(50),
	price set(row_int not null)			-->TEMPORAL
	);

create table disease(
	dis_code serial primary key,
	general_name set(row_char not null),		-->TEMPORAL
	sci_name char(50),
	dis_type char(30),
	dis_name char(50)
	);

create table diagnosis(
	dia_code serial primary key,
	weight int,
	height int,
	doctor int,					-->REF to doctor
	diagnose_record blob
	);

create table doctor(
	doc_code serial primary key,
	name set(row_char not null),			-->TEMPORAL
	surname set(row_char not null),		-->TEMPORAL
	sex char,					
	level set(row_char not null),			-->TEMPORAL
	skill char(40),
	charge set(row_int not null)			-->TEMPORAL
	);

create table patience(
	HN serial primary key,
	picture set(row_int not null),			-->TEMPORAL,REF to photo
	name set(row_char not null),			-->TEMPORAL
	surname set(row_char not null),		-->TEMPORAL
	birthday date,
	sex char,
	id_num char(13),
	blood_group char(2),
	address set(address not null),			-->TEMPORAL
	tel_num set(row_char_s not null),		-->TEMPORAL,Multivalues
	chronic_dis set(row_int not null),		-->TEMPORAL, REF to disease, Multivalues
	allergy_med set(row_int not null),		-->TEMPORAL, REF to medicine, Multivalues
	diagnosis set(row_int not null),			-->TEMPORAL, REF to diagnosis
	admission set(row_int not null)			-->TEMPORAL, REF to admission
	);

create table lab_number(
	lab_code serial primary key,
	name char(20),
	standard_from int,
	standard_to int,
	unit char(10),
	price set(row_int not null)			-->TEMPORAL
	);

create table lab_char(
	lab_code serial primary key,
	name char(20),
	price set(row_int not null)			-->TEMPORAL
	);

create table lab_photo(
	lab_code serial primary key,
	name char(30),
	price set(row_int not null)			-->TEMPORAL
	);

create table LRNP(					--Lab Result in Number type with Patience
	patience int,				-->REF to patience
	lab int,					-->REF to lab
	lab_result set(row_int not null),			-->TEMPORAL
	primary key(patience,lab)
	);

create table LRND(					--Lab Result in Number type with Diagnosis
	diagnosis int,				-->REF to diagnosis
	lab int,					-->REF to lab
	lab_result int,
	primary key(diagnosis,lab)
	);

create table LRNA(					--Lab Result in Number type with Admission
	admission int,				-->REF to admission
	lab int,					-->REF to lab
	lab_result set(row_int not null),			-->TEMPORAL
	primary key(admission,lab)
	);

create table LRCP(					--Lab Result in Char type with Patience
	patience int,				-->REF to patience
	lab int,					-->REF to lab
	lab_result set(row_char not null),		-->TEMPORAL
	primary key(patience,lab)
	);

create table LRCD(					--Lab Result in Char type with Diagnosis
	diagnosis int,				-->REF to diagnosis
	lab int,					-->REF to lab
	lab_result char(50),
	primary key(diagnosis,lab)
	);

create table LRCA(					--Lab Result in Char type with Admission
	admission int,				-->REF to admission
	lab int,					-->REF to lab
	lab_result set(row_char not null),		-->TEMPORAL
	primary key(admission,lab)
	);

create table LRPP(					--Lab Result in Photo type with Patience
	patience int, 				-->REF to patience
	lab int,					-->REF to lab
	lab_result set(row_int not null),			-->TEMPORAL,REF to photo
	primary key(patience,lab)
	);

create table LRPD(					--Lab Result in Photo type with Diagnosis
	diagnosis int,				-->REF to diagnosis
	lab int,					-->REF to lab
	lab_result blob,
	primary key(diagnosis,lab)
	);

create table LRPA(					--Lab Result in Photo type with Admission
	admission int, 				-->REF to admission
	lab int,					-->REF to lab
	lab_result set(row_int not null),			-->TEMPORAL,REF to photo
	primary key(admission,lab)
	);

create table MOP(					--Medicine Order with Patience
	patience int,				-->REF to patience
	medicine int,				-->REF to medicine
	quantity set(row_int not null),			-->TEMPORAL
	primary key(patience,medicine)
	);

create table MOD(					--Medicine Order with Diagnosis
	diagnosis int, 				-->REF to diagnosis
	medicine int,				-->REF to medicine
	quantity int,
	primary key(diagnosis,medicine)
	);

create table MOA(					--Medicine Order with Admission
	admission int, 				-->REF to admission
	medicine int,				-->REF to medicine
	quantity set(row_int not null),			-->TEMPORAL
	primary key(admission,medicine)
	);			
	
create table admission_package(
	package_code serial primary key,
	package_name char(20),
	price set(row_int not null)			-->TEMPORAL
	);


create table admission(
	ad_code serial primary key,
	doctor int,					-->REF to doctor
	package int,				-->REF to admission_package
	room int,					-->REF to room
	ad_diagnosis int,				-->REF to ad_diagnosis
	in_time datetime year to minute,
	out_time datetime year to minute
	);

create table ad_diagnosis(				--บันทึกรายการตรวจประจำวันขณะadmit
	ad_diagnosis_code serial primary key,
	temperature set(row_int not null),		-->TEMPORAL
	pulse set(row_int not null),			-->TEMPORAL
	repisitory set(row_int not null),			-->TEMPORAL
	blood_pressure_l set(row_int not null),		-->TEMPORAL
	blood_pressure_h set(row_int not null),		-->TEMPORAL
	nursing_plan set(row_int not null),		-->TEMPORAL,REF to photo
	diagnosis_record set(row_int not null)		-->TEMPORAL,REF to photo
	);

create table photo(					--เก็บรูปทั้งหมดใน database
	photo_id serial primary key,
	pic blob					
	);

create table room(
	room_id serial(101) primary key,
	price set(row_int not null)			-->TEMPORAL
	);



