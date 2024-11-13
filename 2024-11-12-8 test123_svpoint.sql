select * from test123;
set autocommit = 0;
select @@autocommit;
start transaction;

insert into test123 values (1);
savepoint sv_0;
insert into test123 values (2);
savepoint sv_1;
insert into test123 values (3);
savepoint sv_2;
insert into test123 values (4);
savepoint sv_3;

rollback to sv_3;
select * from test123;
rollback to sv_2;
select * from test123;
rollback to sv_1;
select * from test123;
rollback to sv_0;
select * from test123;
-- err : rollback to sv_3; 
commit;
set autocommit = 1;
select @@autocommit;




