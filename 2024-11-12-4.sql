-- create view 뷰이름 as select ~;
-- drop view 뷰이름;
-- 이름이 luigi 인 사원 중 성별이 남성이고  입사일이 '1995-01-01' 이후인 사람을 모두 검색

select emp_no, first_name, last_name, gender, birth_date, hire_date
from employees
where first_name = 'luigi' 
and hire_date >= '1995-01-01'
and gender = 'M';



select * from employees;

CREATE VIEW luigis AS 
	select emp_no, first_name, last_name, gender, birth_date, hire_date
	from employees
	where first_name = 'luigi' 
	and hire_date >= '1995-01-01'
	and gender = 'M';

select * from luigis;
drop view luigis;


select emp.emp_no, emp.first_name, emp.last_name, emp.gender, sa.salary from employees as emp join salaries as sa on sa.emp_no = emp.emp_no and sa.emp_no = '10571';
CREATE VIEW salaryinfo AS
    SELECT 
        emp.emp_no,
        emp.first_name,
        emp.last_name,
        emp.gender,
        sa.salary
    FROM
        employees AS emp
            JOIN
        salaries AS sa ON sa.emp_no = emp.emp_no
            AND sa.emp_no = '10571';

select * from salaryinfo;
