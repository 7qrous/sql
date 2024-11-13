create database dbtest1;
set @@session.session_track_gtids = 'off';
GRANT SUPER ON *.* TO 'test1'@'%';
FLUSH PRIVILEGES;
SET GLOBAL log_bin_trust_function_creators = 1;