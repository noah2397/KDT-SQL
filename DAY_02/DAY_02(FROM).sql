-- Active: 1706681927328@@127.0.0.1@3306@sakila
use sakila;

-- 파생 테이블
-- select ... from (subquery) as 테이블이름

select * from customer where first_name='JESSIE'

select concat(cust.last_name, ', ', cust.first_name) as fullname -- first와 last 을 열 순서를 바꿔서 concat시킴
FROM 
(select first_name, last_name, email from customer where first_name='JESSIE') as cust;


-- 임시 테이블 : 휘발성의 테이블, 데이터베이스 세션이 닫힐 때 사라짐
drop table if exists actors_j;
create temporary table actors_j -- 임시 테이블 생성 후 
(actor_id smallint(5),
first_name varchar(45),
last_name varchar(45));
desc actors_j; -- 임시 테이블 출력

insert into actors_j
    select actor_id, first_name, last_name
    from actor
    where last_name like 'J%'; # J로 시작하는 last_name을 가진 사람의 열들을 갖고옴

select * from actors_j;

-- 가상 테이블(View)
/*
SQL 쿼리의 결과 셋을 기반으로 만들어진 가상 테이블
실제 데이터가 저장된느 것이 아닌, view를 통해 데이터를 관리
*/
create view cust_vw as 
    select customer_id, first_name, last_name, active from customer;
select * from cust_vw;

-- 이미 만들어진 가상 테이블에서 쿼리를 수행함
select first_name, last_name from cust_vw where active=0; 