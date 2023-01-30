-- 대량의 샘플 데이터 생성

CREATE TABLE testTbl4 (id int, Fname varchar(50), Lname varchar(50));
INSERT INTO testTbl4 
  SELECT emp_no, first_name, last_name
    FROM employees.employees ;	-- employees 데이터베이스에 있는 employees를 추가

SELECT * FROM testtbl4;

UPDATE testTbl4
    SET Lname = '없음'
    WHERE Fname = 'Kyoichi';

SELECT * FROM testtbl4 WHERE Fname = 'Kyoichi';

SELECT * FROM buyTbl;

UPDATE buyTbl 
SET price = price * 1.5 ;

SELECT @@AUTOCOMMIT;	-- AUTOCOMMIT이 0이면 FALSE, 1이면 TRUE. TRUE인 경우 커밋이 자동으로 되어 롤백 안됨

SET AUTOCOMMIT = TRUE;

SELECT * FROM buyTbl2;
DELETE FROM buyTbl2 WHERE NUM = 2;
UPDATE buyTbl2 SET amount = 100 WHERE NUM = 2;
COMMIT;
ROLLBACK;


SELECT * FROM buytbl2;

DELETE FROM buyTbl2 WHERE num = 3;

SELECT * FROM buytbl2 ORDER BY userID;
DELETE FROM buyTbl2 WHERE userID = 'BBK' limit 3;


DELETE FROM bigTbl1;	-- DML명령문

TRUNCATE TABLE bigTbl3;	-- DDL명령문

DROP TABLE bigTbl2;	-- 테이블 자체 삭제


