CREATE TABLE Customer (
       Customer_ID          NUMBER NOT NULL,
       Username             VARCHAR2(30) NULL,
       Password             VARCHAR2(30) NULL,
       M_name               VARCHAR2(30) NULL,
       M_surname            VARCHAR2(30) NULL,
       M_birthdate          VARCHAR2(20) NULL,
       M_phone              VARCHAR2(11) NULL,
       M_address            VARCHAR2(100) NULL,
       M_email              VARCHAR2(50) NULL,
       F_name               VARCHAR2(30) NULL,
       F_surname            VARCHAR2(30) NULL,
       F_birthdate          VARCHAR2(20) NULL,
       F_phone              VARCHAR2(11) NULL,
       F_address            VARCHAR2(100) NULL,
       F_email              VARCHAR2(50) NULL
);

ALTER TABLE Customer
       ADD  ( PRIMARY KEY (Customer_ID) ) ;




CREATE TABLE Olala_wedding_Contact (
       Wedding_Contact_ID       NUMBER NOT NULL,
       Customer_ID          NUMBER NOT NULL,
       DeadLine             VARCHAR2(30) NULL,
       Wedding_Contact_Name     VARCHAR2(30) NULL,
       Wedding_Allprice     NUMBER NULL
);


ALTER TABLE Olala_wedding_Contact
       ADD  ( PRIMARY KEY (Wedding_Contact_ID) ) ;



CREATE TABLE Photo (
       Photo_name           VARCHAR2(30) NOT NULL,
       Photo_ID             NUMBER NULL,
       Pphone               VARCHAR2(11) NULL,
       Paddress             VARCHAR2(100) NULL,
       Pusername            VARCHAR2(20) NULL,
       Ppassword            VARCHAR2(20) NULL,
       PCust_ID              NUMBER NULL
);
ALTER TABLE PHOTO 
 ADD (
  PROVINCE INTEGER,
  DISTRICT INTEGER
 );


CREATE TABLE Photo_Contact (
       Photo_Contact_ID     NUMBER NOT NULL,
       Wedding_Contact_ID       NUMBER NOT NULL,
       Customer_ID          NUMBER NOT NULL,
       Photo_ID             NUMBER NOT NULL,
       Photo_Allprice       NUMBER NULL
);

CREATE TABLE Photoinwedding_service (
       Photoinwedding_Job_ID NUMBER NOT NULL,
       Photo_Contact_ID     NUMBER NOT NULL,
       Wedding_Contact_ID       NUMBER NOT NULL,
       Customer_ID          NUMBER NOT NULL,
       Photo_ID             NUMBER NOT NULL,
       Photoinwedding_price NUMBER NULL
);

CREATE TABLE Photoinstudio_service (
       Photoinstudio_Job_ID NUMBER NOT NULL,
       Photo_Contact_ID     NUMBER NOT NULL,
       Wedding_Contact_ID   NUMBER NOT NULL,
       Customer_ID          NUMBER NOT NULL,
       Photo_ID             NUMBER NOT NULL,
       Photoinstudio_price  NUMBER NULL
);

CREATE TABLE Photomulti_service (
       Photomulti_Job_ID    NUMBER NOT NULL,
       Photo_Contact_ID     NUMBER NOT NULL,
       Wedding_Contact_ID   NUMBER NOT NULL,
       Customer_ID          NUMBER NOT NULL,
       Photo_ID             NUMBER NOT NULL,
       Photomulti_price     NUMBER NULL
);

ALTER TABLE Photo
       ADD  ( PRIMARY KEY (Photo_ID) ) ;
ALTER TABLE Photo_Contact
       ADD  ( PRIMARY KEY (Photo_Contact_ID) ) ;
ALTER TABLE Photoinwedding_service
       ADD  ( PRIMARY KEY (Photoinwedding_Job_ID) ) ;
ALTER TABLE Photoinstudio_service
       ADD  ( PRIMARY KEY (Photoinstudio_Job_ID) ) ;
ALTER TABLE Photovdo_service
       ADD  ( PRIMARY KEY (Photovdo_Job_ID) ) ;
ALTER TABLE Photomulti_service
       ADD  ( PRIMARY KEY (Photomulti_Job_ID) ) ;

SELECT * FROM PHOTovdo_service;
select * from photomulti_service;
select * from photoinstudio_service;
select * from Photoinwedding_service;
SELECT * FROM PHOTO_CONTACT
select * from photo
select * from coordinate
select * from province
SELECT * FROM PHOTOINSTUDIO_SERVICE
SELECT * FROM PHOTOINWEDDING_SERVICE
SELECT * FROM PHOTOMULTI_SERVICE


SELECT * FROM OLALA_WEDDING_CONTACT
SELECT * FROM CUSTOMER
--update olala_wedding_contact set deadline='0' 

--delete photoinstudio_service
--delete photo_contact
--delete photoinwedding_service
--delete photomulti_service
delete  photo_contact where photo_contact_id=22

commit

drop table photovdo_service


select * from gift_contact


DROP TABLE PHOTO;
DROP TABLE PHOTO_CONTACT;
DROP TABLE PHOTOINSTUDIO_SERVICE;
DROP TABLE PHOTOMULTI_SERVICE;
DROP TABLE PHOTOINWEDDING_SERVICE;

COMMIT
select * from customer
UPDATE PHOTO SET PROVINCE=18,DISTRICT=38 WHERE PHOTO_ID=1;
UPDATE PHOTO SET PROVINCE=18,DISTRICT=22 WHERE PHOTO_ID=2;
UPDATE PHOTO SET PROVINCE=18,DISTRICT=27 WHERE PHOTO_ID=3;
UPDATE PHOTO SET PROVINCE=18,DISTRICT=9  WHERE PHOTO_ID=4;
UPDATE PHOTO SET PROVINCE=18,DISTRICT=14 WHERE PHOTO_ID=5;
UPDATE PHOTO SET PROVINCE=2 ,DISTRICT=0  WHERE PHOTO_ID=6;
UPDATE PHOTO SET PROVINCE=3 ,DISTRICT=0  WHERE PHOTO_ID=7;
UPDATE PHOTO SET PROVINCE=39,DISTRICT=0  WHERE PHOTO_ID=8;
UPDATE PHOTO SET PROVINCE=48,DISTRICT=0  WHERE PHOTO_ID=9;
UPDATE PHOTO SET PROVINCE=74,DISTRICT=0  WHERE PHOTO_ID=10;

SELECT * FROM PHOTO





------------------------------------------------------------------------


create sequence autonumber;

select autocust_id.nextval from dual;
select autowedding_contact.nextval from dual;

create table TEST2 (FNAME varchar(20),FSURNAME varchar(20),STARTDATE date);

insert into TEST2 (FNAME,FSURNAME,STARTDATE) values ('roj250','ishi250',TO_DATE('10-01-46','DD-MM-YY'));

create sequence autocust_id;
create sequence autowedding_contact;
drop sequence autocust_id;
drop sequence autowedding_contact;

drop sequence autocust_id;
select count(*) from CUSTOMER where username = 'rojpic' and password = 'password';

INSERT INTO Customer (CUSTOMER_ID,USERNAME,PASSWORD,M_NAME,M_SURNAME,M_BIRTHDATE,M_PHONE,M_ADDRESS,M_EMAIL,F_NAME,F_SURNAME,F_BIRTHDATE,F_PHONE,F_ADDRESS,F_EMAIL) values (1,'roj250','ishi250','ROJ','250',TO_DATE('10-01-03','DD-MM-YY'),023615096,'12345','roj250@yahoo.com','ROJ','250',TO_DATE('10-01-03','DD-MM-YY'),023615096,'12345','roj250@yahoo.com');
SELECT * FROM PHOTO
commit;
select * from coordinate
select * from photo
sel
select * from olala_wedding_contact

select * from gift_service
delete gift_service where wedding_contact_id = 1

select * from gift_contact where wedding_contact_id = 1
select * from hotel_contact where wedding_contact_id = 1
select * from tour_contact where wedding_contact_id = 1
select * from photo_contact where wedding_contact_id = 1
select * from entertain_contact where wedding_contact_id = 1

delete gift_service where wedding_contact_id = 1
delete gift_contact where wedding_contact_id = 1

delete entertain_service where wedding_contact_id = 1
delete entertain_contact where wedding_contact_id = 1

delete tour_service where wedding_contact_id = 1
delete tour_contact where wedding_contact_id = 1

delete photoinstudio_service where wedding_contact_id = 1
delete photovdo_service where wedding_contact_id = 1
delete photomulti_service where wedding_contact_id = 1
delete photoinwedding_service where wedding_contact_id = 1
delete photo_contact where wedding_contact_id = 1

delete cake_service where wedding_contact_id = 1
delete food_service where wedding_contact_id = 1
delete flower_service where wedding_contact_id = 1
delete room_service where wedding_contact_id = 1
delete seminar_service where wedding_contact_id = 1
delete hotel_contact where wedding_contact_id = 1

select * from tour
select * from hotel
select * from photo

