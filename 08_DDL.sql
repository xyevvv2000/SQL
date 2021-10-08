-- DDL 테이블 생성과 수정, 삭제

-- 테이블 생성
CREATE TABLE 테스트 (
    문자열 VARCHAR2(100),
    숫자 NUMBER,
    날짜 DATE DEFAULT SYSDATE
    );

-- 테이블 삭제
DROP TABLE 테스트;

DESC 테스트;
SELECT * FROM 테스트;

-- 데이터 입력
INSERT INTO 테스트 VALUES ('HTML', 5, '2021-10-8');
INSERT INTO 테스트 VALUES ('CSS', 3, SYSDATE);
INSERT INTO 테스트(문자열, 숫자) VALUES ('JAVA', 7);

-- 기존의 테이블을 복사해서 만드는 방법

-- employees 테이블의 열 구조만 복사
CREATE TABLE EMP_TEMP
AS 
SELECT * FROM employees WHERE 1 <> 1; -- 데이터는 가져오지 않음

SELECT * FROM emp_temp;
DESC emp_temp;

-- 80번 부서의 데이터만 따로 테이블 생성
CREATE TABLE EMP80
AS 
SELECT employee_id 직원번호, last_name 이름, SALARY 월급, salary*12 연봉, hire_date 고용일
FROM employees WHERE department_id = 80;

DESC emp80;
SELECT * FROM EMP80;

-- 예제
CREATE TABLE stmans
AS
SELECT employee_id ID, job_id JOB, salary SAL FROM employees
WHERE job_id = 'ST_MAN';

select * from stmans;