use employees;
SELECT * FROM employees;

SELECT emp_no, birth_date, first_name, last_name, gender, hire_date
FROM employees
WHERE emp_no <= 10010;

SELECT 
	emp_no AS '사원번호', 
	birth_date AS '생년월일', 
	first_name AS '이름', 
	last_name AS '성', 
	gender AS '성별', 
	hire_date AS '입사일'
FROM 
	employees 
WHERE 
	emp_no <= 10010;
    
 
 SELECT emp_no AS eno,
		birth_date AS 'b Day',
        first_name AS fName,
        last_name AS lName,
        hire_date AS hDay
FROM employees 
WHERE emp_no <=10010;
 
 
SELECT emp_no AS eno,
		birth_date AS `b Day`,
        first_name AS fName,
        last_name AS lName,
        hire_date AS hDay
FROM employees 
WHERE emp_no <=10010;


SELECT emp_no, birth_date, first_name, last_name, gender, hire_date FROM employees as emp;


SELECT 
	employees.emp_no, 
	employees.birth_date, 
	employees.first_name, 
	employees.last_name, 
	employees.gender, 
	employees.hire_date 
FROM employees;

SELECT 
	emp.emp_no, 
	emp.birth_date, 
	emp.first_name, 
	emp.last_name, 
	emp.gender, 
	emp.hire_date 
FROM employees as emp;

SELECT 
	emp.emp_no as eno, 
	emp.birth_date as bDay, 
	emp.first_name as fName, 
	emp.last_name as lName, 
	emp.gender as gd, 
	emp.hire_date as hDay
FROM employees as emp;





























