-- Active: 1706681927328@@127.0.0.1@3306@sakila
use sakila;

select * from language;

select language_id, name, last_update from language; -- 필요한 열을 지정하여 뽑아올 수 있다

select name from language; -- 필요한 열만 뽑아올 수 있다

/*
SELECT 절에 추가할 수 있는 항목
-숫자 또는 문자열
-표현식
-내장 함수 호출 및 사용자 정의 함수 호출
*/
select 
language_id, # 기존 열 그냥 출력
'COMMON' language_usage,  # 새로운 열에 "COMMON"이란 값을 넣어서 출력
LANGUAGE_ID * 3.14 lang_pi_value, # 기존열에 연산을 하여 lang_pi_value라는 열 이름으로 출력
upper(name) language_name # 기존열에 연산을 하여 language_name라는 열 이름으로 출력
from language;

select -- as를 사용함으로써 가독성 향상
language_id,
'COMMON' as language_usage,
LANGUAGE_ID * 3.14 as lang_pi_value,
upper(name) as language_name
from language;

select actor_id from film_actor order by actor_id; -- 동일한 배우가 여러 영화에 출연하여 중복된 actor_id 발생
-- distinct 키워드를 사용하여 중복 제거
select DISTINCT actor_id from film_actor order by actor_id;