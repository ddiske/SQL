-- INSERT
-- INSERT INTO 테이블명 (컬럼명, 컬럼명, ...) VALUES (값, 값, ...)
SELECT * FROM REGIONS;

INSERT INTO REGIONS (REGION_ID, REGION_NAME)
VALUES (5, 'OSEANEA');

INSERT INTO REGIONS (REGION_ID, REGION_NAME)
VALUES (6, NULL);

INSERT INTO REGIONS (REGION_ID)
VALUES (7);

-- 컬럼명의 순서는 테이블의 컬럼들과 동일하게
-- 따라서 값의 순서는 테이블의 컬럼들 순서와 일치
INSERT INTO REGIONS
VALUES (8, 'North');
-- 컬럼명을 나열하지 않을때는 컬럼의 갯수만큼 값도 입력
INSERT INTO REGIONS
VALUES (
	(SELECT MAX(REGION_ID)+1 FROM REGIONS)
, 'South');





INSERT INTO COUNTRIES (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
VALUES ('AN', 'ANIHC', 3);

INSERT INTO COUNTRIES
VALUES ('NP', 'Napaj', 3);


SELECT * FROM SEQ;


SELECT * FROM DEPARTMENTS;

INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
VALUES (DEPARTMENTS_SEQ.NEXTVAL, 'Test', 100, 1700);

INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
VALUES (DEPARTMENTS_SEQ.NEXTVAL, 'Test2', 100, 1700);

SELECT * FROM EMPLOYEES;
SELECT * FROM JOBS;
SELECT * FROM DEPARTMENTS;

INSERT INTO EMPLOYEES(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
VALUES (EMPLOYEES_SEQ.NEXTVAL, 'Keunho', 'Lee', 'DDISKE', '010.4642.1906', CURRENT_DATE, 'AD_VP', 17000, NULL, 100, 90);

SELECT * FROM EMPLOYEES
WHERE LAST_NAME = 'Lee';

INSERT INTO EMPLOYEES
VALUES (EMPLOYEES_SEQ.NEXTVAL, '0', '1', '01', '010', '2025-01-20', 'SA_REP', 1010, 0.1, 147, 80);

-- 접속 후 INSERT, UPDATE, DELETE
-- COMMIT(저장)
-- ROLLBACK(취소, 이전 COMMIT 지점까지)
COMMIT;


----------------------------------------------------------------



SELECT * FROM REGIONS;
UPDATE REGIONS SET REGION_NAME = 'EARTH';
UPDATE REGIONS SET REGION_NAME = 'Asia'
WHERE REGION_ID = 1;
ROLLBACK;

SELECT * FROM DEPARTMENTS;
UPDATE DEPARTMENTS SET MANAGER_ID = 200
WHERE MANAGER_ID IS NULL;

-- 월급 인상, 모든 사원의 월급을 일괄적으로 10% 인상
SELECT * FROM EMPLOYEES;

UPDATE EMPLOYEES SET SALARY = SALARY*1.1;



-----------------------------------------------------------------


DELETE REGIONS WHERE REGION_ID = 1;


SELECT * FROM DEPARTMENTS;

SELECT * FROM COUNTRIES;


------------------------------------------------------------------
-- Table 생성
CREATE TABLE Study(
	NUM NUMBER PRIMARY KEY,
	NAME VARCHAR2(50) NOT NULL, -- BYTE
	BIRTH DATE DEFAULT '2000-01-01',
	AGE NUMBER(3) CHECK (AGE > 0 AND AGE <= 150) -- AGE 1 BETWEEN 150
);

SELECT * FROM TAB;
SELECT * FROM STUDY;

DROP TABLE STUDY;

INSERT INTO STUDY
VALUES (1, '김철수', '1988-08-08', 38);

INSERT INTO STUDY
VALUES (2, '이영희', '1989-12-25', 37);

INSERT INTO STUDY
VALUES (3, '이영희', NULL, 37);

INSERT INTO STUDY(NUM, NAME, AGE)
VALUES (4, '김철수', 38);

INSERT INTO STUDY(NUM, NAME, AGE)
VALUES (5, '김철수', 200);




DELETE STUDY WHERE NUM = 1;


--------------------------------------------------------------------

SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'REGIONS';

DROP TABLE TEACHERS;
CREATE TABLE Teachers(
	num NUMBER PRIMARY KEY,
	name varchar2(200)
	
);

DROP TABLE STUDENTS;
CREATE TABLE STUDENTS(
	HAKBUN NUMBER PRIMARY KEY,
	STUdentname varchar2(200),
	AGE NUMBER,
	num NUMBER REFERENCES teachers (num)
)


-- 학번, 이름, 나이
SELECT * FROM TEACHERS;
SELECT * FROM STUDENTS;

INSERT INTO TEACHERS
VALUES (1, 'IU');

INSERT INTO STUDENTS
VALUES (1001, 'winter', 20, 1);

INSERT INTO STUDENTS
VALUES (1002, 'suji', 21, 2);




