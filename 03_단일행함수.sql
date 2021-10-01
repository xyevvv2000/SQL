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
SELECT lower(last_name), upper(last_name), initcap(email)
FROM employees;

SELECT job_id, SUBSTR(job_id, 1, 2)
FROM employees;

-- 숫자형 함수

-- 반올림 함수 ROUND ( 숫자, 자릿수), 0이 소숫점 첫째자리 자릿수가 없으면 정수로 반올림 
SELECT ROUND (15.193), ROUND (15.193, 0), ROUND (15.193, 1),ROUND (15.193, 2) FROM DUAL;

-- 나머지를 구하는 함수 MOD
-- 사원번호가 짝수인 사원 출력
SELECT employee_id 사원번호, last_name 성 --employee_id를 사원번호, last_name을 성으로 출력
FROM employees -- employees 테이블에서
WHERE MOD(employee_id, 2) = 0 -- 데이터 중에 짝수인 값만
ORDER by employee_id; -- employee_id 로 오름차순으로 정렬하라