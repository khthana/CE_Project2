-- phpMyAdmin SQL Dump
-- version 2.9.0.2
-- http://www.phpmyadmin.net
-- 
-- โฮสต์: localhost
-- เวลาในการสร้าง: 28 ก.พ. 2007  น.
-- รุ่นของเซิร์ฟเวอร์: 5.0.24
-- รุ่นของ PHP: 5.1.6
-- 
-- ฐานข้อมูล: `storetest`
-- 

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `answers`
-- 

CREATE TABLE `answers` (
  `id_ans` int(2) NOT NULL,
  `ans` text NOT NULL,
  `ans_1` text NOT NULL,
  `ans_2` text NOT NULL,
  `ans_3` text NOT NULL,
  `ans_4` text NOT NULL,
  `ans_5` text NOT NULL,
  PRIMARY KEY  (`id_ans`)
) TYPE=MyISAM;

-- 
-- dump ตาราง `answers`
-- 

INSERT INTO `answers` VALUES (100, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (10, '4', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (2, '2', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (1, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (11, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (12, '4', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (13, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (14, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (15, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (16, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (17, '2', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (18, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (19, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (20, '2', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (21, '4', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (22, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (23, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (24, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (25, '2', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (26, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (27, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (28, '2', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (29, '4', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (3, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (30, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (31, '2', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (32, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (33, '2', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (34, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (35, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (36, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (37, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (38, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (39, '4', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (4, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (40, '4', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (41, '2', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (42, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (43, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (44, '4', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (45, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (46, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (47, '2', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (48, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (49, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (5, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (50, '2', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (51, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (52, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (53, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (54, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (55, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (56, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (57, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (58, '2', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (59, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (6, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (60, '4', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (61, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (62, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (63, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (64, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (65, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (66, '2', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (67, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (68, '4', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (69, '2', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (7, '2', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (70, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (71, '4', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (72, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (73, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (74, '2', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (75, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (76, '4', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (77, '4', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (78, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (79, '2', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (8, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (80, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (81, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (82, '2', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (83, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (84, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (85, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (86, '4', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (87, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (88, '2', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (89, '2', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (90, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (91, '2', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (92, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (93, '2', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (94, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (95, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (96, '2', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (97, '1', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (98, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (99, '3', '1', '2', '3', '4', '4');
INSERT INTO `answers` VALUES (9, '1', '1', '2', '3', '4', '4');

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `point`
-- 

CREATE TABLE `point` (
  `std_id` int(10) NOT NULL,
  `points` int(11) NOT NULL,
  PRIMARY KEY  (`std_id`)
) TYPE=MyISAM;

-- 
-- dump ตาราง `point`
-- 

INSERT INTO `point` VALUES (59010607, 63);
INSERT INTO `point` VALUES (45010607, 61);
INSERT INTO `point` VALUES (45010459, 65);
INSERT INTO `point` VALUES (45015389, 50);
INSERT INTO `point` VALUES (45010938, 76);
INSERT INTO `point` VALUES (45010350, 82);
INSERT INTO `point` VALUES (45010946, 98);
INSERT INTO `point` VALUES (45015397, 81);
INSERT INTO `point` VALUES (46015369, 100);

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `question`
-- 

CREATE TABLE `question` (
  `id` int(2) NOT NULL,
  `quest` text NOT NULL,
  `choice1` text NOT NULL,
  `choice2` text NOT NULL,
  `choice3` text NOT NULL,
  `choice4` text NOT NULL,
  `answer` text NOT NULL,
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;

-- 
-- dump ตาราง `question`
-- 

INSERT INTO `question` VALUES (2, 'Which ports on Cisco routers can be used for initial configuration?', 'Ethernet', 'console', 'auxiliary', 'serial', '2');
INSERT INTO `question` VALUES (1, 'The console port can be used for which of the following? (Choose three.)', 'debugging', 'password recovery routing data between networks', 'troubleshooting', 'connecting one router to another', '3');
INSERT INTO `question` VALUES (3, 'Which of the following devices are used in the construction of a WAN?', 'hubs', 'routers', 'communication servers', 'transceivers', '1');
INSERT INTO `question` VALUES (4, ' Why is a console connection to a router or switch preferred when troubleshooting?', 'can be accessed remotely', 'does not depend on network services', 'displays startup and error messages by default', 'does not require special components', '3');
INSERT INTO `question` VALUES (5, 'Which of the following layers of the OSI model are incorporated in WAN standards?', 'physical layer', 'application layer', 'transport layer', 'data link layer', '2');
INSERT INTO `question` VALUES (6, 'What do routers use to select the best path for outgoing data packets?', 'ARP tables', 'bridging tables', 'routing tables', 'switching tables', '3');
INSERT INTO `question` VALUES (7, 'Select the statements that correctly describe flash memory in a 2600 series router?', 'holds the startup configuration by default', 'can be upgraded with single in-line memory modules', 'stores Cisco IOS software images', 'stores routing table information by default', '3');
INSERT INTO `question` VALUES (8, 'Which of the following are true regarding router interfaces?', 'provide temporary memory for the router configuration files', 'connect the router to the network for packet entry and exit', 'can be on the motherboard or a separate module', 'hold the IOS image', '4');
INSERT INTO `question` VALUES (9, 'Which of the following are functions of RAM?', 'contains startup configuration file', 'stores routing table', 'holds fast switching cache', 'retains contents when power is removed', '1');
INSERT INTO `question` VALUES (10, 'Which router component holds the configuration file when power is lost?', 'volatile random access memory', 'read only memory', 'non-volatile random access memor', 'flash memory', '3');
INSERT INTO `question` VALUES (11, 'What contains the instructions that a router uses to control the flow of traffic through its interfaces?', 'packet configuration', 'configuration files', 'flash memory', 'internal components', '2');
INSERT INTO `question` VALUES (12, 'Which basic components do a router and a standard desktop PC have in common?', 'CPU', 'hard drive', 'input/output interfaces', 'keyboard', '2');
INSERT INTO `question` VALUES (13, 'Which of the following are functions of NVRAM?', 'stores the routing table', 'retains contents when power is removed', 'stores the startup configuration file', 'contains the running configuration file', '3');
INSERT INTO `question` VALUES (14, 'Which of the following tasks can be accomplished through a management connection on a router?', 'troubleshooting problems', 'monitoring the system', 'capturing LAN data packets', 'configuring the router', '2');
INSERT INTO `question` VALUES (15, 'An internetwork must include which of the following?', 'switching', 'static addressing', 'IETF standardization', 'dynamic or static routing', '2');
INSERT INTO `question` VALUES (16, 'Which of the following describes the function of a WAN?', 'connects peripherals in a single location', 'connects multiple networks in a single building', 'provides connectivity on a LAN', 'provides connectivity over a large geographic area', '3');
INSERT INTO `question` VALUES (17, 'Which keystroke is used to move to the beginning of a command line?', 'Ctrl-A', 'Ctrl-B', 'Esc-A', 'Esc-B', '1');
INSERT INTO `question` VALUES (18, 'What is the maximum number of commands allowed in the history buffer?', '10', '20', '128', '255', '3');
INSERT INTO `question` VALUES (19, 'Which tasks can be performed in the ROM monitor mode?', 'recover from system failures', 'create startup configuration files', 'recover from lost passwords', 'configure IP addresses on all router interfaces', '2');
INSERT INTO `question` VALUES (20, 'What is the default sequence for loading the IOS?', 'NVRAM, TFTP, FLASH', 'NVRAM, TFTP, CONSOLE', 'FLASH, ROM, TFTP', 'FLASH, TFTP, ROM', '4');
INSERT INTO `question` VALUES (21, 'Which connection method can be used to perform the initial configuration of a router?', 'use a serial connection of a computer connected to the console port of a router', 'telnet to the router through a serial port', 'use a vty port through the Ethernet interface', 'use a modem connected to the AUX port of the router', '2');
INSERT INTO `question` VALUES (22, 'What information does the name of the IOS file provide to the network administrator?', 'the amount of NVRAM required to run the image', 'the hardware platform the image runs on', 'the various software platforms the image can run on', 'special features and capabilities of the image', '3');
INSERT INTO `question` VALUES (23, 'Under what conditions does the router enter setup mode?', 'immediately after issuing the command Router#erase start', 'after issuing the command Router#setup', 'during the initial configuration of a router', 'after deleting the backup configuration and reloading the router', '2');
INSERT INTO `question` VALUES (24, 'What does the command sh? return as output if issued at the Router# prompt?', 'all show commands allowed in privileged mode', 'all commands beginning with the letters sh', 'an incomplete command error message', 'an invalid command error message', '2');
INSERT INTO `question` VALUES (25, 'Cisco IOS software is separated into two levels as a security feature. What are those two levels?', 'global', 'privileged', 'local', 'user', '3');
INSERT INTO `question` VALUES (26, 'Which keystrokes can be used to return to the privileged mode from the interface configuration mode?', 'Ctrl-P', 'Ctrl-Shift-6, then X', 'Ctrl-Z', 'Esc', '4');
INSERT INTO `question` VALUES (27, 'Which of the following is the correct flow of routines for a router startup?', 'load bootstrap, load IOS, apply configuration', 'load bootstrap, apply configuration, load IOS', 'load IOS, load bootstrap, apply configuration, check hardware', 'check hardware, apply configuration, load bootstrap, load IOS', '3');
INSERT INTO `question` VALUES (28, ' What is the default sequence for loading the configuration file?', 'NVRAM, FLASH, ROM', 'FLASH, TFTP,CONSOLE', 'NVRAM, TFTP, CONSOLE', 'FLASH, TFTP, ROM', '1');
INSERT INTO `question` VALUES (29, 'Which tasks can be accomplished by using the command history feature?', 'View a list of commands entered in a previous session.', 'Recall up to 15 command lines by default.', 'Set the command history buffer size.', 'Recall previously entered commands.', '3');
INSERT INTO `question` VALUES (30, 'Why is it important to create standards for network consistency?', 'reduces network complexity', 'increases unplanned downtime', 'limits unplanned downtime', 'increases bandwidth by regulating networking performance', '2');
INSERT INTO `question` VALUES (31, 'Select the interface descriptions that provide the most appropriate information.', 'circuit number', 'host IP address', 'telnet password', 'number of hops between routers', '3');
INSERT INTO `question` VALUES (32, 'Select the commands necessary to remove any existing configuration on a router.', 'delete flash', 'erase startup-config', 'erase running-config', 'restart', '3');
INSERT INTO `question` VALUES (33, 'Select the commands that will store the current configuration file to a network TFTP server?', 'Router# copy run tftp', 'Router# copy tftp run', 'Router# copy running-config tftp', 'Router# copy tftp running-config', '4');
INSERT INTO `question` VALUES (34, 'Which statements are true regarding the recommended use of login banners?', 'They should be used to display information regarding system changes or maintenance', 'They should be used to display warnings to unauthorized users', 'They should be used to display welcome messages prior to login.', 'They should be seen only by system administrators.', '2');
INSERT INTO `question` VALUES (35, 'What are the default settings for a serial interface?', 'DTE', 'DCE', 'shutdown', 'no IP address', '1');
INSERT INTO `question` VALUES (36, 'What is the default state of the interfaces on a router?', 'up, line protocol down', 'down, line protocol dow', 'adminstratively down, line protocol down', 'up, line protocol up', '2');
INSERT INTO `question` VALUES (37, 'Which are valid router prompts?', 'Router(privileged)#', 'Router(config)#', 'Router(command)#', 'Router(config-router)#', '2');
INSERT INTO `question` VALUES (38, 'Select the recommended locations to save a running-config file', 'all network hosts', 'network server', 'floppy disk', 'TFTP server', '2');
INSERT INTO `question` VALUES (39, 'Which command turns on a router interface?', 'Router(config-if)# enable', 'Router(config-if)# no down', 'Router(config-if)# s0 active', 'Router(config-if)# interface up', '1');
INSERT INTO `question` VALUES (40, 'What must be configured to establish a serial link between two routers that are directly connected?', 'a clock rate on the DTE interface', 'a no clock rate command on the DTE interface', 'no configuration is required', 'a clock rate on the DCE interface', '4');
INSERT INTO `question` VALUES (41, 'Which of the following are displayed by the Router# show cdp neighbors command?', 'load', 'platform', 'reliability', 'holdtime', '1');
INSERT INTO `question` VALUES (42, 'What command enables CDP on the interface of a router?', 'Router(config-if)# cdp enable', 'Router(config-if)# cdp run', 'Router(config-if)# cdp start', 'Router(config-if)# cdp config', '3');
INSERT INTO `question` VALUES (43, 'Which of the following is true regarding CDP and the graphic shown?', 'CDP running on Router D will gather information about routers A, B, C, and E.', 'By default, Router A will receive CDP advertisements from routers B and C', 'If routers D and E are running different routing protocols, they will not exchange CDP information.', 'Router E can use CDP to identify the IOS running on Router B.', '1');
INSERT INTO `question` VALUES (44, 'For which of the following network layer protocols does CDP provide information?', 'IP', 'RIP', 'SNMP', 'AppleTalk', '4');
INSERT INTO `question` VALUES (45, 'Which command will produce the output shown in the graphic?', 'show cdp', 'show cdp neighbors', 'show cdp neighbors detail', 'show cdp detail', '2');
INSERT INTO `question` VALUES (46, 'What is the purpose of the cdp timer command?', 'specifies the hold time to be sent in the CDP update packet', 'resets the traffic counters back to zero', 'specifies how often the Cisco IOS software sends CDP updates', 'deletes and resets the CDP table of information about neighbors', '2');
INSERT INTO `question` VALUES (47, 'What is the main use of Telnet?', 'transfer of data between end users', 'verification of simple connectivity', 'routing of data packets', 'remote connection to network devices', '3');
INSERT INTO `question` VALUES (48, 'Why would an administrator use the Telnet application when troubleshooting a network?', 'It can be used to verify the operation of application layer software between the source and destination.', 'Telnet can use the ICMP protocol to verify a hardware connection and network layer address.', 'It is the most complete testing mechanism available.', 'Remote networks may be accessed via a Telnet session for troubleshooting.', '2');
INSERT INTO `question` VALUES (49, 'What key sequence is used to suspend a Telnet session on a remote router?', 'Ctrl-Shift-S', 'Ctrl-Shift-6', 'Ctrl-Shift-6, then x', 'Ctrl-Alt-S', '3');
INSERT INTO `question` VALUES (50, 'Where does a router look for boot system statements?', 'ROM', 'RAM', ' NVRAM', 'EPROM', '3');
INSERT INTO `question` VALUES (51, 'Which command will backup configuration files from RAM to NVRAM or a TFTP server?', 'backup', 'copy', 'telnet', 'move', '2');
INSERT INTO `question` VALUES (52, 'What is the purpose of a routing protocol?', 'It is used to build and maintain ARP tables.', 'It provides a method for segmenting and reassembling data packets.', 'It allows an administrator to devise an addressing scheme for the network.', 'It allows a router to share information about known networks with other routers', '3');
INSERT INTO `question` VALUES (53, 'Which type of address does a router use to make routing decisions?', 'source IP address', 'source MAC address', 'destination IP address', 'destination MAC address', '3');
INSERT INTO `question` VALUES (54, 'Which are the primary functions used by a router when forwarding data?', 'data encryption', 'error notification', 'packet switching', 'address identification', '1');
INSERT INTO `question` VALUES (55, 'Which protocols use an addressing scheme to direct user traffic?', ' IP', 'IGRP', 'EIGRP', 'RIP', '2');
INSERT INTO `question` VALUES (56, 'Which command set will stop the IGRP routing process?', 'RouterB(config)# router igrp 101', 'RouterB(config-router)#shutdown', 'RouterB(config)# router igrp 101', 'RouterB(config-router)#network no 192.168.2.0', '2');
INSERT INTO `question` VALUES (57, ' Which of the following routes within an autonomous system does not include subnet information?', 'interior routes', 'system routes', 'border routes', 'border routes', '2');
INSERT INTO `question` VALUES (58, 'When does RIP send routing table updates?', 'periodically, every 30 seconds', 'periodically, every 60 seconds', 'periodically, every 90 seconds', 'if optionally configured, when topology changes occur', '4');
INSERT INTO `question` VALUES (59, 'Which statements describe RIP?', 'The maximum metric value is 15 hops', 'Routing updates occur every 30 seconds', 'Routing updates occur every 90 seconds.', 'It is a distance vector routing protocol.', '2');
INSERT INTO `question` VALUES (60, 'Which command will display RIP activity as it occurs on a router?', 'debug ip rip', 'show ip route', 'show ip interface', 'show ip protocols', '2');
INSERT INTO `question` VALUES (61, 'Which layer protocols provide reliability for IP when needed?', 'ICMP and ping', 'RIP and TTL', 'upper layer protocols', 'lower layer protocols', '1');
INSERT INTO `question` VALUES (62, 'Which statements describe RIP?', 'The maximum metric value is 255 hops.', 'The maximum metric value is 15 hops.', 'Routing updates occur every 30 seconds.', 'Routing updates occur every 90 seconds.', '3');
INSERT INTO `question` VALUES (63, 'Which command will display RIP activity as it occurs on a router?', 'debug ip rip', 'show ip route', 'show ip interface', 'show ip protocols', '3');
INSERT INTO `question` VALUES (64, 'Which layer protocols provide reliability for IP when needed?', 'ICMP and ping', 'RIP and TTL', 'upper layer protocols', 'lower layer protocols', '1');
INSERT INTO `question` VALUES (65, 'Which of the following start the test of destination reachability?', 'echo request issued by source', 'echo reply issued by source', 'echo request issued by destination', 'echo reply issued by destination', '2');
INSERT INTO `question` VALUES (66, 'Which ICMP message type notifies source hosts that a receiving host or network is not available?', 'time exceeded', 'redirect', 'destination unreachable', 'source quench', '3');
INSERT INTO `question` VALUES (67, 'What does TCP use to ensure reliable delivery of data segments?', 'upper layer protocols', 'lower layer protocols', 'sequence numbers', 'port numbers', '3');
INSERT INTO `question` VALUES (68, 'Which address is dynamically assigned by the source host when forwarding data?', 'destination IP address', 'destination port number', 'default gateway address', 'source IP address', '4');
INSERT INTO `question` VALUES (69, 'Which of the following are functions of the TCP protocol?', 'translation of data', 'synchronization', 'path determination', 'flow control', '2');
INSERT INTO `question` VALUES (100, 'What is the default sequence for loading the IOS?', 'NVRAM, TFTP, FLASH', 'NVRAM, TFTP, CONSOLE', 'FLASH, ROM, TFTP', 'FLASH, TFTP, ROM', '4');
INSERT INTO `question` VALUES (70, 'What type of segment and data is shown in the graphic?', 'a UDP segment carrying e-mail traffic', 'a TCP segment carrying FTP traffic', 'an IP segment carrying FTP traffic', 'a UDP segment carrying web traffic', '1');
INSERT INTO `question` VALUES (71, 'What is used by both TCP and UDP when creating a segment?', 'IP address', 'MAC address', 'IPX address', 'socket or port number', '4');
INSERT INTO `question` VALUES (72, ' Which of the following protocols uses UDP for transport layer services?', 'SMTP', 'HTTP', 'DNS', 'FTP', '3');
INSERT INTO `question` VALUES (73, 'Choose the command that will correctly configure a standard ACL.', 'Router# access-list 10 permit any', 'Router# access-list 101 permit any', 'Router(config)# access-list 10 permit any', 'Router(config)# access-list 101 permit any', '3');
INSERT INTO `question` VALUES (74, 'Which of the following parameters can ACLs use to filter traffic?', 'packet size', 'protocol suite', 'source address', 'destination address', '1');
INSERT INTO `question` VALUES (75, 'Which command displays the active configuration file of a router?', 'Display startup-config', 'Display running-config', 'Show running-config', 'Show startup-config', '3');
INSERT INTO `question` VALUES (76, 'What are the two basic functions used by a router to relay packets?', 'Filtering and switching', 'Path determination and filtering', 'Path determination and switching', 'Traffic analysis and filtering', '2');
INSERT INTO `question` VALUES (77, 'Which of the following are TCP services?', 'address resolution', 'end-to-end communication', 'flow control', 'reliability of data delivery', '2');
INSERT INTO `question` VALUES (78, 'What is the purpose of media access control?', 'It identifies which workstation has sent a frame.', 'It determines which Layer 3 protocol should handle a frame.', 'It identifies which Ethernet frame format to use on the network.', 'It determines which workstation on a shared medium LAN is allowed to transmit data.', '4');
INSERT INTO `question` VALUES (79, 'What is the default state of the interfaces on a router?', 'up, line protocol down', 'down, line protocol down', 'adminstratively down, line protocol down', 'up, line protocol up', '2');
INSERT INTO `question` VALUES (80, 'How many bits are in IPv6 addresses?', '16', '32', '64', '96', '2');
INSERT INTO `question` VALUES (81, 'How many bits are in IPv6 addresses?', '16', '32', '64', '96', '2');
INSERT INTO `question` VALUES (82, 'Which OSI layer defines the functions of a router?', 'physical', 'data link', 'network', 'transport', '3');
INSERT INTO `question` VALUES (83, 'What are the primary uses of Telnet?', 'routing of data packets', 'transfer of data between end users', 'verification of application layer connectivity', 'connecting to remote network devices', '3');
INSERT INTO `question` VALUES (84, 'Which command turns on a router interface?', 'Router(config-if)# enable', 'Router(config-if)# no down', 'Router(config-if)# s0 active', 'Router(config-if)# interface up', '4');
INSERT INTO `question` VALUES (85, 'At which layer of the TCP/IP model does Telnet operate?', 'application', 'presentation', 'session', 'transport', '1');
INSERT INTO `question` VALUES (86, 'What command enables CDP on the interface of a router?', 'Router(config-if)# cdp enable', 'Router(config-if)# cdp run', 'Router(config-if)# cdp start', 'Router(config-if)# cdp config', '1');
INSERT INTO `question` VALUES (87, 'Which criteria identify a Class B address?', 'decimal number in first octet between 127 - 191', 'decimal number in first octet between 128 - 192', 'decimal number in first octet between 128 - 191', 'first bit of binary IP address is 0', '2');
INSERT INTO `question` VALUES (88, 'Which device imposes boundaries on broadcast traffic?', 'bridge', 'repeater', 'router', 'transceiver', '3');
INSERT INTO `question` VALUES (89, 'Identify the correct pairing of protocols and their classifications.', 'Routed - IP, IGRP', 'Routed - RIP, OSPF', ' Routing - IPX, RIP', 'Routing - OSPF, IGRP', '4');
INSERT INTO `question` VALUES (90, 'What is the first step a Cisco router performs after it is powered up?', 'Empties contents of NVRAM', 'Looks for the configuration file', 'Performs a POST', 'Starts the operating system', '2');
INSERT INTO `question` VALUES (91, 'Which of the following are functions of RAM?', 'contains startup configuration file', 'stores routing table', 'holds fast switching cache', 'retains contents when power is removed', '2');
INSERT INTO `question` VALUES (92, 'Which two statements are true regarding ICMP?', 'ICMP provides reliability for the TCP/IP protocol stack.', 'ICMP is a component of the TCP/IP protocol stack.', 'ICMP notifies the sender that data transmission errors have occurred.', ' ICMP is connection-oriented.', '1');
INSERT INTO `question` VALUES (93, ' What types of messages are sent periodically by devices configured for CDP?', 'probes', 'beacons', 'signals', 'advertisements', '2');
INSERT INTO `question` VALUES (94, 'Which of the following is the correct flow of routines for a router startup?', 'load bootstrap, load IOS, apply configuration', 'load bootstrap, load IOS, apply configuration', 'load IOS, load bootstrap, apply configuration, check hardware', 'check hardware, apply configuration, load bootstrap, load IOS', '1');
INSERT INTO `question` VALUES (95, 'Which of the following are functions of a router?', 'packet switching', 'extension of network segments', ' segmentation of local area networks', 'selection of best path based on a logical addressing', '3');
INSERT INTO `question` VALUES (96, 'Which command will produce the output shown in the graphic?', 'show cdp', 'show cdp neighbors', 'show cdp neighbors detail', 'show cdp detail', '2');
INSERT INTO `question` VALUES (97, 'When must a router serial interface be configured with the clock rate command?', 'when the interface is functioning as a DTE device', 'when the interface timers have been cleared', 'when the connected DTE device is shut down', 'when the interface is functioning as a DCE device', '2');
INSERT INTO `question` VALUES (98, 'When would the ROM monitor mode be used?', 'maintaining routing configuration settings', 'modifying the IOS image stored in Flash', 'running a limited IOS feature set', 'performing the bootstrap process', '1');
INSERT INTO `question` VALUES (99, 'Which of the following are functions of RAM?', 'contains startup configuration file', 'stores routing table', 'holds fast switching cache', 'retains contents when power is removed', '4');

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `stdinfo`
-- 

CREATE TABLE `stdinfo` (
  `syd_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY  (`syd_id`)
) TYPE=MyISAM;

-- 
-- dump ตาราง `stdinfo`
-- 

