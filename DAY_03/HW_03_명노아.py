
import pymysql
import pandas as pd

# 파이썬 파일에서 Mysql 과 연결
conn=pymysql.connect(host='localhost', user='root', password='1234', db='shoppingmall', charset='utf8')
cur = conn.cursor() # cursor생성 : SQL문 실행, 결과 집합 처리, 트랜잭션 관리, 오류 처리를 수행함

def print_line(n, rows, *args) :
    print(f"문제 {n}번")
    print("-------------------------------------------")
    for item in args :
        if item =="연락처" :
            print(f'{item:^{len(item)+8}}', end="")
        else :print(f'{item:^{len(item)+2}}', end="")
    print("\n-------------------------------------------")
    for row in rows:
        print(row)
    print()


cur.execute('''
            drop table if exists buy_table
            ''')
conn.commit()
cur.execute('''
            drop table if exists user_table
            ''')
conn.commit()
cur.execute('''
            CREATE TABLE user_table (
    userID CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 ID
    userName VARCHAR(10) NOT NULL, -- 이름
    birthYear INT NOT NULL, -- 출생년도
    addr CHAR(2) NOT NULL, -- 지역(경기,서울, 경남, 2 글자)
    mobile1 CHAR(3), -- 휴대폰 국번
    mobile2 CHAR(8), -- 휴대폰 나머지 전화번호 (하이픈 제외)
    height SMALLINT, -- 키
    mDate DATE -- 회원 가입일
)
            ''')
conn.commit()
cur.execute('''
            insert into user_table values
('KHD', '강호동', 1970, '경북', '011', '22222222', 182, '2007-07-07'),
('KJD', '김제동', 1974, '경남', NULL, NULL, 173, '2013-03-03'),
('KKJ', '김국진', 1965, '서울', '019', '33333333', 171, '2009-09-09'),
('KYM', '김용만', 1967, '서울', '010', '44444444', 177, '2015-05-05'),
('LHJ', '이휘재', 1972, '경기', '011', '88888888', 180, '2006-04-04'),
('LKK', '이경규', 1960, '경남', '018', '99999999', 170, '2004-12-12'),
('NHS', '남희석', 1971, '충남', '016', '66666666', 180, '2017-04-04'),
('PSH', '박수홍', 1970, '서울', '010', '00000000', 183, '2012-05-05'),
('SDY', '신동엽', 1971, '경기', NULL, NULL, 176, '2008-10-10'),
('YJS', '유재석', 1972, '서울', '010', '11111111', 178, '2008-08-08')
            ''')
conn.commit()
cur.execute('''
            CREATE TABLE buy_table (
    num int AUTO_INCREMENT not null primary key, -- 순번
    userID CHAR(8) not null, -- 아이디(FK)
    prodName CHAR(6) not null, -- 물품명
    groupName CHAR(4), -- 분류
    price INT not null, -- 단가
    amount SMALLINT not null, -- 수량
    foreign key (userID) references user_table(userID)
)
            ''')
conn.commit()
cur.execute('''
            insert into buy_table values
(1, 'KHD', '운동화', NULL, 30, 2),
(2, 'KHD', '노트북', '전자', 1000, 1),
(3, 'KYM', '모니터', '전자', 200, 1),
(4, 'PSH', '모니터', '전자', 200, 5),
(5, 'KHD', '청바지', '의류', 50, 3),
(6, 'PSH', '메모리', '전자', 80, 10),
(7, 'KJD', '책', '서적', 15, 5),
(8, 'LHJ', '책', '서적', 15, 2),
(9, 'LHJ', '청바지', '의류', 50, 1),
(10, 'PSH', '운동화', NULL, 30, 2),
(11, 'LHJ', '책', '서적', 15, 1),
(12, 'PSH', '운동화', NULL, 30, 2)

            ''')
conn.commit()
cur.execute('''
            -- 두 테이블을 내부 조인(buy_table.useID와 user_table.userID)한 다음, 아래의 결과와 같이 출력이 되도록 SQL 쿼리를 작성하시오.
-- 1) 내부 조인한 결과에 ‘연락처’ 컬럼 추가
select u.userName, b.prodName, u.addr, concat(u.mobile1,u.mobile2) as 연락처 from user_table as u inner join buy_table as b on u.userID = b.userID
            ''')
rows=cur.fetchall() # 결과 집합 처리
print_line(1, rows, "userName", "prodName", "addr", "연락처")

cur.execute('''
            -- 2) userID가 KYM인 사람이 구매한 물건과 회원 정보 출력

select u.userID, u.userName, b.prodName, u.addr, concat(u.mobile1, u.mobile2) from user_table as u inner join buy_table as b 
on u.userID = b.userID where u.userID = 'KYM'
            ''')
rows=cur.fetchall() # 결과 집합 처리
print_line(2, rows, "userID", "userName", "prodName", "addr", "연락처")
cur.execute('''
            -- 3) 전체 회원이 구매한 목록을 회원 아이디 순으로 정렬
select u.userID, u.userName, b.prodName, u.addr, concat(u.mobile1, u.mobile2) as 연락
 from user_table as u inner join buy_table as b on u.userID = b.userID
 order by u.userID
            ''')
rows=cur.fetchall() # 결과 집합 처리
print_line(3, rows, "userID", "userName", "prodName", "addr", "연락처")
cur.execute('''
            -- 4) 쇼핑몰에서 한 번이라도 구매한 기록이 있는 회원 정보를 회원 아이디 순으로 출력(distinct 사용)
-- select distinct userID from buy_table;
select u.userID, u.userName, u.addr from user_table as u inner join buy_table as b on u.userID = b.userID
where u.userID in (select distinct userID from buy_table) group by u.userID order by u.userID
            ''')
rows=cur.fetchall() # 결과 집합 처리
print_line(4, rows, "userID", "userName", "addr")
cur.execute('''
            -- 5) 쇼핑몰 회원 중에서 주소가 경북과 경남인 회원 정보를 회원 아이디 순으로 출력
select u.userID, u.userName, u.addr, concat(u.mobile1,u.mobile2) as 연락
 from user_table as u inner join buy_table as b on u.userID = b.userID where u.addr in ('경북','경남')
            ''')
rows=cur.fetchall() # 결과 집합 처리
print_line(5, rows, "userID", "userName", "addr", "연락처")





cur.close()
conn.close()





'''SELECT문
cur.execute('select * from language') # SQL문 실행
rows=cur.fetchall() # 결과 집합 처리
print(rows)

    그 이외
curs.execute(sql, ('이연수', 2, '서울'))
conn.commit()   
'''

#language_df=pd.DataFrame(rows) # DataFrame으로 변환
#print(language_df)