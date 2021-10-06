select sysdate from dual;

-- ���� �ּ��Դϴ�.
-- HR계정을 언락하고 비밀번호를 1234로

alter user hr account UNLOCK identified by 1234;

-- git testing
-- git testing 2

-- SCOTT 계정을 설치 및 비번 정하기
@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\scott.sql;
alter user scott account unlock identified by 1234;