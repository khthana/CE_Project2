--INSERT INTO MEDICINE
insert into medicine values	(0,
			"set{row('para',1979-3-4 10:00,9999-12-31 23:59)}",
			'para-rofitofobic',
			'eat',
			'sanguan',
			"set{row(20,1979-3-4 10:00,1980-4-8 12:45),row(50,1980-4-8 12:45,9999-12-31 23:59)}"
			);

insert into medicine values	(0,
			"set{row('Jinjeng Powder',1950-8-4 11:00,1978-10-21 14:50),row('Jinjing',1978-10-21 14:50,9999-12-31 23:59)}",
			'Jing Tero Democritic',
			'anoint',
			'ChunChom',
			"set{row(100,1950-8-4 11:00,1980-4-8 12:45),row(1000,1980-4-8 12:45,9999-12-31 23:59)}"
			);


insert into medicine values	(0,
			"set{row('Vanna',1920-7-1 17:00,1950-8-21 14:45),row('Vandana',1950-8-21 14:45,9999-12-31 23:59)}",
			'Van dino tero acritic',
			'sniff',
			'ChunChom',
			"set{row(10,1920-7-1 17:00,1925-7-3 7:45),row(150,1925-7-3 7:45,1935-2-1 5:12),row(50,1935-2-1 5:12,9999-12-31 23:59)}"
			);

--INSERT INTO DISEASE
insert into disease values	(0,
			"set{row('diphtheria',1930-4-12 10:00,9999-12-31 23:59)}",
			'crimotogoropotogenus',
			'virus',
			'himogotozeus'
			);

insert into disease values	(0,
			"set{row('mala',1920-5-10 10:00,1930-5-4 12:50),row('malaria',1930-5-4 12:50,9999-12-31 23:59)}",
			'forestoria',
			'virus',
			'hermitogeus'
			);

insert into disease values	(0,
			"set{row('diplomatic illness',1950-12-10 10:01,1975-8-6 12:50),row('political illness',1975-8-6 12:50,9999-12-31 23:59)}",
			'politic',
			'politician',
			'politician'
			);

--INSERT INTO LAB_NUMBER
insert into lab_number values	(0,
			'Sodium',
			135,
			145,
			'mEq/L',
			"set{row(10,1978-12-4 10:10,1990-4-9 10:00),row(15,1990-4-9 10:00,9999-12-31 23:59)}"
			);

insert into lab_number values	(0,
			'ALT(SGPT)',
			0,
			40,
			'U/L',
			"set{row(50,1976-12-4 22:10,1994-4-9 10:00),row(80,1994-4-9 10:00,9999-12-31 23:59)}"
			);
			
insert into lab_number values	(0,
			'Calcium',
			8,
			10,
			'mg/dl',
			"set{row(100,1976-12-4 22:10,9999-12-31 23:59)}"
			);

--INSERT INTO LAB_CHAR
insert into lab_char values	(0,
			'Blood group ABO',
			"set{row(20,1950-4-6 10:00,1956-7-8 11:12),row(25,1956-7-8 11:12,9999-12-31 23:59)}"
			);

insert into lab_char values	(0,
			'G-6-PD',
			"set{row(27,1950-4-6 10:10,1956-7-8 11:40),row(50,1956-7-8 11:40,9999-12-31 23:59)}"
			);

insert into lab_char values	(0,
			'Normochromia',
			"set{row(100,1940-8-6 10:00,9999-12-31 23:59)}"
			);

--INSERT INTO LAB_PHOTO
insert into lab_photo values	(0,
			'X-ray',
			"set{row(100,1980-5-7 10:00,1990-4-8 10:00),row(250,1990-4-8 10:00,9999-12-31 23:59)}"
			);

insert into lab_photo values	(0,
			'Ultrasound',
			"set{row(300,1985-7-7 10:00,1997-4-8 10:00),row(500,1997-4-8 10:00,9999-12-31 23:59)}"
			);

insert into lab_photo values	(0,
			'Brain x-ray',
			"set{row(1000,1996-5-7 10:00,9999-12-31 23:59)}"
			);

--INSERT INTO DOCTOR
insert into doctor values	(0,
			"set{row('Panop',1978-4-5 11:00,9999-12-31 23:59)}",
			"set{row('Rumo',1978-4-5 11:00,1994-7-5 10:00),row('Kito',1994-7-5 10:00,9999-12-31 23:59)}",
			'm',
			"set{row('apprenticed',1978-4-5 10:00,1980-8-5 10:00),row('specialist',1980-8-5 10:00,9999-12-31 23:59)}",
			'surgeon',
			"set{row(200,1978-4-5 10:00,1980-8-5 10:00),row(550,1980-8-5 10:00,9999-12-31 23:59)}"
			);
			
insert into doctor values	(0,
			"set{row('Michelle',1975-4-5 11:00,1990-8-7 10:00),row('Risa',1990-8-7 10:00,9999-12-31 23:59)}",
			"set{row('W.derberto',1975-4-5 11:00,9999-12-31 23:59)}",
			'f',
			"set{row('specialist',1975-4-5 10:00,1990-5-5 10:00),row('professional',1990-5-5 10:00,9999-12-31 23:59)}",
			'abstetrician',
			"set{row(400,1975-4-5 10:00,1990-5-5 10:00),row(900,1990-5-5 10:00,9999-12-31 23:59)}"
			);			

--INSERT INTO ADMISSION_PACKAGE
insert into admission_package values	(0,
				'Economic',
				"set{row(500,1960-5-4 10:00,1990-6-9 10:00),row(700,1990-6-9 10:00,9999-12-31 23:59)}"
				);

insert into admission_package values	(0,
				'Private',
				"set{row(1000,1980-6-7 10:00,9999-12-31 23:59)}"
				);

insert into admission_package values	(0,
				'First-class',
				"set{row(1500,1982-5-3 10:10,1993-4-8 10:10),row(1800,1993-4-8 10:10,9999-12-31 23:59)}"
				);

insert into admission_package values	(0,
				'Luxurious',
				"set{row(2500,1997-5-7 10:10,9999-12-31 23:59)}"
				);



--INSERT INTO ROOM
insert into room values	(0,
			"set{row(900,1997-5-8 10:00,1998-6-8 10:00),row(1500,1998-6-8 10:00,9999-12-31 23:59)}"
			);
insert into room values	(0,
			"set{row(1200,1997-5-8 10:00,1998-6-8 10:00),row(2000,1998-6-8 10:00,9999-12-31 23:59)}"
			);
