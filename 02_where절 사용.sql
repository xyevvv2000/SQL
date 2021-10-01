-- where 특정 조건을 만족한 값을 출력
SELECT *
FROM EMPLOYEES
WHERE SALARY > 14000; -- 월급이 14000 보다 많은 직원

SELECT *
FROM EMPLOYEES
WHERE LAST_NAME = 'King'; -- 성이 King인 직원 *문자열은 ''로 표시*

SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE < '2002/06/10'; -- 2002/06/10 이전에 고용된 직원

/* where 절에 사용되는 연산자
=, <>(같지않음), >, >=, <, <= */

-- 예제1
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 100;

-- 예제2
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME = 'David';

-- 예제3
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID < 105;

-- 예제4
SELECT *
FROM DEPARTMENTS
WHERE LOCATION_ID <> 1700;

/*
 논리 연산자
 AND 조건을 모두 만족해야함
 OR 조건 중 하나만 만족하면 됨
 NOT 조건을 만족하지 않을 때
 IN ( ) 안의 값과 같을 때 OR 와 유사
*/

SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60 -- 부서 ID가 60 또는 80이면서 SALARY가 10000 초과
    OR (DEPARTMENT_ID = 80
    AND SALARY > 10000);    

SELECT *
FROM employees
WHERE NOT (hire_date > '2004/01/01' OR salary > 5000 );
-- 위 조건은 WHERE ( hire_date <= '2004/01/01' AND salary <= 5000); 과 동일

-- 예제1
SELECT *
FROM employees
WHERE salary > 4000 AND job_id  = 'IT_PROG';  

-- 예제2
SELECT *
FROM employees
WHERE salary > 4000 AND (job_id = 'IT_PROG' OR job_id = 'FI_ACCOUNT');

-- IN 연산자
SELECT *
FROM employees
WHERE salary IN ( 4000, 3000, 2000 ); -- salary가 4000, 3000 또는 2000 인 직원

-- 예제1
SELECT *
FROM employees
WHERE salary IN (10000, 17000, 24000);

-- 예제2
SELECT *
FROM employees
WHERE department_id NOT IN ( 30, 50, 80, 100, 110 ); -- id가 괄호 안의 조건이 아닌 직원

-- BETWEEN 연산자 사잇 값을 만족하는 데이터 출력
SELECT *
FROM employees
WHERE salary BETWEEN 9000 and 10000;
-- 위와 아래는 동일한 결과 값을 가짐
SELECT *
FROM employees
WHERE salary >= 9000 and salary <= 10000;

-- 예제
SELECT *
FROM employees
where salary BETWEEN 10000 and 20000;

SELECT *
FROM employees
WHERE hire_date BETWEEN '2004/01/01' and '2004/12/30';

SELECT *
FROM employees
where salary not BETWEEN 7000 and 17000;

-- LIKE 연산자 
-- _와 %를 같이 사용해서 문자열을 검색함
SELECT *
FROM employees
WHERE last_name LIKE 'B%'; -- 대문자 B로 시작하는 데이터 값들을 출력함

SELECT *
FROM employees
WHERE last_name LIKE '%b%'; -- 대문자 B가 문자열의 중간에 존재하는 경우 값을 출력

SELECT *
FROM employees
WHERE last_name LIKE '____y'; -- 다섯번째 자리에 y가 존재하는 값을 출력

-- 예제
SELECT *
FROM employees
WHERE job_id LIKE '%AD%';

SELECT *
FROM employees
WHERE job_id LIKE '%AD___';

SELECT *
FROM employees
where phone_number like '%1234';

SELECT *
FROM employees
where phone_number not like '%3%' and phone_number like '%9';

SELECT *
FROM employees
where job_id LIKE '%MGR%' or job_id like '%ASST%';

-- NULL은 값이 입력되어있지 않음
SELECT commission_pct
FROM employees
WHERE commission_pct is null; -- 커미션 값이 입력되지 않은 직원들

SELECT commission_pct
FROM employees
WHERE commission_pct is not null; -- 커미션 값이 입력되어 있는 직원들