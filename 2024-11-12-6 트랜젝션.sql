-- 트랜젝션
-- SQL 문 실행 시 데이터베이스에 직접적으로 데이터 수정이 진행되는 INSERT, UPDATE, DELETE 쿼리문 실행 후 실행 이전의 내용으로 복구하는 명령
-- start transaction 명령 복구 옵션을 실행하고, commit / rollback 명령어 데이터베이스에 내용을 적용하거나 기존 내용으로 복구
-- MySQL은 기본적으로 AUTO commit이 적용되어 있음
-- 트랜젝션 사용 시 auto commit 옵션을 끄고 사용해야 함
-- savepoint를 사용하여 복구 위치를 여러개 설정할 수 있음
-- ROLLBACK TO 명령을 사용하여 원하는 위치로 복구할 수 있음

-- 사용법
-- start transaction;
-- insert | update | delete 명령 실행;

-- commit | rollback;

-- start transaction;
-- savepoint savePoint이름1;
-- INSERT | UPDATE | DELETE 명령 실행;
-- savepoint savepoint이름2;
-- INSERT | UPDATE | DELETE 명령 실행;
-- COMMIT | ROLLBACK TO savepoint이름1 or savepoint이름2;


-- auto commit 켜고/끄기
-- set autocommit = 0 | 1 ;
set autocommit = 1;
-- auto commit 확인
select @@autocommit;
set autocommit = 0;
select @@autocommit;

-- 트랜젝션에서 DDL 명령은 제외 됨 ( create, drop, alter, truncate ) ;
-- 현재 auto commit; 상태 확인
start transaction;
select seq, pd_name, pd_price, pd_comment, pd_company from product;
insert into product (pd_name, pd_price, pd_comment, pd_company ) 
values ('포키2',1500 ,'빼뺴로 데이는 지났지만..','해태');
select seq, pd_name, pd_price, pd_comment, pd_company from product;
rollback;
select seq, pd_name, pd_price, pd_comment, pd_company from product;
insert into product (pd_name, pd_price, pd_comment, pd_company ) 
values ('환타2',1700 ,'환타 맛있다.','한국 코카콜라');
update product set pd_name = '환타 제로 파인애플' where seq = 21;
rollback;
select seq, pd_name, pd_price, pd_comment, pd_company from product;
commit;
start transaction;
select * from product;
savepoint sp_a;
update product set pd_name = '닥터페퍼' where seq = 14;
update product set pd_name = '닥터페퍼 제로' where seq = 15;
savepoint sp_b;
update product set pd_name = '마운틴 듀' where seq = 16;
update product set pd_name = '트레비' where seq = 17;
savepoint sp_c;
INSERT INTO product(pd_name, pd_price, pd_comment, pd_company ) VALUES ('게토레이',2500,'운동 시엔 게토레이..', '롯데 칠성');
UPDATE product set pd_name = '게토레이'   WHERE seq=26;
savepoint sp_d;
INSERT INTO product(pd_name, pd_price, pd_comment, pd_company ) VALUES ('비타파워',1000,'비타500따라서 만듬', '롯데 칠성');
INSERT INTO product(pd_name, pd_price, pd_comment, pd_company ) VALUES ('비타파워',1000,'비타500따라서 만듬', '롯데 칠성');
savepoint sp_e;
DELETE FROM product WHERE seq = 14;
DELETE FROM product WHERE seq = 15;
select * from product;
rollback to sp_c;
rollback to sp_a;
select @@autocommit;
set autocommit = 1;
select @@autocommit;

















