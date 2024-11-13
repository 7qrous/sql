use mysql;
select host, user, authentication_string from user;
create user 'outeruser'@'%' identified by 'full503';
show grants for 'outeruser'@'%';
grant all privileges on employees.salaryinfo to 'outeruser'@'%';