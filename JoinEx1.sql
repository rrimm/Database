-- INNER JOIN

USE sqlDB;

CREATE TABLE `usertbl` (
  `userID` char(8) NOT NULL,
  `name` varchar(10) NOT NULL,
  `birthYear` int NOT NULL,
  `addr` char(2) NOT NULL,
  `mobile1` char(3) DEFAULT NULL,
  `mobile2` char(8) DEFAULT NULL,
  `height` smallint DEFAULT NULL,
  `mDATE` date DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `buytbl` (
  `num` int NOT NULL AUTO_INCREMENT,
  `userID` char(8) NOT NULL,
  `prodName` char(6) NOT NULL,
  `groupName` char(4) DEFAULT NULL,
  `price` int NOT NULL,
  `amount` smallint NOT NULL,
  PRIMARY KEY (`num`),
  KEY `userID` (`userID`),
  CONSTRAINT `buytbl_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `usertbl` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * FROM userTbl;
SELECT * FROM buytbl;

SELECT * 
FROM buyTbl INNER JOIN userTbl ON buyTbl.userID = userTbl.userID;
   
SELECT * 
FROM buyTbl INNER JOIN userTbl ON buyTbl.userID = userTbl.userID
WHERE buyTbl.userID = 'JYP';

SELECT userID, name, prodName, addr, mobile1 + mobile2 AS '연락처'
   FROM buyTbl
     INNER JOIN userTbl
        ON buyTbl.userID = userTbl.userID
        ORDER BY num;

SELECT buyTbl.userID, usertbl.name, buytbl.prodName, usertbl.addr, usertbl.mobile1 + usertbl.mobile2 AS '연락처'
  FROM buyTbl INNER JOIN usertbl ON buytbl.userID = usertbl.userID
 ORDER BY buyTbl.num;
 
SELECT B.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 AS '연락처'
  FROM buyTbl B INNER JOIN usertbl U ON B.userID = U.userID
 ORDER BY B.num;
 
SELECT B.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 AS '연락처'
  FROM buyTbl B INNER JOIN usertbl U ON B.userID = U.userID
 WHERE B.userID = 'JYP';
 
SELECT B.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 AS '연락처'
  FROM buyTbl B INNER JOIN usertbl U ON B.userID = U.userID
 ORDER BY U.userID;
 
SELECT U.userID, U.name, U.addr, U.mobile1 + U.mobile2 AS '연락처'
  FROM usertbl U INNER JOIN buyTbl B ON U.userID = B.userID
 ORDER BY U.userID;
 
 SELECT DISTINCT U.userID, U.name, U.addr, U.mobile1 + U.mobile2 AS '연락처'
  FROM usertbl U INNER JOIN buyTbl B ON U.userID = B.userID
 ORDER BY U.userID;
 
 SELECT U.userID, U.name,  U.addr
   FROM userTbl U
   WHERE EXISTS (
      SELECT * 
      FROM buyTbl B
      WHERE U.userID = B.userID );
      
-- 3개 테이블 조인
USE sqlDB;

CREATE TABLE stdTbl 	-- 학생 테이블
( stdName    VARCHAR(10) NOT NULL PRIMARY KEY,
  addr	  CHAR(4) NOT NULL
);

CREATE TABLE clubTbl 	-- 동아리 테이블
( clubName    VARCHAR(10) NOT NULL PRIMARY KEY,
  roomNo    CHAR(4) NOT NULL
);

CREATE TABLE stdclubTbl	-- 학생 동아리 테이블
(  num int AUTO_INCREMENT NOT NULL PRIMARY KEY, 	-- 정수형이면서 기본키일 때 주로 AI 활용
   stdName    VARCHAR(10) NOT NULL,
   clubName    VARCHAR(10) NOT NULL,
FOREIGN KEY(stdName) REFERENCES stdTbl(stdName),
FOREIGN KEY(clubName) REFERENCES clubTbl(clubName)
);

INSERT INTO stdTbl VALUES ('김범수','경남'), ('성시경','서울'), ('조용필','경기'), ('은지원','경북'),('바비킴','서울');
INSERT INTO clubTbl VALUES ('수영','101호'), ('바둑','102호'), ('축구','103호'), ('봉사','104호');
INSERT INTO stdclubTbl VALUES (NULL, '김범수','바둑'), (NULL,'김범수','축구'), (NULL,'조용필','축구'), (NULL,'은지원','축구'), (NULL,'은지원','봉사'), (NULL,'바비킴','봉사');

SELECT * FROM stdTbl;
SELECT * FROM clubTbl;
SELECT * FROM stdclubTbl;

SELECT S.stdName, S.addr, C.clubName
   FROM stdTbl S INNER JOIN stdclubTbl SC ON S.stdName = SC.stdName
				 INNER JOIN clubTbl C ON SC.clubName = C.clubName 
   ORDER BY S.stdName;
   
SELECT S.stdName, S.addr, C.clubName, C.roomNo	-- 학생 테이블, 동아리 테이블, 학생동아리 테이블을 이용해서 학생을 기준으로 학생 이름/지역/가입한 동아리/동아리방 출력
   FROM stdTbl S INNER JOIN stdclubTbl SC ON S.stdName = SC.stdName
				 INNER JOIN clubTbl C ON SC.clubName = C.clubName 
   ORDER BY S.stdName;

SELECT C.clubName, C.roomNo, S.stdName, S.addr	-- 동아리를 기준으로 가입한 학생의 목록 출력
   FROM  stdTbl S INNER JOIN stdclubTbl SC ON SC.stdName = S.stdName	-- stdclubtbl이 stdtbl, clubtbl을 연결시켜주는 역할이라고 볼 수 있음
				  INNER JOIN clubTbl C ON SC.clubName = C.clubName
   ORDER BY C.clubName;
      
