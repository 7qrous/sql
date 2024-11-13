SELECT * FROM employees;
SELECT * FROM salaries;

SELECT emp_no, birth_date, first_name, last_name, gender, hire_date
FROM employees
WHERE emp_no = 10013;

SELECT emp_no, salary, from_date, to_date 
FROM salaries
WHERE emp_no = 10013;


SELECT 
	employees.emp_no, 
    employees.birth_date, 
    employees.first_name, 
    employees.last_name, 
    employees.gender, 
    employees.hire_date,
    salaries.emp_no,
    salaries.salary,    
    salaries.from_date,
    salaries.to_date
FROM employees 
JOIN salaries ON employees.emp_no = salaries.emp_no AND salaries.emp_no = 10013;




SELECT 
	emp.emp_no, 
    emp.birth_date, 
    emp.first_name, 
    emp.last_name, 
    emp.gender, 
    emp.hire_date,
    sa.emp_no,
    sa.salary,    
    sa.from_date,
    sa.to_date
FROM employees as emp
JOIN salaries as sa ON emp.emp_no = sa.emp_no AND sa.emp_no = 10013;


SELECT 
	e.emp_no, 
    e.birth_date, 
    e.first_name, 
    e.last_name, 
    e.gender, 
    e.hire_date,
    s.emp_no,
    s.salary,    
    s.from_date,
    s.to_date
FROM employees as e
JOIN salaries as s ON e.emp_no = s.emp_no AND s.emp_no = 10013;


-- emp_no, first_name, last_name, gender, salary, hire_date

SELECT 
	emp.emp_no, 
    emp.last_name,
    emp.first_name,
    emp.gender,
    sa.salary, 
    emp.hire_date
FROM employees as emp  
JOIN salaries as sa 
ON emp.emp_no = sa.emp_no 
AND emp.emp_no = 10013 
AND sa.to_date > '2024-11-12'; 



SELECT 
    emp.emp_no, 
    emp.last_name,
    emp.first_name,
    emp.gender,
    sa.salary, 
    emp.hire_date
FROM employees as emp
JOIN salaries as sa
ON emp.emp_no = sa.emp_no
   AND emp.emp_no = 10013
   AND sa.to_date > '2024-11-12';


SELECT
	emp.emp_no,
    emp.last_name,
    emp.first_name,
    emp.gender,
    sa.salary,
    sa.from_date
FROM
	employees as emp
JOIN
	salaries as sa
ON
	emp.emp_no = sa.emp_no
AND
	emp.emp_no = 20202;
 
    
SELECT
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	emp.gender,
	sa.salary
FROM
	employees as emp
JOIN
	salaries as sa
ON
	emp.emp_no = sa.emp_no
AND
	emp.first_name = 'mario'
AND
	emp.gender = 'F';
    
   
    
    
    
    