-- DCL : 데이터 제어어 (데이터베이스 사용 권한을 주고 회수하는 명령어)

-- 테이블스페이스 생성
CREATE TABLESPACE johnSpace
DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\john.dbf' SIZE 10M
AUTOEXTEND ON NEXT 5M;
-- 파일이름 john.dbf에 10MB 사이즈로 파일 생성, 이후 5MB씩 용량 증가

-- 새 유저 JOHN 생성
CREATE USER john IDENTIFIED BY 2510 DEFAULT TABLESPACE johnSpace;

-- john 접속권한 부여
GRANT CREATE SESSION TO JOHN;

-- john 테이블 생성권한 부여
GRANT CREATE TABLE TO JOHN;

-- 롤(권한들의 모음)을 주기
-- CONNECT는 접속관련 권한,RESOURCE는 테이블 및 객체 사용권한
-- DBA는 관리자권한 - 아무나에게 부여하지 않는다
GRANT CONNECT,RESOURCE TO JOHN;

-- REVOKE : 권한을 제거 
REVOKE CREATE TABLE, RESOURCE FROM JOHN;
REVOKE CONNECT FROM JOHN;

-- 계정삭제
DROP USER JOHN CASCADE;

-- 테이블스페이스 삭제
DROP TABLESPACE johnSpace;

-- 계정에 비밀번호 변경
alter user scott identified by "1234";
alter user HR identified by "1234";

-- 현재 오라클 서버의 포트번호 확인
select dbms_xdb.gethttpport() from dual;

-- 오라클의 포트번호를 9090으로 변경
exec dbms_xdb.sethttpport(9090);