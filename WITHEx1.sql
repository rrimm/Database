SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'
FROM buytbl
GROUP BY userid;

WITH abc(userid, total)	-- abc: 임시 테이블 이름으로 생각
AS
(SELECT userID , SUM(price*amount)
FROM buytbl GROUP BY userid)
SELECT * FROM abc ORDER BY total DESC;





