USE sqlDB;

CREATE TABLE testTbl1 (id  int, userName char(3), age int);

SELECT * FROM testtbl1;

INSERT INTO testTbl1 VALUES (1, '홍길동', 25);	-- 위에 컬럼을 모두 정의했으므로 테이블이름 뒤 컬럼네임을 생략 가능했다.
INSERT INTO testTbl1(id, userName, age) VALUES (1, '이순신', 25); 	-- 생략 안했을 때
INSERT INTO testTbl1(id, userName) VALUES (3, '김유신'); 		-- age를 삽입하지 않았으므로 null로 표시되어 생성됨
INSERT INTO testTbl1(userName, age, id) VALUES ('하니', 26, 4); 	-- 순서가 바껴도 상관없음

CREATE TABLE testTbl2 
  (id  int AUTO_INCREMENT PRIMARY KEY, 
   userName char(3), 
   age int );
   
DESC testtbl2;

INSERT INTO testTbl2 VALUES (NULL, '지민', 25); -- 순서를 맞추기 위한 null

SELECT * FROM testtbl2;

INSERT INTO testTbl2(userName, age) VALUES ('지민', 27);

ALTER TABLE testTbl2 AUTO_INCREMENT=100;	-- 기존값 변경
INSERT INTO testTbl2 VALUES (NULL, '찬미', 23);
INSERT INTO testTbl2 VALUES (NULL, '찬미2', 21);
SELECT * FROM testTbl2;

CREATE TABLE testTbl3 
  (id  int AUTO_INCREMENT PRIMARY KEY, 
   userName char(3), 
   age int );

DESC testtbl3;

ALTER TABLE testTbl3 AUTO_INCREMENT=1000;	-- 시작값 1000
SET @@auto_increment_increment=3;	-- 증가치를 3으로 변경. 모든 테이블의 auto_increment에 적용되어버림

INSERT INTO testTbl3 VALUES (NULL, '나연', 20);
INSERT INTO testTbl3 VALUES (NULL, '정연', 18);
INSERT INTO testTbl3 VALUES (NULL, '모모', 19);

INSERT INTO testTbl3 VALUES (NULL, '나연', 20), (NULL, '정연', 18), (NULL, '모모', 19);		-- 위의 3줄과 동일한 결과

SELECT * FROM testTbl3;

SELECT * FROM testTbl2;
INSERT INTO testTbl2 VALUES (NULL, '모모', 19);
INSERT INTO testTbl2 VALUES (NULL, '모모2', 29);
INSERT INTO testTbl2 VALUES (NULL, '정연2', 28);
