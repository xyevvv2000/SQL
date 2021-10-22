-- 제약조건
-- NOT NULL : NULL값 입력불가
DESC departments;

-- UK(유니크) : 중복값 입력 불가
-- emp_name은 NOT NULL 제약조건, email은 유니크 제약조건
CREATE TABLE emp1 (
    eno         NUMBER(3),
    emp_name    VARCHAR2(20) CONSTRAINT emp1_ename_nn NOT NULL,
    email       VARCHAR2(30),
    CONSTRAINT emp1_email_uk UNIQUE(email)
    );
    desc emp1;

-- emp1에 데이터를 입력
INSERT INTO emp1 VALUES(208,'Kim','KJS@naver.com');
INSERT INTO emp1 VALUES(208,NULL,'KJS@naver.com'); -- NULL 입력불가여서 에러발생
INSERT INTO emp1 VALUES(208,'Lee','KJS@naver.com'); -- 중복불가여서 에러발생

CREATE TABLE emp2 (
    eno         NUMBER(3),
    emp_name    VARCHAR2(20),
    sal         NUMBER(10),
    CONSTRAINT emp2_sal_check CHECK(sal>1000)
    );
INSERT INTO emp2 VALUES(208,'Kim',1200);
INSERT INTO emp2 VALUES(208,'Lee',900); -- sal의 값이 입력조건(sal>1000)을 만족하지 못함

-- 제약조건을 이름없이 테이블 생성
CREATE TABLE emp (
    eno NUMBER(4) PRIMARY KEY, -- 기본키(고유값)
    ename VARCHAR2(20) NOT NULL, -- NULL 입력불가
    gno VARCHAR2(13) UNIQUE CHECK (LENGTH(gno)>=8), -- 8자 이상
    gender VARCHAR2(5) CHECK (gender IN('woman','man')) -- man 또는 woman 입력
    );

INSERT INTO emp VALUES(1,'Kim','12345678','man');    
INSERT INTO emp VALUES(2,'Kim','123456789','woman');

-- 예제
CREATE TABLE members (
    member_id    NUMBER(2) PRIMARY KEY,
    first_name   VARCHAR2(50) NOT NULL,
    last_name    VARCHAR2(50) NOT NULL,
    gender       VARCHAR2(5) CHECK (gender IN('woman','man')),
    birth_day    DATE DEFAULT SYSDATE,
    email        VARCHAR2(200) UNIQUE NOT NULL    
    );
desc members;

-- 제약조건 pk fk 기본키 외래키 관계

-- 기본키 PK(PRIMARY KEY)
CREATE TABLE 부서(
    부서번호 NUMBER(4),
    부서이름 VARCHAR2(20),
    CONSTRAINT dept_pk PRIMARY KEY(부서번호)
    );
desc 부서;
INSERT INTO 부서 VALUES (1,'개발');
-- INSERT INTO 부서 VALUES (NULL,'회계'); 기본키 열은 중복 혹은 NULL 입력불가
SELECT * FROM 부서;

-- 외래키 (FOREIGN KEY)
-- 외래키 문법 FOREIGN KEY(열이름) REFERENCES 참조테이블(참조열) ON 조건(ON DELETE SET NULL/CASCADE 등)
DROP TABLE 직원;
CREATE TABLE 직원(
    직원번호 NUMBER(4) PRIMARY KEY,
    이름 VARCHAR2(20),
    월급 NUMBER(10),
    부서번호 NUMBER(4),
    FOREIGN KEY(부서번호) REFERENCES 부서(부서번호) ON DELETE SET NULL
    -- FOREIGN KEY(부서번호) REFERENCES 부서(부서번호) ON DELETE CASCADE -- ON DELETE CASCADE 참조하는 외래키가 삭제되면 참조해서 만든 데이터도 같이 삭제된다
    );
DESC 직원;
-- 데이터 입력
INSERT INTO 부서 VALUES (1,'개발');
INSERT INTO 부서 VALUES (2,'경영');
INSERT INTO 부서 VALUES (3,'회계');
SELECT * FROM 부서;

INSERT INTO 직원(직원번호,이름,월급,부서번호) VALUES (100,'홍길동',150,1);
INSERT INTO 직원(직원번호,이름,월급,부서번호) VALUES (110,'펭수',100,1);
INSERT INTO 직원(직원번호,이름,월급,부서번호) VALUES (120,'라이언',200,NULL); -- 외래키는 NULL 입력가능
SELECT * FROM 직원;

-- 외래키 연관된 데이터 삭제시 에러가 발생
DELETE FROM 부서 WHERE 부서번호 = 1; -- 현재 외래키로 참조하는 열이 있어서 삭제불가

-- 이미 생성된 테이블에 제약조건 추가 하는법
CREATE TABLE 과목(
    과목번호 VARCHAR2(2),
    과목이름 VARCHAR2(50)    
    );
INSERT INTO 과목 VALUES ('01','데이터베이스');
INSERT INTO 과목 VALUES ('02','프로그래밍');

CREATE TABLE 학생(
    학번 VARCHAR2(4),
    이름 VARCHAR2(50),
    과목번호 VARCHAR2(2)    
    );
INSERT INTO 학생 VALUES ('0414','홍길동','01');
INSERT INTO 학생 VALUES ('0415','임꺽정','02');
INSERT INTO 학생 VALUES ('0416','이순신','03');
SELECT * FROM 학생;

-- 과목 테이블에 제약조건 추가
ALTER TABLE 과목 ADD PRIMARY KEY (과목번호); -- 과목번호를 기본키로
ALTER TABLE 과목 ADD UNIQUE (과목이름); -- 과목이름을 유니크로

-- 학생 테이블에 제약조건 추가
ALTER TABLE 학생 ADD PRIMARY KEY (학번);
ALTER TABLE 학생 MODIFY 이름 NOT NULL; -- 이름을 NOT NULL 조건으로
ALTER TABLE 학생 ADD FOREIGN KEY (과목번호) REFERENCES 과목(과목번호);

UPDATE 학생 SET 과목번호 = '01' WHERE 학번 = '0416';

-- 추가된 제약조건 확인 테이블 이름은 대문자로 '' 안에 넣어서 확인
SELECT * FROM All_CONSTRAINTS WHERE TABLE_NAME = '과목';
SELECT * FROM All_CONSTRAINTS WHERE TABLE_NAME = '학생';

-- 제약조건 삭제하기
ALTER TABLE 과목 DROP PRIMARY KEY; -- 과복번호 기본키를 학생테이블에서 참조 중이므로 삭제불가
-- CASCADE 옵션으로 외래키 조건과 같이 삭제
ALTER TABLE 과목 DROP PRIMARY KEY CASCADE;
-- 제약조건의 이름으로 삭제
ALTER TABLE 과목 DROP CONSTRAINT SYS_C007159; -- SYS_C007159 <- 임의로 생성된 제약조건 이름
ALTER TABLE 학생 DROP PRIMARY KEY;
ALTER TABLE 학생 DROP CONSTRAINT SYS_C007161;

-- 테이블에 열을 추가 / 수정 / 삭제
CREATE TABLE 직원 (직원번호,이름,급여,부서번호)
AS SELECT employee_id,first_name,salary,department_id FROM employees
WHERE department_id = 90; --90번 부서의 직원들로 새로운 테이블 (직원) 생성
SELECT * FROM 직원;

-- 열을 추가
ALTER TABLE 직원 ADD(성별 VARCHAR2(3));
ALTER TABLE 직원 ADD(커미션 NUMBER DEFAULT 0);

-- 열을 수정 (데이터 타입을 바꾸거나 용량을 늘릴 때)
DESC 직원;
ALTER TABLE 직원 MODIFY (성별 VARCHAR2(10));
-- ALTER TABLE 직원 MODIFY (커미션 VARCHAR2(10)); -- 데이터가 들어가 있으면 타입 변경 불가

-- 열을 삭제
ALTER TABLE 직원 DROP COLUMN 성별;

-- 테이블의 이름 수정
RENAME 직원 TO 직원2;
DESC 직원2;