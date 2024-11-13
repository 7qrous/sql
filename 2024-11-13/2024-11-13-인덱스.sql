-- test
select * from salaries;
select * from salaries where emp_no = 22222;
select * from salaries where to_date= '1997-06-12';
select * from salaries where to_date= '1999-06-12';
select count(*) from salaries;
select * from employees where hire_date = '1985-11-21';

-- 인덱스 사용
-- 데이터베이스 테이블의 내용을 조회할 때 미리 인덱싱 작업을 통해서 조회 속도를 높이는 방법
-- select 시 자주 사용하는 컬럼에 인덱스를 적용하면 됨
-- 너무 많이 사용 시 시스템의 전체 부하가 많이 걸림
-- 인덱싱 되어 있는 컬럼 조회시 검색 속도가 빠름
-- 인덱싱 되어 있지 않은 컬럼으로 조회 시 검색속도가 느림


