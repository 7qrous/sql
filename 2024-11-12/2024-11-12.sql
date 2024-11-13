
-- AS
-- 테이블명, 컬럼명의 별명을 지정하여 사용하도록 하는 명령
-- 별명이 영문이면 그대로 입력, 한글이나, 공백 기호가 있을 경우 ' ' 로 감싸서 사용
-- JOIN 사용 시 필수로 사용해야 함
-- JOIN 사용 시 컬럼을 입력할 때 테이블명.컬럼명 방식으로 입력하여 컬럼명이 길어지기 때문에 AS 를 사용하여 컬럼명을 줄여서 사용함

-- 사용법
-- SELECT 컬럼1 AS 별명1, 컬럼2 AS 별명2, ... FROM 테이블명 AS 테이블별명 WHERE 테이블별명.컬럼별명 = 값;

-- 기본 입력 방식
SELECT emp_no, birth_date, first_name, last_name, gender, hire_date
FROM employees WHERE emp_no <= 10010;

-- 출력 컬럼의 이름을 한글로 변경
SELECT emp_no AS '사원번호', birth_date AS '생년월일', last_name AS '성',  first_name AS '이름', gender AS '성별', hire_date AS '입사일' FROM employees
WHERE emp_no <= 10010;

-- 영문으로 별명을 사용했을 경우
SELECT emp_no AS eno, birth_date AS 'b Day', first_name AS fName, last_name AS lName, hire_date AS hDay
FROM employees WHERE emp_no <= 10010;

-- 테이블명에 별명 사용
SELECT emp_no, birth_date, first_name, last_name, gender, hire_date FROM employees AS emp;

SELECT employees.emp_no, employees.birth_date, employees.first_name, employees.last_name, employees.gender, employees.hire_date
FROM employees;

SELECT emp.emp_no, emp.birth_date, emp.first_name, emp.last_name, emp.gender, emp.hire_date
FROM employees AS emp;

SELECT emp.emp_no AS eno, emp.birth_date AS bDay, emp.first_name AS fName, emp.last_name AS lName, emp.gender AS sex, emp.hire_date AS hDay
FROM employees AS emp;


-- JOIN
-- 2개 이상의 테이블에 데이터를 한번에 조회하여 가져오는 명령
-- INNER JOIN(일반적인 JOIN), OUTER JOIN(LEFT OUTER JOIN, RIGHT OUTER JOIN), CROSS JOIN, SELF JOIN

-- 사용법 (INNER JOIN)
-- SELECT 테이블1.컬럼1, 테이블1.컬럼2, ... , 테이블2.컬럼1, 테이블2.컬럼2, ...  
-- FROM 테이블1 JOIN 테이블2
-- ON 테이블1.같은데이터의컬럼 = 테이블2.같은데이터의컬럼
-- AND 검색조건

-- SELECT 테이블1.컬럼1, 테이블1.컬럼2, ... , 테이블2.컬럼1, 테이블2.컬럼2, ... , 테이블3.컬럼1, 테이블3.컬럼2
-- FROM 테이블1 JOIN 테이블2 ON 테이블1.같은데이터의컬럼 = 테이블2.같은데이터의컬럼
-- JOIN 테이블3 ON 테이블2.같은데이터의컬럼 = 테이블3.같은데이터의컬럼

-- FROM 테이블1 JOIN 테이블2 JOIN 테이블3
-- ON 테이블1.컬럼 = 테이블2.컬럼
-- ON 테이블2.컬럼 = 테이블3.컬럼

SELECT * FROM employees;
SELECT * FROM salaries;

-- JOIN을 미사용 시 각각의 테이블에서 데이터를 따로따로 조회해야 함
SELECT emp_no, birth_date, first_name, last_name, gender, hire_date
FROM employees WHERE emp_no = 10013;
SELECT emp_no, salary, from_date, to_date
FROM salaries WHERE emp_no = 10013;

-- JOIN 사용 시 
SELECT * FROM employees JOIN salaries
ON employees.emp_no = salaries.emp_no
AND employees.emp_no = 10013;

-- JOIN 사용 시 반드시 테이블.컬럼명 방식으로 입력해야 함
SELECT employees.emp_no, employees.birth_date, employees.first_name, employees.last_name, employees.gender, employees.hire_date, salaries.salary,
salaries.from_date, salaries.to_date
FROM employees JOIN salaries
ON employees.emp_no = salaries.emp_no
AND salaries.emp_no = 10013;

-- JOIN 사용 시 AS 로 별명 사용
-- join 사용 시 테이블명을 as로 변경하면 컬럼명 입력 시 테이블별명.컬럼명 으로 입력
SELECT emp.emp_no, emp.birth_date, emp.first_name, emp.last_name, emp.gender, emp.hire_date, sa.salary, sa.from_date, sa.to_date
FROM employees as emp JOIN salaries as sa
ON emp.emp_no = sa.emp_no
AND sa.emp_no = 10013;

-- 사원번호가 10013 인 사원의 이름, 성, 성별, 입사일, 현재 급여 를 출력
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.gender, sa.salary, emp.hire_date
FROM employees AS emp JOIN salaries AS sa
ON emp.emp_no = sa.emp_no
AND emp.emp_no = 10013
AND sa.to_date > '2024-11-12';

-- 문제1) 사원 번호가 20202 인 사원의 사원번호, 성, 이름, 성별, 급여, 해당 급여 시작일, 해당 급여 종료일 을 출력하는 SQL 쿼리문을 생성하세요
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.gender, sa.salary, sa.from_date, sa.to_date
FROM employees AS emp JOIN salaries AS sa
ON emp.emp_no = sa.emp_no
AND emp.emp_no = 20202;


-- 문제2) 사원의 이름이 'mario'이고, 성별이 여성인 사원의 사원번호, 성, 이름, 성별, 현재 급여 를 출력하는 SQL 쿼리문을 생성하세요
SELECT a.emp_no, a.last_name, a.first_name, a.gender, b.salary
FROM employees AS a JOIN salaries AS b
ON a.emp_no = b.emp_no
AND a.first_name = 'mario'
AND a.gender = 'F'
AND b.to_date > '2024-11-12';


-- 3개의 테이블의 JOIN
-- JOIN 구문과 ON 을 2개 사용하여 각각의 테이블의 연결
SELECT * FROM employees WHERE emp_no = 10571;
SELECT * FROM salaries WHERE emp_no = 10571;
SELECT * FROM titles WHERE emp_no = 10571;

SELECT *
FROM employees AS emp
JOIN salaries AS sa
ON emp.emp_no = sa.emp_no
JOIN titles AS ti
ON sa.emp_no = ti.emp_no
AND emp.emp_no = 10571;


SELECT emp.emp_no, emp.first_name, emp.last_name, emp.gender, emp.hire_date, sa.salary, ti.title
FROM employees AS emp
JOIN salaries AS sa ON emp.emp_no = sa.emp_no
JOIN titles AS ti ON emp.emp_no = ti.emp_no
AND emp.emp_no = 10571
AND ti.to_date > '2024-11-12'
AND sa.to_date > '2024-11-12';

-- 사원의 이름이 'luigi'인 사람 중 성별이 남성이고, 입사일이 1995년 1월 1일 이후 입사자의 사원번호, 이름, 성, 성별, 입사일, 직급, 급여 를 출력하는 SQL문을 생성하세요
-- 해당 사원은 현재 계속 근무하고 있는 사원으로 한정함
SELECT * FROM employees WHERE first_name = 'luigi';

SELECT emp.emp_no, emp.first_name, emp.last_name, emp.gender, emp.hire_date, ti.title, sa.salary
FROM employees AS emp
JOIN salaries AS sa ON sa.emp_no = emp.emp_no
JOIN titles AS ti ON ti.emp_no = emp.emp_no
AND emp.first_name = 'luigi'
AND ti.to_date >= '2024-11-12'
AND emp.hire_date >= '1995-01-01';


-- VIEWS
-- JOIN 및 여러가지 SQL문을 실행 시 복잡한 SQL문 생성하여야 하는 부분을 간단한 SQL문으로 변환하여 사용하도록 하는 가상 테이블
-- 외부 사용자에게 내부 사용자가 사용하는 실제 데이터 테이블을 공유할 경우 보안 위험이 발생하므로 외부 사용자만 잠시 접근할 수 있는 가상의 테이블을 생성하여 공유하는 것
-- views 는 기본적으로 생성과 삭제만 있음, 수정 시 삭제 후 다시 생성해야 함

-- 사용방법
-- 생성
-- CREATE VIEW 뷰이름 AS 
-- SELECT 컬럼1, 컬럼2, ... FROM 테이블명 WHERE 검색조건;

-- 삭제
-- DROP VIEW 뷰이름


-- 이름이 'luigi'인 사원 중 성별이 남성이고, 입사일이 '1995-01-01' 이후인 사람을 모두 검색
SELECT emp_no, first_name, last_name, gender, birth_date, hire_date
FROM employees
WHERE first_name = 'luigi'
AND hire_date >= '1995-01-01'
AND gender = 'M';

-- 위의 내용을 VIEWS 로 생성하여 간단한 SQL문으로 조회하기
CREATE VIEW luigis AS
	SELECT emp_no, first_name, last_name, gender, birth_date, hire_date
    FROM employees WHERE first_name = 'luigi'
    AND gender = 'F' AND hire_date >= '1995-01-01';

-- 간단한 SQL문으로 내용 조회
SELECT * FROM luigis;

-- VIEWS 삭제
DROP VIEW luigis;


SELECT emp.emp_no, emp.first_name, emp.last_name, emp.gender, sa.salary, sa.from_date
FROM employees AS emp
JOIN salaries AS sa ON sa.emp_no = emp.emp_no
AND sa.emp_no = 10571;

CREATE VIEW salaryinfo AS
	SELECT emp.emp_no, emp.first_name, emp.last_name, emp.gender, sa.salary, sa.from_date
	FROM employees AS emp
	JOIN salaries AS sa ON sa.emp_no = emp.emp_no
	AND sa.emp_no = 10571;

SELECT * FROM salaryinfo;


-- LEFT OUTER JOIN, RIGHT OUTER JOIN
-- 기준이 되는 테이블의 모든 내용을 출력하고 연관된 다른 테이블의 내용을 함께 출력하는 JOIN
-- 왼쪽 테이블을 기준으로 하면 LEFT OUTER JOIN, 오른쪽 테이블을 기준으로 하면 RIGHT OUTER JOIN 이 됨
-- 기준이 되는 테이블에는 내용이 존재하지만 연관된 테이블의 내용이 없을 경우에는 NULL 이 표시

-- 사용법
-- SELECT 테이블1.컬럼1, 테이블1.컬럼2, ... , 테이블2.컬럼1, 테이블2.컬럼2, ... 
-- FROM 테이블1 LEFT JOIN 테이블2
-- ON 테이블1.연결된컬럼 = 테이블2.연결된컬럼
-- AND 검색조건 ... ;

-- inner join으로 emp_no 가 10571 인 사람의 정보 가져오기
SELECT emp.emp_no, emp.first_name, emp.last_name, emp.gender, sa.salary, sa.from_date, sa.to_date
FROM employees AS emp
JOIN salaries AS sa
ON emp.emp_no = sa.emp_no
AND emp.emp_no = 10571;

-- left outer join으로 emp_no 가 10571 인 사람의 정보를 가져오기
-- 기준이 되는 employees 테이블의 모든 내용을 그대로 출력
-- 오른쪽의 테이블의 내용 중 기준이 되는 employees 테이블의 내용을 연관이 있는 내용을 출력
SELECT emp.emp_no, emp.first_name, emp.last_name, emp.gender, sa.salary, sa.from_date, sa.to_date
FROM employees AS emp
LEFT JOIN salaries AS sa
ON emp.emp_no = sa.emp_no
AND emp.emp_no = 10571;

SELECT emp.emp_no, emp.first_name, emp.last_name, emp.gender, sa.salary, sa.from_date, sa.to_date
FROM employees AS emp
RIGHT JOIN salaries AS sa
ON emp.emp_no = sa.emp_no
AND emp.emp_no = 10009;


SELECT emp.emp_no, emp.first_name, emp.last_name, emp.gender, ti.title, ti.from_date, ti.to_date
FROM employees AS emp
JOIN titles AS ti
ON emp.emp_no = ti.emp_no
AND emp.emp_no = 10571;

SELECT emp.emp_no, emp.first_name, emp.last_name, emp.gender, ti.title, ti.from_date, ti.to_date
FROM employees AS emp
LEFT OUTER JOIN titles AS ti
ON emp.emp_no = ti.emp_no
AND emp.emp_no = 10571;

SELECT emp.emp_no, emp.first_name, emp.last_name, emp.gender, ti.title, ti.from_date, ti.to_date
FROM employees AS emp
RIGHT OUTER JOIN titles AS ti
ON emp.emp_no = ti.emp_no
AND emp.emp_no = 10571;


-- CROSS JOIN
-- 사용법
-- SELECT 테이블1.컬럼1, 테이블1.컬럼2, ... , 테이블2.컬럼1, 테이블2.컬럼2, ...
-- FROM 테이블1 CROSS JOIN 테이블2
-- ON 테이블1.연결된컬럼 = 테이블2.연결된컬럼
-- AND 검색조건 ... ;

SELECT emp.emp_no, emp.first_name, emp.last_name, emp.gender, sa.salary, sa.from_date, sa.to_date
FROM employees AS emp
JOIN salaries AS sa
ON emp.emp_no = sa.emp_no
AND emp.emp_no = 10571;

SELECT ti.emp_no, ti.from_date, ti.to_date, sa.salary, sa.from_date, sa.to_date
FROM titles AS ti
CROSS JOIN salaries AS sa
ON ti.emp_no = sa.emp_no
AND ti.emp_no = 10571;


-- UNION 
-- 두가지의 SQL을 실행 후 결과를 하나로 합하여 출력하는 명령
-- 출력 시 사용할 컬럼명이 동일해야 함
-- 출력 시 사용할 컬럼의 데이터 타입이 동일해야 함

-- 사용법
-- SELECT 컬럼1, 컬럼2, ... FROM 테이블1 WHERE 검색조건
-- UNION
-- SELECT 컬럼1, 컬럼2, ... FROM 테이블2 WHERE 검색조건

SELECT emp_no, first_name, last_name FROM employees WHERE first_name = 'mario'
UNION
SELECT emp_no, first_name, last_name FROM employees WHERE first_name = 'luigi';


-- 트랜젝션
-- SQL 문 실행 시 데이터베이스에 직접적으로 데이터 수정이 진행되는 INSERT, UPDATE, DELETE 쿼리문 실행 후 실행 이전의 내용으로 복구하는 명령
-- START TRANSACTION 명령으로 복구 옵션을 실행하고, COMMIT / ROLLBACK 명령어 데이터베이스에 내용을 적용하거나 기존 내용으로 복구
-- MySQL은 기본적으로 AUTO COMMIT 이 적용되어 있음
-- 트랜젝션 사용 시 AUTO COMMIT 옵션을 끄고 사용해야 함
-- SAVEPOINT 를 사용하여 복구 위치를 여러개 설정할 수 있음
-- ROLLBACK TO 명령을 사용하여 원하는 위치로 복구할 수 있음
-- 트랜젝션에서 DDL 명령은 제외 됨 (CREATE, DROP, ALTER, TRUNCATE)

-- AUTO COMMIT 켜고(1) 끄기(0)
-- SET AUTOCOMMIT = 0;

-- AUTO COMMIT 설정 확인
-- select @@autocommit;

-- 사용법
-- START TRANSACTION;
-- INSERT | UPDATE | DELETE 명령 실행;
-- COMMIT | ROLLBACK;

-- START TRANSACTION;
-- SAVEPOINT savepoint이름1;
-- INSERT | UPDATE | DELETE 명령 실행;
-- SAVEPOINT savepoint이름2;
-- INSERT | UPDATE | DELETE 명령 실행;
-- COMMIT | ROLLBACK TO savepoint이름1 or savepoint이름2;

-- 현재 AUTO COMMIT 상태 확인
select @@autocommit;
-- AUTO COMMIT 설정 변경
SET AUTOCOMMIT = 1;

START TRANSACTION;

SELECT seq, pd_name, pd_price, pd_comment, pd_company FROM product;

INSERT INTO product (pd_name, pd_price, pd_comment, pd_company)
VALUES ('환타', 1700, '환타 맛있다.', '한국 코카콜라');

UPDATE product SET pd_name = '환타 제로 파인애플' WHERE seq = 28;

COMMIT;

ROLLBACK;




START TRANSACTION;

SELECT * FROM product;

SAVEPOINT sp_a;
UPDATE product SET pd_name = '닥터페퍼' WHERE seq = 15;
UPDATE product SET pd_name = '닥터페퍼 제로' WHERE seq = 16;

SAVEPOINT sp_b;
UPDATE product SET pd_name = '마운틴 듀' WHERE seq = 17;
UPDATE product SET pd_name = '트레비' WHERE seq = 18;

SAVEPOINT sp_c;
INSERT INTO product (pd_name, pd_price, pd_comment, pd_company)
VALUES ('게토레이', 2500, '운동 시엔 게토레이..', '롯데 칠성'),
('비타파워', 1000, '비타500 따라서 만듬..', '롯데 칠성');

SAVEPOINT sp_d;
DELETE FROM product WHERE seq = 15;
DELETE FROM product WHERE seq = 16;

SELECT * FROM product;

ROLLBACK TO sp_c;
ROLLBACK TO sp_a;





