import pymysql
conn = pymysql.connect(host='localhost', user='root', password='1234',db='sqlclass_db', charset='utf8')

curs = conn.cursor()
sql = """insert into customer(name, category, region)
values (%s, %s, %s)"""
data = (
('홍진우', 1, '서울'),
('강지수', 2, '부산'),
('김청진', 1, '대구'),
)
# executemany : 여러 개의 tuple 데이터를 처리
curs.executemany(sql, data) # 필요한 인자값을 튜플 형태로 묶어서 전달한다
conn.commit()
print('executemany() 완료')
curs.close()
conn.close()