-- Active: 1706681927328@@127.0.0.1@3306@sakila
use sakila;

select c.first_name,	c.last_name,	count(*)
from customer	as c	inner join rental	as r
on c.customer_id =	r.customer_id
group by c.first_name,	c.last_name -- 이름을 그룹화 함
having count(*)	>=	40; -- 해당 이름이 40개가 넘으면 출력하도록 설정




-- 고객 중 last_name이 동일한 경우, first_name으로 다시 정렬
select c.first_name,	c.last_name,
time(r.rental_date)	as rental_time
from customer	as c inner join rental	as r
on c.customer_id =	r.customer_id
where date(r.rental_date)	=	'2005-06-14'
order by c.last_name,	c.first_name asc;



select c.first_name,	c.last_name,time(r.rental_date)	as rental_time
from customer	as c inner join rental	as r on c.customer_id =	r.customer_id
where date(r.rental_date)	=	'2005-06-14' order by time (r.rental_date)	desc;

-- order	by	다음에 정렬 기준이 되는 컬럼의 순서(index)를 사용
select c.first_name,	c.last_name,time(r.rental_date)	as rental_time from customer as c
inner join rental	as r on c.customer_id =	r.customer_id where date(r.rental_date)	=	'2005-06-14' order by 1 desc;

-- 연습문제
-- § actor	테이블에서 모든 배우의 actor_id,	first_name,	last_name을 검색하고 last_name,first_name을 기준으로 오름 차순 정렬
select actor_id, first_name, last_name from actor order by last_name, first_name;


-- 성이 ‘WILLIAMS’ 또는 ‘DAVIS’인 모든 배우의 actor_id,	first_name,	last_name을 검색
select actor_id, first_name, last_name from actor where last_name="WILLIAMS" or last_name="DAVIS";

-- rental 테이블에서 2005년 7월 5일 영화를 대여한 고객 ID를 반환하는 쿼리를 작성하고, date()함수로 시간 요소를 무시

select distinct customer_id from rental where date(rental_date) = '2005-07-05';


select c.store_id, c.email, r.rental_date, r.return_date from customer as c inner join rental as r
on c.customer_id = r.customer_id where date(r.rental_date) = '2005-06-14' order by return_date desc;