#create database for snort_inline

CREATE DATABASE  snort;

USE snort;

CREATE TABLE `schema` ( vseq        INT      UNSIGNED NOT NULL,
                      ctime       DATETIME NOT NULL,
                      PRIMARY KEY (vseq));
INSERT INTO schema  (vseq, ctime) VALUES ('106', now());       

CREATE TABLE event  ( sid 	  INT 	   UNSIGNED NOT NULL,
                      cid 	  INT 	   UNSIGNED NOT NULL,
                      signature   INT      UNSIGNED NOT NULL, 
                      timestamp 	   DATETIME NOT NULL,
                      PRIMARY KEY (sid,cid),
                      INDEX       sig (signature),
                      INDEX       time (timestamp));

CREATE TABLE signature ( sig_id       INT          UNSIGNED NOT NULL AUTO_INCREMENT,
                         sig_name     VARCHAR(255) NOT NULL,
                         sig_class_id INT          UNSIGNED NOT NULL,
                         sig_priority INT          UNSIGNED,
                         sig_rev      INT          UNSIGNED,
                         sig_sid      INT          UNSIGNED,
                         PRIMARY KEY (sig_id),
                         INDEX   sign_idx (sig_name(20)),
                         INDEX   sig_class_id_idx (sig_class_id));

CREATE TABLE sig_reference (sig_id  INT    UNSIGNED NOT NULL,
                            ref_seq INT    UNSIGNED NOT NULL,
                            ref_id  INT    UNSIGNED NOT NULL,
                            PRIMARY KEY(sig_id, ref_seq));

CREATE TABLE reference (  ref_id        INT         UNSIGNED NOT NULL AUTO_INCREMENT,
                          ref_system_id INT         UNSIGNED NOT NULL,
                          ref_tag       TEXT NOT NULL,
                          PRIMARY KEY (ref_id));

CREATE TABLE reference_system ( ref_system_id   INT         UNSIGNED NOT NULL AUTO_INCREMENT,
                                ref_system_name VARCHAR(20),
                                PRIMARY KEY (ref_system_id));

CREATE TABLE sig_class ( sig_class_id        INT    UNSIGNED NOT NULL AUTO_INCREMENT,
                         sig_class_name      VARCHAR(60) NOT NULL,
                         PRIMARY KEY (sig_class_id),
                         INDEX       (sig_class_id),
                         INDEX       (sig_class_name));

# store info about the sensor supplying data
CREATE TABLE sensor ( sid	  INT 	   UNSIGNED NOT NULL AUTO_INCREMENT,
                      hostname    TEXT,
                      interface   TEXT,
                      filter	  TEXT,
                      detail	  TINYINT,
                      encoding	  TINYINT,
                      last_cid    INT      UNSIGNED NOT NULL,
                      PRIMARY KEY (sid));

# All of the fields of an ip header
CREATE TABLE iphdr  ( sid 	  INT 	   UNSIGNED NOT NULL,
                      cid 	  INT 	   UNSIGNED NOT NULL,
                      ip_src      INT      UNSIGNED NOT NULL,
                      ip_dst      INT      UNSIGNED NOT NULL,
                      ip_ver      TINYINT  UNSIGNED,
                      ip_hlen     TINYINT  UNSIGNED,
                      ip_tos  	  TINYINT  UNSIGNED,
                      ip_len 	  SMALLINT UNSIGNED,
                      ip_id    	  SMALLINT UNSIGNED,
                      ip_flags    TINYINT  UNSIGNED,
                      ip_off      SMALLINT UNSIGNED,
                      ip_ttl   	  TINYINT  UNSIGNED,
                      ip_proto 	  TINYINT  UNSIGNED NOT NULL,
                      ip_csum 	  SMALLINT UNSIGNED,
                      PRIMARY KEY (sid,cid),
                      INDEX ip_src (ip_src),
                      INDEX ip_dst (ip_dst));

# All of the fields of a tcp header
CREATE TABLE tcphdr(  sid 	  INT 	   UNSIGNED NOT NULL,
                      cid 	  INT 	   UNSIGNED NOT NULL,
                      tcp_sport   SMALLINT UNSIGNED NOT NULL,
                      tcp_dport   SMALLINT UNSIGNED NOT NULL,
                      tcp_seq     INT      UNSIGNED,
                      tcp_ack     INT      UNSIGNED,
                      tcp_off     TINYINT  UNSIGNED,
                      tcp_res     TINYINT  UNSIGNED,
                      tcp_flags   TINYINT  UNSIGNED NOT NULL,
                      tcp_win     SMALLINT UNSIGNED,
                      tcp_csum    SMALLINT UNSIGNED,
                      tcp_urp     SMALLINT UNSIGNED,
                      PRIMARY KEY (sid,cid),
                      INDEX       tcp_sport (tcp_sport),
                      INDEX       tcp_dport (tcp_dport),
                      INDEX       tcp_flags (tcp_flags));

# All of the fields of a udp header
CREATE TABLE udphdr(  sid 	  INT 	   UNSIGNED NOT NULL,
                      cid 	  INT 	   UNSIGNED NOT NULL,
                      udp_sport   SMALLINT UNSIGNED NOT NULL,
                      udp_dport   SMALLINT UNSIGNED NOT NULL,
                      udp_len     SMALLINT UNSIGNED,
                      udp_csum    SMALLINT UNSIGNED,
                      PRIMARY KEY (sid,cid),
                      INDEX       udp_sport (udp_sport),
                      INDEX       udp_dport (udp_dport));

# All of the fields of an icmp header
CREATE TABLE icmphdr( sid 	  INT 	   UNSIGNED NOT NULL,
                      cid 	  INT  	   UNSIGNED NOT NULL,
                      icmp_type   TINYINT  UNSIGNED NOT NULL,
                      icmp_code   TINYINT  UNSIGNED NOT NULL,
                      icmp_csum   SMALLINT UNSIGNED,
                      icmp_id     SMALLINT UNSIGNED,
                      icmp_seq    SMALLINT UNSIGNED,
                      PRIMARY KEY (sid,cid),
                      INDEX       icmp_type (icmp_type));

# Protocol options
CREATE TABLE opt    ( sid         INT      UNSIGNED NOT NULL,
                      cid         INT      UNSIGNED NOT NULL,
                      optid       INT      UNSIGNED NOT NULL,
                      opt_proto   TINYINT  UNSIGNED NOT NULL,
                      opt_code    TINYINT  UNSIGNED NOT NULL,
                      opt_len     SMALLINT,
                      opt_data    TEXT,
                      PRIMARY KEY (sid,cid,optid));

# Packet payload
CREATE TABLE data   ( sid           INT      UNSIGNED NOT NULL,
                      cid           INT      UNSIGNED NOT NULL,
                      data_payload  TEXT,
                      PRIMARY KEY (sid,cid));

# encoding is a lookup table for storing encoding types
CREATE TABLE encoding(encoding_type TINYINT UNSIGNED NOT NULL,
                      encoding_text TEXT NOT NULL,
                      PRIMARY KEY (encoding_type));
INSERT INTO encoding (encoding_type, encoding_text) VALUES (0, 'hex');
INSERT INTO encoding (encoding_type, encoding_text) VALUES (1, 'base64');
INSERT INTO encoding (encoding_type, encoding_text) VALUES (2, 'ascii');

# detail is a lookup table for storing different detail levels
CREATE TABLE detail  (detail_type TINYINT UNSIGNED NOT NULL,
                      detail_text TEXT NOT NULL,
                      PRIMARY KEY (detail_type));
INSERT INTO detail (detail_type, detail_text) VALUES (0, 'fast');
INSERT INTO detail (detail_type, detail_text) VALUES (1, 'full');


#CREATE TABLE acid_event   ( sid                 INT UNSIGNED NOT NULL,
#                            cid                 INT UNSIGNED NOT NULL,
#                            signature           INT UNSIGNED NOT NULL,
#                            sig_name            VARCHAR(255),
#                            sig_class_id        INT UNSIGNED,
#                            sig_priority        INT UNSIGNED,
#                            timestamp           DATETIME NOT NULL,
#                            ip_src              INT UNSIGNED,
#                            ip_dst              INT UNSIGNED,
#                            ip_proto            INT,
#                            layer4_sport        INT UNSIGNED,
#                            layer4_dport        INT UNSIGNED,
#
#                            PRIMARY KEY         (sid,cid),
#                            INDEX               (signature),
#                            INDEX               (sig_name),
#                            INDEX               (sig_class_id),
#                            INDEX               (sig_priority),
#                            INDEX               (timestamp),
#                            INDEX               (ip_src),
#                            INDEX               (ip_dst),
#                            INDEX               (ip_proto),
#                            INDEX               (layer4_sport),
#                            INDEX               (layer4_dport));

