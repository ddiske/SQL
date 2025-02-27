CREATE TABLE PRODUCTS(
	PRODUCTNUM NUMBER,
	PRODUCTNAME VARCHAR2(200) NOT NULL,
	PRODUCTRATE NUMBER(4, 2),
	PRODUCTDATE DATE,
	PRODUCTDETAIL CLOB,
	CONSTRAINT PRODUCTNUM_PK PRIMARY KEY(PRODUCTNUM)
	
);



CREATE TABLE USERS (
	USERNAME VARCHAR2(200) PRIMARY KEY,
	PASSWORD VARCHAR2(200) NOT NULL,
	NAME VARCHAR2(200) NOT NULL,
	PHONE VARCHAR2(200),
	EMAIL VARCHAR2(200),
	CONSTRAINT PHONE_U UNIQUE(PHONE),
	CONSTRAINT EMAIL_U UNIQUE(EMAIL)
);


CREATE TABLE ACCOUNTS(
	ACCOUNTNUM VARCHAR2(200) PRIMARY KEY,
	USERNAME VARCHAR2(200),
	PRODUCTNUM NUMBER,
	ACCOUNTBALANCE NUMBER DEFAULT 0 NOT NULL,
	ACCOUNTDATE DATE DEFAULT SYSDATE NOT NULL,
	CONSTRAINT U_NAME_FK FOREIGN KEY(USERNAME) REFERENCES USERS(USERNAME),
	CONSTRAINT PDT_NUM_FK FOREIGN KEY(PRODUCTNUM) REFERENCES PRODUCTS(PRODUCTNUM)
);

DROP TABLE TRADE;
DROP TABLE ACCOUNTS;
SELECT * FROM ACCOUNTS;
ALTER TABLE ACCOUNTS DROP COLUMN ACCOUNTBALANCE;
ALTER TABLE ACCOUNTS ADD (ACCOUNTBALANCE NUMBER NOT NULL);
ALTER TABLE ACCOUNTS ADD CONSTRAINT ACCB_NN NOT NULL(ACCOUNTBALANCE);

COMMIT;

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'PRODUCTS';

CREATE TABLE TRADE(
	TRADENUM NUMBER PRIMARY KEY,
	ACCOUNTNUM VARCHAR2(200),
	TRADEAMOUNT NUMBER,
	TRADEKIND NUMBER(1),
	TRADEBALANCE NUMBER,
	TRADEDATE DATE NOT NULL,
	CONSTRAINT ACC_N_FK FOREIGN KEY(ACCOUNTNUM) REFERENCES ACCOUNTS(ACCOUNTNUM)
);

SELECT * FROM TRADE;


CREATE TABLE CARTS(
	USERNAME VARCHAR2(200),
	PRODUCTNUM NUMBER,
	CONSTRAINT U_C_FK FOREIGN KEY(USERNAME) REFERENCES USERS(USERNAME),
	CONSTRAINT PDT_C_FK FOREIGN KEY(PRODUCTNUM) REFERENCES PRODUCTS(PRODUCTNUM)
)


SELECT * FROM TAB;
SELECT * FROM SEQ;

----------------------------------------------------------------------------------------------


SELECT * FROM USERS;
INSERT INTO USERS
VALUES ('2', '1234', 'asd', '01012345678', 'abc@def.ghi');

INSERT INTO USERS (USERNAME, PASSWORD, NAME, PHONE, EMAIL)
VALUES ('nisim', '7239', 'nisim', '', '')

SELECT * FROM USERS WHERE EMAIL IS NULL;

CREATE SEQUENCE TRD_NUM_SEQ;
CREATE SEQUENCE PDT_NUM_SEQ;

SELECT * FROM PRODUCTS;
SELECT * FROM PRODUCTS WHERE PRODUCTNUM = 2;
SELECT * FROM PRODUCTS;
INSERT INTO PRODUCTS (PRODUCTNUM, PRODUCTNAME, PRODUCTDATE)
VALUES (PDT_NUM_SEQ.NEXTVAL, '', SYSDATE);


SELECT * FROM ACCOUNTS;
INSERT INTO ACCOUNTS (ACCOUNTNUM, USERNAME, PRODUCTNUM, ACCOUNTDATE)
VALUES ('94642', '1', 1, SYSDATE);
INSERT INTO ACCOUNTS (ACCOUNTNUM, USERNAME, PRODUCTNUM, ACCOUNTDATE, ACCOUNTBALANCE)
 VALUES ('45667', '1', 1, SYSDATE, 1000);


SELECT * FROM TRADE;
INSERT INTO TRADE (TRADENUM, ACCOUNTNUM, TRADEAMOUNT, TRADEKIND, TRADEBALANCE, TRADEDATE)
VALUES (TRD_NUM_SEQ.NEXTVAL, '94642', NULL, NULL, NULL, SYSDATE);


SELECT * FROM CARTS;
INSERT INTO CARTS (USERNAME, PRODUCTNUM)
VALUES ('1', 1);


SELECT USERNAME, NAME, PHONE, EMAIL
FROM USERS WHERE USERNAME = ?;


SELECT * FROM PRODUCTS;
INSERT INTO PRODUCTS (PRODUCTNUM, PRODUCTNAME, PRODUCTRATE, PRODUCTDATE, PRODUCTDETAIL)
VALUES (PDT_NUM_SEQ.NEXTVAL, ?, ?, ?, ?)

SELECT * FROM PRODUCTS
WHERE PRODUCTNUM = ?;

UPDATE PRODUCTS SET PRODUCTRATE = ?
WHERE PRODUCTNUM = ?;

INSERT INTO PRODUCTS (PRODUCTNUM, PRODUCTNAME, PRODUCTDATE) VALUES (PDT_NUM_SEQ.NEXTVAL, '1234', SYSDATE);

SELECT * FROM ACCOUNTS;
INSERT INTO ACCOUNTS (ACCOUNTNUM, USERNAME, PRODUCTNUM)
VALUES (?, ?, ?);

INSERT INTO TRADE (TRADENUM, ACCOUNTNUM, TRADEAMOUNT, TRADEKIND, TRADEBALANCE, TRADEDATE)
VALUES (TRD_NUM_SEQ.NEXTVAL, '94642', NULL, NULL, NULL, SYSDATE)



CREATE TABLE NOTICE (
	BOARDNUM NUMBER,
	USERNAME VARCHAR2(200),
	BOARDTITLE VARCHAR2(200),
	BOARDCONTENTS CLOB,
	BOARDDATE DATE DEFAULT SYSDATE NOT NULL,
	BOARDHIT NUMBER DEFAULT 0 NOT NULL,
	CONSTRAINT BOARDNUM_PK PRIMARY KEY(BOARDNUM),
	CONSTRAINT U_N_FK FOREIGN KEY(USERNAME) REFERENCES USERS(USERNAME)
)

CREATE SEQUENCE BOARD_SEQ;

SELECT * FROM NOTICE;
INSERT INTO NOTICE(BOARDNUM, USERNAME, BOARDTITLE, BOARDCONTENTS)
VALUES (BOARD_SEQ.NEXTVAL, 'test', 'Test', 'testtesttest');

SELECT * FROM NOTICE;
UPDATE NOTICE SET BOARDHIT = BOARDHIT+1;

DELETE PRODUCTS
WHERE PRODUCTNUM > 80;

SELECT * FROM PRODUCTS
WHERE PRODUCTNUM BETWEEN (SELECT MAX(PRODUCTNUM)-9 FROM PRODUCTS) AND (SELECT MAX(PRODUCTNUM) FROM PRODUCTS)
ORDER BY PRODUCTNUM DESC;

DELETE PRODUCTS WHERE PRODUCTNUM = 299;

SELECT * FROM PRODUCTS
ORDER BY PRODUCTNUM ASC;

SELECT * FROM (
		SELECT * FROM PRODUCTS
		ORDER BY PRODUCTNUM DESC
		)
WHERE ROWNUM <= 10;

SELECT * FROM (
	SELECT ROWNUM R, M.* FROM (
			SELECT * FROM PRODUCTS
			ORDER BY PRODUCTNUM DESC
			) M
	)
WHERE R BETWEEN 1 AND 20;//ROWNUM은 항상 1부터 가져올 수 있음


SELECT COUNT(PRODUCTNUM) FROM PRODUCTS;


SELECT * FROM (
	SELECT ROWNUM R, M.* FROM (
			SELECT * FROM NOTICE
			ORDER BY BOARDNUM DESC
			) M
	)
WHERE R BETWEEN 1 AND 10;

SELECT COUNT(BOARDNUM) FROM NOTICE;

SELECT * FROM PRODUCTS
WHERE PRODUCTNAME LIKE '%1%';

SELECT COUNT(PRODUCTNUM) FROM PRODUCTS
WHERE PRODUCTNAME LIKE '%'||'%' OR PRODUCTDETAIL LIKE '%'||'%';


CREATE TABLE QNA (
	BOARDNUM NUMBER,
	USERNAME VARCHAR2(200),
	BOARDTITLE VARCHAR2(200),
	BOARDCONTENTS CLOB,
	BOARDDATE DATE DEFAULT SYSDATE NOT NULL,
	BOARDHIT NUMBER DEFAULT 0 NOT NULL,
	BOARDREF NUMBER DEFAULT 0 NOT NULL,
	BOARDSTEP NUMBER DEFAULT 0 NOT NULL,
	BOARDDEPTH NUMBER DEFAULT 0 NOT NULL,
	CONSTRAINT QNA_BOARDNUM_PK PRIMARY KEY(BOARDNUM),
	CONSTRAINT U_Q_FK FOREIGN KEY(USERNAME) REFERENCES USERS(USERNAME)
)

SELECT * FROM QNA;
INSERT INTO QNA(BOARDNUM, USERNAME, BOARDTITLE, BOARDCONTENTS)
VALUES (BOARD_SEQ.NEXTVAL, 'admin', 'Test', 'test');

SELECT * FROM (
	SELECT ROWNUM R, M.* FROM (
			SELECT * FROM QNA
			ORDER BY BOARDNUM DESC
			) M
	)
WHERE R BETWEEN 1 AND 10
		
SELECT COUNT(BOARDNUM) FROM QNA




CREATE TABLE PROFILE (
	USERNAME VARCHAR2(200),
	FILENAME VARCHAR2(200),
	OLDNAME VARCHAR2(200),
	CONSTRAINT PROFILE_USERNAME_PK PRIMARY KEY(USERNAME),
	CONSTRAINT U_P_FK FOREIGN KEY(USERNAME) REFERENCES USERS(USERNAME) ON DELETE CASCADE
)

SELECT * FROM PROFILE;

INSERT INTO USERS
VALUES ('2', '1234', 'asd', '01012345678', 'abc@def.ghi');
INSERT INTO PROFILE VALUES ('2', 'test', 'test');
DELETE USERS WHERE USERNAME = '2';