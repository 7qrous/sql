use mysql;
select host, user, authentication_string from user;
show grants for 'test1'@'%';


-- 트리거 사용권한 설정
grant trigger on testfull503db.* to 'test1'@'%';

-- 이진 로깅을 비활성화
set @@session_track_gtids = 'off';
select @@session_track_gtids;

grant all privileges on testfull503db.* to 'test1'@'%';
