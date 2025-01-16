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



