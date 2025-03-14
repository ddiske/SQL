SELECT * FROM TAB;

SELECT * FROM TB_BOOK;
SELECT * FROM TB_WRITER;
SELECT * FROM TB_PUBLISHER;
SELECT * FROM TB_BOOK_AUTHOR;

-- 3.
SELECT BOOK_NO, BOOK_NM
FROM TB_BOOK
WHERE LENGTH(BOOK_NM) > 25;


-- 4.
SELECT WRITER_NM, OFFICE_TELNO, HOME_TELNO, MOBILE_NO
FROM TB_WRITER
WHERE MOBILE_NO LIKE '019%' AND WRITER_NM LIKE '김%'
ORDER BY WRITER_NM ASC;


-- 5.
SELECT COUNT(WRITER_NO) "작가(명)"
FROM TB_BOOK_AUTHOR
WHERE COMPOSE_TYPE = '옮김';


-- 6.
SELECT COMPOSE_TYPE, COUNT(BOOK_NO)
FROM TB_BOOK_AUTHOR
GROUP BY COMPOSE_TYPE
HAVING COUNT(BOOK_NO) > 300
AND COMPOSE_TYPE IS NOT NULL;


-- 7.
SELECT BOOK_NM, ISSUE_DATE, PUBLISHER_NM
FROM TB_BOOK
WHERE ISSUE_DATE = (SELECT MAX(ISSUE_DATE) FROM TB_BOOK);

SELECT * FROM SEQ;
SELECT * FROM TAB;
SELECT * FROM USER_CONSTRAINTS;


-- 8.
SELECT TW.WRITER_NM "작가 이름", COUNT(TBA.BOOK_NO) "권 수"
FROM  TB_BOOK_AUTHOR TBA
JOIN TB_WRITER TW
ON TBA.WRITER_NO = TW.WRITER_NO 
GROUP BY TW.WRITER_NM
ORDER BY COUNT(TBA.BOOK_NO) DESC;


-- 9.
SELECT * FROM TB_WRITER;
SELECT * FROM TB_BOOK;
SELECT * FROM TB_BOOK_AUTHOR;

SELECT MIN(TB.ISSUE_DATE), TW.WRITER_NO
FROM TB_BOOK TB
JOIN TB_BOOK_AUTHOR TBA
ON TB.BOOK_NO = TBA.BOOK_NO
JOIN TB_WRITER TW
ON TBA.WRITER_NO = TW.WRITER_NO
GROUP BY TW.WRITER_NO

UPDATE TABLE TB_WRITER
SET REGIST_DATE = 



