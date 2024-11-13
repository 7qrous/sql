-- 참조키 사용하기
-- 다른 테이블의 내용을 가져와서 현재 테이블에서 사용하는 것
-- 여러 테이블 간의 관계를 설정하기 위해서 사용함

SELECT* FROM products;
INSERT INTO cate(cate_code, cate_name)
VALUES 
('abcd','탄산음료'),
('efgh','주스'),
('ijkl','스포츠'),
('mnop','이온음료');

INSERT INTO products (prod_name, prod_cate, prod_price, prod_company, prod_comment)
VALUES ('코카콜라','123',2000,'한국 코카콜라','콜라는 역시 코카콜라');

SELECT* FROM cate;
SELECT* FROM products;



-- 참조키 메인테이블의 특정 컬럼의 값을 참고해서 서브테이블에서 사용
-- 메인 테이블에서 참조하는 컬럼에 저장된 값만 서브테이블에서 사용할 수 있음
-- 게시판 ( 게시글, 댓글 )


INSERT INTO products (prod_name, prod_cate, prod_price, prod_company, prod_comment)
VALUES ('코카콜라','abcd',2000,'한국 코카콜라','콜라는 역시 코카콜라');
INSERT INTO products (prod_name, prod_cate, prod_price, prod_company, prod_comment)
VALUES ('코카콜라 제로','abcd',2000,'한국 코카콜라','제로 콜라도 역시 코카콜라');
SELECT* FROM products;
INSERT INTO products (prod_name, prod_cate, prod_price, prod_company, prod_comment)
VALUES ('미닛메이드','efgh',1700,'한국 코카콜라','주스는 다른게 더 맛난다');
SELECT* FROM products;
INSERT INTO products (prod_name, prod_cate, prod_price, prod_company, prod_comment)
VALUES ('미닛메이드','efgh',1700,'한국 코카콜라','주스는 다른게 더 맛난다');
INSERT INTO products (prod_name, prod_cate, prod_price, prod_company, prod_comment)
VALUES ('토레타','mnop',2500,'한국 코카콜라','포카리 미만...잡');
INSERT INTO products (prod_name, prod_cate, prod_price, prod_company, prod_comment)
VALUES ('토레타제로','mnop',2500,'한국 코카콜라','포카리 미만...잡');
SELECT* FROM products;

select * from products;
select * from cate;

select a.prod_no, b.cate_name, a.prod_name, a.prod_price from products as a join cate as b on a.prod_cate=b.cate_code;

-- 메인이 되는 테이블의 특정 컬럼을 서브가 되는 테이블에서 참조하여 사용함
-- 메인에서 참조하는 컬럼에 저장된 값만 서브 테이블에서 참조하여 사용할 수 있음
-- 단점: 메인테이블에서 데이터를 삭제 시 서브 테이블에서 해당 데이터를 참조하여 사용하고 있을 경우 서브 테이블의 데이터를 먼저 삭제해야 함.


select * from products;
select * from cate;


-- 메인이 되는 cate테이블에 데이터를 새로 추가함
INSERT INTO cate(cate_code, cate_name)
VALUES 
('qrst','티&커피'),
('uvwx','워터');

select * from products;
select * from cate;

delete from cate
where cate_code = 'uvwx';

select * from cate;


-- Cannot delete or update a parent row: a foreign key constraint fails (`testfull503db`.`products`, CONSTRAINT `fk_catecode` FOREIGN KEY (`prod_cate`) REFERENCES `cate` (`cate_code`))	0.000 sec
-- cate 테이블의 cate_code 컬럼을 products 테이블에서 참조하여 사용하고 있음
-- 삭제하려는 코드가 products 테이블에서 참조되어 사용되고 있는 데이터이기 때문에 삭제 안됨
-- products 테이블에서 참조하고 있는 데이터를 먼저 모두 삭제하고 cate테이블의 내용을 삭제
delete from cate where cate_code = 'mnop';

select * from products;

delete from products 
where prod_cate ='mnop';

select * from products;
delete from cate where cate_code = 'mnop';

select * from products;









