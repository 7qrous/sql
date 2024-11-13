
-- 인덱스 사용하기
-- 데이터베이스 테이블의 내용을 조회할 때 미리 인덱싱 작업을 통해서 조회 속도를 높이는 방법
-- 너무 많이 사용 시 시스템의 전체 부하가 많이 걸림
-- SELECT 시 자주 사용하는 컬럼에 인덱스 를 적용하면 됨
-- 데이터베이스에 데이터가 많을수록 검색 속도의 차이가 남

-- 인덱싱되어 있는 컬럼으로 조회 시 검색속도가 빠름
SELECT * FROM salaries WHERE from_date = '1998-06-12';
-- 인덱싱되어 있지 않은 컬럼으로 조회 시 검색속도가 느림
SELECT * FROM salaries WHERE to_date = '1999-06-12';


-- 참조키 사용하기
-- 다른 테이블의 내용을 가져와서 현재 테이블에서 사용하는 것
-- 여러 테이블간의 관계를 설정하기 위해서 사용함
-- 메인이 되는 테이블의 특정 컬럼을 서브가 되는 테이블에서 참조하여 사용함
-- 메인에서 참조하는 컬럼에 저장된 값만 서브 테이블에서 참조하여 사용할 수 있음
-- 메인 테이블에서 데이터를 삭제 시 서브 테이블에서 해당 데이터를 참조하여 사용하고 있을 경우 서브 테이블의 데이터를 먼저 삭제해야 함

-- 메인 테이블이 될 cate 테이블에 데이터 추가
INSERT INTO cate (cate_code, cate_name)
VALUES ('abcd', '탄산음료'),
('efgh', '주스'),
('ijkl', '스포츠'),
('mnop', '이온음료');


-- 데이터를 참조해서 사용할 서브 테이블인 products 테이블에 데이터 추가

-- prod_cate의 값이 데이터를 참조하는 cate 테이블의 cate_code에 저장된 값과 다르기 때문에 insert 사용 시 오류가 발생함
INSERT INTO products (prod_name, prod_cate, prod_price, prod_company, prod_comment)
VALUES ('코카콜라', '1234', 2000, '한국 코카콜라', '콜라는 역시 코카콜라');


-- prod_cate의 값이 데이터를 참조하는 cate 테이블의 cate_code에 저장된 값을 사용하기 때문에 정상적으로 데이터가 추가됨
INSERT INTO products (prod_name, prod_cate, prod_price, prod_company, prod_comment)
VALUES ('코카콜라', 'abcd', 2000, '한국 코카콜라', '콜라는 역시 코카콜라');

INSERT INTO products (prod_name, prod_cate, prod_price, prod_company, prod_comment)
VALUES ('코카콜라 제로', 'abcd', 2000, '한국 코카콜라', '제로 콜라도 코카콜라');

INSERT INTO products (prod_name, prod_cate, prod_price, prod_company, prod_comment)
VALUES ('미닛메이드', 'efgh', 1700, '한국 코카콜라', '주스는 다른게 더 맛난다');

INSERT INTO products (prod_name, prod_cate, prod_price, prod_company, prod_comment)
VALUES ('파워에이드', 'ijkl', 2500, '한국 코카콜라', '우리나라에서는 게토레이가 더 유명함');

INSERT INTO products (prod_name, prod_cate, prod_price, prod_company, prod_comment)
VALUES ('토레타 제로', 'mnop', 2000, '한국 코카콜라', '포카리 미만 잡..');


-- 메인이 되는 cate 테이블에 데이터를 새로 추가함
INSERT INTO cate (cate_code, cate_name)
VALUES ('qrst', '티&커피'),
('uvwx', '워터');

-- cate 테이블의 cate_code 컬럼을 products 테이블에서 참조하여 사용하고 있음
-- product 테이블에서 참조하고 있으나 실제로 'uvwx' 라는 데이터는 사용하지 않음
-- 정상 삭제 됨
DELETE FROM cate WHERE cate_code = 'uvwx';

-- cate 테이블의 cate_code 컬럼을 products 테이블에서 참조하여 사용하고 있음
-- 삭제하려는 코드가 products 테이블에서 참조되어 사용되고 있는 데이터이기 때문에 삭제안됨
DELETE FROM cate WHERE cate_code = 'mnop';

-- products 테이블에서 참조하고 있는 데이터를 먼저 모두 삭제하고 cate 테이블의 내용을 삭제
DELETE FROM products WHERE prod_cate = 'mnop';
DELETE FROM cate WHERE cate_code = 'mnop';


-- 트리거
-- 테이블에 데이터를 추가, 수정, 삭제할 경우 자동으로 실행되는 SQL문
-- 데이터 무결성을 유지하는데 사용함

-- 사용법
-- CREATE TRIGGER 트리거이름 
-- {BEFORE | AFTER} {INSERT, UPDATE, DELETE}
-- ON 테이블이름
-- FOR EACH ROW
-- 트리거 내용(실행할 SQL문);

-- BEFORE, AFTER : 지정한 테이블에 데이터가 추가, 수정, 삭제가 발생하기 이전 혹은 이후에 동작하는 것을 설정
-- INSERT, UPDATE, DELETE : 지정한 테이블에 추가, 수정, 삭제 중 동작할 부분을 설정
-- FOR EACH ROW : 각 행에 대해서 트리거 실행
-- NEW, OLD : NEW 새로운 데이터, OLD 이전 데이터


-- 변수 사용하기

-- 사용법
-- 변수 선언
-- DECLARE 변수명 데이터타입;
-- 변수에 데이터 입력
-- SET 변수명 = 데이터;

-- CONCAT() : mysql 에서 제공하는 문자열 합하기 함수
-- 여러개의 문자열을 합하여 하나의 문자열로 만들어 줌


-- sql문으로 데이터베이스 생성
-- 사용법
-- CREATE DATABASE 데이터베이스명;

sql문으로 데이터베이스 삭제
-- DROP DATABASE 데이터베이스명;

-- sql문으로 테이블 생성
-- 사용법
-- CREATE TABLE 테이블명
-- (컬럼명1   데이터타입   제약조건(Not null 등)   주석,
-- 컬럼명2   데이터타입   제약조건   주석,
-- ...
-- 제약조건 (기본키, 참조키 설정)
-- );

-- 기본 테이블 만들기
CREATE TABLE testtable (
	num int,
    id varchar(45),
    pw varchar(45),
    name varchar(45)
);

-- 제약조건 추가하여 테이블 생성
-- 사용할 수 있는 제약 조건
-- NOT NULL : 해당 컬럼에 NULL 을 입력할 수 없음
-- UNIQUE : 해당 컬럼에 동일한 데이터를 입력할 수 없음
-- PRIMARY KEY : 기본키로 설정
-- FOREIGN KEY : 참조키로 설정
-- AUTO_INCREMENT : 데이터 타입이 INT 인 경우 값 자동 증가, 테이블에서 1개만 사용 가능
CREATE TABLE testtable1 (
	num int not null,
    user_id varchar(45) not null,
    user_pw varchar(45) not null,
    user_name varchar(45) not null,
    user_email varchar(45),
    create_at datetime
);

-- 기존 테이블의 복사하여 새 테이블 만들기
-- 기존 테이블이 가지고 있는 데이터도 함께 복사됨
CREATE TABLE testtable2 AS
	SELECT num, user_id, user_pw, user_name, user_email, create_at
    FROM testtable1;

CREATE TABLE testtable3 AS
	SELECT prod_no, prod_cate, prod_name, prod_price, prod_comment, prod_company FROM products WHERE prod_price = 3000;
    
-- 조인을 사용하여 여러개의 테이블에서 필요한 내용만 가져와서 테이블 생성
CREATE TABLE testtable4 AS
	SELECT prod.prod_no, cate.cate_name, prod.prod_name, prod.prod_price
    FROM products AS prod
    JOIN cate
    ON prod.prod_cate = cate.cate_code;

-- PRIMARY KEY 추가하여 테이블 생성
-- primary key 설정은 컬럼 설정이 끝나고 나서 마지막에 입력
CREATE TABLE testtable5 (
	num int not null auto_increment,
    user_id varchar(45) not null,
    user_pw varchar(45) not null,
    user_name varchar(45) not null,
    user_email varchar(45),
    create_at datetime,
    PRIMARY KEY (num)
);
DROP TABLE testtable5;

-- FOREIGN KEY 를 사용하는 테이블 만들기
CREATE TABLE testtable6 (
	num int not null auto_increment,
    user_id varchar(45) not null,
    user_pw varchar(45) not null,
    user_name varchar(45) not null,
    user_email varchar(45),
    create_at datetime,
    user_type varchar(5),
    PRIMARY KEY (num),
    FOREIGN KEY (user_type) REFERENCES usercate(user_type)
);


-- sql문으로 테이블 삭제
-- 사용법
-- DROP TABLE 테이블명;
DROP TABLE testtable1;

-- sql문으로 테이블 내용 삭제
-- 사용법
-- TRUNCATE TABLE 테이블명;
TRUNCATE TABLE products_log;

-- sql문으로 테이블 수정
-- 사용법
-- ALTER TABLE 테이블명 ADD | DROP | MODIFY COLUMN 컬럼명 데이터타입;
-- ADD : 컬럼 추가 시 사용, 컬럼의 데이터 타입 필수
-- DROP : 컬럼 삭제 시 사용
-- MODIFY : 컬럼 수정 시 사용, 컬럼의 데이터 타입 필수

ALTER TABLE testtable1 ADD COLUMN user_addr varchar(300);
ALTER TABLE testtable1 ADD COLUMN update_at datetime not null;

ALTER TABLE testtable1 DROP COLUMN update_at;

ALTER TABLE testtable1 MODIFY COLUMN user_addr varchar(500) not null;

-- ALTER 명령을 사용하여 기본키(PK) 설정
ALTER TABLE testtable1 ADD PRIMARY KEY (num);
ALTER TABLE testtable1 MODIFY COLUMN num int auto_increment;

-- ALTER 명령을 사용하여 기본키 설정 해제
-- 먼저 auto increment 제거
ALTER TABLE testtable1 MODIFY COLUMN num int;
ALTER TABLE testtable1 DROP PRIMARY KEY;


-- ALTER 명령을 사용하여 참조키(FK) 설정
-- 기존 테이블에 참조키를 추가하려면 참조키로 사용할 컬럼을 먼저 추가해야 함
ALTER TABLE testtable1 ADD COLUMN user_type varchar(5);
ALTER TABLE testtable1
ADD FOREIGN KEY (user_type) REFERENCES usercate(user_type);

-- ALTER 명령을 사용하여 참조키 설정 제거
-- 참조키 설정을 먼저 삭제하고, 참조키로 사용한 컬럼 삭제
ALTER TABLE testtable1 DROP FOREIGN KEY testtable1_ibfk_1;
ALTER TABLE testtable1 DROP COLUMN user_type;

-- CONSTRAINT
-- 기본키 혹은 참조키와 같은 제약 조건을 설정할 때 해당 제약 조건의 이름을 지정하는 명령
-- CREATE TABLE, ALTER TABLE 에서 사용 가능
CREATE TABLE testtable7 (
	num int not null,
    user_id varchar(45) not null,
    user_pw varchar(45) not null,
    user_name varchar(45) not null,
    user_email varchar(45),
    create_at datetime,
    user_type varchar(5),
    CONSTRAINT pk_num PRIMARY KEY (num),
    CONSTRAINT fk_usertype FOREIGN KEY (user_type) REFERENCES usercate(user_type)
);

DROP TABLE testtable7;

ALTER TABLE testtable7 DROP FOREIGN KEY fk_usertype;
ALTER TABLE testtable7 DROP PRIMARY KEY;












