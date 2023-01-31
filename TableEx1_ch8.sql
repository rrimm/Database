DROP DATABASE IF EXISTS ShopDB;
DROP DATABASE IF EXISTS ModelDB;
DROP DATABASE IF EXISTS sqlDB;
DROP DATABASE IF EXISTS tableDB;

CREATE DATABASE tabledb;

USE tabledb;

DROP TABLE IF EXISTS buyTbl, userTbl;

CREATE TABLE userTbl -- 회원 테이블
( userID  		char(8) NOT NULL PRIMARY KEY, 	-- 사용자 아이디
  name    		varchar(10) NOT NULL, 	-- 이름
  birthYear   	int NOT NULL,  	-- 출생년도
  addr	  		char(2) NOT NULL, 	-- 지역(경기,서울,경남 등으로 글자만 입력)
  mobile1		char(3), 	-- 휴대폰의국번(011, 016, 017, 018, 019, 010 등)
  mobile2   	char(8), 	-- 휴대폰의 나머지 전화번호(하이픈 제외)
  height    	smallint,  	-- 키
  mDate    		date  	-- 회원 가입일
);										-- 제약조건 없음

CREATE TABLE buyTbl 	-- 구매 테이블
(  num 			INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 	-- 순번(PK)
   userid  		char(8) NOT NULL,	-- 아이디(FK)
   prodName 	char(6) NOT NULL, 	-- 물품명
   groupName 	char(4) , 	-- 분류
   price     	int NOT NULL, 	-- 단가
   amount    	smallint NOT NULL, 	-- 수량
   FOREIGN KEY(userid) REFERENCES userTbl(userID)
);

SELECT *
FROM Information_schema.table_constraints	-- table_constraints에 설정한 제약조건이 저장됨
WHERE table_schema = 'tabledb';

SELECT *
FROM Information_schema.table_constraints	-- 각각에 대한 외래키 이름을 정확히 알고 싶을 때 사용할 수 있는 명령문
WHERE table_schema = 'tabledb' and table_name = 'buytbl';

INSERT INTO userTbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', '조용필', 1950, '경기', '019', '4444444', 166, '2009-4-4');

SELECT * FROM usertbl;

INSERT INTO buyTbl VALUES(NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buyTbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buyTbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);

SELECT * FROM buyTbl;

DESC usertbl;	 -- 기본키 확인
DESC buytbl;

DROP TABLE IF EXISTS buyTbl;
DROP TABLE IF EXISTS userTbl;

CREATE TABLE userTbl -- 회원 테이블
( userID  		char(8) NOT NULL, 	-- 사용자 아이디
  name    		varchar(10) NOT NULL, 	-- 이름
  birthYear   	int NOT NULL,  	-- 출생년도
  CONSTRAINT PK_usertbl_userID PRIMARY KEY (userID)		-- 자주 쓰이는 키워드 나열 컨벤션
);	

SELECT *
FROM Information_schema.table_constraints	
WHERE table_schema = 'tabledb';

CREATE TABLE `usertbl` (
  `userID` char(8) NOT NULL,
  `name` varchar(10) NOT NULL,
  `birthYear` int NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SHOW KEYS FROM usertbl;

