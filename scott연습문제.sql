--문제1
SELECT empno, ename, sal
FROM EMP
where deptno = 10;

--문제2
SELECT ename, hiredate, deptno
FROM EMP
WHERE empno = 7369;

--문제3
SELECT *
FROM emp
WHERE ename = 'ALLEN';

--문제4
SELECT ENAME,deptno,sal
FROM EMP
WHERE hiredate='81/02/20';

--문제5
SELECT
    *
FROM emp
WHERE job != 'MANAGER';

--문제6
SELECT
    *
FROM emp
WHERE hiredate>='81/04/02';

--문제7
SELECT ENAME,sal,deptno
FROM emp
WHERE sal>=800;

--문제8
SELECT
    *
FROM EMP
WHERE deptno>=20;

--문제9
SELECT
    *
FROM emp
WHERE ename>'L';

--문제10
SELECT
    *
FROM emp
WHERE hiredate<'81/12/09';

--문제11
SELECT empno,ename
FROM emp
WHERE empno<=7698;

--문제12
SELECT ename,sal,deptno
FROM emp
WHERE hiredate<='82/12/09' AND hiredate>='81/04/02';

--문제13
SELECT ename,job,sal
FROM EMP
WHERE sal>1600 AND sal<3000;

--문제14
SELECT
    *
FROM emp
WHERE empno<7654 OR empno>7782;

--문제15
SELECT
    *
FROM emp
WHERE ename>'B' AND ename<'J';

--문제16
SELECT
    *
FROM emp
where not (hiredate >='81/01/01' and hiredate<='81/12/31');

--문제17
SELECT
    *
FROM emp
where job IN ('MANAGER', 'SALESMAN');

--문제18
SELECT ename,empno,deptno
FROM emp
WHERE deptno NOT IN (20,30);

--문제19
SELECT empno,ename,hiredate,deptno
FROM emp
where ename like 'S%';

--문제20
SELECT
    *
FROM emp
where hiredate>='81/01/01' and hiredate<= '81/12/31';

--문제21
SELECT
    *
FROM emp
where ename LIKE 'S%' or ename LIKE '%S%';

--문제22
SELECT
    *
FROM emp
WHERE (ename LIKE 'M_____' and ename LIKE '_____N');

--문제23
SELECT
    *
FROM emp
where ename like '_A%';

--문제24
SELECT
    *
FROM emp
WHERE comm is NULL;

--문제25
SELECT
    *
FROM emp
WHERE comm is not NULL;

--문제26
SELECT ename,deptno,sal
FROM emp
where deptno = 30 and sal>=1500;

--문제27
SELECT empno,ename,deptno
FROM emp
where ename like 'K%' or deptno = 30;

--문제28
SELECT
    *
FROM emp
where sal >=1500 and deptno=30 and job = 'MANAGER';

--문제29
SELECT
    *
FROM emp
WHERE deptno = 30 ORDER BY empno;

--문제30
SELECT
    *
FROM emp ORDER BY sal DESC;

--문제34
SELECT ename,sal,nvl(comm,0),sal+nvl(comm,0) total
FROM emp ORDER BY total desc;

--문제35
SELECT ename,sal,to_char(sal*0.15,'$999.9') 회비
FROM emp
where sal between 1500 and 3000;

--문제36
SELECT d.dname, COUNT(DISTINCT e.empno)
FROM emp e JOIN dept d on d.deptno = e.deptno
GROUP BY d.dname HAVING COUNT(DISTINCT e.empno)>5;

--문제37
SELECT job, sum(sal)
FROM emp
where not job = 'SALESMAN'
GROUP BY job HAVING SUM(SAL)>5000;

--문제38
SELECT e.empno,e.ename,e.sal,s.grade
FROM emp e join salgrade s on e.sal BETWEEN s.losal and s.hisal;

--문제39
SELECT deptno,count(empno),count(comm)
FROM emp group by deptno;

--문제40
SELECT ename,deptno,decode(deptno,10,'총무부',20,'개발부',30,'영업부')
FROM emp;

SELECT ename,deptno, case deptno 
                                                when 10 then '총무부'
                                                when 20 then '개발부'
                                                else '영업부' end "부서명"
FROM emp;