-- VIEW
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

SELECT userid, name, addr FROM usertbl;

CREATE VIEW v_userTbl
AS
SELECT userid, name, addr FROM usertbl;		

SELECT * FROM v_usertbl;

-- 실습6
DROP TABLE IF EXISTS userTbl, buyTbl;

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

CREATE TABLE buyTbl 	-- 구매 테이블
(  num 			INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 	-- 순번(PK)
   userid  		char(8) NOT NULL,	-- 아이디(FK)
   prodName 	char(6) NOT NULL, 	-- 물품명
   groupName 	char(4) , 	-- 분류
   price     	int NOT NULL, 	-- 단가
   amount    	smallint NOT NULL, 	-- 수량
   FOREIGN KEY(userid) REFERENCES userTbl(userID)
);

INSERT INTO userTbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', '조용필', 1950, '경기', '019', '4444444', 166, '2009-4-4');

INSERT INTO buyTbl VALUES(NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buyTbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buyTbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);

SELECT * FROM usertbl;
SELECT * FROM buyTbl;

CREATE VIEW v_userbuyTbl
AS
   SELECT U.userid AS 'USER ID', U.name AS 'USER NAME', B.prodName AS 'PRODUCT NAME', 
		U.addr, CONCAT(U.mobile1, U.mobile2) AS 'MOBILE PHONE'
      FROM userTbl U
	INNER JOIN buyTbl B
	 ON U.userid = B.userid;

SHOW CREATE VIEW v_userbuytbl;

SELECT * FROM v_userbuyTbl;

SELECT `USER ID`, `USER NAME` FROM v_userbuyTbl;

DROP VIEW v_userbuyTbl;

CREATE OR REPLACE VIEW v_userTbl	-- v_userTbl가 있으면 그것으로 대체하고 없으면 새로 만듦
AS
	SELECT userid, name, addr FROM userTbl;
    
 DESC v_userTbl;   
 
SELECT * FROM v_userTbl;
SELECT * FROM userTbl;

UPDATE v_userTbl SET addr = '부산' WHERE userid='JYP' ;
    
INSERT INTO v_userTbl(userid, name, addr) VALUES('KBM','김병만','충북') ;	-- 뷰를 통해 INSERT했어도 실제로 테이블에 삽입하는 것이므로 NOT NULL 조건을 가진 birthYear에 값을 줄 수 없어 오류

DESC userTbl;  

CREATE VIEW v_sum
AS
	SELECT userid AS 'userid', SUM(price*amount) AS 'total'  
	   FROM buyTbl GROUP BY userid;

SELECT * FROM v_sum;

SELECT * FROM INFORMATION_SCHEMA.VIEWS
     WHERE TABLE_SCHEMA = 'tableldb' AND TABLE_NAME = 'v_sum';
     
CREATE VIEW v_height177
AS
	SELECT * FROM userTbl WHERE height >= 177 ;
    
SELECT * FROM v_height177;

DELETE FROM v_height177 WHERE height < 177 ;

INSERT INTO v_height177 VALUES('KBM', '김병만', 1977 , '경기', '010', '5555555', 158, '2023-01-01') ;	-- 키가 158이므로 v_height177로 불러올 수 없음

ALTER VIEW v_height177
AS
	SELECT * FROM userTbl WHERE height >= 177	-- 이 조건을 만족하지 않는 데이터에 대한 입력을 거부
	    WITH CHECK OPTION ;
        
 INSERT INTO v_height177 VALUES('WDT', '서장훈', 2006 , '서울', '010', '3333333', 155, '2019-3-3') ;	-- WITH CHECK OPTION에 위배되므로 입력 거부됨
 
 
 