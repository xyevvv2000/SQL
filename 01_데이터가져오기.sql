-- 주석 단축키 ctrl+/
/*
여
러
줄
*/
-- 1. 테이블의 모든 행과 열을 읽어오기
-- * 은 전체 열을 의미
-- 문장의 끝은 항상 ; 으로 마치기
SELECT * FROM departments; --departments의 전체 열을 불러오기

-- 2. 특정 열만 조회하기
SELECT department_id, department_name 
from departments;

-- 3. 별칭 붙이기 (열의 이름)
SELECT department_id as 부서번호, department_name 부서이름
    
FROM departments;

-- 4. 산술 연산자 (+,-,*,/)
SELECT  first_name 이름, job_id 직책, salary 월급  
FROM EMPLOYEES;

-- 월급에 100씩 뺀 열을 만들기 (숫자열은 산술연산자로 산술이 가능)
SELECT  first_name 이름, job_id 직책, salary 월급, salary-100 월급차감 
FROM EMPLOYEES;

-- 월급의 10% 열을 만들기 (숫자열은 산술연산자로 산술이 가능)
SELECT  first_name 이름, job_id 직책, salary 월급, salary/10 월급10퍼센트 
FROM EMPLOYEES;

-- 보너스를 월급에 1000을 뺀 값의 5%로 설정
SELECT 
    last_name,
    first_name,
    job_id,
    salary,
    (salary-1000)*0.05 as 보너스
FROM employees;

-- distinct : 중복 값을 제거함
SELECT DISTINCT job_id as 직업
FROM employees;

-- 예제1 employees 테이블에서 아이디, 이름, 성을 출력하기
SELECT employee_id, first_name, last_name
FROM employees;

-- 예제2 employees 테이블에서 이름, 월급, 월급*1.1 의 별명을 붙여 출력
SELECT first_name, salary, salary*1.1 as 인상
FROM employees;

-- 예제3 
SELECT employee_id as 사원번호, first_name 이름, last_name 성
FROM employees;

-- 연결 연산자 || : 열을 붙여서 하나의 열로 출력
SELECT LAST_NAME || ' is a ' || JOB_ID AS 직업정보
FROM employees;

-- 예제4
SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME 풀네임, EMAIL || '@메일' 메일
FROM EMPLOYEES;

-- 데이터의 유형 출력
-- varchar(길이) - 문자열, number(길이,소숫점) - 숫자열, date - 날짜
DESC EMPLOYEES;
desc DEPARTMENTS;