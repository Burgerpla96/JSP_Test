
/* Drop Tables */

DROP TABLE child CASCADE CONSTRAINTS;
DROP TABLE parent CASCADE CONSTRAINTS;



/* Create Tables */
/*
CREATE TABLE child
(
	no number NOT NULL,
	col char(10) NOT NULL,
	id varchar2(10),
	PRIMARY KEY (no)
);


CREATE TABLE parent
(
	id varchar2(10) NOT NULL,
	name nvarchar2(10) NOT NULL,
	PRIMARY KEY (id)
);



/* Create Foreign Keys */

ALTER TABLE child
	ADD FOREIGN KEY (id)
	REFERENCES parent (id)
;

*/

