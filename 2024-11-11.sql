SELECT * FROM employees.employees;

select count(*) from employees;

-- SELECT 문 사용하기
-- 데이터베이스에 저장된 내용 중 사용자가 원하는 데이터를 검색하여 가져오는 명령

-- 사용법
-- SELECT 컬럼1, 컬럼2, 컬럼3, ... FROM 테이블명 WHERE 검색조건1 AND 검색조건2 ...;


-- 지정한 테이블의 모든 컬럼에 대한 모든 내용을 출력
SELECT * FROM employees;

-- 지정한 테이블의 지정한 컬럼에 대한 모든 내용을 출력
SELECT emp_no, birth_date, first_name, last_name, gender, hire_date FROM employees;

-- 지정한 테이블의 원하는 컬럼만 원하는 순서대로 출력 가능
SELECT emp_no, last_name, first_name, gender, birth_date, hire_date FROM employees;

SELECT emp_no, first_name, last_name, gender FROM employees;


-- WHERE 문 사용하기
-- SELECT, UPDATE, DELETE 문에 추가하여 정확한 데이터를 검색하기 위한 명령

-- 사용법
-- SELECT (UPDATE, DELETE) FROM 테이블명 WHERE 검색할 컬럼1 = 검색할 데이터1 AND (OR, IN) 검색할 컬럼2 = 검색할 데이터2 ...;

-- WHERE 을 사용하여 원하는 데이터만 검색
SELECT * FROM employees WHERE emp_no = 10101;
SELECT * FROM employees WHERE first_name = 'mario';
SELECT * FROM employees WHERE gender = 'M';
SELECT * FROM employees WHERE birth_date = '1960-10-04';

-- WHERE 을 사용하여 원하는 데이터를 원하는 컬럼만 출력
SELECT emp_no, first_name, last_name, gender FROM employees
WHERE emp_no = 20202;
SELECT emp_no, first_name, last_name, gender FROM employees
WHERE first_name = 'luigi';
SELECT emp_no, first_name, last_name, gender FROM employees
WHERE hire_date = '1997-07-02';


-- SQL문의 연산자
-- SQL문을 사용 시 연산자를 사용하여 데이터를 제어할 수 있음
-- +, -, *, /, %(나머지) 의 사칙연산자 사용 가능
-- =(같다), >, <, <=, >=, <>(같지않다) 비교연산자 사용 가능
-- ALL, AND, ANY, BETWEEN, EXISTS, IN, LIKE, NOT, OR, SOME 논리연산자 사용가능

-- =, <> 사용
SELECT emp_no, first_name, last_name, gender FROM employees
WHERE gender = 'M';
SELECT emp_no, first_name, last_name, gender FROM employees
WHERE gender <> 'M';

-- 사칙연산자 사용
SELECT * FROM employees WHERE emp_no = 20000;
SELECT * FROM employees WHERE emp_no = 20000 + 10;
SELECT * FROM employees WHERE emp_no = 20000 - 10;
SELECT * FROM employees WHERE emp_no = 3000 * 10;
SELECT * FROM employees WHERE emp_no = 400000 / 10;
SELECT * FROM employees WHERE emp_no = (10000 % 3) + 30000;

-- 비교연산자 사용
-- 데이터의 크기 비교를 진행하기 때문에 주로 숫자 데이터에 사용함
-- 날짜 데이터에도 사용 가능 (문자 데이터에서도 사용 가능)
SELECT * FROM employees WHERE emp_no = 30000;
SELECT * FROM employees WHERE emp_no < 10100;
SELECT * FROM employees WHERE emp_no <= 10100;
SELECT * FROM employees WHERE emp_no > 499900;
SELECT * FROM employees WHERE emp_no >= 499900;

SELECT * FROM employees WHERE hire_date = '1997-07-02';
SELECT * FROM employees WHERE hire_date < '1990-01-01';
SELECT * FROM employees WHERE hire_date > '1990-01-01';


-- AND, OR, NOT
-- WHERE 문에서 사용하는 명령어
-- 검색 조건을 추가할 경우 사용함

-- AND : 검색 조건 추가, AND를 사용하면 사용할수록 데이터의 정확도가 높아짐, 결과가 적어짐
-- 사용법
-- WHERE 검색조건1 AND 검색조건2 AND 검색조건3 ... ;
SELECT * FROM employees WHERE first_name = 'mario';
SELECT * FROM employees WHERE first_name = 'mario' AND gender = 'M';
SELECT * FROM employees WHERE first_name = 'mario' AND gender = 'M'
AND birth_date < '1955-01-01';
SELECT * FROM employees WHERE first_name = 'mario' AND gender = 'M'
AND birth_date < '1955-01-01' AND emp_no >= 400000;

-- OR : 검색 조건 추가, OR를 사용하면 사용할수록 데이터의 정확도가 낮아짐, 결과가 많아짐
-- 사용법
-- WHERE 검색조건1 OR 검색조건2 OR 검색조건3 ... ;
SELECT * FROM employees.employees;
SELECT * FROM employees WHERE first_name = 'mario';
SELECT * FROM employees WHERE first_name = 'mario' OR last_name = 'caine';
SELECT * FROM employees WHERE first_name = 'mario' OR first_name = 'parto'
OR last_name = 'caine';

-- NOT : 지정한 검색 조건의 부정, 지정한 검색 조건의 반대 결과가 나옴
-- 사용법
-- WHERE NOT 검색조건;
SELECT * FROM employees WHERE gender = 'M';
SELECT * FROM employees WHERE NOT gender = 'M';
SELECT * FROM employees WHERE gender <> 'M'; 


-- ORDER BY
-- SELECT의 실행 결과를 정렬하여 출력
-- 오름차순(ASC), 내림차순(DESC)으로 정렬 가능
-- 문자, 숫자, 날짜 다 가능함
-- 정렬 기준으로 여러개 사용 가능(정렬 기준이 3개 이상일 경우 원하는대로 정렬되지 않을 수 있음)
-- 사용법
-- SELECT 컬럼1, 컬럼2, ... FROM 테이블명 ORDER BY 정렬할컬럼1 정렬방식1, 정렬할컬럼2 정렬방식2, ... ;
-- SELECT 컬럼1, 컬럼2, ... FROM 테이블명 WHERE 검색조건 ORDER BY 정렬할컬럼1 정렬방식1, 정렬할컬럼2 정렬방식2, ... ;

SELECT * FROM employees;
-- 문자를 기준으로 오름차순 정렬
SELECT * FROM employees ORDER By first_name ASC;
-- 날짜를 기준으로 오름차순 정렬
SELECT * FROM employees ORDER BY birth_date ASC;
-- 숫자를 기준으로 내림차순 정렬
SELECT * FROM employees ORDER BY emp_no DESC;
-- 정렬 기준이 여러개일 경우
SELECT * FROM employees ORDER BY first_name ASC, emp_no DESC;
SELECT * FROM employees ORDER BY first_name ASC, emp_no DESC, birth_date DESC;


-- LIMIT
-- SELECT 문 사용 후 조회 결과를 원하는 수만큼 제한
-- WHERE 절 사용 후 LIMIT 사용 가능
-- ORDER BY 를 사용하여 정렬 가능
-- 출력된 결과 번호는 0부터 카운트 됨

-- 사용법
-- SELECT 컬럼1, 컬럼2, ... FROM 테이블명 WHERE 검색조건 LIMIT 제한수;
-- SELECT 컬럼1, 컬럼2, ... FROM 테이블명 WHERE 검색조건 LIMIT 시작번호, 제한수;

-- 제한 없음
SELECT * FROM employees;
-- 조회 결과를 시작부터 10개로 제한
SELECT * FROM employees LIMIT 10;
-- 조회 결과를 emp_no를 기준으로 내림차순 정렬 후 10개로 제한 출력
SELECT * FROM employees ORDER BY emp_no DESC LIMIT 10;
-- 이름이 mario 인 사람을 검색 후 emp_no를 기준으로 내림차순 정렬 후 20개로 제한 출력
SELECT * FROM employees WHERE first_name = 'mario' ORDER BY emp_no ASC LIMIT 20;


-- 조회 결과를 10번부터 20개로 제한하여 출력
SELECT * FROM employees LIMIT 10, 20;
-- 이름이 'luigi'인 사람을 검색 후 50번 부터 10개만 제한하여 출력
SELECT * FROM employees WHERE first_name = 'luigi' LIMIT 50, 10;


-- MIN, MAX, AVG, SUM, COUNT
-- SELECT 절에 사용하는 명령어

-- MIN : 지정한 컬럼의 최소값을 출력 (이미 저장되어 있는 데이터의 최소값)
-- 사용법
-- SELECT MIN(컬럼) FROM 테이블명 WHERE 검색조건;
SELECT MIN(emp_no) FROM employees;
SELECT MIN(emp_no) FROM employees WHERE first_name = 'mario';
SELECT MIN(birth_date) FROM employees WHERE first_name = 'mario';
SELECT MIN(last_name) FROM employees WHERE first_name = 'mario';

-- MAX : 지정한 컬럼의 최대값을 출력 (이미 저장되어 있는 데이터의 최대값)
-- 사용법
-- SELECT MAX(컬럼) FROM 테이블명 WHERE 검색조건;
SELECT MAX(emp_no) FROM employees;
SELECT MAX(emp_no) FROM employees WHERE first_name = 'mario';
SELECT MAX(birth_date) FROM employees WHERE first_name = 'mario';
SELECT MAX(last_name) FROM employees WHERE first_name = 'mario';

-- AVG : 지정한 컬럼의 평균값을 출력 (숫자 데이터만 사용)
-- 사용법
-- SELECT AVG(컬럼명) FROM 테이블명 WHERE 검색조건;
SELECT * FROM salaries WHERE emp_no = 10013;
SELECT AVG(salary) FROM salaries WHERE emp_no = 10013;

-- SUM : 지정한 컬럼의 총합을 출력 (숫자 데이터만 사용)
-- 사용법
-- SELECT SUM(컬럼명) FROM 테이블명 WHERE 검색조건;
SELECT SUM(salary) FROM salaries WHERE emp_no = 10013;

-- COUNT : WHERE 절의 검색 조건과 동일한 데이터를 가지고 있는 컬럼의 개수를 출력
-- 사용법
-- SELECT COUNT(컬럼명) FROM 테이블명 WHERE 검색조건;
-- 모든 데이터가 총 몇개인지 검색
SELECT COUNT(*) FROM employees;
-- 성별이 여성인 사원이 총 몇명인지 카운트
SELECT COUNT(gender) FROM employees WHERE gender = 'F';
-- 성별이 남성인 사원이 총 몇명인지 카운트
SELECT COUNT(gender) FROM employees WHERE gender = 'M';


-- NULL
-- 데이터가 없다는 의미의 단어
-- NULL 데이터는 검색 시 =, <> 를 사용할 수 없음

-- IS NULL : 지정한 컬럼의 데이터가 NULL 인 데이터를 검색 시 사용
-- IS NOT NULL : 지정한 컬럼의 데이터가 NULL 이 아닌 데이터를 검색 시 사용
-- 사용법
-- SELECT 컬럼1, 컬럼2, ... FROM 테이블명 WHERE 컬럼명 IS NULL
-- SELECT 컬럼1, 컬럼2, ... FROM 테이블명 WHERE 컬럼명 IS NOT NULL
SELECT * FROM product;

-- NULL 은 일반 연산자로 검색이 불가능함
SELECT * FROM product WHERE pd_comment = NULL;
SELECT * FROM product WHERE pd_comment <> NULL;
-- NULL 은 반드시 IS NULL, IS NOT NULL 로 검색해야 함
SELECT * FROM product WHERE pd_comment IS NULL;
SELECT * FROM product WHERE pd_comment IS NOT NULL;

INSERT INTO product (pd_name, pd_price, pd_comment, pd_company)
VALUES ('아이시스8.0', 1000, NULL, '롯데 칠성');


-- 와일드카드문자 %, _
-- MySQL에서 사용하는 특정 문자열을 대체하는 문자

-- % : 문자열의 수가 0 이거나 여러개인 임의의 문자
-- _ : 문자열의 수가 1개인 임의의 문자

-- LIKE
-- WHERE 절에서 지정한 컬럼의 데이터를 검색 시 검색어의 일부만 입력하여 검색하는 명령
-- 와일드카드 문자와 함께 사용
-- 와일드카드 문자는 문자열의 처음, 마지막, 중간 아무곳에나 사용할 수 있음

-- 사용법
-- SELECT 컬럼1, 컬럼2, ... FROM 테이블명 WHERE 검색컬럼 LIKE '%검색어_일부%';

-- 이름이 mario 인 사원을 검색
SELECT * FROM employees WHERE first_name = 'mario';

-- 이름이 'ma'로 시작하는 사원을 모두 검색
SELECT * FROM employees WHERE first_name LIKE 'ma%';
-- 이름이 'ma'로 끝나는 사원을 모두 검색
SELECT * FROM employees WHERE first_name LIKE '%ma';
-- 이름의 중간에 'ma' 가 들어가는 사원을 모두 검색
SELECT * FROM employees WHERE first_name LIKE '%ma%';
-- 이름이 'ma'로 시작하고 'rio'로 끝나는 사원을 모두 검색
SELECT * FROM employees WHERE first_name LIKE 'm%o';


-- 이름이 'ma' 로 시작하고 글자수가 5개인 사원을 모두 검색
SELECT * FROM employees WHERE first_name LIKE 'ma___';
-- 이름이 'ma' 로 끝나고 글자수가 5개인 사원을 모두 검색
SELECT * FROM employees WHERE first_name LIKE '___ma';
-- 이름의 첫글자가 'm'이고 마지막 글자가 'a'이며 총 글자수가 5개인 사원을 모두 검색
SELECT * FROM employees WHERE first_name LIKE 'm___a';
SELECT * FROM employees WHERE first_name LIKE 'm_r_a';

-- %, _ 함께 사용 가능
-- 이름 중간에 'ma' 가 포함되고, 마지막 단어 3글자이면서 'o'로 끝나는 이름을 가진 사원 모두 검색
SELECT * FROM employees WHERE first_name LIKE '%ma%__o';


-- IN
-- OR 명령어와 비슷한 기능을 하는 명령어
-- OR 명령처럼 조건을 추가하여 검색 결과의 범위를 넓힐 수 있음
-- OR는 조건식의 컬럼을 다른 컬럼으로 사용할 수 있으나 IN은 동일한 컬럼의 다른 값을 추가하는 방식
-- NOT 명령을 추가하여 지정한 값이 아닌 값을 출력할 수 있음
-- 서브 쿼리를 사용 시 사용하는 명령어
-- 사용법
-- SELECT 컬럼1, 컬럼2, ... FROM 테이블명 WHERE 검색조건 IN (값1, 값2, ...);

-- OR를 사용하여 여러가지 값을 검색
SELECT * FROM employees WHERE first_name = 'mario'
OR first_name = 'parto'
OR first_name = 'marko';

-- IN 사용하여 여러가지 값을 가져오기
SELECT * FROM employees WHERE first_name IN ('mario', 'parto', 'marko');

-- OR는 조건식 자체를 다른 조건식으로 변경할 수 있음
SELECT * FROM employees WHERE first_name = 'mario'
OR first_name = 'parto'
OR last_name = 'bamford';

-- IN은 동일한 조건식에서 다른 값만 추가할 수 있음, 조건식을 바꾸려면 OR를 사용
SELECT * FROM employees WHERE first_name IN ('mario', 'parto')
OR last_name IN ('bamford');

-- IN 사용하여 여러가지 값을 가져오기
SELECT * FROM employees WHERE first_name IN ('mario', 'parto', 'marko');
-- NOT 을 추가하여 지정한 값이 아닌 값 가져오기
SELECT * FROM employees WHERE first_name NOT IN ('mario', 'parto', 'marko');

-- IN을 사용하여 서브 쿼리 사용하기
SELECT * FROM employees
WHERE first_name IN
		(SELECT first_name FROM employees
        WHERE first_name LIKE 'm___o' AND gender = 'M');


-- BETWEEN
-- SELECT 사용 시 검색 조건의 범위를 설정해서 데이터를 가져오는 명령어
-- 비교연산자와 AND 명령을 사용하는 방식와 동일함
-- 숫자, 문자, 날짜 데이터 모두에서 사용 가능

-- 사용법
-- SELECT 컬럼1, 컬럼2, ... FROM 테이블명 WHERE 검색조건 BETWEEN 값1 AND 값2;

-- BETWEEN을 사용한 범위 설정
SELECT * FROM employees WHERE emp_no BETWEEN 10501 AND 11000;

-- 비교연산자와 AND 를 사용한 범위 설정
SELECT * FROM employees WHERE emp_no >= 10501 AND emp_no <= 11000;

-- BETWEEN 으로 날짜 데이터 범위 설정
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1990-12-31';
SELECT * FROM employees WHERE hire_date >= '1990-01-01' AND hire_date <= '1990-12-31';

-- BETWEEN 으로 문자 데이터 범위 설정
SELECT * FROM employees WHERE last_name BETWEEN 'vieri' AND 'zyda' ORDER BY last_name ASC;








 


