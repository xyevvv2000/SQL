-- 조인 JOIN

-- ON 을 사용한 기본 조인
SELECT e.employee_id 직원번호, e.last_name 이름, e.department_id 부서번호, d.department_name 부서이름
FROM employees E JOIN departments D 
ON E.department_id = D.department_id;

-- WHERE 을 사용한 예전 조인방법
SELECT e.employee_id 직원번호, e.last_name 이름, e.department_id 부서번호, d.department_name 부서이름
FROM employees E , departments D 
WHERE E.department_id = D.department_id;

-- 3개의 테이블 직원, 부서, 로케이션 테이블 조인하기
SELECT e.employee_id 직원번호, d.department_name 부서이름, l.city 도시
FROM employees e 
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON l.location_id = d.location_id;

-- 예제
SELECT d.department_name 부서명, l.city 도시, c.country_name 국가
FROM departments d
JOIN locations l on l.location_id = d.location_id
JOIN countries c on c.country_id = l.country_id
where l.city in ('Seattle', 'London') and c.country_name like 'United%';

-- 자체 조인
SELECT e.last_name 직원, m.last_name 매니저
FROM employees e join employees m on e.manager_id = m.employee_id;