-- 주석 단축키 ctrl+/
/*
여
러
줄
*/
-- 1. 테이블의 모든 행과 열을 읽어오기
-- * 은 전체 열을 의미
-- 문장의 끝은 항상 ; 으로 마치기
SELECT * FROM departments; --departments의 전체 열을 불러오기

-- 2. 특정 열만 조회하기
SELECT department_id, department_name 
from departments;