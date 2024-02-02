-- Active: 1706681927328@@127.0.0.1@3306@sqlclass_db
-- 데이터 베이스 이름 : sqlclass_db
-- 테이블 이름 : nobel (1901년 ~ 2019년까지 노벨상 수상자 현황 )
-- category : 수상 분야
use sqlclass_db;
select * from nobel;
select distinct count(year) from nobel

select distinct category from nobel;

-- 1) 1960년에 노벨상 물리학상 또는 노벨 평화상을 수상한 사람의 정보를 출력
select year, category, fullname from nobel where category="Peace" or category="Physics";

-- 2) Albert Einstein이 수상한 연도와 수상 분야(category), 출생대륙, 출생국가를 출력
select year, category, birth_continent, birth_country from nobel where fullname="Albert Einstein";


-- 3) 1910년 부터 2010년까지 노벨 평화상 수상자 명단 출력 (연도 오름차순)
select year, fullname, birth_country from nobel where year between 1910 and 2010 and category="Literature" order by year asc;

-- 4) 전체 테이블에서 수상자 이름이 ‘John’으로 시작하는 수상자 모두 출력
select category, fullname from nobel where fullname like "John%";

-- 5) 1964년 수상자 중에서 노벨화학상과 의학상(‘Physiology or Medicine’)을 제외한 수상자의 모든 정보를 수상자 이름을 기준으로 오름차순으로 정렬 후 출력
select * from nobel where year=1964 and category not in ("Physiology or Medicine") order by fullname asc;

-- 6) 2000년부터 2019년까지 노벨 문학상 수상자 명단 출력
select year, fullname, gender, birth_country from nobel where category="Literature" and year between 2000 and 2019;

-- 7) 각 분야별 역대 수상자의 수를 내림차순으로 정렬 후 출력(group by, order by)
select count(*), category from nobel group by category order by count(*) desc;

-- 8) 노벨 의학상이 없었던 연도를 모두 출력 (distinct) 사용
--select distinct year from nobel where category="Physiology or Medicine"; -- 노벨 의학상을 받은 년도 출력
select distinct year from nobel where year not in (select distinct year from nobel where category="Physiology or Medicine"); -- 노벨 문학상을 받은 년도 출력


-- 9) 노벨 의학상이 없었던 연도의 총 회수를 출력
create view PM_year as (select distinct year from nobel where year not in (select distinct year from nobel where category="Physiology or Medicine"))

select count(*) from PM_year;


--  10) 여성 노벨 수상자의 명단 출력
select fullname, category, birth_country from nobel where gender="Female";

-- 11) 수상자들의 출생 국가별 횟수 출력
select birth_country, count(*) as count from nobel group by birth_country;

-- 12) 수상자의 출생 국가가 ‘Korea’인 정보 모두 출력
select * from nobel where birth_country="Korea";

-- 13) 수상자의 출신 국가가 (‘Europe’, ‘North America’, 공백)이 아닌 모든 정보 출력
select * from nobel where birth_continent not in ("Europe", "North America", "");

-- 14) 수상자의 출신 국가별로 그룹화를 해서 수상 횟수가 10회 이상인 국가의 모든 정보 출력하고 국가별 수상횟수의 역순으로 출력
select birth_country,count(*) from nobel group by birth_country having count(*) >=10 order by count(*) desc;

-- 15) 2회 이상 수상자 중에서 fullname이 공백이 아닌 경우를 출력하는데, fullname의 오름차순으로 출력
select fullname, count(*) from nobel group by fullname having count(*) >=2 and fullname <> "" order by fullname;