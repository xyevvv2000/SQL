-- 그룹함수 (다중행 함수, 집계함수 )
SELECT
    round (AVG(salary)) 평균값, MAX (salary) 최대값, MIN(salary) 최소값, SUM(salary) 합계, COUNT(salary) 카운트
FROM employees
where job_id LIKE '%REP%';

SELECT COUNT(*) FROM employees; -- 전체 직원수

SELECT COUNT(*) FROM employees WHERE department_id = 80; -- 80번 부서의 직원들

SELECT COUNT(department_id) FROM employees; -- count 함수는 NULL값을 제외, 1명이 부서가 없음

SELECT COUNT(DISTINCT department_id) FROM employees; -- 부서의 수, 중복된 값을 생략

SELECT AVG(commission_pct) FROM employees; -- NULL 값을 제외한 모든 직원들의 커미션 평균


-- GROUP BY 절 : 특정 그룹으로 나누어서 그룹함수를 사용
SELECT
    department_id 부서번호, ROUND(avg(salary)) 평균급여
FROM employees
GROUP BY department_id ORDER BY department_id; -- 부서번호로 그룹 나눔

SELECT
    *
FROM employees WHERE department_id is null; -- 부서가 없는 직원

-- 예제
SELECT
    department_id 부서명, COUNT(department_id) 인원, max(salary) 최대, min(salary) 최소, sum(salary) 합계, round(avg(salary),0) 평균
FROM employees
GROUP BY department_id ORDER BY 합계 DESC;

SELECT
    department_id 부서명, job_id 직업, manager_id 상사번호, round(avg(salary),0) 월급합계, count(department_id) 직원수
FROM employees
GROUP BY department_id, job_id, manager_id ORDER BY 부서명;

SELECT
    round(avg(max(salary)),0) 부서별최고월급평균,
    round(avg(min(salary)),0) 부서별최저월급평균
FROM employees
GROUP BY department_id;

-- 그룹 함수의 조건절 HAVING
SELECT
    department_id 부서번호, count(*) 사원수
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5; -- 사원이 5명 넘는 부서

-- 예제
SELECT
    job_id 직종, sum(salary) 합계
FROM employees where job_id !='AC_MGR'
GROUP BY job_id
HAVING avg(salary)>10000 ORDER BY 합계 desc;

SELECT
    department_id 부서, round(avg(salary)) 급여평균
FROM employees WHERE department_id != 40
GROUP BY department_id
HAVING avg(salary)<=7000;

SELECT
    job_id 직업, sum(salary) 급여합계
FROM employees WHERE job_id not LIKE'%REP%'
GROUP BY job_id
having SUM(salary)>=13000
ORDER BY 급여합계 DESC;