-- Active: 1706681927328@@127.0.0.1@3306@sakila
use sakila;

select customer.first_name, customer.last_name, time(rental.rental_date) as rental_time -- time : 시간만 뽑아낸다(hh-mm-ss)
from customer inner join rental on customer.customer_id = rental.customer_id
where date(rental.rental_date) = '2005-06-14'

select date('2021-07-29 09:02:03'); -- 날짜만 뽑아오기
select time('2021-07-29 09:02:03'); -- 시간만 뽑아오기


select c.first_name,	c.last_name, -- as 키워드 추가
				time(r.rental_date)	as rental_time
from customer	as c inner join rental	as r
				on c.customer_id =	r.customer_id
where date(r.rental_date)	=	'2005-06-14';

select title from film where rating='G' and rental_duration >= 7;
-- rating이 G등급이고, rental_duration이 7일 이상인 행만 뽑아옴

select title,	rating,	rental_duration
from film
where (rating='G' and rental_duration >=	7)
or(rating='PG-13' and rental_duration <	4);
-- G등급이면서 7일 이상 대여할 수 있거나, PG-13 등급이면서 3일 이내로 대여할 수 있는 영화 목록