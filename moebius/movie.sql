update M_USER set user_point=600000 where user_id='admin'
delete from M_RESERVE
/* Drop Tables */

DROP TABLE m_board CASCADE CONSTRAINTS;
DROP TABLE m_board_info CASCADE CONSTRAINTS;
DROP TABLE m_reserve CASCADE CONSTRAINTS;
DROP TABLE m_schedule CASCADE CONSTRAINTS;
DROP TABLE m_seat CASCADE CONSTRAINTS;
DROP TABLE m_screen CASCADE CONSTRAINTS;
DROP TABLE m_comment CASCADE CONSTRAINTS;
DROP TABLE m_location CASCADE CONSTRAINTS;
DROP TABLE m_comment_total CASCADE CONSTRAINTS;
DROP TABLE m_movie CASCADE CONSTRAINTS;
DROP TABLE m_user CASCADE CONSTRAINTS;



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
DROP SEQUENCE seq_comment_total_no;




/* Create Sequences */

CREATE SEQUENCE seq_movie_no;
CREATE SEQUENCE seq_board_no;
CREATE SEQUENCE seq_bno;
CREATE SEQUENCE seq_comment_no;
CREATE SEQUENCE seq_location_no;
CREATE SEQUENCE seq_schedule_no;
CREATE SEQUENCE seq_screen_no;
CREATE SEQUENCE seq_seat_no;
CREATE SEQUENCE seq_reserve_no;
CREATE SEQUENCE seq_comment_total_no;



/* Create Tables */

CREATE TABLE m_board_info
(
	bno number NOT NULL,
	bname varchar2(100) NOT NULL,
	user_id varchar2(20) NOT NULL,
	PRIMARY KEY (bno)
);


CREATE TABLE m_screen
(
	screen_no number NOT NULL,
	screen_name varchar2(5) NOT NULL,
	movie_no number NOT NULL,
	location_no number NOT NULL,
	PRIMARY KEY (screen_no)
);


CREATE TABLE m_comment
(
	comment_star number DEFAULT 0 NOT NULL,
	comment_review varchar2(200) NOT NULL,
	comment_no number NOT NULL,
	user_id varchar2(20) NOT NULL,
	movie_no number NOT NULL,
	PRIMARY KEY (comment_no)
);


CREATE TABLE m_location
(
	location_no number NOT NULL,
	location_name varchar2(20) NOT NULL,
	location_addr varchar2(200) NOT NULL,
	location_addx varchar2(20) NOT NULL,
	location_addy varchar2(20) NOT NULL,
	location_phone varchar2(20) NOT NULL,
	PRIMARY KEY (location_no)
);


CREATE TABLE m_comment_total
(
	comment_total_no number NOT NULL,
	user_id varchar2(20) NOT NULL,
	comment_count number DEFAULT 0 NOT NULL,
	movie_no number NOT NULL,
	PRIMARY KEY (comment_total_no)
);


CREATE TABLE m_seat
(
	seat_no number NOT NULL,
	seat_name varchar2(4) NOT NULL,
	location_no number NOT NULL,
	screen_no number NOT NULL,
	PRIMARY KEY (seat_no)
);


CREATE TABLE m_board
(
	board_no number NOT NULL,
	board_title varchar2(100) NOT NULL,
	board_content varchar2(4000) NOT NULL,
	board_regdate date DEFAULT sysdate NOT NULL,
	board_count number DEFAULT 0 NOT NULL,
	bno number NOT NULL,
	user_id varchar2(20) NOT NULL,
	PRIMARY KEY (board_no)
);


CREATE TABLE m_movie
(
	movie_no number NOT NULL,
	movie_title varchar2(100) NOT NULL,
	movie_directer varchar2(40) NOT NULL,
	movie_genre varchar2(40) NOT NULL,
	movie_nation varchar2(20) NOT NULL,
	movie_runningtime number NOT NULL,
	movie_actor varchar2(2000) NOT NULL,
	movie_story varchar2(2000) NOT NULL,
	movie_poster varchar2(20) NOT NULL,
	movie_count number DEFAULT 0 NOT NULL,
	movie_sdate date NOT NULL,
	movie_grade number NOT NULL,
	movie_point number NOT NULL,
	movie_edate date NOT NULL,
	movie_video varchar2(2000),
	user_id varchar2(20) NOT NULL,
	PRIMARY KEY (movie_no)
);


CREATE TABLE m_schedule
(
	schedule_no number NOT NULL,
	schedule_date date NOT NULL,
	schedule_time date NOT NULL,
	screen_no number NOT NULL,
	PRIMARY KEY (schedule_no)
);


CREATE TABLE m_user
(
	user_id varchar2(20) NOT NULL,
	user_name varchar2(20) NOT NULL,
	user_age number NOT NULL,
	user_pwd varchar2(100) NOT NULL,
	user_pwd_ok varchar2(100) NOT NULL,
	user_pwd_hint varchar2(200) NOT NULL,
	user_pwd_answer varchar2(100) NOT NULL,
	user_gender number(1) DEFAULT 1 NOT NULL,
	user_email varchar2(60) NOT NULL,
	user_phone varchar2(16) NOT NULL,
	user_zipcode varchar2(7) NOT NULL,
	user_addr1 varchar2(100) NOT NULL,
	user_addr2 varchar2(50) NOT NULL,
	user_regdate date DEFAULT sysdate NOT NULL,
	user_point number DEFAULT 5000 NOT NULL,
	user_status number(1) DEFAULT 0 NOT NULL,
	PRIMARY KEY (user_id)
);


CREATE TABLE m_reserve
(
	reserve_no number NOT NULL,
	user_id varchar2(20) NOT NULL,
	screen_no number NOT NULL,
	seat_no number NOT NULL,
	schedule_no number NOT NULL,
	movie_no number NOT NULL,
	PRIMARY KEY (reserve_no)
);



/* Create Foreign Keys */

ALTER TABLE m_board
	ADD FOREIGN KEY (bno)
	REFERENCES m_board_info (bno)
;


ALTER TABLE m_reserve
	ADD FOREIGN KEY (screen_no)
	REFERENCES m_screen (screen_no)
;


ALTER TABLE m_schedule
	ADD FOREIGN KEY (screen_no)
	REFERENCES m_screen (screen_no)
;


ALTER TABLE m_seat
	ADD FOREIGN KEY (screen_no)
	REFERENCES m_screen (screen_no)
;


ALTER TABLE m_screen
	ADD FOREIGN KEY (location_no)
	REFERENCES m_location (location_no)
;


ALTER TABLE m_reserve
	ADD FOREIGN KEY (seat_no)
	REFERENCES m_seat (seat_no)
;


ALTER TABLE m_comment
	ADD FOREIGN KEY (movie_no)
	REFERENCES m_movie (movie_no)
;


ALTER TABLE m_screen
	ADD FOREIGN KEY (movie_no)
	REFERENCES m_movie (movie_no)
;


ALTER TABLE m_comment_total
	ADD FOREIGN KEY (movie_no)
	REFERENCES m_movie (movie_no)
;


ALTER TABLE m_reserve
	ADD FOREIGN KEY (movie_no)
	REFERENCES m_movie (movie_no)
;


ALTER TABLE m_reserve
	ADD FOREIGN KEY (schedule_no)
	REFERENCES m_schedule (schedule_no)
;


ALTER TABLE m_comment
	ADD FOREIGN KEY (user_id)
	REFERENCES m_user (user_id)
;


ALTER TABLE m_comment_total
	ADD FOREIGN KEY (user_id)
	REFERENCES m_user (user_id)
;


ALTER TABLE m_board_info
	ADD FOREIGN KEY (user_id)
	REFERENCES m_user (user_id)
;


ALTER TABLE m_board
	ADD FOREIGN KEY (user_id)
	REFERENCES m_user (user_id)
;


ALTER TABLE m_movie
	ADD FOREIGN KEY (user_id)
	REFERENCES m_user (user_id)
;


ALTER TABLE m_reserve
	ADD FOREIGN KEY (user_id)
	REFERENCES m_user (user_id)
;


-- 게시판 준비
insert into m_board_info(bno, bname, user_id)
values(seq_bno.nextval, '공지사항','admin');

-- 게시판 준비
insert into m_board_info(bno, bname, user_id)
values(seq_bno.nextval, '자주하는질문','admin');

select * from m_board_info;


insert into m_location(location_no, location_name, location_addr, location_addx, location_addy, location_phone)
values (seq_location_no.nextval, '영등포', '서울시 영등포구 영등포동 4가 442', 126.9034013, 37.5172108, '02)2638-2000');
insert into m_location(location_no, location_name, location_addr, location_addx, location_addy, location_phone)
values (seq_location_no.nextval, '용산', '서울특별시 용산구 한강로3가 40-11', 126.9644407, 37.5296968, '02)1544-1123');
insert into m_location(location_no, location_name, location_addr, location_addx, location_addy, location_phone)
values (seq_location_no.nextval, '홍대입구', '서울특별시 마포구 동교동 165', 126.9237910, 37.5568476, '02)2638-2000');

select * from M_SCREEN;
select * from m_location;
select * from m_seat;
select * from m_reserve;
select * from M_SCHEDULE;

	SELECT u.user_name, l.location_name, s.screen_name, m.movie_title, t.seat_name, m.movie_point, to_char(h.schedule_time,'HH24:MI') AS schedule_time, to_char(h.schedule_date,'YYYYMMDD') AS schedule_date
		FROM m_user u, m_movie m, m_location l, m_screen s, m_seat t, m_reserve r, m_schedule h
		WHERE u.user_id='admin' AND r.user_id='admin' AND s.screen_no='1' AND l.location_name='영등포' AND t.seat_no=35 AND h.schedule_no=11 AND m.movie_no=1
	
		
		
		
		
		
		
		
		
		
		