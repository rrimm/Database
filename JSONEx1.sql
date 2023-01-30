USE sqlDB;

SELECT name, height
FROM userTBL 
    WHERE height >= 180;

SELECT JSON_OBJECT('name', name, 'height', height) AS 'JSON 값'
	FROM userTBL 
    WHERE height >= 180;

SET @json='{ "userTBL" :
  [
	{"name":"임재범","height":182},
	{"name":"이승기","height":182},
	{"name":"성시경","height":186},
    {"name":"성시경","height":180}
  ]
}' ;	-- KEY: USERTBL, VALUE: [ ] 안의 것

SELECT JSON_VALID(@json) AS JSON_VALID; 	-- @json의 데이터 구조가 JSON형식에 만족하는지 확인. TRUE: 1, FALSE: 0

SELECT JSON_SEARCH(@json, 'one', '성시경') AS JSON_SEARCH;	-- @json 데이터 안에서 성시경을 찾은 후 문자열 위치 반환
SELECT JSON_SEARCH(@json, 'all', '성시경') AS JSON_SEARCH;

SELECT JSON_EXTRACT(@json, '$.userTBL[2].name') AS JSON_EXTRACT;

SELECT JSON_INSERT(@json, '$.userTBL[0].mDate', '2009-09-09') AS JSON_INSERT;

SELECT JSON_REPLACE(@json, '$.userTBL[0].name', '홍길동') AS JSON_REPLACE;

SELECT JSON_REMOVE(@json, '$.userTBL[0]') AS JSON_REMOVE;
