'''
Connection.cursor() 함수
 - cursor 객체 생성
 - cursor: 쿼리문에 의해 반환되는 결과값을 저장하는 공간

cursor.execute(‘쿼리문장’, args=None) 함수
 - 작성한 쿼리를 실행
cursor.executemany(‘쿼리문장’, 튜플데이터)
 - 한 번에 여러 개의 데이터(튜플데이터) 처리

cursor 객체의 fetch 관련 함수
cursor.fetchall(): 모든 데이터를 한 번에 가져옴 -> Pandas의 DataFrame 으로 변환 가능
cursor.fetchone(): 한 번 호출에 하나의 행만 가져옴
cursor.fetchmany(n): n개 만큼의 데이터를 가져옴

Connection.commit() 함수
 - 데이터를 추가, 수정, 삭제 등의 작업을 수행한 다음에 실행

cursor.close() 함수
 - cursor 객체 종료
'''


import pymysql
import pandas as pd

# 파이썬 파일에서 Mysql 과 연결
conn=pymysql.connect(host='localhost', user='root', password='1234', db='sakila', charset='utf8')

cur = conn.cursor() # cursor생성 : SQL문 실행, 결과 집합 처리, 트랜잭션 관리, 오류 처리를 수행함
cur.execute('select * from language') # SQL문 실행
rows=cur.fetchall() # 결과 집합 처리
print(rows)
language_df=pd.DataFrame(rows) # DataFrame으로 변환
print(language_df)

cur.close()
conn.close()






