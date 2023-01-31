-- 기본키 제약조건
DROP TABLE IF EXISTS userTbl;

CREATE TABLE userTbl -- 회원 테이블
( userID  		char(8) NOT NULL, 	-- 사용자 아이디
  name    		varchar(10) NOT NULL, 	-- 이름
  birthYear   	int NOT NULL  	-- 출생년도
);

ALTER TABLE userTbl		-- ALTER TABLE: DDL로 분류. 만들어진 테이블에 대한 구조 변경
	ADD CONSTRAINT PK_userTbl_userID 	-- 이름 부여 시 userTbl_userID_PK로도 가능하나 기본키는 PRIMARY로 통일되므로 별로 의미는 없다.
        PRIMARY KEY (userID);
        
DROP TABLE IF EXISTS prodTbl;

CREATE TABLE prodTbl
( prodCode CHAR(3) NOT NULL,
  prodID   CHAR(4)  NOT NULL,
  prodDate DATETIME  NOT NULL,
  prodCur  CHAR(10) NULL
);

ALTER TABLE prodTbl
	ADD CONSTRAINT PK_prodTbl_proCode_prodID 
	PRIMARY KEY (prodCode, prodID) ;
    
SHOW KEYS FROM prodTbl;

-- 외래키 제약조건
DROP TABLE IF EXISTS prodTbl;
DROP TABLE IF EXISTS userTbl;
DROP TABLE IF EXISTS buyTbl;

CREATE TABLE userTbl -- 회원 테이블
( userID  		char(8) NOT NULL PRIMARY KEY, 	-- 사용자 아이디
  name    		varchar(10) NOT NULL, 	-- 이름
  birthYear   	int NOT NULL  	-- 출생년도
);

CREATE TABLE buyTbl 	-- 구매 테이블
(  num 			INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 	-- 순번(PK)
   userid  		char(8) NOT NULL,	-- 아이디(FK)
   prodName 	char(6) NOT NULL, 	-- 물품명
   FOREIGN KEY(userid) REFERENCES userTbl(userID)	-- 이름을 적용하는 경우: CONSTRAINT FK_usertbl_buytbl FOREIGN KEY(userID) REFERENCES usertbl(userID)
);

CREATE TABLE buyTbl 	-- 구매 테이블
(  num 			INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 	-- 순번(PK)
   userid  		char(8) NOT NULL,	-- 아이디(FK)
   prodName 	char(6) NOT NULL, 	-- 물품명
   CONSTRAINT FK_usertbl_buytbl FOREIGN KEY(userID) REFERENCES usertbl(userID)	-- 이름을 적용하는 경우. FK_usertbl_buytbl_userID 방식으로 작성하기도 함
);

SELECT *
FROM Information_schema.table_constraints	
WHERE table_schema = 'tabledb';

ALTER TABLE buyTbl
	DROP FOREIGN KEY FK_usertbl_buytbl; 

SELECT *
FROM Information_schema.table_constraints	
WHERE table_schema = 'tabledb';

ALTER TABLE buyTbl
	ADD CONSTRAINT FK_userTbl_buytbl
    FOREIGN KEY (userID)
    REFERENCES usertbl (userID)
    ON UPDATE CASCADE;
	
SHOW KEYS FROM buyTbl;

INSERT INTO userTbl VALUES('LSG', '이승기', 1987);
INSERT INTO userTbl VALUES('KBS', '김범수', 1979);
INSERT INTO userTbl VALUES('KKH', '김경호', 1971);
INSERT INTO userTbl VALUES('JYP', '조용필', 1950);

SELECT * FROM usertbl;

INSERT INTO buyTbl VALUES(NULL, 'KBS', '운동화');
INSERT INTO buyTbl VALUES(NULL, 'KBS', '노트북');
INSERT INTO buyTbl VALUES(NULL, 'JYP', '모니터');

SELECT * FROM buytbl;

DELETE FROM usertbl WHERE userID = 'JYP';	-- 에러: usertbl의 userid를 buytbl이 참조하고 있으므로

ALTER TABLE buyTbl
	DROP FOREIGN KEY FK_usertbl_buytbl; 
    
ALTER TABLE buyTbl
	ADD CONSTRAINT FK_userTbl_buytbl
    FOREIGN KEY (userID)
    REFERENCES usertbl (userID)
    ON DELETE CASCADE;
    
-- UNIQUE 제약조건

SELECT *
FROM Information_schema.table_constraints	
WHERE table_schema = 'tabledb';

SHOW KEYS FROM buyTbl;

DROP TABLE IF EXISTS userTbl;
    
CREATE TABLE userTbl -- 회원 테이블
( userID  		char(8) NOT NULL PRIMARY KEY, 	-- 사용자 아이디
  name    		varchar(10) NOT NULL, 	-- 이름
  birthYear   	INT NOT NULL,  	-- 출생년도
  email 		CHAR(30) NULL,
  CONSTRAINT AK_email UNIQUE(email) -- UK_email
);

SHOW KEYS FROM userTbl;


-- CHECK 제약조건
DROP TABLE IF EXISTS userTbl;

CREATE TABLE userTbl -- 회원 테이블
( userID  		char(8) PRIMARY KEY, 	-- 사용자 아이디
  name    		varchar(10) , 	-- 이름
  birthYear   	INT CHECK (birthYear >= 1900 AND birthYear <= 2023),  	-- 출생년도
  mobile1 		CHAR(3) NULL,
  CONSTRAINT CK_name CHECK (name IS NOT NULL) 
);

DESC usertbl;

INSERT INTO usertbl(userID, mobile1) VALUES('aaa', '010');	-- ck_name에 값을 주지 않았으므로 오류 발생
INSERT INTO usertbl(userID, name, mobile1) VALUES('aaa','이기자', '010');

SELECT * FROM usertbl;

ALTER TABLE userTbl
	ADD CONSTRAINT CK_mobile1
    CHECK (mobile1 IN ('010', '011', '016', '017', '018', '019')) ;
