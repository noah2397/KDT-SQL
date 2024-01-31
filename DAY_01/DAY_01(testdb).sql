
-- ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '1234';


drop database if Exists testdb;
show databases;
use sakila;
select now();
show character set;


create database testdb;
use testdb;

drop table if EXISTS person;

CREATE TABLE person -- 테이블 이름
(person_id SMALLINT UNSIGNED,
fname VARCHAR(20),
lname VARCHAR(20),
eye_color ENUM('BR','BL','GR'), -- BR, BL, GR 만 사용할 수 있음, 카테고리 속성 생성
birth_date DATE,
street	VARCHAR(30),
city	VARCHAR(20),
state	VARCHAR(20),
country	VARCHAR(20),
postal_code VARCHAR(20),
CONSTRAINT pk_person PRIMARY KEY (person_id)); -- pk_person : 제약조건의 별칭, 기본키로 person_id를 지정
-- 


desc person; -- person 테이블 확인


create table favorite_food(
person_id smallint unsigned,
food varchar(20),
constraint pk_favorite_food primary key(person_id, food), -- 속성 두 개를 기본키로 설정
constraint fk_fav_food_person_id foreign key (person_id) references person(person_id)); -- person_id를 서로 두 테이블을 연결하는 외래키로 설정
-- favorite_food 테이블에서 person_id의 값에 person 테이블에 있는 값만 포함되도록 제한

set foreign_key_checks=0; -- 제약 조건 비활성화
ALTER	TABLE person	MODIFY person_id smallint unsigned auto_increment; -- 테이블 수정
set foreign_key_checks=1; -- 제약 조건 활성화


INSERT	INTO person
(person_id,	fname,	lname,	eye_color,	birth_date)
VALUES (null,	'William',	'Turner',	'BR',	'1972-05-27'); -- auto_increment를 했기 때문에 null값을 줘도 자동으로 값이 들어감

select * from person; -- 데이터 모두 조회

select person_id,	fname,	lname,	birth_date from person;

select person_id,	fname,	lname,	birth_date
from person	where lname =	'Turner';

INSERT INTO favorite_food (person_id,	food)
VALUES (1,	'pizza');
INSERT INTO favorite_food (person_id,	food)
VALUES (1,	'cookies');
INSERT INTO favorite_food (person_id,	food)
VALUES (1,	'nachos'); -- 한 행씩 추가

DELETE FROM favorite_food where person_id=1; #	person_id값이 1인 데이터 삭제
INSERT INTO favorite_food (person_id,	food)
VALUES (1,	'pizza'),
(1,	'cookie'),
(1,	'nachos'); -- 한 번에 여러 행 추가

select * from favorite_food;

SELECT food FROM favorite_food
WHERE person_id=1 ORDER BY food;

INSERT INTO person
(person_id,	fname,	lname,	eye_color,	birth_date,	
street,	city,	state,	country,	postal_code)
VALUES(null,	'Susan',	'Smith',	'BL',	'1975-11-02',
'23	Maple	St.',	'Arlington',	'VA',	'USA',	'20220');
SELECT person_id,	fname,	lname,	birth_date FROM person;


UPDATE person
SET street =	'1225	Tremon	St.',
city =	'Boston',
state =	'MA',
country =	'USA',
postal_code =	'02138'
WHERE person_id=1;

SELECT * FROM person;


DELETE FROM person WHERE person_id=2; -- person_id가 2인 행 삭제
SELECT *	FROM person;

-- INSERT INTO favorite_food (person_id,	food)	VALUES (3,	'lasagna');
-- person 테이블의 person_id를 참조하기 때문에 없는 3번의 데이터는 넣을 수 없다

INSERT INTO person (person_id,	fname, lname)	VALUES (null,'Kevin','Kern');
SELECT * FROM person;

INSERT INTO favorite_food (person_id,	food)	VALUES (3,	'lasagna');
SELECT * FROM favorite_food;