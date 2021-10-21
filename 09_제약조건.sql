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