INSERT INTO memberTBL VALUES ('Figure', '연아', '경기도 군포시 당정동');

SELECT*FROM memberTBL ;

UPDATE memberTBL SET memberAddress = '서울 강남구 역삼동' WHERE memberName = '연아'; 

DELETE FROM memberTBL WHERE memberName = '연아';

CREATE TABLE deletedMemberTBL (
    memberID CHAR(8),
    memberName CHAR(5),
    memberAddress CHAR(20),
    deletedDate DATE
)

DELIMITER //
CREATE TRIGGER trg_deletedMemberTBL
	AFTER DELETE
	ON memberTBL
	FOR EACH ROW
BEGIN
	-- OLD 테이블의 내용을 백업 테이블에 삽입
	INSERT INTO deletedMemberTBL
		VALUES (OLD.memberID, OLD.memberName, OLD.memberAddress, CURDATE() );
END //
DELIMITER ;

SELECT*FROM memberTBL ;

DELETE FROM memberTBL WHERE memberName = '당탕이';

SELECT*FROM deletedMemberTBL ;