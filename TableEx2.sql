-- sqldb

SELECT addr FROM userTbl;

SELECT addr FROM userTbl ORDER BY addr;

SELECT DISTINCT addr FROM userTbl ORDER BY addr; 	-- 어떤 주소에 있는지만 확인하므로 중복을 제거

-- employees

DESC employees;
USE employees;

SELECT emp_no, hire_date FROM employees;

SELECT emp_no, hire_date FROM employees LIMIT 5;

SELECT emp_no, hire_date FROM employees
   ORDER BY hire_date ASC LIMIT 5;
   
   SELECT emp_no, hire_date FROM employees
   ORDER BY hire_date ASC LIMIT 6, 5; 	-- 6번째 위치부터 5개
   
   SELECT emp_no, hire_date FROM employees
   ORDER BY hire_date ASC LIMIT 0, 5; 	-- LIMIT 5 OFFSET 0과 동일
   
   -- sqldb
   
   CREATE TABLE buyTbl2 (SELECT * FROM buyTbl);
   SELECT * FROM buyTbl2;
   
   DESC buytbl;
   DESC buytbl2; -- 기본키나 외래키는 복사되지 않음
   
   CREATE TABLE `buytbl` (
  `num` int NOT NULL AUTO_INCREMENT,
  `userID` char(8) NOT NULL,
  `prodName` char(6) NOT NULL,
  `groupName` char(4) DEFAULT NULL,
  `price` int NOT NULL,
  `amount` smallint NOT NULL,
  PRIMARY KEY (`num`),
  KEY `userID` (`userID`),
  CONSTRAINT `buytbl_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `usertbl` (`userID`)		-- `buytbl_ibfk_1`: 제약조건의 이름
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `buytbl2` (
  `num` int NOT NULL DEFAULT '0',
  `userID` char(8) NOT NULL,
  `prodName` char(6) NOT NULL,
  `groupName` char(4) DEFAULT NULL,
  `price` int NOT NULL,
  `amount` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE buytbl3 (SELECT userID, prodName FROM buyTbl);
SELECT * FROM buytbl3;

SELECT * FROM buytbl order by userID;
SELECT userID as '사용자 아이디', SUM(amount) as '총 구매 개수' FROM buytbl GROUP BY userID;		-- 그룹화할 대상만 select할 수 있음

SELECT userID as '사용자 아이디', SUM(price*amount) as '총 구매액' FROM buytbl GROUP BY userID;
