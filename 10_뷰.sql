-- 뷰는 가상의 테이블
-- 단순한 뷰 만들기
CREATE VIEW EMP_V1 (직원번호,이름,성,이메일,고용일,직종)
AS
SELECT employee_id,first_name,last_name,email,hire_date,job_id
FROM employees;
SELECT * FROM emp_v1;

-- 뷰에 데이터를 입력
-- 뷰는 가상의 테이블이기 때문에 뷰가 아니라 원래 테이블(employees)에 입력됨
INSERT INTO emp_v1(직원번호,이름,성,이메일,고용일,직종)
VALUES (333,'펭수','김','Peng',SYSDATE,'IT_PROG');

SELECT * FROM employees;

-- 복잡한 뷰
-- 그룹함수를 쓴 뷰는 DML(입력,수정,삭제) 등 불가
CREATE OR REPLACE VIEW 부서별_직원_보고서
AS
SELECT department_id 부서번호, COUNT(*) 직원수, MAX(salary) 최고급여, MIN(salary) 최저급여, ROUND(AVG(salary)) 평균급여
FROM employees GROUP BY department_id ORDER BY department_id;

SELECT * FROM 부서별_직원_보고서;

-- 읽기전용 뷰 만들기
CREATE OR REPLACE VIEW EMP90_read (직원번호,이름,성,이메일,고용일,직종)
AS
SELECT employee_id,first_name,last_name,email,hire_date,job_id
FROM employees WHERE department_id = 90 WITH READ ONLY;
SELECT * FROM emp90_read;
DELETE FROM emp90_read; -- DML 작업 불가