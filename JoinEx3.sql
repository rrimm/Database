-- CROSS JOIN (ON구문 사용 불가)
USE sqlDB;

SELECT * 
   FROM buyTbl CROSS JOIN userTbl ;

SELECT * 
   FROM buyTbl , userTbl ;

USE employees;

SELECT  COUNT(*) AS '데이터개수'
   FROM employees CROSS JOIN titles;

-- SELF JOIN (하나의 테이블을 한 번 더 사용해서 조인)
USE sqlDB;

CREATE TABLE empTbl (
    emp CHAR(3),
    manager CHAR(3),
    empTel VARCHAR(8)
);

INSERT INTO empTbl VALUES('나사장',NULL,'0000');
INSERT INTO empTbl VALUES('김재무','나사장','2222');
INSERT INTO empTbl VALUES('김부장','김재무','2222-1');
INSERT INTO empTbl VALUES('이부장','김재무','2222-2');
INSERT INTO empTbl VALUES('우대리','이부장','2222-2-1');
INSERT INTO empTbl VALUES('지사원','이부장','2222-2-2');
INSERT INTO empTbl VALUES('이영업','나사장','1111');
INSERT INTO empTbl VALUES('한과장','이영업','1111-1');
INSERT INTO empTbl VALUES('최정보','나사장','3333');
INSERT INTO empTbl VALUES('윤차장','최정보','3333-1');
INSERT INTO empTbl VALUES('이주임','윤차장','3333-1-1');

SELECT * FROM empTbl;

SELECT A.emp AS '부하직원' , B.emp AS '직속상관', B.empTel AS '직속상관연락처'
   FROM empTbl A
	INNER JOIN empTbl B
         ON A.manager = B.emp
   WHERE A.emp = '우대리';
   
-- UNION / UNION ALL
USE sqlDB;

SELECT stdName, addr FROM stdTbl
UNION ALL
SELECT stdName, addr FROM stdTbl;

SELECT stdName, addr FROM stdTbl
UNION
SELECT clubName, roomNo FROM clubTbl;

SELECT userID, price FROM buyTbl
UNION all
SELECT userID, addr FROM userTbl;

-- NOT IN / IN
SELECT name FROM userTbl WHERE mobile1 IS NULL;

SELECT name, CONCAT(mobile1, mobile2) AS '전화번호' FROM userTbl
   WHERE name NOT IN ( SELECT name FROM userTbl WHERE mobile1 IS NULL) ;

SELECT name, CONCAT(mobile1, mobile2) AS '전화번호' FROM userTbl
   WHERE name IN ( SELECT name FROM userTbl WHERE mobile1 IS NULL) ;


