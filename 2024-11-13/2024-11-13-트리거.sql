-- 트리거
-- 테이블에 데이터를 추가, 수정, 삭제할 경우 자동으로 실행되는 SQL
-- 데이터 무결성을 유지하는데 사용함

-- BEFORE, AFTER : 지정한 테이블에 데이터 추가, 수정, 삭제가 발생하기 이전 혹은 이후에 동작하는 것을 설정
-- INSERT, UPDATE, DELETE : 지정한 테이블에 추가, 수정, 삭제 중 동작할 부분을 설정
-- FOR EACH ROW : 각 행에 대해서 트리거 실행
-- NEW, OLD : NEW 새로운 데이터를 뜻하는 것, OLD 이전 데이터

-- 사용법
-- CREATE TRIGGER 트리거 이름
-- { BEFORE | AFTER  } { INSERT, UPDATE, DELETE }
-- ON 테이블이름 
-- FOR EACH ROW
-- 트리거 내용 (  실행할 SQL문  ) 


