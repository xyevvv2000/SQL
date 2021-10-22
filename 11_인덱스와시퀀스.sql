-- 인덱스
-- 인덱스 조회하기
SELECT * FROM ALL_IND_COLUMNS
WHERE table_name = 'MEMBERS'; -- 테이블 이름은 대문자로

-- 새 테이블 만들기
CREATE TABLE members (
    member_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(100) NOT NULL,
    last_name VARCHAR2(100) NOT NULL,
    gender  VARCHAR2(1) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR2(255) NOT NULL
    );
SELECT * FROM members ORDER BY member_id;

-- 일반 열을 검색하기
-- 이름이 Harse인 사람
SELECT * FROM members WHERE last_name = 'Harse';

-- 아래 쿼리문의 실행보고서를 작성
EXPLAIN PLAN FOR
SELECT * FROM members WHERE last_name = 'Harse';

-- 작성된 실행보고서를 읽기
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());

-- 인덱스 만들기
CREATE INDEX members_last_name_i ON members(last_name);

-- 인덱스 삭제
DROP INDEX members_last_name_i;

-- 예제
EXPLAIN PLAN FOR
CREATE INDEX members_name ON members(first_name,last_name);

EXPLAIN PLAN FOR
SELECT * FROM members where last_name like 'A%' and first_name like 'M%';