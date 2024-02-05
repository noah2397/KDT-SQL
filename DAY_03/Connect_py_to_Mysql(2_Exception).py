import pymysql

def create_table(conn, cur):
    try:
        delete_query = '''drop table if exists customer'''
        query = """
        create table customer(
            name varchar(10),
            category smallint,
            region varchar(10))
        """
        cur.execute(delete_query)
        cur.execute(query)
        conn.commit()
        print('Table 생성 완료')
    except Exception as e: # 예외가 발생되면 해당 구문으로 이동하게 된다
        print(e)
        
def main():
    # 데이터베이스(sqlclass_db) 연결
    conn = pymysql.connect(host='localhost',user='root', password='1234',db = 'sqlclass_db', charset='utf8')
    # cursor 객체 생성
    cur = conn.cursor()
    # 테이블 생성 함수 호출
    create_table(conn, cur)
    # 연결 종료
    cur.close()
    conn.close()
    print('Database 연결 종료')
main()