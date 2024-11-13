-- sql문으로 데이터베이스 생성
-- create database 데이터베이스명

-- sql문으로 데이터베이스 삭제
-- drop database 데이터베이스명;

-- sql문으로 테이블 생성
-- create table 테이블명
-- (
-- 		컬럼1	데이터타입		제약조건(Not null 등)		주석,
-- 		컬럼2 	데이터타입		제약조건		주석,
--		...
-- 		제약조건(기본키, 참조키 설정)
-- );
-- 제약조건 (기본키, 참조키 설정)

create table testtable (
	num int ,
    id varchar(45),
    pw varchar(45),
    name varchar(45)
);


-- 제약조건 추가하여 테이블 생성
create table testtable1 (
	num int not null,
    user_id varchar(45) not null,
    user_pw varchar(45) not null,
    user_name varchar(45) not null,
    user_email varchar(45) not null,
    user_address varchar(45),
    create_at datetime
);

drop table testtable1;
-- 제약 조건 추가하여 테이블 생성
-- 사용할 수 있는 제약조건
-- NOT NULL : 해당 컬럼에 NULL을 입력할 수 없음
-- UNIQUE : 해당 컬럼에 동일한 데이터를 입력할 수 없음
-- PRIMARY KEY : 기본키로 설정
-- FOREIGN KEY : 참조키로 설정
-- 
-- AUTO_INCREMENT : 데이터 타입이 INT 인 경우 자동증가, 테이블에서 1개만 사용가능

create table testtable1 (
	num int not null,
    user_id varchar(45) not null,
    user_pw varchar(45) not null,
    user_name varchar(45) not null,
    user_email varchar(45) not null,
    user_address varchar(45),
    create_at datetime
);
drop table testtable1;

-- 기존 테이블을 복사하여 새 테이블 만들기
-- 기존 테이블이 가지고 있는 데이터도 함께 복사됨
select * from testtable1;
create table testtable2 as select * from testtable1;
select * from products;
create table testtable3 as select  prod_no, prod_cate, prod_name, prod_price, prod_comment, prod_company from products where prod_price=3000;
select * from testtable3;
select * from products;
select * from cate;
select * from products as prod join cate on cate.cate_code = prod.prod_cate;
drop table testtable4;
create table testtable4 as select prod.prod_no, cate.cate_name, prod.prod_name, prod.prod_price from products as prod join cate on cate.cate_code = prod.prod_cate;
select * from testtable4;


-- PRIMARY KEY 추가하여 테이블 생성





-- sql문으로 테이블 삭제
-- 사용법
-- drop table 테이블명;


drop table testtable;
-- sql문으로 테이블 내용 삭제
-- 사용법
-- truncate table 테이블명;
truncate table products_log;
select * from products_log;

-- sql문으로 테이블 수정
create table testtable5 (
	num int not null,
    user_id varchar(45) not null,
    user_pw varchar(45) not null,
    user_name varchar(45) not null,
    user_email varchar(45) not null,
    user_address varchar(45),
    create_at datetime,
    primary key (num)
);

drop table testtable5;

create table testtable5 (
	num int not null auto_increment,
    user_id varchar(45) not null,
    user_pw varchar(45) not null,
    user_name varchar(45) not null,
    user_email varchar(45) not null,
    user_address varchar(45),
    create_at datetime,
    primary key (num)
);
select * from cate;
-- foreign key를 사용하는 테이블 만들기
create table testtable6 (
	num int not null auto_increment,
    user_id varchar(45) not null,
    user_pw varchar(45) not null,
    user_name varchar(45) not null,
    user_email varchar(45) not null,
    user_address varchar(45),
    create_at datetime,
    cate_code varchar(4),
    primary key (num),
    foreign key (cate_code)  references  cate(cate_code) 
);

select * from usercate;
insert into usercate( user_type, user_name ) values ('admin','관리자');
insert into usercate( user_type, user_name ) values ('user','일반 사용자');
select * from usercate;

create table testtable6 (
	num int not null auto_increment,
    user_id varchar(45) not null,
    user_pw varchar(45) not null,
    user_name varchar(45) not null,
    user_email varchar(45) not null,
    user_address varchar(45),
    create_at datetime,
    user_type varchar(5),
    primary key (num),
    foreign key (user_type) references usercate(user_type) 
);





















