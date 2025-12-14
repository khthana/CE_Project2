-- phpMyAdmin SQL Dump
-- version 2.6.2-pl1
-- http://www.phpmyadmin.net
-- 
-- โฮสต์: localhost
-- เวลาในการสร้าง: 15 มี.ค. 2006  น.
-- รุ่นของเซิร์ฟเวอร์: 4.1.12
-- รุ่นของ PHP: 5.0.4
-- 
-- ฐานข้อมูล: `project`
-- 

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `authorities_new`
-- 

DROP TABLE IF EXISTS `authorities_new`;
CREATE TABLE IF NOT EXISTS `authorities_new` (
  `faculty_id` char(2) NOT NULL default '',
  `dept_id` char(2) NOT NULL default '',
  `authorities_id` varchar(8) character set tis620 NOT NULL default '',
  `authorities_name` varchar(60) NOT NULL default '',
  `a_status` int(1) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- dump ตาราง `authorities_new`
-- 

INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '01', '01000005', 'b1', 1);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '01', '01000004', 'b2', 1);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '01', '01000003', 'b3', 1);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '01', '01000002', 'b4', 1);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '01', '01000001', 'b5', 1);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '01', '01000006', 'b6', 1);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '01', '01000007', 'b7', 0);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '01', '01000008', 'b8', 0);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '01', '01000009', 'b9', 0);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '01', '01000010', 'b10', 0);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '01', '01000011', 'b11', 0);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '05', '07000013', 'b12', 1);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '05', '07000014', 'b13', 1);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '05', '07000015', 'b14', 1);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '05', '07000016', 'b15', 1);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '05', '07000017', 'b16', 1);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '05', '07000018', 'b17', 1);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '05', '07000019', 'b18', 1);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '05', '07000020', 'b19', 0);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '05', '07000021', 'b20', 0);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '05', '07000022', 'b21', 0);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '03', '03000023', 'b22', 0);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '03', '03000023', 'b23', 0);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '03', '03000024', 'b24', 0);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '03', '03000025', 'b25', 0);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '03', '03000026', 'b26', 0);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '03', '03000027', 'b27', 0);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '03', '03000028', 'b28', 0);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '03', '03000029', 'b29', 0);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '03', '03000030', 'b30', 0);
INSERT INTO `authorities_new` (`faculty_id`, `dept_id`, `authorities_id`, `authorities_name`, `a_status`) VALUES ('01', '03', '03000031', 'gewfw .oi;kil', 0);

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `code_subject_dept`
-- 

DROP TABLE IF EXISTS `code_subject_dept`;
CREATE TABLE IF NOT EXISTS `code_subject_dept` (
  `faculty_id` char(2) NOT NULL default '',
  `dept_id` char(2) NOT NULL default '',
  `code` varchar(4) NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- dump ตาราง `code_subject_dept`
-- 

INSERT INTO `code_subject_dept` (`faculty_id`, `dept_id`, `code`) VALUES ('01', '01', '0101');
INSERT INTO `code_subject_dept` (`faculty_id`, `dept_id`, `code`) VALUES ('01', '02', '0102');
INSERT INTO `code_subject_dept` (`faculty_id`, `dept_id`, `code`) VALUES ('01', '03', '0104');
INSERT INTO `code_subject_dept` (`faculty_id`, `dept_id`, `code`) VALUES ('01', '04', '0108');
INSERT INTO `code_subject_dept` (`faculty_id`, `dept_id`, `code`) VALUES ('01', '05', '0107');
INSERT INTO `code_subject_dept` (`faculty_id`, `dept_id`, `code`) VALUES ('01', '06', '0105');
INSERT INTO `code_subject_dept` (`faculty_id`, `dept_id`, `code`) VALUES ('01', '07', '0106');
INSERT INTO `code_subject_dept` (`faculty_id`, `dept_id`, `code`) VALUES ('01', '08', '0109');
INSERT INTO `code_subject_dept` (`faculty_id`, `dept_id`, `code`) VALUES ('01', '09', '0110');
INSERT INTO `code_subject_dept` (`faculty_id`, `dept_id`, `code`) VALUES ('01', '10', '1022');
INSERT INTO `code_subject_dept` (`faculty_id`, `dept_id`, `code`) VALUES ('01', '11', '0111');
INSERT INTO `code_subject_dept` (`faculty_id`, `dept_id`, `code`) VALUES ('01', '12', '0123');
INSERT INTO `code_subject_dept` (`faculty_id`, `dept_id`, `code`) VALUES ('01', '14', '0121');
INSERT INTO `code_subject_dept` (`faculty_id`, `dept_id`, `code`) VALUES ('01', '13', '0100');

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `exam_room`
-- 

DROP TABLE IF EXISTS `exam_room`;
CREATE TABLE IF NOT EXISTS `exam_room` (
  `exam_date` date NOT NULL default '0000-00-00',
  `exam_time` time NOT NULL default '00:00:00',
  `faculty_id` char(2) character set tis620 NOT NULL default '',
  `dept_id` char(2) character set tis620 NOT NULL default '',
  `subject_id` varchar(8) character set tis620 NOT NULL default '',
  `building_no` varchar(10) character set tis620 NOT NULL default '',
  `room_no` varchar(10) character set tis620 NOT NULL default '',
  `line` char(1) NOT NULL default '',
  `amount_std` int(4) NOT NULL default '0',
  `Control_ID1` varchar(10) character set tis620 NOT NULL default '',
  `Control_ID2` varchar(10) character set tis620 NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- dump ตาราง `exam_room`
-- 

INSERT INTO `exam_room` (`exam_date`, `exam_time`, `faculty_id`, `dept_id`, `subject_id`, `building_no`, `room_no`, `line`, `amount_std`, `Control_ID1`, `Control_ID2`) VALUES ('2006-02-20', '09:30:00', '01', '01', '01010001', 'ECC', 'ECC-202', '1', 75, '', '');
INSERT INTO `exam_room` (`exam_date`, `exam_time`, `faculty_id`, `dept_id`, `subject_id`, `building_no`, `room_no`, `line`, `amount_std`, `Control_ID1`, `Control_ID2`) VALUES ('2006-02-20', '09:30:00', '01', '01', '01010002', 'ECC', 'ECC-201', '1', 60, '', '');
INSERT INTO `exam_room` (`exam_date`, `exam_time`, `faculty_id`, `dept_id`, `subject_id`, `building_no`, `room_no`, `line`, `amount_std`, `Control_ID1`, `Control_ID2`) VALUES ('2006-02-20', '09:30:00', '01', '05', '01070001', 'ECC', 'ECC-601', '1', 60, '', '');
INSERT INTO `exam_room` (`exam_date`, `exam_time`, `faculty_id`, `dept_id`, `subject_id`, `building_no`, `room_no`, `line`, `amount_std`, `Control_ID1`, `Control_ID2`) VALUES ('2006-02-20', '09:30:00', '01', '05', '01070001', 'ECC', 'ECC-602', '1', 48, '', '');
INSERT INTO `exam_room` (`exam_date`, `exam_time`, `faculty_id`, `dept_id`, `subject_id`, `building_no`, `room_no`, `line`, `amount_std`, `Control_ID1`, `Control_ID2`) VALUES ('2006-02-20', '09:30:00', '01', '05', '01070001', 'ECC', 'ECC-603', '1', 42, '', '');
INSERT INTO `exam_room` (`exam_date`, `exam_time`, `faculty_id`, `dept_id`, `subject_id`, `building_no`, `room_no`, `line`, `amount_std`, `Control_ID1`, `Control_ID2`) VALUES ('2006-02-20', '09:30:00', '01', '05', '01070006', 'ECC', 'ECC-603', '2', 50, '', '');
INSERT INTO `exam_room` (`exam_date`, `exam_time`, `faculty_id`, `dept_id`, `subject_id`, `building_no`, `room_no`, `line`, `amount_std`, `Control_ID1`, `Control_ID2`) VALUES ('2006-02-21', '09:30:00', '01', '01', '01010005', 'ECC', 'ECC-201', '2', 50, '', '');
INSERT INTO `exam_room` (`exam_date`, `exam_time`, `faculty_id`, `dept_id`, `subject_id`, `building_no`, `room_no`, `line`, `amount_std`, `Control_ID1`, `Control_ID2`) VALUES ('2006-02-21', '09:30:00', '01', '01', '01010006', 'ECC', 'ECC-202', '2', 45, '', '');
INSERT INTO `exam_room` (`exam_date`, `exam_time`, `faculty_id`, `dept_id`, `subject_id`, `building_no`, `room_no`, `line`, `amount_std`, `Control_ID1`, `Control_ID2`) VALUES ('2006-02-21', '09:30:00', '01', '05', '01070002', 'ECC', 'ECC-601', '2', 50, '', '');
INSERT INTO `exam_room` (`exam_date`, `exam_time`, `faculty_id`, `dept_id`, `subject_id`, `building_no`, `room_no`, `line`, `amount_std`, `Control_ID1`, `Control_ID2`) VALUES ('2006-02-21', '09:30:00', '01', '05', '01070005', 'L', 'L-101', '1', 50, '', '');
INSERT INTO `exam_room` (`exam_date`, `exam_time`, `faculty_id`, `dept_id`, `subject_id`, `building_no`, `room_no`, `line`, `amount_std`, `Control_ID1`, `Control_ID2`) VALUES ('2006-02-21', '13:00:00', '01', '01', '01010008', 'L', 'L-102', '1', 60, '', '');
INSERT INTO `exam_room` (`exam_date`, `exam_time`, `faculty_id`, `dept_id`, `subject_id`, `building_no`, `room_no`, `line`, `amount_std`, `Control_ID1`, `Control_ID2`) VALUES ('2006-02-21', '13:00:00', '01', '01', '01010007', 'L', 'L-102', '2', 60, '', '');
INSERT INTO `exam_room` (`exam_date`, `exam_time`, `faculty_id`, `dept_id`, `subject_id`, `building_no`, `room_no`, `line`, `amount_std`, `Control_ID1`, `Control_ID2`) VALUES ('2006-02-21', '13:00:00', '01', '05', '01070003', 'ECC', 'ECC-501', '1', 50, '', '');

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `faculty`
-- 

DROP TABLE IF EXISTS `faculty`;
CREATE TABLE IF NOT EXISTS `faculty` (
  `faculty_id` char(2) NOT NULL default '0',
  `faculty_name` varchar(80) NOT NULL default '',
  `faculty_ename` varchar(80) NOT NULL default '',
  PRIMARY KEY  (`faculty_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- dump ตาราง `faculty`
-- 

INSERT INTO `faculty` (`faculty_id`, `faculty_name`, `faculty_ename`) VALUES ('01', '??????????????', 'Engineering');
INSERT INTO `faculty` (`faculty_id`, `faculty_name`, `faculty_ename`) VALUES ('02', '?????????????????', 'Architecture');
INSERT INTO `faculty` (`faculty_id`, `faculty_name`, `faculty_ename`) VALUES ('03', '???????????????????', 'Industrial Education');
INSERT INTO `faculty` (`faculty_id`, `faculty_name`, `faculty_ename`) VALUES ('04', '?????????????????', 'Agriculture Technology');
INSERT INTO `faculty` (`faculty_id`, `faculty_name`, `faculty_ename`) VALUES ('05', '???????????', 'Science');
INSERT INTO `faculty` (`faculty_id`, `faculty_name`, `faculty_ename`) VALUES ('07', '?????????????????', 'Information Technology');
INSERT INTO `faculty` (`faculty_id`, `faculty_name`, `faculty_ename`) VALUES ('06', '???????????????', 'Agricultural Industry');

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `mark_subject`
-- 

DROP TABLE IF EXISTS `mark_subject`;
CREATE TABLE IF NOT EXISTS `mark_subject` (
  `faculty_id` char(2) NOT NULL default '',
  `dept_id` char(2) NOT NULL default '',
  `subject_id` varchar(8) NOT NULL default '',
  `amount_std` int(4) NOT NULL default '0',
  `exam_date` date NOT NULL default '0000-00-00',
  `exam_time` time NOT NULL default '00:00:00',
  `mark` int(1) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- dump ตาราง `mark_subject`
-- 


-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `pri_building`
-- 

DROP TABLE IF EXISTS `pri_building`;
CREATE TABLE IF NOT EXISTS `pri_building` (
  `faculty_id` char(2) NOT NULL default '',
  `dept_id` char(2) NOT NULL default '',
  `p1` varchar(10) NOT NULL default '',
  `p2` varchar(10) NOT NULL default '',
  `p3` varchar(10) NOT NULL default '',
  `p4` varchar(10) NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- dump ตาราง `pri_building`
-- 

INSERT INTO `pri_building` (`faculty_id`, `dept_id`, `p1`, `p2`, `p3`, `p4`) VALUES ('01', '05', 'ECC', 'L', 'A', 'ME');
INSERT INTO `pri_building` (`faculty_id`, `dept_id`, `p1`, `p2`, `p3`, `p4`) VALUES ('01', '01', 'ECC', 'L', 'A', 'ME');

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `room`
-- 

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `faculty_id` char(2) NOT NULL default '',
  `dept_id` char(2) NOT NULL default '',
  `building_no` varchar(10) NOT NULL default '',
  `room_no` varchar(10) NOT NULL default '',
  `odd` int(4) NOT NULL default '0',
  `even` int(4) NOT NULL default '0',
  `state_odd` int(1) NOT NULL default '0',
  `state_even` int(1) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- dump ตาราง `room`
-- 

INSERT INTO `room` (`faculty_id`, `dept_id`, `building_no`, `room_no`, `odd`, `even`, `state_odd`, `state_even`) VALUES ('01', '05', 'ECC', 'ECC-601', 60, 60, 1, 1);
INSERT INTO `room` (`faculty_id`, `dept_id`, `building_no`, `room_no`, `odd`, `even`, `state_odd`, `state_even`) VALUES ('01', '05', 'ECC', 'ECC-602', 48, 48, 1, 0);
INSERT INTO `room` (`faculty_id`, `dept_id`, `building_no`, `room_no`, `odd`, `even`, `state_odd`, `state_even`) VALUES ('01', '05', 'ECC', 'ECC-603', 52, 52, 1, 1);
INSERT INTO `room` (`faculty_id`, `dept_id`, `building_no`, `room_no`, `odd`, `even`, `state_odd`, `state_even`) VALUES ('01', '05', 'ECC', 'ECC-604', 32, 32, 0, 0);
INSERT INTO `room` (`faculty_id`, `dept_id`, `building_no`, `room_no`, `odd`, `even`, `state_odd`, `state_even`) VALUES ('01', '', 'ECC', 'ECC-501', 55, 55, 1, 0);
INSERT INTO `room` (`faculty_id`, `dept_id`, `building_no`, `room_no`, `odd`, `even`, `state_odd`, `state_even`) VALUES ('01', '', 'ECC', 'ECC-502', 125, 125, 0, 0);
INSERT INTO `room` (`faculty_id`, `dept_id`, `building_no`, `room_no`, `odd`, `even`, `state_odd`, `state_even`) VALUES ('01', '', 'ECC', 'ECC-503', 55, 55, 0, 0);
INSERT INTO `room` (`faculty_id`, `dept_id`, `building_no`, `room_no`, `odd`, `even`, `state_odd`, `state_even`) VALUES ('01', '', 'L', 'L-101', 50, 50, 1, 0);
INSERT INTO `room` (`faculty_id`, `dept_id`, `building_no`, `room_no`, `odd`, `even`, `state_odd`, `state_even`) VALUES ('01', '', 'L', 'L-102', 80, 80, 1, 1);
INSERT INTO `room` (`faculty_id`, `dept_id`, `building_no`, `room_no`, `odd`, `even`, `state_odd`, `state_even`) VALUES ('01', '01', 'ECC', 'ECC-201', 60, 60, 1, 1);
INSERT INTO `room` (`faculty_id`, `dept_id`, `building_no`, `room_no`, `odd`, `even`, `state_odd`, `state_even`) VALUES ('01', '01', 'ECC', 'ECC-202', 80, 80, 1, 1);

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `subject`
-- 

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `faculty_id` char(2) NOT NULL default '',
  `dept_id` char(2) NOT NULL default '',
  `subject_id` varchar(8) NOT NULL default '',
  `exam_date` date NOT NULL default '0000-00-00',
  `exam_time` time NOT NULL default '00:00:00',
  `sum_std` int(3) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- dump ตาราง `subject`
-- 

INSERT INTO `subject` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '01', '01010008', '2006-02-21', '13:00:00', 60);
INSERT INTO `subject` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '01', '01010007', '2006-02-21', '13:00:00', 60);
INSERT INTO `subject` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '01', '01010006', '2006-02-21', '09:30:00', 45);
INSERT INTO `subject` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '01', '01010005', '2006-02-21', '09:30:00', 50);
INSERT INTO `subject` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '01', '01010004', '2006-02-20', '13:00:00', 150);
INSERT INTO `subject` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '01', '01010003', '2006-02-20', '13:00:00', 150);
INSERT INTO `subject` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '01', '01010002', '2006-02-20', '09:30:00', 60);
INSERT INTO `subject` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '01', '01010001', '2006-02-20', '09:30:00', 75);
INSERT INTO `subject` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '05', '01070001', '2006-02-20', '09:30:00', 150);
INSERT INTO `subject` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '05', '01070002', '2006-02-21', '09:30:00', 50);
INSERT INTO `subject` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '05', '01070003', '2006-02-21', '13:00:00', 50);
INSERT INTO `subject` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '05', '01070004', '2006-02-21', '13:00:00', 60);
INSERT INTO `subject` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '05', '01070005', '2006-02-21', '09:30:00', 50);
INSERT INTO `subject` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '05', '01070006', '2006-02-20', '09:30:00', 50);

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `subject_not_exam_room`
-- 

DROP TABLE IF EXISTS `subject_not_exam_room`;
CREATE TABLE IF NOT EXISTS `subject_not_exam_room` (
  `faculty_id` char(2) NOT NULL default '',
  `dept_id` char(2) NOT NULL default '',
  `subject_id` varchar(8) NOT NULL default '',
  `exam_date` date NOT NULL default '0000-00-00',
  `exam_time` time NOT NULL default '00:00:00',
  `sum_std` int(3) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- dump ตาราง `subject_not_exam_room`
-- 

INSERT INTO `subject_not_exam_room` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '01', '01010003', '2006-02-20', '13:00:00', 150);
INSERT INTO `subject_not_exam_room` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '01', '01010004', '2006-02-20', '13:00:00', 150);
INSERT INTO `subject_not_exam_room` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '05', '01070004', '2006-02-21', '13:00:00', 60);
INSERT INTO `subject_not_exam_room` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '01', '01010003', '2006-02-20', '13:00:00', 150);
INSERT INTO `subject_not_exam_room` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '01', '01010004', '2006-02-20', '13:00:00', 150);
INSERT INTO `subject_not_exam_room` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '05', '01070004', '2006-02-21', '13:00:00', 60);
INSERT INTO `subject_not_exam_room` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '01', '01010003', '2006-02-20', '13:00:00', 150);
INSERT INTO `subject_not_exam_room` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '01', '01010004', '2006-02-20', '13:00:00', 150);
INSERT INTO `subject_not_exam_room` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '05', '01070004', '2006-02-21', '13:00:00', 60);
INSERT INTO `subject_not_exam_room` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '01', '01010003', '2006-02-20', '13:00:00', 150);
INSERT INTO `subject_not_exam_room` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '01', '01010004', '2006-02-20', '13:00:00', 150);
INSERT INTO `subject_not_exam_room` (`faculty_id`, `dept_id`, `subject_id`, `exam_date`, `exam_time`, `sum_std`) VALUES ('01', '05', '01070004', '2006-02-21', '13:00:00', 60);

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `teacher`
-- 

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `teacher_id` varchar(5) NOT NULL default '0',
  `user_id` varchar(16) NOT NULL default '',
  `faculty_id` char(2) NOT NULL default '',
  `dept_id` char(2) NOT NULL default '',
  `prename` varchar(16) NOT NULL default '',
  `t_prename` varchar(16) NOT NULL default '',
  `teacher_tname` varchar(60) NOT NULL default '',
  `e_prename` varchar(16) NOT NULL default '',
  `teacher_ename` varchar(60) NOT NULL default '',
  `degree` char(1) NOT NULL default '',
  `position` char(1) NOT NULL default '',
  `type` char(2) NOT NULL default '',
  `person_id` varchar(4) NOT NULL default '',
  `level` char(1) NOT NULL default '',
  PRIMARY KEY  (`teacher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- 
-- dump ตาราง `teacher`
-- 

INSERT INTO `teacher` (`teacher_id`, `user_id`, `faculty_id`, `dept_id`, `prename`, `t_prename`, `teacher_tname`, `e_prename`, `teacher_ename`, `degree`, `position`, `type`, `person_id`, `level`) VALUES ('01008', '', '01', '01', '', 'ดร.', 'A1', '', '', '', '', '', '', '');
INSERT INTO `teacher` (`teacher_id`, `user_id`, `faculty_id`, `dept_id`, `prename`, `t_prename`, `teacher_tname`, `e_prename`, `teacher_ename`, `degree`, `position`, `type`, `person_id`, `level`) VALUES ('01007', '', '01', '01', '', 'ดร.', 'A2', '', '', '', '', '', '', '');
INSERT INTO `teacher` (`teacher_id`, `user_id`, `faculty_id`, `dept_id`, `prename`, `t_prename`, `teacher_tname`, `e_prename`, `teacher_ename`, `degree`, `position`, `type`, `person_id`, `level`) VALUES ('01006', '', '01', '01', '', 'ดร.', 'A3', '', '', '', '', '', '', '');
INSERT INTO `teacher` (`teacher_id`, `user_id`, `faculty_id`, `dept_id`, `prename`, `t_prename`, `teacher_tname`, `e_prename`, `teacher_ename`, `degree`, `position`, `type`, `person_id`, `level`) VALUES ('01005', '', '01', '01', '', 'ดร.', 'A4', '', '', '', '', '', '', '');
INSERT INTO `teacher` (`teacher_id`, `user_id`, `faculty_id`, `dept_id`, `prename`, `t_prename`, `teacher_tname`, `e_prename`, `teacher_ename`, `degree`, `position`, `type`, `person_id`, `level`) VALUES ('01004', '', '01', '01', '', 'ดร.', 'A5', '', '', '', '', '', '', '');
INSERT INTO `teacher` (`teacher_id`, `user_id`, `faculty_id`, `dept_id`, `prename`, `t_prename`, `teacher_tname`, `e_prename`, `teacher_ename`, `degree`, `position`, `type`, `person_id`, `level`) VALUES ('01003', '', '01', '01', '', 'ดร.', 'A6', '', '', '', '', '', '', '');
INSERT INTO `teacher` (`teacher_id`, `user_id`, `faculty_id`, `dept_id`, `prename`, `t_prename`, `teacher_tname`, `e_prename`, `teacher_ename`, `degree`, `position`, `type`, `person_id`, `level`) VALUES ('01002', '', '01', '01', '', 'ดร.', 'A7', '', '', '', '', '', '', '');
INSERT INTO `teacher` (`teacher_id`, `user_id`, `faculty_id`, `dept_id`, `prename`, `t_prename`, `teacher_tname`, `e_prename`, `teacher_ename`, `degree`, `position`, `type`, `person_id`, `level`) VALUES ('01001', '', '01', '01', '', 'ดร.', 'A8', '', '', '', '', '', '', '');
INSERT INTO `teacher` (`teacher_id`, `user_id`, `faculty_id`, `dept_id`, `prename`, `t_prename`, `teacher_tname`, `e_prename`, `teacher_ename`, `degree`, `position`, `type`, `person_id`, `level`) VALUES ('05010', '', '01', '01', '', 'ดร.', 'A9', '', '', '', '', '', '', '');
INSERT INTO `teacher` (`teacher_id`, `user_id`, `faculty_id`, `dept_id`, `prename`, `t_prename`, `teacher_tname`, `e_prename`, `teacher_ename`, `degree`, `position`, `type`, `person_id`, `level`) VALUES ('05011', '', '01', '01', '', 'ดร.', 'A10', '', '', '', '', '', '', '');
INSERT INTO `teacher` (`teacher_id`, `user_id`, `faculty_id`, `dept_id`, `prename`, `t_prename`, `teacher_tname`, `e_prename`, `teacher_ename`, `degree`, `position`, `type`, `person_id`, `level`) VALUES ('05012', '', '01', '01', '', 'ดร.', 'A11', '', '', '', '', '', '', '');
INSERT INTO `teacher` (`teacher_id`, `user_id`, `faculty_id`, `dept_id`, `prename`, `t_prename`, `teacher_tname`, `e_prename`, `teacher_ename`, `degree`, `position`, `type`, `person_id`, `level`) VALUES ('05013', '', '01', '01', '', 'ดร.', 'A12', '', '', '', '', '', '', '');
INSERT INTO `teacher` (`teacher_id`, `user_id`, `faculty_id`, `dept_id`, `prename`, `t_prename`, `teacher_tname`, `e_prename`, `teacher_ename`, `degree`, `position`, `type`, `person_id`, `level`) VALUES ('05014', '', '01', '01', '', 'ดร.', 'A13', '', '', '', '', '', '', '');
INSERT INTO `teacher` (`teacher_id`, `user_id`, `faculty_id`, `dept_id`, `prename`, `t_prename`, `teacher_tname`, `e_prename`, `teacher_ename`, `degree`, `position`, `type`, `person_id`, `level`) VALUES ('05015', '', '01', '01', '', 'ดร.', 'A14', '', '', '', '', '', '', '');

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `teacher_teach`
-- 

DROP TABLE IF EXISTS `teacher_teach`;
CREATE TABLE IF NOT EXISTS `teacher_teach` (
  `faculty_id` char(2) NOT NULL default '',
  `dept_id` char(2) NOT NULL default '',
  `curr_id` int(6) NOT NULL default '0',
  `curr2_id` char(3) NOT NULL default '',
  `subject_id` varchar(8) NOT NULL default '',
  `semester` int(1) NOT NULL default '0',
  `year` int(4) NOT NULL default '0',
  `class` char(1) NOT NULL default '',
  `program` varchar(4) NOT NULL default '',
  `section` char(2) NOT NULL default '',
  `teacher_id` varchar(5) NOT NULL default '0',
  `lect_or_prac` char(1) NOT NULL default 'ท',
  `priority` int(1) NOT NULL default '0',
  `t_status` int(1) NOT NULL default '0',
  PRIMARY KEY  (`faculty_id`,`dept_id`,`curr_id`,`curr2_id`,`year`,`semester`,`class`,`section`,`subject_id`,`teacher_id`,`lect_or_prac`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- 
-- dump ตาราง `teacher_teach`
-- 

INSERT INTO `teacher_teach` (`faculty_id`, `dept_id`, `curr_id`, `curr2_id`, `subject_id`, `semester`, `year`, `class`, `program`, `section`, `teacher_id`, `lect_or_prac`, `priority`, `t_status`) VALUES ('01', '01', 0, '', '01010008', 0, 0, '', '', '', '01008', 'ท', 0, 0);
INSERT INTO `teacher_teach` (`faculty_id`, `dept_id`, `curr_id`, `curr2_id`, `subject_id`, `semester`, `year`, `class`, `program`, `section`, `teacher_id`, `lect_or_prac`, `priority`, `t_status`) VALUES ('01', '01', 0, '', '01010007', 0, 0, '', '', '', '01007', 'ท', 0, 0);
INSERT INTO `teacher_teach` (`faculty_id`, `dept_id`, `curr_id`, `curr2_id`, `subject_id`, `semester`, `year`, `class`, `program`, `section`, `teacher_id`, `lect_or_prac`, `priority`, `t_status`) VALUES ('01', '01', 0, '', '01010006', 0, 0, '', '', '', '01006', 'ท', 0, 0);
INSERT INTO `teacher_teach` (`faculty_id`, `dept_id`, `curr_id`, `curr2_id`, `subject_id`, `semester`, `year`, `class`, `program`, `section`, `teacher_id`, `lect_or_prac`, `priority`, `t_status`) VALUES ('01', '01', 0, '', '01010005', 0, 0, '', '', '', '01005', 'ท', 0, 0);
INSERT INTO `teacher_teach` (`faculty_id`, `dept_id`, `curr_id`, `curr2_id`, `subject_id`, `semester`, `year`, `class`, `program`, `section`, `teacher_id`, `lect_or_prac`, `priority`, `t_status`) VALUES ('01', '01', 0, '', '01010004', 0, 0, '', '', '', '01004', 'ท', 0, 0);
INSERT INTO `teacher_teach` (`faculty_id`, `dept_id`, `curr_id`, `curr2_id`, `subject_id`, `semester`, `year`, `class`, `program`, `section`, `teacher_id`, `lect_or_prac`, `priority`, `t_status`) VALUES ('01', '01', 0, '', '01010003', 0, 0, '', '', '', '01003', 'ท', 0, 0);
INSERT INTO `teacher_teach` (`faculty_id`, `dept_id`, `curr_id`, `curr2_id`, `subject_id`, `semester`, `year`, `class`, `program`, `section`, `teacher_id`, `lect_or_prac`, `priority`, `t_status`) VALUES ('01', '01', 0, '', '01010002', 0, 0, '', '', '', '01002', 'ท', 0, 0);
INSERT INTO `teacher_teach` (`faculty_id`, `dept_id`, `curr_id`, `curr2_id`, `subject_id`, `semester`, `year`, `class`, `program`, `section`, `teacher_id`, `lect_or_prac`, `priority`, `t_status`) VALUES ('01', '01', 0, '', '01010001', 0, 0, '', '', '', '01001', 'ท', 0, 0);
INSERT INTO `teacher_teach` (`faculty_id`, `dept_id`, `curr_id`, `curr2_id`, `subject_id`, `semester`, `year`, `class`, `program`, `section`, `teacher_id`, `lect_or_prac`, `priority`, `t_status`) VALUES ('01', '05', 0, '', '01070001', 0, 0, '', '', '', '05010', 'ท', 0, 0);
INSERT INTO `teacher_teach` (`faculty_id`, `dept_id`, `curr_id`, `curr2_id`, `subject_id`, `semester`, `year`, `class`, `program`, `section`, `teacher_id`, `lect_or_prac`, `priority`, `t_status`) VALUES ('01', '05', 0, '', '01070002', 0, 0, '', '', '', '05011', 'ท', 0, 0);
INSERT INTO `teacher_teach` (`faculty_id`, `dept_id`, `curr_id`, `curr2_id`, `subject_id`, `semester`, `year`, `class`, `program`, `section`, `teacher_id`, `lect_or_prac`, `priority`, `t_status`) VALUES ('01', '05', 0, '', '01070003', 0, 0, '', '', '', '05012', 'ท', 0, 0);
INSERT INTO `teacher_teach` (`faculty_id`, `dept_id`, `curr_id`, `curr2_id`, `subject_id`, `semester`, `year`, `class`, `program`, `section`, `teacher_id`, `lect_or_prac`, `priority`, `t_status`) VALUES ('01', '05', 0, '', '01070004', 0, 0, '', '', '', '05013', 'ท', 0, 0);
INSERT INTO `teacher_teach` (`faculty_id`, `dept_id`, `curr_id`, `curr2_id`, `subject_id`, `semester`, `year`, `class`, `program`, `section`, `teacher_id`, `lect_or_prac`, `priority`, `t_status`) VALUES ('01', '05', 0, '', '01070005', 0, 0, '', '', '', '05014', 'ท', 0, 0);
INSERT INTO `teacher_teach` (`faculty_id`, `dept_id`, `curr_id`, `curr2_id`, `subject_id`, `semester`, `year`, `class`, `program`, `section`, `teacher_id`, `lect_or_prac`, `priority`, `t_status`) VALUES ('01', '05', 0, '', '01070006', 0, 0, '', '', '', '05015', 'ท', 0, 0);
        