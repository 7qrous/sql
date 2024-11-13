select * from titles as ti
cross join salaries as sa
on ti.emp_no = sa.emp_no
and ti.emp_no = 10571;

select * from titles as ti
join salaries as sa
on ti.emp_no = sa.emp_no
and ti.emp_no = 10571;

-- 두 가지의 SQL 실행 후 결과를 하나로 합하여 출력하는 명령
-- 사용법
-- SELECT 컬럼1, 컬럼2, ...FROM 테이블1 WHERE 검색조건;
-- union 
-- SELECT 컬럼1, 컬럼2, ...FROM 테이블2 WHERE 검색조건;
-- 출력 시 사용할 컬럼이 동일해야 함
-- 출력 시 사용할 컬럼의 데이터 타입이 동일해야 함

SELECT emp_no, first_name, last_name FROM employees WHERE first_name = 'mario' UNION SELECT emp_no, first_name, last_name FROM employees WHERE first_name ='mario';


