DROP DATABASE IF EXISTS sqldb;
CREATE DATABASE sqldb;

use sqldb;

CREATE TABLE usertbl
( 	userID		CHAR(8) NOT NULL PRIMARY KEY,	-- 사용자 아이디(PK)
	name		VARCHAR(10) NOT NULL,	-- 이름
	birthYear	INT NOT NULL,	-- 출생년도
	addr		CHAR(2) NOT NULL,	-- 지역(경기,서울,경남 식으로 2글자만입력)
	mobile1		CHAR(3),	-- 휴대폰의 국번(011, 016, 017, 018, 019, 010 등)
	mobile2		CHAR(8),	-- 휴대폰의 나머지 전화번호(하이픈제외)
	height		SMALLINT,	-- 키
	mDATE		DATE	-- 회원 가입일
);

desc usertbl;

CREATE TABLE buytbl -- 회원 구매 테이블(Buy Table의 약자)
(   num			INT AUTO_INCREMENT NOT NULL PRIMARY KEY,	-- 순번(PK)
	userID		CHAR(8) NOT NULL,	-- 아이디(FK)
	prodName	CHAR(6) NOT NULL,	--  물품명
	groupName	CHAR(4),	-- 분류
	price		INT NOT NULL,	-- 단가
	amount		SMALLINT NOT NULL,	-- 수량
	FOREIGN KEY (userID) REFERENCES usertbl(userID) -- 외래키(테이블 레벨 방식). usertb1에서 userID를 참조할 목적으로 buytb1의 userID를 사용하겠다
    );
    
    desc buytbl;
    
INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울','011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '22222222', '173', '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '33333333', '177', '2007-7-7');
INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기', '011', '44444444', '166', '2009-4-4');
INSERT INTO usertbl VALUES('SSK', '성시경', 1979, '서울', NULL , NULL      , '186', '2013-12-12');
INSERT INTO usertbl VALUES('LJB', '임재범', 1963, '서울', '016', '66666666', '182', '2009-9-9');
INSERT INTO usertbl VALUES('YJS', '윤종신', 1969, '경남', NULL , NULL      , '170', '2005-5-5');
INSERT INTO usertbl VALUES('EJW', '은지원', 1972, '경북', '011', '88888888', '174', '2014-3-3');
INSERT INTO usertbl VALUES('JKW', '조관우', 1965, '경기', '018', '99999999', '172', '2010-10-10');
INSERT INTO usertbl VALUES('BBK', '바비킴', 1973, '서울', '010', '00000000', '176', '2013-5-5');		-- buytbl 데이터 삽입


INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL , 30  ,  2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000,  1);
INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200 ,  1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '모니터', '전자', 200 ,  5);
INSERT INTO buytbl VALUES(NULL, 'KBS', '청바지', '의류', 50  ,  3);
INSERT INTO buytbl VALUES(NULL, 'BBK', '메모리', '전자', 80  , 10);
INSERT INTO buytbl VALUES(NULL, 'SSK', '책'   , '서적', 15  ,  5);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'   , '서적', 15  ,  2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '청바지', '의류', 50  ,  1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL , 30  ,  2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'   , '서적', 15  ,  1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL , 30  ,  2);		-- 데이터 확인


SELECT * FROM usertbl;
SELECT * FROM buytbl;

SELECT * FROM usertbl WHERE name = '김경호';

SELECT userID, Name FROM usertbl WHERE birthYear >= 1970 AND height >= 182;
SELECT userID, Name FROM usertbl WHERE birthYear >= 1970 OR height >= 182;

SELECT name, height FROM usertbl WHERE height >= 180 AND height <= 183;
SELECT name, height FROM usertbl WHERE height BETWEEN 180 AND 183;

SELECT name, addr FROM usertbl WHERE addr = '경남' OR addr = '전남' OR addr = '경북';
SELECT name, addr FROM usertbl WHERE addr IN('경남', '전남', '경북');

SELECT name, height FROM usertbl WHERE name LIKE '김%';
SELECT name, height FROM usertbl WHERE name LIKE '_종신';
SELECT name, height FROM usertbl WHERE name LIKE '%기%';

SELECT height FROM usertbl WHERE name = '김경호';
SELECT height FROM usertbl WHERE name = 177;
SELECT name, height FROM usertbl
	WHERE height > (SELECT height FROM usertbl WHERE name = '김경호');

SELECT name, height FROM usertbl
	WHERE height >= any (SELECT height FROM usertbl WHERE addr = '경남');
SELECT name, height FROM usertbl
	WHERE height >= (SELECT min(height) FROM usertbl WHERE addr = '경남');
    
SELECT name, height FROM usertbl
	WHERE height <= any (SELECT height FROM usertbl WHERE addr = '경남');
SELECT name, height FROM usertbl
	WHERE height <= (SELECT max(height) FROM usertbl WHERE addr = '경남');

SELECT name, height FROM usertbl
	WHERE height = any (SELECT height FROM usertbl WHERE addr = '경남');
SELECT name, height FROM usertbl
	WHERE height IN(SELECT height FROM usertbl WHERE addr = '경남');
    
SELECT name, height FROM usertbl
	WHERE height >= ALL (SELECT height FROM usertbl WHERE addr = '경남');
SELECT name, height FROM usertbl
	WHERE height >= (SELECT max(height) FROM usertbl WHERE addr = '경남');   
    
SELECT name, height FROM usertbl
	WHERE height <= ALL (SELECT height FROM usertbl WHERE addr = '경남');
SELECT name, height FROM usertbl
	WHERE height <= (SELECT min(height) FROM usertbl WHERE addr = '경남');   

SELECT name, mDate FROM usertbl ORDER BY height DESC, name ASC; -- 키를 1차로 내림차순으로 정렬하고 키가 같은 조건에서, 2차 기준인 이름을 오름차순으로 정렬

SELECT name, mDate FROM usertbl ORDER BY mDate; -- 오름차순 디폴트값

SELECT name, mDate FROM usertbl ORDER BY mDate DESC;

SELECT name, mDate FROM usertbl ORDER BY name DESC;

SELECT name, mDate FROM usertbl ORDER BY name;

