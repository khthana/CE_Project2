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



CREATE TABLE Tour (
       Tour_ID              NUMBER NOT NULL,
       Tour_name            VARCHAR2(30) NOT NULL,
       Taddress             VARCHAR2(100) NULL,
       Tphone               VARCHAR2(11) NULL,
       Tusername            VARCHAR2(20) NULL,
       Tpassword            VARCHAR2(20) NULL,
       Tcust_ID              NUMBER NULL  
);

CREATE TABLE Tour_Contact (
       Tour_Contact_ID      NUMBER NOT NULL,
       Wedding_Contact_ID   NUMBER NOT NULL,
       Customer_ID          NUMBER NOT NULL,
       Tour_ID              NUMBER NOT NULL,
       Tour_Allprice        NUMBER NULL
);

CREATE TABLE Tour_service (
       Tour_Job_ID          NUMBER NOT NULL,
       Tour_Contact_ID      NUMBER NOT NULL,
       Wedding_Contact_ID   NUMBER NOT NULL,
       Customer_ID          NUMBER NOT NULL,
       Tour_ID              NUMBER NOT NULL,
       Tour_price           NUMBER NULL
);

ALTER TABLE Tour
       ADD  ( PRIMARY KEY (Tour_name) ) ;
ALTER TABLE Tour_Contact
       ADD  ( PRIMARY KEY (Tour_Contact_ID)) ;
ALTER TABLE Tour_service
       ADD  ( PRIMARY KEY (Tour_Job_ID) ) ;
drop table tour
drop table tour_service
drop table tour_contact

SELECT * FROM TOUR
SELECT * FROM TOUR_CONTACT
SELECT * FROM TOUR_SERVICE
SELECT * FROM OLALA_WEDDING_CONTACT
SELECT * FROM CUSTOMER
select * from entertain_contact

delete tour_contact
delete tour_service
delete tour where tour_id=5
commit
