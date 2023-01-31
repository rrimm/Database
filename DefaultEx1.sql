-- DEFAULT 정의
DROP TABLE IF EXISTS userTbl;

CREATE TABLE userTbl 
( userID	char(8) NOT NULL PRIMARY KEY,  
  name		varchar(10) NOT NULL, 
  birthYear	int NOT NULL DEFAULT -1,
  addr		char(2) NOT NULL DEFAULT '서울',
  mobile1	char(3) NULL, 
  mobile2	char(8) NULL, 
  height	smallint NULL DEFAULT 170, 
  mDate	date NULL 
);

DESC usertbl;

INSERT INTO userTbl(userID, name, birthYear, mobile1, mobile2)
VALUES ('aaa', '이기자', 1988, '010', '12345678');	-- DEFAULT: 값을 입력하지 않고도 쓸 수 있도록 함

SELECT * FROM usertbl;

DESC usertbl;

-- 다른 방법
DROP TABLE IF EXISTS userTbl;
CREATE TABLE userTbl 
( userID	char(8) NOT NULL PRIMARY KEY,  
  name		varchar(10) NOT NULL, 
  birthYear	int NOT NULL ,
  addr		char(2) NOT NULL,
  mobile1	char(3) NULL, 
  mobile2	char(8) NULL, 
  height	smallint NULL, 
  mDate	date NULL 
);

ALTER TABLE userTbl
	ALTER COLUMN birthYear SET DEFAULT -1;
ALTER TABLE userTbl
	ALTER COLUMN addr SET DEFAULT '서울';
ALTER TABLE userTbl
	ALTER COLUMN height SET DEFAULT 170;

DESC usertbl;

INSERT INTO userTbl VALUES('LHL', '이혜리', default, default, '011', '1234567', default, '2023.12.12');	-- DEFAULT로 설정된 값을 자동 입력

INSERT INTO userTbl(userID, name) VALUES('KAY', '김아영');	-- 열이름이 명시되지 않으면 DEFAULT로 설정된 값을 자동 입력

INSERT INTO userTbl VALUES ('WB', '원빈', 1982, '대전', '019', '9876543', 176, '2017.5.5');	-- 값이 직접 명기되면 DEFAULT로 설정된 값은 무시

SELECT * FROM userTbl;

