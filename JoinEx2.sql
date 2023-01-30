 -- OUTER JOIN
 
 USE sqlDB;
 
SELECT * FROM userTbl;
SELECT * FROM buyTbl;
 
SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2)  AS '연락처'
   FROM userTbl U JOIN buyTbl B ON U.userID = B.userID 
   ORDER BY U.userID;
 
SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2)  AS '연락처'
	FROM userTbl U LEFT OUTER JOIN buyTbl B ON U.userID = B.userID 
	ORDER BY U.userID;
   
SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2)  AS '연락처'
   FROM userTbl U RIGHT OUTER JOIN buyTbl B ON U.userID = B.userID 
   ORDER BY U.userID;
   
SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2)  AS '연락처'
FROM userTbl U LEFT OUTER JOIN buyTbl B ON U.userID = B.userID 
WHERE B.prodName IS NULL	
ORDER BY U.userID;

-- 3개 테이블 조인
USE sqlDB;

SELECT * FROM stdclubTbl;

SELECT S.stdName, S.addr, C.clubName
   FROM stdTbl S LEFT OUTER JOIN stdclubTbl SC ON S.stdName = SC.stdName
				 LEFT OUTER JOIN clubTbl C ON SC.clubName = C.clubName
   ORDER BY S.stdName;
   
SELECT S.stdName, S.addr, C.clubName, C.roomNo
   FROM stdTbl S LEFT OUTER JOIN stdclubTbl SC ON S.stdName = SC.stdName
				 LEFT OUTER JOIN clubTbl C ON SC.clubName = C.clubName
   ORDER BY S.stdName;

SELECT C.clubName, C.roomNo, S.stdName, S.addr
   FROM  stdTbl S LEFT OUTER JOIN stdclubTbl SC ON SC.stdName = S.stdName
				  RIGHT OUTER JOIN clubTbl C ON SC.clubName = C.clubName
   ORDER BY C.clubName ;

SELECT S.stdName, S.addr, C.clubName, C.roomNo
   FROM stdTbl S LEFT OUTER JOIN stdclubTbl SC ON S.stdName = SC.stdName
				 LEFT OUTER JOIN clubTbl C ON SC.clubName = C.clubName
UNION 
SELECT S.stdName, S.addr, C.clubName, C.roomNo
   FROM  stdTbl S LEFT OUTER JOIN stdclubTbl SC ON SC.stdName = S.stdName
				  RIGHT OUTER JOIN clubTbl C ON SC.clubName = C.clubName;
   