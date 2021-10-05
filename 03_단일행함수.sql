/*단일행 함수*/

/* 문자 함수*/

-- 대소문자 변환 UPPER, LOWER, INITCAP
SELECT UPPER('SQL Course') FROM dual; -- dual은 테스트용 테이블 SQL Course 가 전부 대문자로 출력됨
SELECT LOWER ('SQL Course') FROM dual; -- 전부 소문자로 출력
SELECT INITCAP ('SQL Course') FROM dual; -- 첫글자만 대문자로 출력

-- 문자 조작 함수
SELECT SUBSTR('ABCDEFG',3,4) from dual; -- 3번째 값을 시작으로 4번째 자리까지의 값을 출력
SELECT LENGTH('ABCDEFG') from dual; -- 값의 길이를 출력
SELECT INSTRB('ABCDEFG','C') from dual; -- 특정 문자의 위치를 숫자로 출력
SELECT TRIM('       헬로우     '), '       헬로우     ' FROM dual; -- 공백을 없앰

-- 예제
SELECT last_name, CONCAT ('직업명이', job_id) as 직업
FROM employees
WHERE substr (job_id, 4, 3) = 'REP';

-- 문자열 바꾸기
select job_id , replace (job_id, 'account', 'accnt') 적용결과
FROM employees;

-- 예제
SELECT lower(last_name), upper(last_name), initcap(email) FROM employees;

SELECT job_id, SUBSTR(job_id, 1, 2) FROM employees; -- job_id와 job_id의 첫번째 문자에서 두번째 문자까지 출력


-- 숫자형 함수

-- 반올림 함수 ROUND ( 숫자, 자릿수), 0이 소숫점 첫째자리 자릿수가 없으면 정수로 반올림 
SELECT ROUND (15.193), ROUND (15.193, 0), ROUND (15.193, 1),ROUND (15.193, 2) FROM DUAL;

-- 나머지를 구하는 함수 MOD
-- 사원번호가 짝수인 사원 출력
SELECT employee_id 사원번호, last_name 성 --employee_id를 사원번호, last_name을 성으로 출력
FROM employees -- employees 테이블에서
WHERE MOD(employee_id, 2) = 0 -- 데이터 중에 짝수인 값만
ORDER by employee_id; -- employee_id 로 오름차순으로 정렬하라

-- 날짜형 함수, sysdate는 시스템 날짜
-- round는 반올림 함수 일은 오후 12시가 지나면 그 다음 날로 출력됨
SELECT SYSDATE 현재날짜, round(sysdate, 'dd') 일, round(sysdate, 'mm') 월, round(sysdate, 'yyyy') 년,
round(MONTHS_BETWEEN('2021/10/05', '2021/06/10'), 1)월차이
FROM dual;

-- 날짜에 더하기 빼기
SELECT sysdate 오늘날짜, sysdate + 1 내일
FROM dual;

-- 예제
SELECT sysdate, hire_date, months_between(sysdate, hire_date) 월차이
FROM employees
WHERE department_id = 100;

SELECT hire_date, ADD_MONTHS(hire_date, 3) 더하기3개월, ADD_MONTHS(hire_date, -3) 빼기3개월
FROM employees
WHERE employee_id BETWEEN 100 and 106;

-- 변환형 함수
-- 숫자를 문자로 변환
SELECT 
    to_char(12345678, '999,999,999') 콤마,
    to_char(12345678.678, '999,999,999.99') 콤마와소수점,
    to_char(12345678, '$999,999,999') 달러,
    to_char(12345678, 'L999,999,999') L은로컬통화
FROM dual;

-- 날짜를 문자로 변환
select 
    to_char(sysdate,'yy-mm-dd') 날짜표시,
    to_char(sysdate,'yy-mm-dd hh24:mi:ss') 날짜와시간표시
from dual;

-- 예제
SELECT 
    employee_id, to_char(hire_date,'mm/yy') 입사월
FROM employees
WHERE department_id = 100;

SELECT
    last_name 이름, to_char(salary,'$999,999.99') 월급
FROM employees
where salary > 10000
ORDER BY salary DESC;

-- 문자열 => 날짜 변환
SELECT
    TO_DATE('2011/01/01', 'yyyy/mm/dd')
FROM dual;

-- 문자열 => 숫자 변환
SELECT
    to_number('0123')+100
FROM dual;

-- NULL 관련 함수

-- NVL( 값 , 0 ) NULL값을 0으로 변환
SELECT last_name 성, nvl(manager_id, 0) 매니저id FROM employees
WHERE last_name = 'King';  -- manager_id 가 null값을 가지면 0을 출력

-- NVL2 ( 값 , 첫번째, 두번째 ) 값이 NULL이 아닐 경우 첫번째 값, NULL일 경우 두번째 값 출력
SELECT last_name 성, nvl2(manager_id, 1, 0) 매니저id FROM employees
WHERE last_name = 'King';

-- 예제
SELECT 
    last_name 이름, salary 월급, nvl(commission_pct, 0) 커미션, salary*12+salary*12*NVL(commission_pct,0) 연봉
FROM employees
ORDER BY 연봉 DESC;

SELECT 
    last_name 이름, salary 월급, nvl(commission_pct, 0) 커미션, salary*12+salary*12*NVL(commission_pct,0) 연봉,
    NVL2(commission_pct, '월급+보너스', '월급만') income
FROM employees
ORDER BY 연봉 DESC;

-- decode 함수
SELECT
    last_name 이름, job_id, salary,
    decode(job_id, ' IT_PROG', salary*1.10, 'ST_CLEAK', SALARY*1.15, 'SA_REP', SALARY*1.20, SALARY) 수정월급
FROM employees;

-- 예제
SELECT
    last_name 이름, job_id 직무, salary 월급, 
    decode(TRUNC(salary/2000), 0,0,1,0.09,2,0.2,3,0.3,4,0.4,5,0.42,6,0.44,0.45) 세율
FROM employees;

-- case 함수는 decode와 유사하지만 값을 비교할 수 있다
SELECT
    last_name 이름, job_id, salary,
    CASE WHEN salary < 5000 THEN 'low'
              WHEN salary < 10000 THEN 'medium'
              WHEN salary < 20000 THEN 'good'
              ELSE 'excellent' END 급여수준
FROM employees;

-- 예제
SELECT
    job_id, first_name, last_name, salary,
    case WHEN salary >= 9000 then '상위급여'
            WHEN salary > 6000 then '중위급여'
            else '하위급여' end 급여등급
FROM employees
where job_id = 'IT_PROG';