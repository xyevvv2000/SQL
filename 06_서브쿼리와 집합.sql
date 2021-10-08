-- 서브쿼리

-- 이름이 Popp인 직원보다 나중에 고용한 사람
-- 서브쿼리는 결과 값이 하나여야 함
SELECT *
FROM employees
WHERE hire_date > ( SELECT hire_date FROM employees WHERE last_name = 'Popp')
ORDER BY hire_date;

-- 그룹함수의 결과를 서브춰리로 사용
SELECT last_name 이름, job_id 직종, salary 월급
FROM employees
WHERE salary = ( SELECT min(salary) from employees );

-- 예제
SELECT last_name,salary
FROM employees
WHERE salary>(SELECT salary FROM employees WHERE last_name = 'Abel');

SELECT employee_id,last_name,department_id,salary
FROM employees
WHERE salary>(SELECT salary FROM employees WHERE last_name = 'Bull') 
and department_id=(SELECT department_id FROM employees WHERE last_name = 'Bull');

SELECT last_name,salary,manager_id FROM employees
where manager_id =(SELECT employee_id FROM employees WHERE last_name ='Russell');

SELECT *
FROM employees e JOIN jobs j on e.job_id=j.job_id
where j.job_id=(SELECT job_id FROM jobs where job_title = 'Stock Manager');

-- 다중행 서브쿼리 (서브쿼리 결과가 여러개의 행으로 출력)

select min(salary) from employees GROUP BY department_id; -- 부서별 최저월급

-- 다중행 서브쿼리에서는 =, >=, <= 같은 등호 사용이 불가능

-- in(10,20) 은 10과 20 중 하나만 같으면 출력
SELECT department_id,employee_id,last_name
FROM employees
where salary in (select min(salary) from employees group by department_id)
ORDER BY department_id; -- 부서별 최저 월급을 받는 사람을 서브쿼리로 출력

-- any(조건) 은 괄호 안의 조건 중 어느 한 쪽을 만족하면 출력
SELECT department_id,last_name,salary,job_id FROM employees
where salary < any(select salary from employees where job_id = 'IT_PROG')
                         and job_id !='IT_PROG' ORDER BY salary DESC; 
                         --급여가 괄호 안 조건 중 어느하나보다 이하이고 IT_PROG가 아닌 사람들

-- all(조건) 은 괄호 안의 조건을 다 만족해야 출력
SELECT department_id,last_name,salary,job_id FROM employees
where salary < all(select salary from employees where job_id = 'IT_PROG')
                         and job_id !='IT_PROG' ORDER BY salary DESC;
                         --급여가 괄호 안 최저임금 4200 보다 적고 IT_PROG가 아닌 사람들

-- 예제
SELECT employee_id,first_name,job_id 직종,manager_id,salary 급여 FROM employees
WHERE manager_id in(select manager_id from employees where department_id = 20)
                                     and department_id!=20;

SELECT employee_id,last_name,job_id 직종, salary 급여 FROM employees
where salary<any(select salary from employees where job_id = 'ST_MAN') ORDER BY salary desc;

SELECT employee_id,last_name,job_id 직종, salary 급여 FROM employees
where salary<all(select salary from employees where job_id = 'IT_PROG') ORDER BY salary DESC;

-- 다중열 서브쿼리 열이 여러 개 일 때
-- Bruce와 같은 매니저, 직종을 가진 직원들
SELECT employee_id, first_name, job_id, salary, manager_id
FROM employees 
WHERE (manager_id, job_id) 
in (SELECT manager_id, job_id FROM employees WHERE first_name='Bruce') and first_name <> 'Bruce';

-- 부서별 최저 급여를 받는 직원들을 검색
select department_id 부서번호, employee_id 사원번호, first_name, salary from employees
where (department_id, salary) 
in (select department_id, MIN(salary) from employees group by department_id) -- 부서 별 최저 급여 출력
ORDER BY department_id;
                                                      
-- 예제
SELECT first_name, job_id, salary, department_id FROM employees
where (job_id, salary) IN (select job_id, min(salary) from employees GROUP BY job_id) -- 직종 별 최저 급여 출력
ORDER BY salary DESC;


-- 집합

-- UNION 합집합 : 중복된 부분을 제거한다 ( 115줄 )
SELECT employee_id 직원번호, job_id 직종 FROM employees
union
SELECT employee_id, job_id from job_history;

-- UNION ALL 합집합 : 중복된 부분이 반복된다 ( 117줄 2줄 중복 )
SELECT employee_id 직원번호, job_id 직종 FROM employees
union all
SELECT employee_id, job_id from job_history;

-- INTERSECT 교집합 : 교집합 부분이 출력된다 ( 중복된 2줄 )
SELECT employee_id 직원번호, job_id 직종 FROM employees
INTERSECT
SELECT employee_id, job_id from job_history;

-- MINUS 차집합 : A의 값에서 B의 값을 제거
SELECT employee_id 직원번호, job_id 직종 FROM employees       --A
union
SELECT employee_id, job_id from job_history;        -- B

-- 예제
SELECT department_id FROM employees
union
SELECT department_id FROM departments;


SELECT department_id FROM employees
union all
SELECT department_id FROM departments;


SELECT department_id FROM employees
INTERSECT
SELECT department_id FROM departments;


SELECT department_id FROM departments
MINUS
SELECT department_id FROM employees;

