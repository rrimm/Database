-- sqldb

SELECT AVG(amount) AS '평균 구매 개수' FROM buytbl ; 	-- 테이블 전체를 하나의 그룹처럼 생각

SELECT AVG(amount) AS '평균 구매 개수' FROM buytbl GROUP BY userID;		--

SELECT name, MAX(height), MIN(height) FROM usertbl ; -- 테이블에서 큰것 하나와 작은것 하나, 이름을 여러개 구하는 건 성립 불가 

SELECT name, MAX(height), MIN(height) FROM usertbl GROUP BY name;	-- 이름별로 큰것, 작은 것을 구하므로 성립은 가능하지만 의미는 없음

SELECT name, height
FROM userTbl 
WHERE height = (SELECT MAX(height)FROM usertbl) 
	OR height = (SELECT MIN(height)FROM usertbl);

SELECT MAX(height)FROM usertbl;
SELECT MIN(height)FROM usertbl;

SELECT COUNT(*) FROM usertbl;

SELECT COUNT(mobile1) AS '휴대폰이 있는 사용자' FROM usertbl;	-- null을 제외한 개수세기

SELECT * FROM usertbl;

SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
FROM buytbl 
GROUP BY userID;

SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
FROM buytbl 
WHERE SUM(price*amount) > 1000
GROUP BY userID;	-- 불가

SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
	FROM buytbl 
	GROUP BY userID
	HAVING SUM(price*amount) > 1000;		-- 집계함수 사용해서 그룹화한 대상에 대해 조건을 줄 때 HAVING절 사용 필요

SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
	FROM buytbl 
	GROUP BY userID
	HAVING SUM(price*amount) > 1000
	ORDER BY SUM(price*amount) DESC;

SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
	FROM buytbl
	GROUP BY userID
	HAVING SUM(price*amount) > 1000
	ORDER BY userID DESC;

SELECT num, groupName, SUM(price * amount) AS '비용' 
   FROM buytbl
   GROUP BY  groupName, num
   WITH ROLLUP;
   
SELECT groupName, SUM(price * amount) AS '비용' 
FROM buytbl
GROUP BY groupName
WITH ROLLUP;	-- ex) 연도별로 사용자아이디별로 총구매금액을 알고 싶을 때 사용할 수 있음






