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

-- 시퀀스
CREATE SEQUENCE 시퀀스1; -- 생성
DROP SEQUENCE 시퀀스1; -- 삭제

SELECT * FROM USER_SEQUENCES WHERE sequence_name = '시퀀스1';

-- 시퀀스 테스트 (이름.nextval -> 증가하는 값이 리턴)
-- 증가한 값은 초기화시킬 수 없음
select 시퀀스1.nextval from dual;

create table 부서_테스트 (
    부서번호 number primary key,
    부서이름 varchar2(100)
    );
    
insert into 부서_테스트(부서번호,부서이름) values (시퀀스1.nextval,'영업부');
insert into 부서_테스트(부서번호,부서이름) values (시퀀스1.nextval,'개발부');

SELECT * FROM 부서_테스트;

-- 시퀀스의 값은 증가시키지 않고 현재 값을 알고 싶을 때 (이름.CURRVAL)
select 시퀀스1.currval from dual;

-- 시퀀스 옵션 시작값 10 부터 증가는 20
drop sequence 시퀀스2;
create sequence 시퀀스2 start with 10 increment by 20;
SELECT * FROM USER_SEQUENCES WHERE sequence_name = '시퀀스2';

-- 입력
insert into 부서_테스트(부서번호,부서이름) values (시퀀스2.nextval,'마케팅부');
insert into 부서_테스트(부서번호,부서이름) values (시퀀스2.nextval,'교육부');
insert into 부서_테스트(부서번호,부서이름) values (시퀀스2.nextval,'경영부');

-- 시퀀스로 전체 번호를 업데이트
update 부서_테스트 set 부서번호=시퀀스2.nextval;

-- 시퀀스2의 증가값을 2로 수정
alter sequence 시퀀스2 increment by 2;
insert into 부서_테스트(부서번호,부서이름) values (시퀀스2.nextval,'마케팅부');
insert into 부서_테스트(부서번호,부서이름) values (시퀀스2.nextval,'교육부');
insert into 부서_테스트(부서번호,부서이름) values (시퀀스2.nextval,'경영부');
SELECT * FROM 부서_테스트 ORDER BY 부서번호;