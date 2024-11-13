-- SQL 문 사용하기
-- SQL은 데이터베이스를 제어하기 위한 데이터베이스 전용 언어
-- ANSI-SQL 을 사용 시 모든 데이터베이스 (Oracle, MSSQL, MySql 등)를 제어할 수 있음
-- 각각 DBMS 들은 전용 SQL이 따로 존재(편의성 및 검색 속도 등의 장점이 있음) 함
-- DML에는 4가지 명령어가 존재함
-- insert, update, delete, select


-- INSERT 문 사용하기
-- 지정한 데이터베이스의 테이블에 데이터를 입력 시 사용
-- 데이터를 입력할 테이블명 뒤에 입력할 데이터의 컬럼명을 입력하여 사용
-- VALUE, VALUES 뒤에 컬럼명의 순서에 맞는 데이터를 입력

-- 사용법1
-- VALUE는 컬럼에 맞는 데이터를 1개 입력 시 사용
-- INSERT INTO 테이블명 (컬럼1, 컬럼2, 컬럼3, ...)
-- VALUE (값1, 값2, 값3, ...);
INSERT INTO product (seq, pd_name, pd_price, pd_comment, pd_company)
VALUE (1, '사이다', 2000, '시원하고 맛있는 사이다', '롯데칠성');

INSERT INTO product (pd_name, pd_comment, pd_company, pd_price, seq)
VALUE ('제로 사이다', '설탕이 없어서 다이어트에 최고!!', '롯데칠성', 2000, 2);

INSERT INTO product (seq, pd_name, pd_price, pd_comment, pd_company)
VALUE (3, '롯데칠성', 2000, '제로 콜라', '설탕이 없어도 맛은 그대로!!');

-- 사용법2
-- VALUES 컬럼에 맞는 데이터를 여러개 입력 시 사용
-- INSERT INTO 테이블명 (컬럼1, 컬럼2, 컬럼3, ...)
-- VALUES (값1-1, 값2-1, 값3-1, ...),
-- (값1-2, 값2-2, 값3-2, ...),
-- ... ;
INSERT INTO product (seq, pd_name, pd_price, pd_comment, pd_company)
VALUES (6, '스프라이트', 2000, '사이다는 칠성사이다인데..', '한국 코카콜라'),
(7, '스프라이트 제로', 2000, '제로 사이다도 칠성 사이다가 갑인데.', '한국 코카콜라'),
(8, 'KIN 사이다', 2000, 'KIN 사이다는 어디꺼더라??', '몰라요');

-- 사용법3
-- 테이블명 뒤에 컬럼명을 생략할 경우 모든 컬럼에 대해서 데이터를 입력해야 함
-- 컬럼명을 생략할 경우 테이블을 생성 시 입력했던 컬럼의 순서대로 데이터를 입력해야 함
-- INSERT INTO 테이블명 VALUES (값1, 값2, 값3, ...), ... ;
INSERT INTO product
VALUE (9, '트로피카나', 1700, '과즙 탄산음료', '한국 코카콜라');

-- 컬럼이 생략되어 데이터 입력 순서를 알 수 없기 때문에 테이블을 생성 시 입력했던 순서대로 데이터를 입력해야 함
-- INSERT INTO product
-- VALUE ('닥터페퍼', 10, 1700, '체리 콜라', '한국 코카콜라');

-- INSERT 사용 시 NULL 이 사용 가능한 컬럼은 생략 가능함
-- 기본값을 사용하는 컬럼은 데이터 생략이 가능함
-- Auto incremental 이 적용 컬럼은 데이터 생략이 가능함
INSERT INTO product (seq, pd_name, pd_price, pd_company)
VALUES (10, '밀키스', 1700, '롯데칠성');

INSERT INTO product (seq, pd_name, pd_company)
VALUES (12, '2% 부족할때 복숭아', '동아 오츠카');

INSERT INTO product (seq, pd_name)
VALUES (13, '2% 부족할때 사과');

INSERT INTO product (pd_name)
VALUES ('2% 부족할때 포도');


-- DELETE 문 사용하기
-- 데이터 테이블에 입력되어 있는 데이터 중 지정한 데이터를 삭제
-- 데이터 삭제 시 정확하게 삭제할 데이터를 구분할 수 있는 컬럼으로 조건을 설정해야 함
-- DELETE 문 사용 시 WHERE 부분을 생략하면 해당 테이블의 모든 데이터를 삭제

-- 사용법
-- DELETE FROM 테이블명 WHERE 컬럼명 = 값;

DELETE FROM product WHERE seq = 14;

DELETE FROM product WHERE pd_company = '몰라요';

DELETE FROM product WHERE pd_price = 1700;

DELETE FROM product;

-- UPDATE 문 사용하기
-- 데이터 테이블에 저장된 내용 중 지정한 내용을 수정하는 명령어
-- WHERE 을 사용하여 정확히 구분할 수 있는 조건을 입력해야 함
-- WHERE 을 생략 시 해당 테이블의 모든 데이터를 수정함

-- 사용법
-- UPDATE 테이블명 SET 컬럼1 = 수정값1, 컬럼2 = 수정값2, 컬럼3 = 수정값3, ...
-- WHERE 검색 조건;

INSERT INTO product (pd_name, pd_price, pd_comment, pd_company)
VALUES ('스프라이트', 1800, '사이다는 칠성사이다인데..', '한국 코카콜라'),
('스프라이트 제로', 1700, '제로 사이다도 칠성 사이다가 갑인데.', '한국 코카콜라'),
('칠성 사이다', 2000, '사이다는 역시 칠성 사이다', '롯데칠성'),
('칠성 사이다 제로', 2000, '칠성 사이다는 제로도 비싸다', '롯데칠성');

SELECT * FROM product;

UPDATE product SET pd_price = 2200, pd_comment = '요즘 물가가 많이 올라서..'
WHERE seq = 18;

UPDATE product SET pd_price = 2300, pd_comment = '트럼프 안되는데..'
WHERE pd_company = '한국 코카콜라';

-- WHERE 부분을 생략 시 해당 테이블의 모든 데이터를 수정함
UPDATE product SET pd_name = '음료수';









