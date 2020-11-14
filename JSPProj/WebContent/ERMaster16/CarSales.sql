
/* Drop Tables */
/*
DROP TABLE Scrap CASCADE CONSTRAINTS;
DROP TABLE Sales CASCADE CONSTRAINTS;
DROP TABLE Car CASCADE CONSTRAINTS;
DROP TABLE Customer CASCADE CONSTRAINTS;
*/



/* Create Tables */

CREATE TABLE Car
(
	car_no number NOT NULL,
	car_name nvarchar2(10) NOT NULL,
	car_year number(4,0),
	PRIMARY KEY (car_no)
);


CREATE TABLE Customer
(
	-- 아이디에용~
	id varchar2(10) NOT NULL,
	name nvarchar2(10) NOT NULL,
	tel char(13),
	addr nvarchar2(10),
	PRIMARY KEY (id)
);


CREATE TABLE Sales
(
	sales_no number NOT NULL,
	-- 아이디에용~
	id varchar2(10) NOT NULL,
	car_no number NOT NULL,
	sales_date date DEFAULT SYSDATE,
	PRIMARY KEY (sales_no)
);


CREATE TABLE Scrap
(
	sales_no number NOT NULL,
	scrap_date date DEFAULT SYSDATE,
	PRIMARY KEY (sales_no)
);



/* Create Foreign Keys */

ALTER TABLE Sales
	ADD FOREIGN KEY (car_no)
	REFERENCES Car (car_no)
;


ALTER TABLE Sales
	ADD FOREIGN KEY (id)
	REFERENCES Customer (id)
;


ALTER TABLE Scrap
	ADD FOREIGN KEY (sales_no)
	REFERENCES Sales (sales_no)
;


/* 시퀀스 만들기 */
CREATE SEQUENCE SEQ_CAR
NOCACHE
NOCYCLE;


CREATE SEQUENCE SEQ_SALES
NOCACHE
NOCYCLE;








