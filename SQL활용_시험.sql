desc EMP;

SELECT deptno, job FROM emp
where deptno = 30 AND job = 'SALESMAN';

SELECT * FROM emp
where sal BETWEEN 2000 AND 3000;

CREATE TABLE emp_temp AS SELECT * FROM emp WHERE 1 <> 1;
desc emp_temp;

INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (9999, '홍길동', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);
DELETE FROM emp_temp where ename = '홍길동';
SELECT * FROM emp_temp WHERE ename = '홍길동';

CREATE TABLE DEPT_TEMP2 AS SELECT * FROM dept;
desc dept_temp2;

UPDATE dept_temp2 SET dname = 'DATABASE', loc = 'SEOUL'
WHERE deptno = 40;
SELECT * FROM dept_temp2 where deptno = 40;


ROLLBACK;

SELECT * FROM emp WHERE UPPER(ename) = 'SMITH';

SELECT * FROM emp WHERE LENGTH(ename) <= 4;

SELECT SUBSTR(job, 1, 3) FROM emp;

SELECT * FROM emp WHERE hiredate > '1981/06/01';

SELECT empno 사원번호,ename 사원이름,sal 월급,NVL(comm,0) 추가수당,sal*12+NVL(comm,0) ANNSAL FROM emp;

SELECT COUNT(DISTINCT job) FROM emp;

SELECT e.ename,d.dname,e.sal FROM emp e JOIN dept d ON e.deptno = d.deptno 
WHERE sal >= 3000;

SELECT * FROM emp
WHERE sal>(SELECT sal FROM emp WHERE ename = 'MARTIN');

SELECT * FROM emp
WHERE sal>(SELECT MAX(sal) FROM emp WHERE deptno = 30);

SELECT * FROM emp JOIN salgrade ON sal BETWEEN losal AND hisal
WHERE salgrade.grade = 3 AND emp.deptno = 30;

CREATE TABLE EMP_DLL(
             EMPNO NUMBER(4),
             ENAME VARCHAR2(10),
             JOB VARCHAR2(9),
             MGR NUMBER(4),
             HIRE_DATE DATE,
             SAL NUMBER(7,2),
             COMM NUMBER(7,2),
             DEPTNO NUMBER(2)
             );
desc emp_dll;

CREATE VIEW EMP_V3 AS 
SELECT empno 직원번호, ename 이름, job 직업, hiredate 고용일자, sal 월급, deptno 부서번호 FROM emp;