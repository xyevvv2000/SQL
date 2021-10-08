-- DML 작업

-- 데이터 입력 INSERT
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (300, 'Game', 100, 1700);

select * from departments ORDER BY department_id desc; -- 데이터 입력 확인

-- 테이블 열의 구조를 확인
DESC departments;

-- 특정 열만 입력 ( 미입력시 NULL )
INSERT INTO departments(department_id, department_name)
values (280,'music');

-- 열의 이름을 생략하면 모든 값을 적어야 함
INSERT INTO departments
values (290,'Busan', NULL, 1700);

-- 예제
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (271, 'Sample Dept 1', 200, 1700);
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (272, 'Sample Dept 2', 200, 1700);
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (273, 'Sample Dept 3', 200, 1700);

-- 데이터의 수정 UPDATE : 특정 행을 대상으로 업데이트 해야하므로 where 절을 작성
--                       대상을 지정하지 않으면 모든 값이 바뀌어버림
UPDATE departments
SET manager_id = 200
where department_name = 'Game';

select * from departments ORDER BY department_id desc; -- 바뀐 데이터 확인

-- 예제
update departments
set manager_id = 100
where department_id between 150 and 200;

-- 두 개 이상의 열을 업데이트
UPDATE departments
SET manager_id = 200 , location_id = 1800
where department_name = 'Game';

select * from departments ORDER BY department_id desc; -- 바뀐 데이터 확인

-- 데이터의 삭제 DELETE
-- where 절 조건에 만족하는 데이터를 삭제
-- where 절을 적지 않으면 전체 데이터 삭제
-- 다른 테이블에서 사용하고 있는 데이터는 삭제가 불가능
-- rollback; 으로 마지막 저장 지점으로 롤백가능
-- 수정 후 commit;으로 데이터 저장 확정
DELETE FROM departments
WHERE department_name = 'music';

DELETE from departments
WHERE department_name = 'Game';

DELETE from departments
WHERE department_id = 290;

DELETE from departments
WHERE department_name like '%Sample%';

-- 수정한 데이터 저장
commit;

-- 자동 커밋 설정
show autocommit; -- 설정 확인
set autocommit on; -- ON
set autocommit off; -- OFF