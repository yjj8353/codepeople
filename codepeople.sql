
/* Drop Triggers */

DROP TRIGGER TRI_qna_answer_answer_no;
DROP TRIGGER TRI_qna_comment_comment_no;
DROP TRIGGER TRI_qna_qna_no;
DROP TRIGGER TRI_qna_tag_hash_no;
DROP TRIGGER TRI_Users_user_no;



/* Drop Tables */

DROP TABLE advertising_bar CASCADE CONSTRAINTS;
DROP TABLE user_badge CASCADE CONSTRAINTS;
DROP TABLE badge CASCADE CONSTRAINTS;
DROP TABLE lectrue_history CASCADE CONSTRAINTS;
DROP TABLE piad_lecture_question_reply CASCADE CONSTRAINTS;
DROP TABLE paid_lecture_question CASCADE CONSTRAINTS;
DROP TABLE paid_lecture_review CASCADE CONSTRAINTS;
DROP TABLE buy_lecture CASCADE CONSTRAINTS;
DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE free_lecture_chedule CASCADE CONSTRAINTS;
DROP TABLE free_lecture_grade CASCADE CONSTRAINTS;
DROP TABLE free_lecture_coment_reply CASCADE CONSTRAINTS;
DROP TABLE free_lecture_coment CASCADE CONSTRAINTS;
DROP TABLE free_lecture_section CASCADE CONSTRAINTS;
DROP TABLE free_lecture CASCADE CONSTRAINTS;
DROP TABLE paid_lecture_note CASCADE CONSTRAINTS;
DROP TABLE paid_lecture_detail CASCADE CONSTRAINTS;
DROP TABLE paid_lecture CASCADE CONSTRAINTS;
DROP TABLE instructor CASCADE CONSTRAINTS;
DROP TABLE qna_answer CASCADE CONSTRAINTS;
DROP TABLE qna CASCADE CONSTRAINTS;
DROP TABLE qna_comment CASCADE CONSTRAINTS;
DROP TABLE qna_tag CASCADE CONSTRAINTS;
DROP TABLE user_follow CASCADE CONSTRAINTS;
DROP TABLE user_avatar CASCADE CONSTRAINTS;
DROP TABLE user_chat CASCADE CONSTRAINTS;
DROP TABLE user_log CASCADE CONSTRAINTS;
DROP TABLE Users CASCADE CONSTRAINTS;
DROP TABLE user_auth CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_qna_answer_answer_no;
DROP SEQUENCE SEQ_qna_comment_comment_no;
DROP SEQUENCE SEQ_qna_qna_no;
DROP SEQUENCE SEQ_qna_tag_hash_no;
DROP SEQUENCE SEQ_Users_user_no;




/* Create Sequences */

CREATE SEQUENCE SEQ_qna_answer_answer_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_qna_comment_comment_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_qna_qna_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_qna_tag_hash_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Users_user_no INCREMENT BY 1 START WITH 1;



/* Create Tables */

-- 새 테이블
CREATE TABLE advertising_bar
(
	-- ad_no
	ad_no number(5,0) NOT NULL,
	-- add_name
	add_name varchar2(200),
	-- add_img_path
	add_img_path varchar2(300),
	-- ad_type
	ad_type varchar2(20),
	-- ad_status
	ad_status varchar2(1),
	-- ad_create_date
	ad_create_date date,
	PRIMARY KEY (ad_no)
);


-- 달성 뱃지
CREATE TABLE badge
(
	-- badge_no
	badge_no number(5,0) NOT NULL,
	-- badge_name
	badge_name varchar2(100) NOT NULL,
	-- badge_icon
	badge_icon varchar2(100) NOT NULL,
	-- badge_exp
	badge_exp number(5,0) NOT NULL,
	PRIMARY KEY (badge_no)
);


-- 유저가 산 강좌들
CREATE TABLE buy_lecture
(
	-- buy_lecture_no
	buy_lecture_no number(5,0) NOT NULL,
	-- paid_lecture_no
	paid_lecture_no number(5,0) NOT NULL,
	-- user_no
	user_no number(5,0) NOT NULL,
	PRIMARY KEY (buy_lecture_no)
);


-- 장바구니
CREATE TABLE cart
(
	-- cart_no
	cart_no number(7,0) NOT NULL,
	-- user_no
	user_no number(5,0) NOT NULL,
	-- paid_lecture_no
	paid_lecture_no number(5,0) NOT NULL,
	-- create_date
	create_date date,
	PRIMARY KEY (cart_no)
);


-- 무료강의
CREATE TABLE free_lecture
(
	-- free_lecture_no
	free_lecture_no number(5,0) NOT NULL,
	-- lecture_image
	lecture_image varchar2(100),
	-- lecture_title
	lecture_title varchar2(100) NOT NULL,
	-- lecture_contents
	lecture_contents varchar2(4000),
	-- lecture_time
	lecture_time number(5,0),
	-- lecture_level
	lecture_level varchar2(100),
	-- lecture_lecture_summary
	lecture_lecture_summary varchar2(500),
	PRIMARY KEY (free_lecture_no)
);


-- 새 테이블
CREATE TABLE free_lecture_chedule
(
	-- lecture_schedule_no
	lecture_schedule_no number(5,0) NOT NULL,
	-- free_lecture_no
	free_lecture_no number(5,0) NOT NULL,
	-- user_no
	user_no number(5,0) NOT NULL,
	-- scheduler_name
	scheduler_name varchar2(100),
	-- scheduler_start_date
	scheduler_start_date date,
	-- scheduler_end_date
	scheduler_end_date date,
	PRIMARY KEY (lecture_schedule_no)
);


-- free_lecture_coment
CREATE TABLE free_lecture_coment
(
	-- lecture_coment_no
	lecture_coment_no number(5,0) NOT NULL,
	-- lecture_section_no
	lecture_section_no number(5,0) NOT NULL,
	-- user_no
	user_no number(5,0) NOT NULL,
	-- coment_contents
	coment_contents varchar2(1000),
	-- coment_likes
	coment_like number(5,0),
	-- coment_create_date
	coment_create_date date,
	PRIMARY KEY (lecture_coment_no)
);


-- free_lecture_coment_reply
CREATE TABLE free_lecture_coment_reply
(
	-- coment_reply_no
	coment_reply_no number(5,0) NOT NULL,
	-- user_no
	user_no number(5,0) NOT NULL,
	-- lecture_coment_no
	lecture_coment_no number(5,0) NOT NULL,
	-- reply_contents
	reply_contents varchar2(1000),
	-- reply_create_date
	reply_create_date date,
	PRIMARY KEY (coment_reply_no)
);


-- free_lecture_grade
CREATE TABLE free_lecture_grade
(
	-- lectrue_grade_no
	lectrue_grade_no number(5,0) NOT NULL,
	-- gade_coment
	gade_coment varchar2(4000),
	-- grade_point
	grade_point number(2,0),
	-- grade_create_date
	grade_create_date date,
	-- free_lecture_no
	free_lecture_no number(5,0) NOT NULL,
	-- user_no
	user_no number(5,0) NOT NULL,
	PRIMARY KEY (lectrue_grade_no)
);


-- free_lecture_section
CREATE TABLE free_lecture_section
(
	-- lecture_section_no
	lecture_section_no number(5,0) NOT NULL,
	-- free_lecture_no
	free_lecture_no number(5,0) NOT NULL,
	-- section_title
	section_title varchar2(100),
	-- section_contents
	section_contents varchar2(4000),
	-- section_count
	section_count number(7,0),
	-- section_views
	section_views number(5,0),
	-- section_create_date
	section_create_date date,
	PRIMARY KEY (lecture_section_no)
);


-- 강사
CREATE TABLE instructor
(
	-- instructor_no
	instructor_no number(5,0) NOT NULL,
	-- user_no
	user_no number(5,0) NOT NULL,
	-- instructor_summary
	instructor_summary varchar2(4000),
	-- instructor_description
	instructor_description varchar2(1000),
	PRIMARY KEY (instructor_no)
);


-- 새 테이블
CREATE TABLE lectrue_history
(
	-- studied_no
	studied_no number(5,0) NOT NULL,
	-- instructor_no
	instructor_no number(5,0) NOT NULL,
	-- detail_no
	detail_no number(5,0) NOT NULL,
	-- buy_lecture_no
	buy_lecture_no number(5,0) NOT NULL,
	-- pass
	pass varchar2(1) DEFAULT 'N',
	PRIMARY KEY (studied_no)
);


-- 유료 강좌
CREATE TABLE paid_lecture
(
	-- paid_lecture_no
	paid_lecture_no number(5,0) NOT NULL,
	-- instructor_no
	instructor_no number(5,0) NOT NULL,
	-- lecture_lang
	lecture_lang varchar2(100),
	-- lecture_title
	lecture_title varchar2(100),
	-- lecture_level
	lecture_level varchar2(100),
	-- lecture_specialized
	lecture_specialized varchar2(100),
	-- lecture_summary
	lecture_summary varchar2(4000),
	-- lecture_description
	lecture_description varchar2(1000),
	-- lecture_price
	lecture_price number(7,0),
	-- lecture_thumnail_path
	lecture_thumnail_path varchar2(300),
	-- lecture_create_date
	lecture_create_date date,
	-- lecture_likes
	lecture_likes number(5,0),
	-- lecture_view_count
	lecture_view_count number(7,0),
	-- exposure_status
	exposure_status varchar2(1),
	-- approve_status
	approve_status varchar2(1),
	PRIMARY KEY (paid_lecture_no)
);


-- 유료 강좌 디테일
CREATE TABLE paid_lecture_detail
(
	-- detail_no
	detail_no number(5,0) NOT NULL,
	-- instructor_no
	instructor_no number(5,0) NOT NULL,
	-- paid_lecture_no
	paid_lecture_no number(5,0) NOT NULL,
	-- filepath
	filepath varchar2(100),
	-- section_no
	section_no number(5,0),
	-- section_name
	section_name varchar2(100),
	-- lesson_no
	lesson_no number(5,0),
	-- lesson_name
	lesson_name varchar2(100),
	-- lesson_length
	lesson_length number(5,0),
	PRIMARY KEY (detail_no)
);


-- 새 테이블
CREATE TABLE paid_lecture_note
(
	-- note_no
	note_no number(5,0) NOT NULL,
	-- user_no
	user_no number(5,0) NOT NULL,
	-- detail_no
	detail_no number(5,0) NOT NULL,
	PRIMARY KEY (note_no)
);


-- 새 테이블
CREATE TABLE paid_lecture_question
(
	-- question_no
	question_no number(5,0) NOT NULL,
	-- buy_lecture_no
	buy_lecture_no number(5,0) NOT NULL,
	-- detail_no
	detail_no number(5,0) NOT NULL,
	-- title
	title varchar2(100),
	-- content
	content varchar2(3000),
	-- create_date
	create_date date,
	PRIMARY KEY (question_no)
);


-- 리뷰
CREATE TABLE paid_lecture_review
(
	-- review_no
	review_no number(5,0) NOT NULL,
	-- buy_lecture_no
	buy_lecture_no number(5,0) NOT NULL,
	-- detail_no
	detail_no number(5,0) NOT NULL,
	-- comments
	comments varchar2(1000),
	-- create_date
	create_date date,
	-- grade
	grade number(5,0),
	PRIMARY KEY (review_no)
);


-- 새 테이블
CREATE TABLE piad_lecture_question_reply
(
	-- reply_no
	reply_no number(5,0) NOT NULL,
	-- question_no
	question_no number(5,0) NOT NULL,
	-- buy_lecture_no
	buy_lecture_no number(5,0) NOT NULL,
	-- content
	content varchar2(1000),
	PRIMARY KEY (reply_no)
);


-- QnA
CREATE TABLE qna
(
	-- qna_no
	qna_no number(5,0) NOT NULL,
	-- qna_title
	qna_title varchar2(500),
	-- qna_writer
	qna_writer varchar2(500),
	-- qna_contents
	qna_contents varchar2(4000),
	-- qna_views
	qna_views number(5,0),
	-- qna_create_date
	qna_create_date date,
	PRIMARY KEY (qna_no)
);


-- 답변
CREATE TABLE qna_answer
(
	-- answer_no
	answer_no number(5,0) NOT NULL,
	-- answer_writer
	answer_writer varchar2(300),
	-- answer_contents
	answer_contents varchar2(4000),
	-- answer_create_date
	answer_create_date date,
	-- qna_no
	qna_no number(5,0) NOT NULL,
	PRIMARY KEY (answer_no)
);


-- QnA댓글
CREATE TABLE qna_comment
(
	-- comment_no
	comment_no number(7,0) NOT NULL,
	-- co_writer
	co_writer number(5,0),
	-- co_contents
	co_contents varchar2(3000),
	-- co_create_date
	co_create_date date,
	PRIMARY KEY (comment_no)
);


-- 새 테이블
CREATE TABLE qna_tag
(
	-- hash_no
	hash_no number(7,0) NOT NULL,
	-- hash_contents
	hash_contents varchar2(100),
	PRIMARY KEY (hash_no)
);


-- 회원
CREATE TABLE Users
(
	-- user_no
	user_no number(5,0) NOT NULL,
	-- user_id
	user_id varchar2(100) NOT NULL UNIQUE,
	-- user_password
	user_password varchar2(100) NOT NULL,
	-- user_email
	user_email varchar2(100) NOT NULL UNIQUE,
	-- user_name
	user_name varchar2(100) NOT NULL,
	-- user_create_date
	user_create_date date NOT NULL,
	-- user_auth_status
	user_auth_status number(2,0) DEFAULT 0 NOT NULL,
	PRIMARY KEY (user_no)
);


-- 새 테이블
CREATE TABLE user_auth
(
	-- auth_email
	auth_email varchar2(100),
	-- auth_key
	auth_key varchar2(100)
);


-- 유저 화면출력정보
CREATE TABLE user_avatar
(
	-- user_no
	user_no number(5,0) NOT NULL UNIQUE,
	-- avatar_image
	avatar_image varchar2(100),
	-- avatar_bg
	avatar_bg varchar2(100),
	-- avatar_nick
	avatar_nick varchar2(30),
	-- avatar_exp
	avatar_exp number(5,0)
);


-- 유저가 가진 뱃지
CREATE TABLE user_badge
(
	-- badge_no
	badge_no number(5,0) NOT NULL,
	-- user_no
	user_no number(5,0) NOT NULL,
	-- create_date
	create_date date NOT NULL
);


-- 채팅
CREATE TABLE user_chat
(
	-- send_user
	send_user number(5,0) NOT NULL UNIQUE,
	-- recv_user
	recv_user number(5,0) NOT NULL UNIQUE,
	-- chat_msg
	chat_msg varchar2(3000),
	-- chat_create_date
	chat_create_date date
);


-- 친구
CREATE TABLE user_follow
(
	-- 신청 받은 사람
	fllower number(5,0) NOT NULL UNIQUE,
	-- 신청한 사람
	following number(5,0) NOT NULL UNIQUE,
	-- follow_create_date
	follow_create_date date
);


-- 로그
CREATE TABLE user_log
(
	-- user_no
	user_no number(5,0) NOT NULL UNIQUE,
	-- log_account
	log_account varchar2(500) NOT NULL,
	-- log_ip
	log_ip varchar2(20) NOT NULL,
	-- log_create_date
	log_create_date date NOT NULL
);



/* Create Foreign Keys */

ALTER TABLE user_badge
	ADD FOREIGN KEY (badge_no)
	REFERENCES badge (badge_no)
;


ALTER TABLE lectrue_history
	ADD FOREIGN KEY (buy_lecture_no)
	REFERENCES buy_lecture (buy_lecture_no)
;


ALTER TABLE paid_lecture_question
	ADD FOREIGN KEY (buy_lecture_no)
	REFERENCES buy_lecture (buy_lecture_no)
;


ALTER TABLE paid_lecture_review
	ADD FOREIGN KEY (buy_lecture_no)
	REFERENCES buy_lecture (buy_lecture_no)
;


ALTER TABLE piad_lecture_question_reply
	ADD FOREIGN KEY (buy_lecture_no)
	REFERENCES buy_lecture (buy_lecture_no)
;


ALTER TABLE free_lecture_chedule
	ADD FOREIGN KEY (free_lecture_no)
	REFERENCES free_lecture (free_lecture_no)
;


ALTER TABLE free_lecture_grade
	ADD FOREIGN KEY (free_lecture_no)
	REFERENCES free_lecture (free_lecture_no)
;


ALTER TABLE free_lecture_section
	ADD FOREIGN KEY (free_lecture_no)
	REFERENCES free_lecture (free_lecture_no)
;


ALTER TABLE free_lecture_coment_reply
	ADD FOREIGN KEY (lecture_coment_no)
	REFERENCES free_lecture_coment (lecture_coment_no)
;


ALTER TABLE free_lecture_coment
	ADD FOREIGN KEY (lecture_section_no)
	REFERENCES free_lecture_section (lecture_section_no)
;


ALTER TABLE lectrue_history
	ADD FOREIGN KEY (instructor_no)
	REFERENCES instructor (instructor_no)
;


ALTER TABLE paid_lecture
	ADD FOREIGN KEY (instructor_no)
	REFERENCES instructor (instructor_no)
;


ALTER TABLE paid_lecture_detail
	ADD FOREIGN KEY (instructor_no)
	REFERENCES instructor (instructor_no)
;


ALTER TABLE buy_lecture
	ADD FOREIGN KEY (paid_lecture_no)
	REFERENCES paid_lecture (paid_lecture_no)
;


ALTER TABLE cart
	ADD FOREIGN KEY (paid_lecture_no)
	REFERENCES paid_lecture (paid_lecture_no)
;


ALTER TABLE paid_lecture_detail
	ADD FOREIGN KEY (paid_lecture_no)
	REFERENCES paid_lecture (paid_lecture_no)
;


ALTER TABLE lectrue_history
	ADD FOREIGN KEY (detail_no)
	REFERENCES paid_lecture_detail (detail_no)
;


ALTER TABLE paid_lecture_note
	ADD FOREIGN KEY (detail_no)
	REFERENCES paid_lecture_detail (detail_no)
;


ALTER TABLE paid_lecture_question
	ADD FOREIGN KEY (detail_no)
	REFERENCES paid_lecture_detail (detail_no)
;


ALTER TABLE paid_lecture_review
	ADD FOREIGN KEY (detail_no)
	REFERENCES paid_lecture_detail (detail_no)
;


ALTER TABLE piad_lecture_question_reply
	ADD FOREIGN KEY (question_no)
	REFERENCES paid_lecture_question (question_no)
;


ALTER TABLE qna_answer
	ADD FOREIGN KEY (qna_no)
	REFERENCES qna (qna_no)
;


ALTER TABLE buy_lecture
	ADD FOREIGN KEY (user_no)
	REFERENCES Users (user_no)
;


ALTER TABLE cart
	ADD FOREIGN KEY (user_no)
	REFERENCES Users (user_no)
;


ALTER TABLE free_lecture_chedule
	ADD FOREIGN KEY (user_no)
	REFERENCES Users (user_no)
;


ALTER TABLE free_lecture_coment
	ADD FOREIGN KEY (user_no)
	REFERENCES Users (user_no)
;


ALTER TABLE free_lecture_coment_reply
	ADD FOREIGN KEY (user_no)
	REFERENCES Users (user_no)
;


ALTER TABLE free_lecture_grade
	ADD FOREIGN KEY (user_no)
	REFERENCES Users (user_no)
;


ALTER TABLE instructor
	ADD FOREIGN KEY (user_no)
	REFERENCES Users (user_no)
;


ALTER TABLE paid_lecture_note
	ADD FOREIGN KEY (user_no)
	REFERENCES Users (user_no)
;


ALTER TABLE user_avatar
	ADD FOREIGN KEY (user_no)
	REFERENCES Users (user_no)
;


ALTER TABLE user_badge
	ADD FOREIGN KEY (user_no)
	REFERENCES Users (user_no)
;


ALTER TABLE user_chat
	ADD FOREIGN KEY (recv_user)
	REFERENCES Users (user_no)
;


ALTER TABLE user_chat
	ADD FOREIGN KEY (send_user)
	REFERENCES Users (user_no)
;


ALTER TABLE user_log
	ADD FOREIGN KEY (user_no)
	REFERENCES Users (user_no)
;


ALTER TABLE user_follow
	ADD FOREIGN KEY (following)
	REFERENCES user_avatar (user_no)
;


ALTER TABLE user_follow
	ADD FOREIGN KEY (fllower)
	REFERENCES user_avatar (user_no)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_qna_answer_answer_no BEFORE INSERT ON qna_answer
FOR EACH ROW
BEGIN
	SELECT SEQ_qna_answer_answer_no.nextval
	INTO :new.answer_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_qna_comment_comment_no BEFORE INSERT ON qna_comment
FOR EACH ROW
BEGIN
	SELECT SEQ_qna_comment_comment_no.nextval
	INTO :new.comment_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_qna_qna_no BEFORE INSERT ON qna
FOR EACH ROW
BEGIN
	SELECT SEQ_qna_qna_no.nextval
	INTO :new.qna_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_qna_tag_hash_no BEFORE INSERT ON qna_tag
FOR EACH ROW
BEGIN
	SELECT SEQ_qna_tag_hash_no.nextval
	INTO :new.hash_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Users_user_no BEFORE INSERT ON Users
FOR EACH ROW
BEGIN
	SELECT SEQ_Users_user_no.nextval
	INTO :new.user_no
	FROM dual;
END;

/




/* Comments */

COMMENT ON TABLE advertising_bar IS '새 테이블';
COMMENT ON COLUMN advertising_bar.ad_no IS 'ad_no';
COMMENT ON COLUMN advertising_bar.add_name IS 'add_name';
COMMENT ON COLUMN advertising_bar.add_img_path IS 'add_img_path';
COMMENT ON COLUMN advertising_bar.ad_type IS 'ad_type';
COMMENT ON COLUMN advertising_bar.ad_status IS 'ad_status';
COMMENT ON COLUMN advertising_bar.ad_create_date IS 'ad_create_date';
COMMENT ON TABLE badge IS '달성 뱃지';
COMMENT ON COLUMN badge.badge_no IS 'badge_no';
COMMENT ON COLUMN badge.badge_name IS 'badge_name';
COMMENT ON COLUMN badge.badge_icon IS 'badge_icon';
COMMENT ON COLUMN badge.badge_exp IS 'badge_exp';
COMMENT ON TABLE buy_lecture IS '유저가 산 강좌들';
COMMENT ON COLUMN buy_lecture.buy_lecture_no IS 'buy_lecture_no';
COMMENT ON COLUMN buy_lecture.paid_lecture_no IS 'paid_lecture_no';
COMMENT ON COLUMN buy_lecture.user_no IS 'user_no';
COMMENT ON TABLE cart IS '장바구니';
COMMENT ON COLUMN cart.cart_no IS 'cart_no';
COMMENT ON COLUMN cart.user_no IS 'user_no';
COMMENT ON COLUMN cart.paid_lecture_no IS 'paid_lecture_no';
COMMENT ON COLUMN cart.create_date IS 'create_date';
COMMENT ON TABLE free_lecture IS '무료강의';
COMMENT ON COLUMN free_lecture.free_lecture_no IS 'free_lecture_no';
COMMENT ON COLUMN free_lecture.lecture_image IS 'lecture_image';
COMMENT ON COLUMN free_lecture.lecture_title IS 'lecture_title';
COMMENT ON COLUMN free_lecture.lecture_contents IS 'lecture_contents';
COMMENT ON COLUMN free_lecture.lecture_time IS 'lecture_time';
COMMENT ON COLUMN free_lecture.lecture_level IS 'lecture_level';
COMMENT ON COLUMN free_lecture.lecture_lecture_summary IS 'lecture_lecture_summary';
COMMENT ON TABLE free_lecture_chedule IS '새 테이블';
COMMENT ON COLUMN free_lecture_chedule.lecture_schedule_no IS 'lecture_schedule_no';
COMMENT ON COLUMN free_lecture_chedule.free_lecture_no IS 'free_lecture_no';
COMMENT ON COLUMN free_lecture_chedule.user_no IS 'user_no';
COMMENT ON COLUMN free_lecture_chedule.scheduler_name IS 'scheduler_name';
COMMENT ON COLUMN free_lecture_chedule.scheduler_start_date IS 'scheduler_start_date';
COMMENT ON COLUMN free_lecture_chedule.scheduler_end_date IS 'scheduler_end_date';
COMMENT ON TABLE free_lecture_coment IS 'free_lecture_coment';
COMMENT ON COLUMN free_lecture_coment.lecture_coment_no IS 'lecture_coment_no';
COMMENT ON COLUMN free_lecture_coment.lecture_section_no IS 'lecture_section_no';
COMMENT ON COLUMN free_lecture_coment.user_no IS 'user_no';
COMMENT ON COLUMN free_lecture_coment.coment_contents IS 'coment_contents';
COMMENT ON COLUMN free_lecture_coment.coment_like IS 'coment_likes';
COMMENT ON COLUMN free_lecture_coment.coment_create_date IS 'coment_create_date';
COMMENT ON TABLE free_lecture_coment_reply IS 'free_lecture_coment_reply';
COMMENT ON COLUMN free_lecture_coment_reply.coment_reply_no IS 'coment_reply_no';
COMMENT ON COLUMN free_lecture_coment_reply.user_no IS 'user_no';
COMMENT ON COLUMN free_lecture_coment_reply.lecture_coment_no IS 'lecture_coment_no';
COMMENT ON COLUMN free_lecture_coment_reply.reply_contents IS 'reply_contents';
COMMENT ON COLUMN free_lecture_coment_reply.reply_create_date IS 'reply_create_date';
COMMENT ON TABLE free_lecture_grade IS 'free_lecture_grade';
COMMENT ON COLUMN free_lecture_grade.lectrue_grade_no IS 'lectrue_grade_no';
COMMENT ON COLUMN free_lecture_grade.gade_coment IS 'gade_coment';
COMMENT ON COLUMN free_lecture_grade.grade_point IS 'grade_point';
COMMENT ON COLUMN free_lecture_grade.grade_create_date IS 'grade_create_date';
COMMENT ON COLUMN free_lecture_grade.free_lecture_no IS 'free_lecture_no';
COMMENT ON COLUMN free_lecture_grade.user_no IS 'user_no';
COMMENT ON TABLE free_lecture_section IS 'free_lecture_section';
COMMENT ON COLUMN free_lecture_section.lecture_section_no IS 'lecture_section_no';
COMMENT ON COLUMN free_lecture_section.free_lecture_no IS 'free_lecture_no';
COMMENT ON COLUMN free_lecture_section.section_title IS 'section_title';
COMMENT ON COLUMN free_lecture_section.section_contents IS 'section_contents';
COMMENT ON COLUMN free_lecture_section.section_count IS 'section_count';
COMMENT ON COLUMN free_lecture_section.section_views IS 'section_views';
COMMENT ON COLUMN free_lecture_section.section_create_date IS 'section_create_date';
COMMENT ON TABLE instructor IS '강사';
COMMENT ON COLUMN instructor.instructor_no IS 'instructor_no';
COMMENT ON COLUMN instructor.user_no IS 'user_no';
COMMENT ON COLUMN instructor.instructor_summary IS 'instructor_summary';
COMMENT ON COLUMN instructor.instructor_description IS 'instructor_description';
COMMENT ON TABLE lectrue_history IS '새 테이블';
COMMENT ON COLUMN lectrue_history.studied_no IS 'studied_no';
COMMENT ON COLUMN lectrue_history.instructor_no IS 'instructor_no';
COMMENT ON COLUMN lectrue_history.detail_no IS 'detail_no';
COMMENT ON COLUMN lectrue_history.buy_lecture_no IS 'buy_lecture_no';
COMMENT ON COLUMN lectrue_history.pass IS 'pass';
COMMENT ON TABLE paid_lecture IS '유료 강좌';
COMMENT ON COLUMN paid_lecture.paid_lecture_no IS 'paid_lecture_no';
COMMENT ON COLUMN paid_lecture.instructor_no IS 'instructor_no';
COMMENT ON COLUMN paid_lecture.lecture_lang IS 'lecture_lang';
COMMENT ON COLUMN paid_lecture.lecture_title IS 'lecture_title';
COMMENT ON COLUMN paid_lecture.lecture_level IS 'lecture_level';
COMMENT ON COLUMN paid_lecture.lecture_specialized IS 'lecture_specialized';
COMMENT ON COLUMN paid_lecture.lecture_summary IS 'lecture_summary';
COMMENT ON COLUMN paid_lecture.lecture_description IS 'lecture_description';
COMMENT ON COLUMN paid_lecture.lecture_price IS 'lecture_price';
COMMENT ON COLUMN paid_lecture.lecture_thumnail_path IS 'lecture_thumnail_path';
COMMENT ON COLUMN paid_lecture.lecture_create_date IS 'lecture_create_date';
COMMENT ON COLUMN paid_lecture.lecture_likes IS 'lecture_likes';
COMMENT ON COLUMN paid_lecture.lecture_view_count IS 'lecture_view_count';
COMMENT ON COLUMN paid_lecture.exposure_status IS 'exposure_status';
COMMENT ON COLUMN paid_lecture.approve_status IS 'approve_status';
COMMENT ON TABLE paid_lecture_detail IS '유료 강좌 디테일';
COMMENT ON COLUMN paid_lecture_detail.detail_no IS 'detail_no';
COMMENT ON COLUMN paid_lecture_detail.instructor_no IS 'instructor_no';
COMMENT ON COLUMN paid_lecture_detail.paid_lecture_no IS 'paid_lecture_no';
COMMENT ON COLUMN paid_lecture_detail.filepath IS 'filepath';
COMMENT ON COLUMN paid_lecture_detail.section_no IS 'section_no';
COMMENT ON COLUMN paid_lecture_detail.section_name IS 'section_name';
COMMENT ON COLUMN paid_lecture_detail.lesson_no IS 'lesson_no';
COMMENT ON COLUMN paid_lecture_detail.lesson_name IS 'lesson_name';
COMMENT ON COLUMN paid_lecture_detail.lesson_length IS 'lesson_length';
COMMENT ON TABLE paid_lecture_note IS '새 테이블';
COMMENT ON COLUMN paid_lecture_note.note_no IS 'note_no';
COMMENT ON COLUMN paid_lecture_note.user_no IS 'user_no';
COMMENT ON COLUMN paid_lecture_note.detail_no IS 'detail_no';
COMMENT ON TABLE paid_lecture_question IS '새 테이블';
COMMENT ON COLUMN paid_lecture_question.question_no IS 'question_no';
COMMENT ON COLUMN paid_lecture_question.buy_lecture_no IS 'buy_lecture_no';
COMMENT ON COLUMN paid_lecture_question.detail_no IS 'detail_no';
COMMENT ON COLUMN paid_lecture_question.title IS 'title';
COMMENT ON COLUMN paid_lecture_question.content IS 'content';
COMMENT ON COLUMN paid_lecture_question.create_date IS 'create_date';
COMMENT ON TABLE paid_lecture_review IS '리뷰';
COMMENT ON COLUMN paid_lecture_review.review_no IS 'review_no';
COMMENT ON COLUMN paid_lecture_review.buy_lecture_no IS 'buy_lecture_no';
COMMENT ON COLUMN paid_lecture_review.detail_no IS 'detail_no';
COMMENT ON COLUMN paid_lecture_review.comments IS 'comments';
COMMENT ON COLUMN paid_lecture_review.create_date IS 'create_date';
COMMENT ON COLUMN paid_lecture_review.grade IS 'grade';
COMMENT ON TABLE piad_lecture_question_reply IS '새 테이블';
COMMENT ON COLUMN piad_lecture_question_reply.reply_no IS 'reply_no';
COMMENT ON COLUMN piad_lecture_question_reply.question_no IS 'question_no';
COMMENT ON COLUMN piad_lecture_question_reply.buy_lecture_no IS 'buy_lecture_no';
COMMENT ON COLUMN piad_lecture_question_reply.content IS 'content';
COMMENT ON TABLE qna IS 'QnA';
COMMENT ON COLUMN qna.qna_no IS 'qna_no';
COMMENT ON COLUMN qna.qna_title IS 'qna_title';
COMMENT ON COLUMN qna.qna_writer IS 'qna_writer';
COMMENT ON COLUMN qna.qna_contents IS 'qna_contents';
COMMENT ON COLUMN qna.qna_views IS 'qna_views';
COMMENT ON COLUMN qna.qna_create_date IS 'qna_create_date';
COMMENT ON TABLE qna_answer IS '답변';
COMMENT ON COLUMN qna_answer.answer_no IS 'answer_no';
COMMENT ON COLUMN qna_answer.answer_writer IS 'answer_writer';
COMMENT ON COLUMN qna_answer.answer_contents IS 'answer_contents';
COMMENT ON COLUMN qna_answer.answer_create_date IS 'answer_create_date';
COMMENT ON COLUMN qna_answer.qna_no IS 'qna_no';
COMMENT ON TABLE qna_comment IS 'QnA댓글';
COMMENT ON COLUMN qna_comment.comment_no IS 'comment_no';
COMMENT ON COLUMN qna_comment.co_writer IS 'co_writer';
COMMENT ON COLUMN qna_comment.co_contents IS 'co_contents';
COMMENT ON COLUMN qna_comment.co_create_date IS 'co_create_date';
COMMENT ON TABLE qna_tag IS '새 테이블';
COMMENT ON COLUMN qna_tag.hash_no IS 'hash_no';
COMMENT ON COLUMN qna_tag.hash_contents IS 'hash_contents';
COMMENT ON TABLE Users IS '회원';
COMMENT ON COLUMN Users.user_no IS 'user_no';
COMMENT ON COLUMN Users.user_id IS 'user_id';
COMMENT ON COLUMN Users.user_password IS 'user_password';
COMMENT ON COLUMN Users.user_email IS 'user_email';
COMMENT ON COLUMN Users.user_name IS 'user_name';
COMMENT ON COLUMN Users.user_create_date IS 'user_create_date';
COMMENT ON COLUMN Users.user_auth_status IS 'user_auth_status';
COMMENT ON TABLE user_auth IS '새 테이블';
COMMENT ON COLUMN user_auth.auth_email IS 'auth_email';
COMMENT ON COLUMN user_auth.auth_key IS 'auth_key';
COMMENT ON TABLE user_avatar IS '유저 화면출력정보';
COMMENT ON COLUMN user_avatar.user_no IS 'user_no';
COMMENT ON COLUMN user_avatar.avatar_image IS 'avatar_image';
COMMENT ON COLUMN user_avatar.avatar_bg IS 'avatar_bg';
COMMENT ON COLUMN user_avatar.avatar_nick IS 'avatar_nick';
COMMENT ON COLUMN user_avatar.avatar_exp IS 'avatar_exp';
COMMENT ON TABLE user_badge IS '유저가 가진 뱃지';
COMMENT ON COLUMN user_badge.badge_no IS 'badge_no';
COMMENT ON COLUMN user_badge.user_no IS 'user_no';
COMMENT ON COLUMN user_badge.create_date IS 'create_date';
COMMENT ON TABLE user_chat IS '채팅';
COMMENT ON COLUMN user_chat.send_user IS 'send_user';
COMMENT ON COLUMN user_chat.recv_user IS 'recv_user';
COMMENT ON COLUMN user_chat.chat_msg IS 'chat_msg';
COMMENT ON COLUMN user_chat.chat_create_date IS 'chat_create_date';
COMMENT ON TABLE user_follow IS '친구';
COMMENT ON COLUMN user_follow.fllower IS '신청 받은 사람';
COMMENT ON COLUMN user_follow.following IS '신청한 사람';
COMMENT ON COLUMN user_follow.follow_create_date IS 'follow_create_date';
COMMENT ON TABLE user_log IS '로그';
COMMENT ON COLUMN user_log.user_no IS 'user_no';
COMMENT ON COLUMN user_log.log_account IS 'log_account';
COMMENT ON COLUMN user_log.log_ip IS 'log_ip';
COMMENT ON COLUMN user_log.log_create_date IS 'log_create_date';



