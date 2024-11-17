html5, css3, bootstrap, js(es5,6), java, jsp, spring, 
git/github, kotlin, react, sql, linux


MySQL 기본 명령어

* 로그인
기본 로그인
> mysql -u [계정명] -p
다른 서버로 로그인
> mysql -u [계정명] -h [서버주소] -p
다른 서버, 다른 포트로 로그인
> mysql -u [계정명] -h [서버주소] -P [포트번호] -p

* 데이터베이스 목록 확인
> show databases;

* 지정한 데이터베이스 사용
> use [데이터베이스명];

* 데이터 테이블 목록 확인
> show tables;

* 등록된 사용자 확인 (use mysql; 실행 후 사용)
> select host, user, authentication_string from user;

* 사용자 추가
- 비밀번호 없이 사용자만 생성
> create user ['계정명'];

- 비밀번호와 함께 사용자를 생성
- 접속 주소는 해당 사용자가 접속할 수 있는 위치를 뜻함
- 주로 'localhost' 나 '%' 를 사용함 ('%' 는 전체 접속을 의미함)
- 접속 주소를 입력하지 않을 경우 '%' 가 기본값으로 적용됨
> create user ['계정명']@['접속주소'] identified by ['비밀번호'];

* 사용자 삭제
> drop user ['계정명']@['접속주소'];

* 사용자 비밀번호 변경
> alter user ['계정명']@['접속주소'] identified with mysql_native_password by ['변경할 비밀번호'];

* mysql에서 접속 주소(host)의 localhost, %의 의미
- localhost : 네트워크 상에서 내 컴퓨터를 뜻하는 단어
- 127.0.0.1 : 네트워크 상에서 내 컴퓨터를 뜻하는 IP
- 네트워크 안에서 각각의 컴퓨터는 ip 번호로 구분함
- ip 번호는 사람이 기억하기 어렵기 때문에 DNS 를 사용하여 IP 번호를 영어단어로 구성된 주소로 1:1로 매칭하여 사용함
- % : mysql에서 보안을 위해서 mysql 서버에 접속할 수 있는 네트워크를 제한할 수 있음, % 는 모든 네트워크에서 접속 허용

* 데이터베이스 추가
- 데이터베이스 생성 시 기본값으로 생성
create database [데이터베이스명];

- 데이터베이스 생성 시 문자셋을 설정하여 생성
create database [데이터베이스명] default character set utf8mb4;

* 데이터베이스 삭제
> drop database [데이터베이스명];

* 데이터베이스 사용 권한 확인
> show grants for ['사용자명']@['접속주소'];

* 데이터베이스 사용 권한 설정
> grant all privileges on [데이터베이스명].[테이블명] to ['사용자명']@['접속주소'];

* 데이터베이스 사용 권한 제거
> revoke all privileges on [데이터베이스명].['테이블명'] from ['사용자명']@['접속주소'];










