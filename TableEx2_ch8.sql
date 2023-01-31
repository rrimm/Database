-- 테이블 수정
DROP TABLE IF EXISTS userTbl;

CREATE TABLE userTbl -- 회원 테이블
( userID  		char(8) NOT NULL PRIMARY KEY, 	-- 사용자 아이디
  name    		varchar(10) NOT NULL, 	-- 이름
  birthYear   	int NOT NULL,  	-- 출생년도
  addr	  		char(2) NOT NULL, 	-- 지역(경기,서울,경남 등으로 글자만 입력)
  mobile1		char(3), 	-- 휴대폰의국번(011, 016, 017, 018, 019, 010 등)
  mobile2   	char(8), 	-- 휴대폰의 나머지 전화번호(하이픈 제외)
  height    	smallint,  	-- 키
  mDate    		date  	-- 회원 가입일
);	

INSERT INTO userTbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', '조용필', 1950, '경기', '019', '4444444', 166, '2009-4-4');

DESC usertbl;
USE tableDB;
ALTER TABLE userTbl
	ADD homepage VARCHAR(30)  -- 열추가
		DEFAULT 'http://www.hanbit.co.kr' -- 디폴트값
		NULL; -- Null 허용함
        
ALTER TABLE userTbl
	DROP COLUMN mobile1;	-- COLUMN 키워드 생략 가능
    
ALTER TABLE userTbl
	CHANGE COLUMN name uName VARCHAR(20) NULL ;

ALTER TABLE userTbl
	DROP PRIMARY KEY; 
    
