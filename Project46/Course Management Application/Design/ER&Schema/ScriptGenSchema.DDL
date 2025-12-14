
-- Create new table MESSAGE.
-- MESSAGE : Table of Message
-- 	IDMSG : รหัสข้อความ
-- 	TOPIC : หัวช้อ
-- 	DESCRIPTION : คำอธิบาย
-- 	DATEPOST : วันที่ประกาศ
-- 	IDPOSTER : รหัสผู้ประกาศ
-- 	TYPEPOSTER : ชนิดผู้ประกาศ
-- 	MSGTYPE : ชนิดข้อความ
-- 	IDGROUP : รหัสกลุ่ม  
create table MESSAGE (
	IDMSG VARCHAR2(20) not null,
	TOPIC VARCHAR2(100) null,
	DESCRIPTION VARCHAR2(4000) null,
	DATEPOST DATE null,
	IDPOSTER VARCHAR2(20) null,
	TYPEPOSTER VARCHAR2(20) null,
	MSGTYPE VARCHAR2(20) null,
	IDGROUP VARCHAR2(20) null, constraint MESSAGE_PK primary key (IDMSG) ); 

-- Create new table RANK.
-- RANK : Table of Rank
-- 	IDRANK : ระดับคะแนน
-- 	MINSCORE : ช่วงคะแนนต่ำสุด
-- 	MAXSCORE : ช่วงคะแนนสูงสุด  
create table RANK (
	IDRANK VARCHAR2(1) not null,
	MINSCORE INTEGER null,
	MAXSCORE INTEGER null, constraint RANK_PK primary key (IDRANK) ); 

-- Create new table REPLYWB.
-- REPLYWB : Table of ReplyWB
-- 	IDREPLY : รหัสความคิดเห็น
-- 	DESCRIPTION : คำอธิบาย
-- 	IDPOSTER : รหัสผู้แสดงความคิดเห็น
-- 	TYPEPOSTER : ชนิดผู้แสดงคามคิดเห็น
-- 	IDTOPIC : รหัสกระทู้
-- 	CREATEDATE : วันที่ทำการแสดงความคิดเห็น
-- 	ISVISIBLE : ค่าเป็น 1 หมายถึง อนุญาติให้ผู้ใช้มองเห็น  
create table REPLYWB (
	IDREPLY VARCHAR2(200) not null,
	DESCRIPTION VARCHAR2(4000) null,
	IDPOSTER VARCHAR2(20) not null,
	TYPEPOSTER VARCHAR2(20) not null,
	IDTOPIC VARCHAR2(20) null,
	CREATEDATE DATE null,
	ISVISIBLE CHAR(1) null, constraint REPLYWB_PK primary key (IDREPLY) ); 

-- Create new table TOPICWB.
-- TOPICWB : Table of TopicWB
-- 	IDTOPIC : รหัสกระทู้
-- 	NAME : ชื่อ
-- 	DESCRIPTION : คำอธิบาย
-- 	IDPOSTER : รหัสผู้สร้างกระทู้
-- 	TYPEPOSTER : ชนิดผู้สร้างกรทู้
-- 	ISVISIBLE : ค่าเป็น 1 หมายถึง อนุญาติให้ผู้ใช้มองเห็น
-- 	IDSUBJECT : รหัสวิชา
-- 	CREATEDATE : วันที่ทำการสร้าง  
create table TOPICWB (
	IDTOPIC VARCHAR2(200) not null,
	NAME VARCHAR2(100) not null,
	DESCRIPTION VARCHAR2(4000) null,
	IDPOSTER VARCHAR2(20) not null,
	TYPEPOSTER VARCHAR2(20) not null,
	ISVISIBLE VARCHAR2(1) null,
	IDSUBJECT VARCHAR2(20) null,
	CREATEDATE DATE null, constraint TOPICWB_PK primary key (IDTOPIC) ); 

-- Create new table TYPEREMIND.
-- TYPEREMIND : Table of TypeRemind
-- 	TYPEREMIND : ชนิดการเตือน  
create table TYPEREMIND (
	TYPEREMIND VARCHAR2(50) not null, constraint TYPEREMIND_PK primary key (TYPEREMIND) ); 

-- Create new table REMIND.
-- REMIND : Table of Remind
-- 	IDREMIND : รหัสการเตือน
-- 	RDATE : วันที่เตือน
-- 	TYPEREMIND : ชนิดการเตือน
-- 	DESCRIPTION : คำอธิบาย
-- 	DATEREMINDER : วันที่ทำการเตือนโดยระบบ
-- 	IDUSER : รหัสเจ้าของการเตือน
-- 	RTIME : เวลาที่เตือน
-- 	TOPIC : หัวข้อ  
create table REMIND (
	IDREMIND VARCHAR2(200) not null,
	RDATE DATE null,
	TYPEREMIND VARCHAR2(50) null,
	DESCRIPTION VARCHAR2(4000) not null,
	DATEREMINDER DATE null,
	IDUSER VARCHAR2(20) null,
	RTIME DATE null,
	TOPIC VARCHAR2(100) null, constraint REMIND_PK primary key (IDREMIND) ); 

-- Create new table DOEXAM.
-- DOEXAM : Table of DoExam
-- 	SCOREEXAM : คะแนนการสอบ
-- 	IDEXAM : รหัสการสอบ
-- 	IDSTUDENT : รหัสนักศึกษา  
create table DOEXAM (
	SCOREEXAM NUMBER(38,0) null,
	IDEXAM VARCHAR2(20) not null,
	IDSTUDENT VARCHAR2(20) not null, constraint DOEXAM_PK primary key (IDEXAM, IDSTUDENT) ); 

-- Create new table TYPEPART.
-- TYPEPART : Table of TypePart
-- 	TYPE : ชนิดตอนของข้อสอบ
-- 	COMMAND : คำสั่ง  
create table TYPEPART (
	TYPE VARCHAR2(20) not null,
	COMMAND VARCHAR2(50) null, constraint TYPEPART_PK primary key (TYPE) ); 

-- Create new table EXAMRANK.
-- EXAMRANK : Table of ExamRank
-- 	RANK : ระดับคะแนน
-- 	MINPERCENT : ช่วงคะแนนน้อยสุด
-- 	MAXPERCENT : ช่วงคะแนนมากสุด
-- 	IDSUBJECT : รหัสวิชา  
create table EXAMRANK (
	RANK VARCHAR2(1) not null,
	MINPERCENT NUMBER(5,2) null,
	MAXPERCENT NUMBER(5,2) null,
	IDSUBJECT VARCHAR2(20) not null, constraint EXAMRANK_PK primary key (RANK, IDSUBJECT) ); 

-- Create new table EXAM.
-- EXAM : Table of Exam
-- 	IDEXAM : รหัสการสอบ
-- 	MAXSCORE : คะแนนเต็มของข้อสอบ
-- 	REALSCORE : คะแนนที่เก็บจริง
-- 	TYPE : ชนิดการสอบ
-- 	EXAMDATE : วันที่ทำการสอบ
-- 	STARTTIME : เวลาเริ่มสอบ
-- 	STOPTIME : เวลาสิ้นสุดการสอบ
-- 	STATUS : สถานะ ( Tested = การทดสอบเสร็จสิ้น, Testing = กำลังทดสอบ, notTest = ยังไม่ถึงเวลาสอบ )
-- 	ISANNOUNCE : ค่าเป็น 1 หมายถึง ประกาศคะแนนให้นักศึกษาทราบ
-- 	MAGICNUM : รหัสยืนยันการเข้าสอบ
-- 	AVGSTDGRADE : ระดับเฉลี่ยของเกรดของเด็กที่รับการทดสอบ
-- 	STATMINSCORE : สถิติคะแนนต่ำสุด
-- 	STATMAXSCORE : สถิติของคะแนนสูงสุด
-- 	IDSUBJECT : รสัดวิชา
-- 	IDEXAMINATIONSET : รหัสชุดข้อสอบ  
create table EXAM (
	IDEXAM VARCHAR2(20) not null,
	MAXSCORE INTEGER null,
	REALSCORE INTEGER null,
	TYPE VARCHAR2(20) not null,
	EXAMDATE DATE not null,
	STARTTIME DATE not null,
	STOPTIME DATE not null,
	STATUS VARCHAR2(20) not null,
	ISANNOUNCE VARCHAR2(1) null,
	MAGICNUM VARCHAR2(20) not null,
	AVGSTDGRADE NUMBER(3,2) null,
	STATMINSCORE INTEGER null,
	STATMAXSCORE INTEGER null,
	IDSUBJECT VARCHAR2(20) not null,
	IDEXAMINATIONSET VARCHAR2(20) null, constraint EXAM_PK primary key (IDEXAM) ); 

-- Create new table QUESTIONOFPART.
-- QUESTIONOFPART : Table of QuestionOfPart
-- 	IDPART : รหัสตอนของข้อสอบ
-- 	IDQUESTION : รหัสคำถาม  
create table QUESTIONOFPART (
	IDPART VARCHAR2(20) not null,
	IDQUESTION VARCHAR2(20) not null, constraint QUESTIONOFPART_PK primary key (IDPART, IDQUESTION) ); 

-- Create new table PART.
-- PART : Table of Part
-- 	IDPART : รหัสตอนของข้อสอบ
-- 	TYPE : ชนิด
-- 	AVGRANK : ระดับโดยเฉลี่ยจากข้อสอบในตอน
-- 	SCOREWEIGHT : น้ำหนักของคำถาม
-- 	IDEXAMINATIONSET : รหัสชุดข้อสอบ  
create table PART (
	IDPART VARCHAR2(20) not null,
	TYPE VARCHAR2(20) not null,
	AVGRANK NUMBER(5,2) null,
	SCOREWEIGHT NUMBER(5,2) null,
	IDEXAMINATIONSET VARCHAR2(20) null, constraint PART_PK primary key (IDPART) ); 

-- Create new table EXAMINATIONSET.
-- EXAMINATIONSET : Table of ExaminationSet
-- 	IDEXAMINATIONSET : รหัสชุดข้อสอบ
-- 	TYPE : ชนิดชุดข้อสอบ
-- 	TIME2EXAM : จำนวนครั้งที่นำไปใช้ในการทดสอบ
-- 	IDSUBJECT : รหัสวิชา  
create table EXAMINATIONSET (
	IDEXAMINATIONSET VARCHAR2(20) not null,
	TYPE VARCHAR2(20) not null,
	TIME2EXAM INTEGER null,
	IDSUBJECT VARCHAR2(20) not null, constraint EXAMINATIONSET_PK primary key (IDEXAMINATIONSET) ); 

-- Create new table ANSWER.
-- ANSWER : Table of Answer
-- 	IDANS : รหัสคำคอบ
-- 	DESCRIPTION : คำอธิบาย
-- 	CHOOSINGTIME : จำนวนครั้งที่ทำการเลือก
-- 	IDQUESTION : รหัสคำถาม  
create table ANSWER (
	IDANS VARCHAR2(20) not null,
	DESCRIPTION VARCHAR2(200) null,
	CHOOSINGTIME INTEGER null,
	IDQUESTION VARCHAR2(20) null, constraint ANSWER_PK primary key (IDANS) ); 

-- Create new table QUESTION.
-- QUESTION : Table of Question
-- 	IDQUESTION : รหัสคำถาม
-- 	DESCRIPTION : คำอธิบาย
-- 	IDCOLLECTANS : รหัสตัวเลือกที่ถูกต้อง
-- 	TYPE : ชนิดคำถาม
-- 	CREATEDATE : วันที่ทำการสร้าง
-- 	TIME2EXAM : จำนวนครั้งที่ใช้งาน ( จำนวนครั้งที่ผู้ใช้ทำข้อสอบ )
-- 	TIME2HIT : จำนวนครั้งที่นักศึกษาตอบถูก
-- 	RANK : ระดีบคำถาม
-- 	ISENABLE : iค่าเป็น 1 หมายถึง อนุญาติให้ใช้งาน
-- 	IDSUBJECT : รหัสวิชา
-- 	IDTEACHER : รหัสอาจารย์ผู้ออกข้อสอบ  
create table QUESTION (
	IDQUESTION VARCHAR2(20) not null,
	DESCRIPTION VARCHAR2(50) null,
	IDCOLLECTANS VARCHAR2(20) not null,
	TYPE VARCHAR2(20) not null,
	CREATEDATE DATE not null,
	TIME2EXAM INTEGER null,
	TIME2HIT INTEGER null,
	RANK VARCHAR2(20) null,
	ISENABLE VARCHAR2(1) not null,
	IDSUBJECT VARCHAR2(20) not null,
	IDTEACHER VARCHAR2(20) not null, constraint QUESTION_PK primary key (IDQUESTION) ); 

-- Create new table POSTSUBJECT.
-- POSTSUBJECT : Table of PostSubject
-- 	IDNEWS : รหัสข่าว
-- 	IDSUBJECT : รหัสวิชา  
create table POSTSUBJECT (
	IDNEWS VARCHAR2(20) not null,
	IDSUBJECT VARCHAR2(20) not null, constraint POSTSUBJECT_PK primary key (IDNEWS, IDSUBJECT) ); 

-- Create new table POSTSTD.
-- POSTSTD : Table of PostStd
-- 	IDSTUDENT : รหัสนักศึกษา
-- 	IDMSG : รหัสข้อความ
-- 	ISUSED : ค่าเป็น 1 หมายถึง ถูกใช้  
create table POSTSTD (
	IDSTUDENT VARCHAR2(20) not null,
	IDMSG VARCHAR2(20) not null,
	ISUSED CHAR(1) null, constraint POSTSTD_PK primary key (IDSTUDENT, IDMSG) ); 

-- Create new table NEWS.
-- NEWS : Table of News
-- 	IDNEWS : รหัสข่าว
-- 	TOPIC : หัวข้อ
-- 	DESCRIPTION : คำอธิบาย
-- 	DATEPOST : วันที่ประกาศ
-- 	IDPOSTER : รหัสผู้ประกาศ
-- 	NUMDAY2DEL : จำนวนวันที่ให้ทำการลบ
-- 	TYPEPOSTER : ชนิดผู้ประกาศ  
create table NEWS (
	IDNEWS VARCHAR2(20) not null,
	TOPIC VARCHAR2(100) not null,
	DESCRIPTION VARCHAR2(4000) null,
	DATEPOST DATE not null,
	IDPOSTER VARCHAR2(20) not null,
	NUMDAY2DEL INTEGER null,
	TYPEPOSTER VARCHAR2(20) null, constraint NEWS_PK primary key (IDNEWS) ); 

-- Create new table TEXTBOOK.
-- TEXTBOOK : Table of TextBook
-- 	IDTEXTBOOK : รหัสหนังสือเรียน
-- 	NAME : ชื่อ
-- 	AUTHOR : ผู้แต่ง
-- 	PUBLISHER : สำนักพิมพ์
-- 	IDSUBJECT : รหัสวิชา  
create table TEXTBOOK (
	IDTEXTBOOK VARCHAR2(20) not null,
	NAME VARCHAR2(100) not null,
	AUTHOR VARCHAR2(100) null,
	PUBLISHER VARCHAR2(100) null,
	IDSUBJECT VARCHAR2(20) null, constraint TEXTBOOK_PK primary key (IDTEXTBOOK) ); 

-- Create new table TIMETABLE.
-- TIMETABLE : Table of TimeTable
-- 	IDTIMETABLE : รหัสตารางเรียน
-- 	TYPE : ชนิดตารางเรียน (Theory = ทฤษฎี,Action = ปฏิบัติ)
-- 	TOPIC : หัวข้อ
-- 	DESCIPTION : คำอธิบาย
-- 	FILE : ชื่อเอกสารประกอบการเรียน
-- 	IDSUBJECT : รหัสวิชา  
create table TIMETABLE (
	IDTIMETABLE VARCHAR2(20) not null,
	TYPE VARCHAR2(20) not null,
	TOPIC VARCHAR2(100) not null,
	DESCIPTION VARCHAR2(200) null,
	FILE VARCHAR2(200) null,
	IDSUBJECT VARCHAR2(20) not null, constraint TIMETABLE_PK primary key (IDTIMETABLE) ); 

-- Create new table GROUPP.
-- GROUPP : Table of Group
-- 	IDGROUP : รหัสกลุ่ม
-- 	SCORE : คะแนนที่ได้
-- 	FILE : ชื่อไฟล์เอกสาร
-- 	ISCOMPLETE : ค่าเป็น 1 เมื่อมีการส่งงาน หมายถึง งานส่งแล้ว
-- 	IDASSIGNMENT : รหัสงาน
-- 	NAME : ชื่อกลุ่ม  
create table GROUPP (
	IDGROUP VARCHAR2(20) not null,
	SCORE NUMBER(5,2) null,
	FILE VARCHAR2(500) null,
	ISCOMPLETE VARCHAR2(1) null,
	IDASSIGNMENT VARCHAR2(20) null,
	NAME VARCHAR2(100) null, constraint GROUP_PK primary key (IDGROUP) ); 

-- Create new table GROUPING.
-- GROUPING : Table of Grouping
-- 	ISBOSS : ค่าเป็น 1 หมายถึง เป็นหัวหน้ากลุ่ม
-- 	IDSTUDENT : รหัสนักศึกษา
-- 	IDGROUP : รหัสกลุ่ม  
create table GROUPING (
	ISBOSS VARCHAR2(20) null,
	IDSTUDENT VARCHAR2(20) not null,
	IDGROUP VARCHAR2(20) not null, constraint GROUPING_PK primary key (IDSTUDENT, IDGROUP) ); 

-- Create new table ASSIGNMENT.
-- ASSIGNMENT : Table of Assignment
-- 	IDASSIGNMENT : รหัสงาน
-- 	NAME : ชื่อ
-- 	DESCRIPTION : คำอธิบาย
-- 	ASSIGNDATE : วันสั่งงาน
-- 	SENDDATE : วันส่งงาน
-- 	MAXSCORE : คะแนนเต็ม
-- 	FILEDETAIL : ชื่อไฟล์เอกสารประกอบคำอธิบาย
-- 	WARNINGDATE : วันที่ทำการเตือน
-- 	SIZEOFGROUP : จำนวนคนของกลุ่ม
-- 	IDSUBJECT : รหัสวิชา  
create table ASSIGNMENT (
	IDASSIGNMENT VARCHAR2(20) not null,
	NAME VARCHAR2(20) not null,
	DESCRIPTION VARCHAR2(500) null,
	ASSIGNDATE DATE not null,
	SENDDATE DATE not null,
	MAXSCORE INTEGER not null,
	FILEDETAIL VARCHAR2(4000) null,
	WARNINGDATE DATE null,
	SIZEOFGROUP INTEGER not null,
	IDSUBJECT VARCHAR2(20) null, constraint ASSIGNMENT_PK primary key (IDASSIGNMENT) ); 

-- Create new table TEACH.
-- TEACH : Table of Teach
-- 	IDTEACHER : รหัสอาจารย์
-- 	IDSUBJECT : รหัสวิชา  
create table TEACH (
	IDTEACHER VARCHAR2(20) not null,
	IDSUBJECT VARCHAR2(20) not null, constraint TEACH_PK primary key (IDTEACHER, IDSUBJECT) ); 

-- Create new table STUDY.
-- STUDY : Table of Study
-- 	GRADE : เกรด
-- 	QUIZ : คะแนนการทดสอบย่อย
-- 	MIDTERM : คะแนนสอบกลางภาค
-- 	FINAL : คะแนนสอบปลายภาค
-- 	ASSIGNMENT : คะแนนงาน
-- 	LAB : คะแนนภาคปฏิบัติ
-- 	SEC : กลุ่มเรียน
-- 	IDSTUDENT : รหัสนักเรียน
-- 	IDSUBJECT : รหัสวิชา  
create table STUDY (
	GRADE VARCHAR2(1) null,
	QUIZ NUMBER(5,2) null,
	MIDTERM NUMBER(5,2) null,
	FINAL NUMBER(5,2) null,
	ASSIGNMENT NUMBER(5,2) null,
	LAB NUMBER(5,2) null,
	SEC VARCHAR2(1) null,
	IDSTUDENT VARCHAR2(20) not null,
	IDSUBJECT VARCHAR2(20) not null, constraint STUDY_PK primary key (IDSTUDENT, IDSUBJECT) ); 

-- Create new table SUBJECT.
-- SUBJECT : Table of Subject
-- 	IDSUBJECT : รหัสวิชา
-- 	NAME : ชื่อ
-- 	NAMEENG : ชื่อภาษาอังกฤษ
-- 	DESCRIPTION : คำอธิบาย
-- 	CURRICULUM : หลักสูตร
-- 	TYPE : ชนิด
-- 	CREDIT : หน่วยกิจ
-- 	REQUIRESUBJECT : วิชาบังคับก่อน
-- 	TIMESTUDY : เวลาเรียน
-- 	SCALEMIDTERM : สัดส่วนคะแนนกลางภาค
-- 	SCALEFINAL : สัดส่วนคะแนนปลายภาค
-- 	SCALEQUIZ : สัดส่วนคะแนนการทดสอบย่อย
-- 	SCALEASSIGNMENT : สัดส่วนคะแนนงาน
-- 	SCALELAB : สัดส่วนคะแนนภาคปฏิบัติ
-- 	SCALEA : ระดับคะแนนเกรดเอ
-- 	SCALEBB : ระดับคะแนนเกรดบีบวก
-- 	SCALEB : ระดับคะแนนเกรดบี
-- 	SCALECC : ระดับคะแนนเกรดซีบวก
-- 	SCALEC : ระดับคะแนนเกรดซี
-- 	SCALEDD : ระดับคะแนนเกรดดีบวก
-- 	SCALED : ระดับคะแนนเกรดดี
-- 	SCALEF : ระดับคะแนนเกรดเอฟ
-- 	MAGICNUM : รหัสสำหรับยืนยันการเข้าร่วมเรียน
-- 	TEXTBOOK : Textbook is of Subject
-- 	TIMETALKING : Timetalking is of Subject  
create table SUBJECT (
	IDSUBJECT VARCHAR2(20) not null,
	NAME VARCHAR2(200) not null,
	NAMEENG VARCHAR2(200) not null,
	DESCRIPTION VARCHAR2(1000) null,
	CURRICULUM VARCHAR2(20) not null,
	TYPE VARCHAR2(20) not null,
	CREDIT VARCHAR2(10) not null,
	REQUIRESUBJECT VARCHAR2(200) null,
	TIMESTUDY VARCHAR2(1000) null,
	SCALEMIDTERM INTEGER null,
	SCALEFINAL INTEGER not null,
	SCALEQUIZ INTEGER null,
	SCALEASSIGNMENT INTEGER null,
	SCALELAB INTEGER null,
	SCALEA NUMBER(5,2) null,
	SCALEBB NUMBER(5,2) null,
	SCALEB NUMBER(5,2) null,
	SCALECC NUMBER(5,2) null,
	SCALEC NUMBER(5,2) null,
	SCALEDD NUMBER(5,2) null,
	SCALED NUMBER(5,2) null,
	SCALEF NUMBER(5,2) null,
	MAGICNUM VARCHAR2(20) null,
	TEXTBOOK VARCHAR2(1000) null,
	TIMETALKING VARCHAR2(1000) null, constraint SUBJECT_PK primary key (IDSUBJECT) ); 

-- Create new table WEBMASTER.
-- WEBMASTER : Table of WebMaster
-- 	IDWM : รหัสประจำตัว
-- 	PASSWORD : รหัสยืนยันตัว
-- 	NAME : ชื่อ
-- 	SURNAME : นามสกุล
-- 	EMAIL : อีเมลล์
-- 	OLDDAY : วันทำการเข้าระบบครั้งที่ผ่านมา
-- 	NEWDAY : วันทำการเข้าระบบครั้งล่าสุด  
create table WEBMASTER (
	IDWM VARCHAR2(20) not null,
	PASSWORD VARCHAR2(20) not null,
	NAME VARCHAR2(20) not null,
	SURNAME VARCHAR2(30) not null,
	EMAIL VARCHAR2(50) null,
	OLDDAY DATE null,
	NEWDAY DATE null, constraint WEBMASTER_PK primary key (IDWM) ); 

-- Create new table STUDENT.
-- STUDENT : Table of Student
-- 	IDSTUDENT : รหัสประจำตัว
-- 	PASSWORD : รหัสยืนยันตัว
-- 	NAME : ชื่อ
-- 	SURNAME : นามสกุล
-- 	NICKNAME : ชื่อเล่น
-- 	COURSE : หลักสูตร
-- 	SEX : เพศ
-- 	EMAIL : อีเมลล์
-- 	TEL : เบอร์โทรศัพท์
-- 	MOBILE : เบอร์โทรศัพท์มือถือ
-- 	ICQ : เบอร์ไอซีคิว
-- 	OLDDAY : วันทำการเข้าระบบครั้งที่ผ่านมา
-- 	NEWDAY : วันทำการเข้าระบบครั้งล่าสุด  
create table STUDENT (
	IDSTUDENT VARCHAR2(20) not null,
	PASSWORD VARCHAR2(20) not null,
	NAME VARCHAR2(20) not null,
	SURNAME VARCHAR2(30) not null,
	NICKNAME VARCHAR2(20) null,
	COURSE VARCHAR2(100) not null,
	SEX VARCHAR2(1) not null,
	EMAIL VARCHAR2(50) null,
	TEL VARCHAR2(20) null,
	MOBILE VARCHAR2(20) null,
	ICQ VARCHAR2(30) null,
	OLDDAY DATE null,
	NEWDAY DATE null, constraint STUDENT_PK primary key (IDSTUDENT) ); 

-- Create new table TEACHER.
-- TEACHER : Table of Teacher
-- 	IDTEACHER : รหัสประจำตัว
-- 	PASSWORD : รหัสยืนยันตัว
-- 	NAME : ชื่อ
-- 	SURNAME : นามสกุล
-- 	EMAIL : อีเมลล์
-- 	TEL : เบอร์โทรศัพท์
-- 	LINK : ลิงค์ส่วนตัว
-- 	QUALIFICATION : ประวัติการศึกษา
-- 	RESEARCH : ผลงานวืจัย
-- 	DUTY : หน้าที่การสอน
-- 	DUTYTIME : เวลาสอน
-- 	MEETINGTIME : เวลาเข้าพบ
-- 	INTERESTING : ความสนใจ
-- 	EXP : ประสบการณ์
-- 	CONTACTROOM : เวลาเข้าพบ
-- 	OLDDAY : วันทำการเข้าระบบครั้งที่ผ่านมา
-- 	NEWDAY : วันทำการเข้าระบบครั้งล่าสุด
-- 	PICTURE : ชื่อรูปภาพ  
create table TEACHER (
	IDTEACHER VARCHAR2(20) not null,
	PASSWORD VARCHAR2(20) not null,
	NAME VARCHAR2(20) not null,
	SURNAME VARCHAR2(30) not null,
	EMAIL VARCHAR2(50) null,
	TEL VARCHAR2(20) null,
	LINK VARCHAR2(100) null,
	QUALIFICATION VARCHAR2(500) null,
	RESEARCH VARCHAR2(500) null,
	DUTY VARCHAR2(300) null,
	DUTYTIME VARCHAR2(300) null,
	MEETINGTIME VARCHAR2(300) null,
	INTERESTING VARCHAR2(300) null,
	EXP VARCHAR2(300) null,
	CONTACTROOM VARCHAR2(20) null,
	OLDDAY DATE null,
	NEWDAY DATE null,
	PICTURE VARCHAR2(300) null, constraint TEACHER_PK primary key (IDTEACHER) ); 

-- Add foreign key constraints to table MESSAGE.
alter table MESSAGE
	add constraint GROUP_MESSAGE_FK1 foreign key (
		IDGROUP)
	 references GROUPP (
		IDGROUP); 

-- Add foreign key constraints to table REPLYWB.
alter table REPLYWB
	add constraint TOPICWB_REPLYWB_FK1 foreign key (
		IDTOPIC)
	 references TOPICWB (
		IDTOPIC); 

-- Add foreign key constraints to table TOPICWB.
alter table TOPICWB
	add constraint SUBJECT_TOPICWB_FK1 foreign key (
		IDSUBJECT)
	 references SUBJECT (
		IDSUBJECT); 

-- Add foreign key constraints to table REMIND.
alter table REMIND
	add constraint STUDENT_REMIND_FK1 foreign key (
		IDUSER)
	 references STUDENT (
		IDSTUDENT); 

alter table REMIND
	add constraint TYPEREMIND_REMIND_FK1 foreign key (
		TYPEREMIND)
	 references TYPEREMIND (
		TYPEREMIND); 

-- Add foreign key constraints to table DOEXAM.
alter table DOEXAM
	add constraint EXAM_DOEXAM_FK1 foreign key (
		IDEXAM)
	 references EXAM (
		IDEXAM); 

alter table DOEXAM
	add constraint STUDENT_DOEXAM_FK1 foreign key (
		IDSTUDENT)
	 references STUDENT (
		IDSTUDENT); 

-- Add foreign key constraints to table EXAMRANK.
alter table EXAMRANK
	add constraint SUBJECT_EXAMRANK_FK1 foreign key (
		IDSUBJECT)
	 references SUBJECT (
		IDSUBJECT); 

-- Add foreign key constraints to table EXAM.
alter table EXAM
	add constraint SUBJECT_EXAM_FK1 foreign key (
		IDSUBJECT)
	 references SUBJECT (
		IDSUBJECT); 

alter table EXAM
	add constraint EXAMINATIONSET_EXAM_FK1 foreign key (
		IDEXAMINATIONSET)
	 references EXAMINATIONSET (
		IDEXAMINATIONSET); 

-- Add foreign key constraints to table QUESTIONOFPART.
alter table QUESTIONOFPART
	add constraint PART_QUESTIONOFPART_FK1 foreign key (
		IDPART)
	 references PART (
		IDPART); 

alter table QUESTIONOFPART
	add constraint QUESTION_QUESTIONOFPART_FK1 foreign key (
		IDQUESTION)
	 references QUESTION (
		IDQUESTION); 

-- Add foreign key constraints to table PART.
alter table PART
	add constraint TYPEPART_PART_FK1 foreign key (
		TYPE)
	 references TYPEPART (
		TYPE); 

alter table PART
	add constraint EXAMINATIONSET_PART_FK1 foreign key (
		IDEXAMINATIONSET)
	 references EXAMINATIONSET (
		IDEXAMINATIONSET); 

-- Add foreign key constraints to table EXAMINATIONSET.
alter table EXAMINATIONSET
	add constraint SUBJECT_EXAMINATIONSET_FK1 foreign key (
		IDSUBJECT)
	 references SUBJECT (
		IDSUBJECT); 

-- Add foreign key constraints to table ANSWER.
alter table ANSWER
	add constraint QUESTION_ANSWER_FK1 foreign key (
		IDQUESTION)
	 references QUESTION (
		IDQUESTION); 

-- Add foreign key constraints to table QUESTION.
alter table QUESTION
	add constraint SUBJECT_QUESTION_FK1 foreign key (
		IDSUBJECT)
	 references SUBJECT (
		IDSUBJECT); 

alter table QUESTION
	add constraint TEACHER_QUESTION_FK1 foreign key (
		IDTEACHER)
	 references TEACHER (
		IDTEACHER); 

-- Add foreign key constraints to table POSTSUBJECT.
alter table POSTSUBJECT
	add constraint NEWS_POSTSUBJECT_FK1 foreign key (
		IDNEWS)
	 references NEWS (
		IDNEWS); 

alter table POSTSUBJECT
	add constraint SUBJECT_POSTSUBJECT_FK1 foreign key (
		IDSUBJECT)
	 references SUBJECT (
		IDSUBJECT); 

-- Add foreign key constraints to table POSTSTD.
alter table POSTSTD
	add constraint STUDENT_POSTSTD_FK1 foreign key (
		IDSTUDENT)
	 references STUDENT (
		IDSTUDENT); 

alter table POSTSTD
	add constraint MESSAGE_POSTSTD_FK1 foreign key (
		IDMSG)
	 references MESSAGE (
		IDMSG); 

-- Add foreign key constraints to table TEXTBOOK.
alter table TEXTBOOK
	add constraint SUBJECT_TEXTBOOK_FK1 foreign key (
		IDSUBJECT)
	 references SUBJECT (
		IDSUBJECT); 

-- Add foreign key constraints to table TIMETABLE.
alter table TIMETABLE
	add constraint SUBJECT_TIMETABLE_FK1 foreign key (
		IDSUBJECT)
	 references SUBJECT (
		IDSUBJECT); 

-- Add foreign key constraints to table GROUPP.
alter table GROUPP
	add constraint ASSIGNMENT_GROUP_FK1 foreign key (
		IDASSIGNMENT)
	 references ASSIGNMENT (
		IDASSIGNMENT); 

-- Add foreign key constraints to table GROUPING.
alter table GROUPING
	add constraint STUDENT_GROUPING_FK1 foreign key (
		IDSTUDENT)
	 references STUDENT (
		IDSTUDENT); 

alter table GROUPING
	add constraint GROUP_GROUPING_FK1 foreign key (
		IDGROUP)
	 references GROUPP (
		IDGROUP); 

-- Add foreign key constraints to table ASSIGNMENT.
alter table ASSIGNMENT
	add constraint SUBJECT_ASSIGNMENT_FK1 foreign key (
		IDSUBJECT)
	 references SUBJECT (
		IDSUBJECT); 

-- Add foreign key constraints to table TEACH.
alter table TEACH
	add constraint TEACHER_TEACH_FK1 foreign key (
		IDTEACHER)
	 references TEACHER (
		IDTEACHER); 

alter table TEACH
	add constraint SUBJECT_TEACH_FK1 foreign key (
		IDSUBJECT)
	 references SUBJECT (
		IDSUBJECT); 

-- Add foreign key constraints to table STUDY.
alter table STUDY
	add constraint STUDENT_STUDY_FK1 foreign key (
		IDSTUDENT)
	 references STUDENT (
		IDSTUDENT); 

alter table STUDY
	add constraint SUBJECT_STUDY_FK1 foreign key (
		IDSUBJECT)
	 references SUBJECT (
		IDSUBJECT); 


-- This is the end of the Microsoft Visual Studio generated SQL DDL script.
