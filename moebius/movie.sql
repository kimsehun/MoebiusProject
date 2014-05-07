
/* Drop Tables */

DROP TABLE m_board CASCADE CONSTRAINTS;
DROP TABLE m_board_info CASCADE CONSTRAINTS;
DROP TABLE m_reserve CASCADE CONSTRAINTS;
DROP TABLE m_seat CASCADE CONSTRAINTS;
DROP TABLE m_screen CASCADE CONSTRAINTS;
DROP TABLE m_location CASCADE CONSTRAINTS;
DROP TABLE m_comment CASCADE CONSTRAINTS;
DROP TABLE m_movie CASCADE CONSTRAINTS;
DROP TABLE m_user CASCADE CONSTRAINTS;
DROP TABLE m_schedule CASCADE CONSTRAINTS;

/* Drop Sequences */

DROP SEQUENCE seq_movie_no;
DROP SEQUENCE seq_board_no;
DROP SEQUENCE seq_bno;
DROP SEQUENCE seq_comment_no;
DROP SEQUENCE seq_location_no;
DROP SEQUENCE seq_schedule_no;
DROP SEQUENCE seq_screen_no;
DROP SEQUENCE seq_seat_no;
DROP SEQUENCE seq_reserve_no;


select * from m_user;

/* Create Sequences */

CREATE SEQUENCE seq_movie_no nocache;
CREATE SEQUENCE seq_board_no nocache;
CREATE SEQUENCE seq_bno nocache;
CREATE SEQUENCE seq_comment_no nocache;
CREATE SEQUENCE seq_location_no nocache;
CREATE SEQUENCE seq_schedule_no nocache;
CREATE SEQUENCE seq_screen_no nocache;
CREATE SEQUENCE seq_seat_no nocache;
CREATE SEQUENCE seq_reserve_no nocache;



/* Create Tables */

CREATE TABLE m_board_info
(
	bno number NOT NULL,
	bname varchar2(100) NOT NULL,
	user_id varchar2(20) NOT NULL,
	PRIMARY KEY (bno)
);


CREATE TABLE m_location
(
	location_no number NOT NULL,
	location_name varchar2(20) NOT NULL,
	locaiton_addr varchar2(200) NOT NULL,
	location_addx varchar2(20) NOT NULL,
	location_addy varchar2(20) NOT NULL,
	location_phone varchar2(11) NOT NULL,
	movie_no number NOT NULL,
	PRIMARY KEY (location_no)
);


CREATE TABLE m_board
(
	board_no number NOT NULL,
	board_title varchar2(100) NOT NULL,
	board_content varchar2(4000) NOT NULL,
	board_regdate date DEFAULT sysdate NOT NULL,
	board_count number DEFAULT 0 NOT NULL,
	user_id varchar2(20) NOT NULL,
	bno number NOT NULL,
	PRIMARY KEY (board_no)
);


CREATE TABLE m_screen
(
	screen_no number NOT NULL,
	location_no number NOT NULL,
	screen_name varchar2(5) NOT NULL,
	movie_no number NOT NULL,
	schedule_no number NOT NULL,
	PRIMARY KEY (screen_no)
);


CREATE TABLE m_seat
(
	seat_no number NOT NULL,
	screen_no number NOT NULL,
	seat_name varchar2(4) NOT NULL,
	PRIMARY KEY (seat_no)
);


CREATE TABLE m_user
(
	user_id varchar2(20) NOT NULL,
	user_name varchar2(20) NOT NULL,
	user_age number NOT NULL,
	user_pwd varchar2(100) NOT NULL,
	user_pwd_hint varchar2(200) NOT NULL,
	user_pwd_answer varchar2(100) NOT NULL,
	user_gender number(1) DEFAULT 1 NOT NULL,
	user_jumin1 number(6) NOT NULL,
	user_jumin2 number(7) NOT NULL,
	user_email varchar2(60) NOT NULL,
	user_phone varchar2(16) NOT NULL,
	user_zipcode varchar2(7) NOT NULL,
	user_addr1 varchar2(100) NOT NULL,
	user_addr2 varchar2(50) NOT NULL,
	user_regdate date DEFAULT sysdate NOT NULL,
	user_point number DEFAULT 0 NOT NULL,
	user_status number(1) DEFAULT 0 NOT NULL,
	PRIMARY KEY (user_id)
);


CREATE TABLE m_reserve
(
	user_id varchar2(20) NOT NULL,
	reserve_no number NOT NULL,
	seat_no number NOT NULL,
	screen_no number NOT NULL,
	PRIMARY KEY (reserve_no)
);


CREATE TABLE m_schedule
(
	schedule_no number NOT NULL,
	schedule_date date NOT NULL,
	schedule_time varchar2(20),
	PRIMARY KEY (schedule_no)
);


CREATE TABLE m_movie
(
	movie_no number NOT NULL,
	movie_title varchar2(100) NOT NULL,
	movie_directer varchar2(40) NOT NULL,
	movie_story varchar2(2000) NOT NULL,
	movie_poster varchar2(20) NOT NULL,
	movie_count number DEFAULT 0 NOT NULL,
	movie_sdate date NOT NULL,
	movie_grade number NOT NULL,
	movie_point number NOT NULL,
	movie_edate date NOT NULL,
	user_id varchar2(20) NOT NULL,
	PRIMARY KEY (movie_no)
);


CREATE TABLE m_comment
(
	user_id varchar2(20) NOT NULL,
	comment_star number DEFAULT 0 NOT NULL,
	comment_review varchar2(200) NOT NULL,
	movie_no number NOT NULL,
	comment_avgstar number DEFAULT 0 NOT NULL,
	comment_no number NOT NULL,
	PRIMARY KEY (comment_no)
);



/* Create Foreign Keys */

ALTER TABLE m_board
	ADD FOREIGN KEY (bno)
	REFERENCES m_board_info (bno)
;


ALTER TABLE m_screen
	ADD FOREIGN KEY (location_no)
	REFERENCES m_location (location_no)
;


ALTER TABLE m_seat
	ADD FOREIGN KEY (screen_no)
	REFERENCES m_screen (screen_no)
;


ALTER TABLE m_reserve
	ADD FOREIGN KEY (screen_no)
	REFERENCES m_screen (screen_no)
;


ALTER TABLE m_reserve
	ADD FOREIGN KEY (seat_no)
	REFERENCES m_seat (seat_no)
;


ALTER TABLE m_movie
	ADD FOREIGN KEY (user_id)
	REFERENCES m_user (user_id)
;


ALTER TABLE m_board_info
	ADD FOREIGN KEY (user_id)
	REFERENCES m_user (user_id)
;


ALTER TABLE m_comment
	ADD FOREIGN KEY (user_id)
	REFERENCES m_user (user_id)
;


ALTER TABLE m_board
	ADD FOREIGN KEY (user_id)
	REFERENCES m_user (user_id)
;


ALTER TABLE m_reserve
	ADD FOREIGN KEY (user_id)
	REFERENCES m_user (user_id)
;


ALTER TABLE m_screen
	ADD FOREIGN KEY (schedule_no)
	REFERENCES m_schedule (schedule_no)
;


ALTER TABLE m_location
	ADD FOREIGN KEY (movie_no)
	REFERENCES m_movie (movie_no)
;


ALTER TABLE m_comment
	ADD FOREIGN KEY (movie_no)
	REFERENCES m_movie (movie_no)
;


ALTER TABLE m_screen
	ADD FOREIGN KEY (movie_no)
	REFERENCES m_movie (movie_no)
;



