-- 유저 생성
-- 아무런 권한이 없다
CREATE USER user01 IDENTIFIED BY user01;

-- 권한 부여
GRANT CONNECT, RESOURCE TO user01;

-- home 유저 생성
CREATE USER home IDENTIFIED BY home;
GRANT CONNECT, RESOURCE TO home;


-- 샘플 유저 hr 사용해제 비번을 hr
ALTER USER hr ACCOUNT UNLOCK 
IDENTIFIED BY hr;

COMMIT;