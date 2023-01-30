USE sqlDB ;
SELECT AVG(amount) AS '평균 구매 개수' FROM buyTbl ;

SELECT CAST(AVG(amount) AS SIGNED INTEGER) AS '평균 구매 개수'  FROM buyTbl ;
SELECT CONVERT(AVG(amount) , SIGNED INTEGER) AS '평균 구매 개수'  FROM buyTbl ;

SELECT CAST('2020$12$12' AS DATE);
SELECT CAST('2020/12/12' AS DATE);
SELECT CAST('2020%12%12' AS DATE);
SELECT CAST('2020@12@12' AS DATE);

SELECT num, CONCAT(CAST(price AS CHAR(10)), 'X', CAST(amount AS CHAR(4)) ,'=' )  AS '단가X수량', price*amount AS '구매액' 
  FROM buyTbl ;

SELECT '100' + '200' ; -- 문자와 문자를 더함 (정수로 변환되서 연산됨)
SELECT CONCAT('100', '200'); -- 문자와 문자를 연결 (문자로 처리)
SELECT CONCAT(100, '200'); -- 정수와 문자를 연결 (정수가 문자로 변환되서 처리)
SELECT 1 > '2mega'; -- 정수인 2로 변환되어서 비교(첫번째 문자열이 숫자면 숫자로 변환)
SELECT 3 > '2MEGA'; -- 정수인 2로 변환되어서 비교(결과값: 1 = true, 0 = false)
SELECT 0 = 'mega2'; -- 문자는 0으로 변환됨

