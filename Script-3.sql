SELECT * FROM DEPARTMENT;
SELECT * FROM EMPLOYEE;
SELECT * FROM JOB;
SELECT * FROM LOCATION;
SELECT * FROM NATIONAL;
SELECT * FROM SAL_GRADE;


-- 1. 사수가 없고 부서배치도 받지 않은 사원들의 (사원명, 사수사번, 부서코드) 조회

SELECT EMP_NAME 사원명, EMP_ID 사원번호, DEPT_CODE 부서코드 
FROM EMPLOYEE 
WHERE MANAGER_ID IS NULL 
AND DEPT_CODE IS NULL;


-- 2. 연봉(보너스포함X)이 3000만원 이상이고 보너스를 받지 않는 사원들의 (사번, 사원명, 급여, 보너스) 조회

SELECT EMP_ID 사번, EMP_NAME 사원명, SALARY 급여, BONUS 보너스 
FROM EMPLOYEE 
WHERE SALARY * 12 > 30000000 
AND BONUS IS NULL;


-- 3. 입사일이 '95/01/01'이상이고 부서배치를 받은 사원들의 (사번, 사원명, 입사일, 부서코드) 조회

SELECT EMP_ID 사번, EMP_NAME 사원명, HIRE_DATE 입사일, DEPT_CODE 부서코드
FROM EMPLOYEE 
WHERE HIRE_DATE > '1995-05-01' 
AND DEPT_CODE IS NOT NULL;


-- 4. 급여가 200만원 이상 500만원 이하고 입사일이 '01/01/01'이상이고 보너스를 받지 않는 사원들의 
--   (사번, 사원명, 급여, 입사일, 보너스) 조회

SELECT EMP_ID 사번, EMP_NAME 사원명, SALARY 급여, HIRE_DATE 입사일, BONUS 보너스 
FROM EMPLOYEE 
WHERE SALARY BETWEEN 2000000 and 5000000 
AND HIRE_DATE > '2001-01-01' 
AND BONUS IS NULL;


-- 5. 보너스포함연봉이 NULL이 아니고 이름에 '하'가 포함되어있는 사원들의 (사번, 사원명, 급여, 보너스포함연봉)

SELECT EMP_ID 사번, EMP_NAME 사원명, SALARY 급여, SALARY * 12 + SALARY * 12 * BONUS 보너스포함연봉
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%하%'
AND SALARY * 12 + SALARY * 12 * BONUS IS NOT NULL;


SELECT * FROM EMPLOYEE;
-- 1. 직급이 대리이면서 ASIA지역에 근무하는 직원들의
--    사번, 사원명, 직급명, 부서명, 근무지역명, 급여를 조회하시오
SELECT EMP_ID, EMP_NAME, JOB_CODE, DEPT_TITLE, LOCAL_NAME, SALARY
FROM EMPLOYEE E
JOIN DEPARTMENT D
ON E.DEPT_CODE = D.DEPT_ID
JOIN LOCATION L
ON D.LOCATION_ID = L.LOCAL_CODE
WHERE E.JOB_CODE = 'J6'
AND L.LOCAL_CODE IN ('L1', 'L2', 'L3');


-- 2. 70년대생이면서 여자이고, 성이 전씨인 직원들의
--    사원명, 주민번호, 부서명, 직급명을 조회하시오
SELECT EMP_NAME, EMP_NO, DEPT_TITLE, JOB_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D
ON E.DEPT_CODE = D.DEPT_ID 
JOIN JOB J
ON E.JOB_CODE = J.JOB_CODE
WHERE E.EMP_NO LIKE '7_____-2______'
AND E.EMP_NAME LIKE '전%';


-- 3. 이름에 '형'자가 들어있는 직원들의
--    사번, 사원명, 직급명을 조회하시오
SELECT EMP_ID, EMP_NAME, JOB_NAME
FROM EMPLOYEE E
JOIN JOB J
ON E.JOB_CODE = J.JOB_CODE
WHERE EMP_NAME LIKE '%형%';


-- 4. 해외영업팀에 근무하는 직원들의
--    사원명, 직급명, 부서코드, 부서명을 조회하시오
SELECT EMP_NAME, JOB_NAME, DEPT_ID, DEPT_TITLE
FROM DEPARTMENT D
JOIN EMPLOYEE E
ON D.DEPT_ID = E.DEPT_CODE
JOIN JOB J
ON J.JOB_CODE = E.JOB_CODE
WHERE D.DEPT_ID IN ('D5', 'D6', 'D7');


-- 5. 보너스를 받는 직원들의
--    사원명, 보너스, 연봉, 부서명, 근무지역명을 조회하시오
--    이때 부서 배정이 안된 사원이 있을 경우 부서명과 근무지역명은 '미정'으로 조회되도록 하시오.


SELECT EMP_NAME, BONUS, SALARY * 12, DEPT_TITLE, LOCAL_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D
ON E.DEPT_CODE = D.DEPT_ID 
JOIN LOCATION L
ON D.LOCATION_ID = L.LOCAL_CODE
WHERE BONUS IS NOT NULL;


-- 6. 부서가 있는 직원들만
--    사원명, 직급명, 부서명, 근무지역명을 조회하시오
SELECT EMP_NAME, JOB_NAME, DEPT_TITLE, LOCAL_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D
ON E.DEPT_CODE = D.DEPT_ID
JOIN JOB J
ON E.JOB_CODE = J.JOB_CODE 
JOIN LOCATION L
ON D.LOCATION_ID = L.LOCAL_CODE;


-- 7. '한국'과 '일본'에 근무하는 직원들의 
--    사원명, 부서명, 근무지역명, 근무국가명을 조회하시오
SELECT EMP_NAME, DEPT_TITLE, LOCAL_NAME, NATIONAL_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D
ON E.DEPT_CODE = D.DEPT_ID 
JOIN LOCATION L
ON D.LOCATION_ID = L.LOCAL_CODE
JOIN NATIONAL N
ON L.NATIONAL_CODE = N.NATIONAL_CODE
WHERE N.NATIONAL_NAME IN ('한국', '일본');


-- 8. 보너스를 받지 않는 직원들 중 직급코드가 J4 또는 J7인 직원들의
--    사원명, 직급명, 급여를 조회하시오
SELECT EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE E
JOIN JOB J
ON E.JOB_CODE = J.JOB_CODE 
WHERE E.BONUS IS NULL
AND E.JOB_CODE IN ('J4', 'J7');


-- 9. 사번, 사원명, 직급명, 급여등급, 구분을 조회하는데
--    이때 구분에 해당하는 값은
--    급여등급이 S1, S2인 경우 '고급'
--    급여등급이 S3, S4인 경우 '중급'
--    급여등급이 S5, S6인 경우 '초급' 으로 조회되게 하시오.

SELECT EMP_ID, EMP_NAME, JOB_NAME, SAL_LEVEL, 
CASE
	WHEN SAL_LEVEL IN ('S1', 'S2') THEN '고급'
	WHEN SAL_LEVEL IN ('S3', 'S4') THEN '중급'
	WHEN SAL_LEVEL IN ('S5', 'S6') THEN '초급'
END AS 구분
FROM EMPLOYEE E
JOIN JOB J
ON E.JOB_CODE = J.JOB_CODE 
JOIN SAL_GRADE SG
ON E.SALARY BETWEEN SG.MIN_SAL AND SG.MAX_SAL; 


-- 10. 각 부서별 총 급여합을 조회하되
--     이때, 총 급여합이 1000만원 이상인 부서명, 급여합을 조회하시오
SELECT DEPT_TITLE, SUM(SALARY)
FROM EMPLOYEE E
JOIN DEPARTMENT D
ON E.DEPT_CODE = D.DEPT_ID
GROUP BY DEPT_TITLE
HAVING SUM(SALARY) >= 10000000


-- 11. 각 부서별 평균급여를 조회하여 부서명, 평균급여 (정수처리)로 조회하시오.
--      단, 부서배치가 안된 사원들의 평균도 같이 나오게끔 하시오.
SELECT DEPT_TITLE, FLOOR(AVG(SALARY))
FROM EMPLOYEE E
LEFT OUTER JOIN DEPARTMENT D
ON D.DEPT_ID = E.DEPT_CODE
GROUP BY D.DEPT_TITLE;






-- 1. 전 사원들의 직원명과 주민번호를 조회
--    단, 주민번호 9번째 자리부터 끝까지는 '*' 로 채워서 조회
--    EX) 771120-1******
SELECT RPAD (SUBSTR(EMP_NO, 1, 8), 14, '*')
FROM EMPLOYEE;


-- 2. 전 사원들의 직원명, 직급코드, 보너스포함연봉(원) 조회
--    단, 보너스포함연봉값에 절대 NULL이 나와서는 안됨
--    뿐만아니라 이때 보너스포함연봉은 \57,000,000원 형식으로 조회되게 함
SELECT EMP_NAME, JOB_CODE, SALARY * 12 + SALARY * 12 * NVL(BONUS, 0),
'\'||TO_CHAR(SALARY * 12 + SALARY * 12 * NVL(BONUS, 0), '999,999,999,999')||'원'
FROM EMPLOYEE;


-- 3. 부서코드가 D5, D9인 직원들 중 2004년에 입사한 직원들의 사번, 사원명, 부서코드, 입사일 조회
SELECT EMP_NO, EMP_NAME, DEPT_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D5', 'D9')
AND TO_CHAR(HIRE_DATE, 'YYYY') = '2004';


-- 4. 직원명, 입사일, 입사한 달의 근무일수(주말에 대한건 고려하지 말 것) 조회
SELECT EMP_NAME, HIRE_DATE, EXTRACT (DAY FROM LAST_DAY(HIRE_DATE))
FROM EMPLOYEE;


-- 5. 직원명, 부서코드, 생년월일 조회
--    단, 생년월일은 XX년 XX월 XX일 형식으로 조회되게 함
SELECT EMP_NAME, DEPT_CODE, SUBSTR(EMP_NO, 1, 2)||'년 '||SUBSTR(EMP_NO, 3, 2)||'월 '||SUBSTR(EMP_NO, 5, 2)||'일'
FROM EMPLOYEE;


-- 6. 부서코드가 D5, D6, D9인 사원들만 조회를 하되 이때 직원명, 부서코드, 부서명을 조회
--    (부서명에 대한 값으로는
--     해당 부서코드가 D5일 경우는 총무부로, D6일 경우 기획부로, D9일 경우 영업부로 조회되게끔 하시오)
SELECT EMP_NAME, DEPT_CODE,

CASE 
	WHEN D.DEPT_ID = 'D5' THEN '총무부'
	WHEN D.DEPT_ID = 'D6' THEN '기획부'
	WHEN D.DEPT_ID = 'D9' THEN '영업부'
END 

FROM EMPLOYEE E
JOIN DEPARTMENT D
ON E.DEPT_CODE = D.DEPT_ID;
