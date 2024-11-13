SELECT * FROM employees WHERE emp_no = 20202;

select emp.emp_no, emp.last_name, emp.first_name, emp.gender, sa.salary, sa.from_date, sa.to_date
from employees as emp join salaries sa
on emp.emp_no = sa.emp_no
and emp.emp_no = 20202;

select a.emp_no, a.last_name, a.first_name, a.gender, b.salary
from employees as a join salaries as b
on a.emp_no = b.emp_no
and a.first_name ='mario'
and a.gender = 'f' 
and b.to_date > '2024-11-12';


select * from employees where emp_no = 10571;
select * from salaries where emp_no = 10571;
select * from titles where emp_no = 10571;


select 
	emp.emp_no,
    emp.first_name,
    emp.last_name,
    emp.gender,
    sa.salary,
    ti.title
from employees as emp
join salaries as sa
on emp.emp_no = sa.emp_no
join titles as ti
on emp.emp_no = ti.emp_no
and emp.emp_no = 10571
and ti.to_date > '2024-11-12';



select 
	emp.emp_no,
    emp.first_name,
    emp.last_name,
    emp.gender,
    sa.salary,
    ti.title
from employees as emp
join salaries as sa
on emp.emp_no = sa.emp_no
join titles as ti
on sa.emp_no = ti.emp_no
and emp.emp_no = 10571
and ti.to_date > '2024-11-12';

select 
	emp.emp_no,
    emp.first_name,
    emp.last_name,
    emp.gender,
    sa.salary,
    ti.title
from employees as emp
join salaries as sa
on emp.emp_no = sa.emp_no
join titles as ti
on emp.emp_no = ti.emp_no
and emp.emp_no = 10571
and ti.to_date > '2024-11-12'
and sa.to_date > '2024-11-12';



select 
	emp.emp_no,
    emp.first_name,
    emp.last_name,
    emp.gender,
    sa.salary,
    ti.title
from employees as emp
join salaries as sa
on emp.emp_no = sa.emp_no
join titles as ti
on emp.emp_no = ti.emp_no
and emp.emp_no = 10571
and ti.to_date > '2024-11-12'
and sa.to_date > '2024-11-12';

select emp.emp_no, emp.first_name, emp.last_name, emp.gender, emp.hire_date, sa.salary, ti.title
from employees as emp
join salaries as sa
on emp.emp_no=sa.emp_no
join titles as ti
on emp.emp_no = ti.emp_no
and emp.first_name ='luigi'
and emp.hire_date >='1995-01-01'
and sa.to_date >='2024-11-12';

