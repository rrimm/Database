USE sqlDB;

SET @myVar1 = 5 ;	-- 서버 자체적으로 변수 생성
SET @myVar2 = 3 ;
SET @myVar3 = 4.25 ;
SET @myVar4 = '가수 이름==> ' ;

SELECT @myVar1 ;
SELECT @myVar2 + @myVar3 ;
SELECT @myVar4 , Name FROM userTbl WHERE height > 180 ;

SET @myVar1 = 3 ;
PREPARE myQuery 
    FROM 'SELECT Name, height FROM userTbl ORDER BY height LIMIT ?';
EXECUTE myQuery USING @myVar1 ;
