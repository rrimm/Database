
select emp_no, first_name, last_name, gender from employees;

desc employees; -- desc : describe -> 테이블의 구조를 명시

show databases ;
use mysql; -- 데이터베이스 관리 및 운영하는 데 필요한 정보를 가진 테이블

select * from user;  -- 사용자 정보
select * from db; -- 어떤 사용자 정보를 어떤 db가 사용하고 있는지? db 관리자 권한이 있어야 접근해서 확인 가능

use employees;
show databases; -- 존재하는 모든 데이터베이스 목록
show tables; -- 현재 선택된 데이터베이스에 존재하는 테이블 목록 확인
show table status; -- 테이블의 목록과 상태정보 모두 보여줌
