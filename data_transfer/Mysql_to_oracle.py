#coding=utf-8

import pymysql

# conn=pymysql.connect(host='127.0.0.1',user='bian',passwd='123456',db='reposts',charset='utf8')
conn=pymysql.connect(host='127.0.0.1',user='bian',passwd='123456',db='car_market',charset='utf8')
cur=conn.cursor()

def find(sql):
    cur.execute(sql)
    data=cur.fetchall()
    for i in data:
        # print (type(i),i,i[0])

        # if data.index(i)==100:break
        insert_o=f'insert INTO beidafabao values {i}'
        print (f'{data.index(i)},',)
        cur_oracle.execute(insert_o)
    conn_oracle.commit()
    print ('commit Success!')

import cx_Oracle
conn_oracle=cx_Oracle.connect('bian/000000@127.0.0.1:1521/orcl')
cur_oracle=conn_oracle.cursor()
# x=c.execute('insert into demo(v) values(:1)',['nice'])
# conn_oracle.commit()




if __name__=="__main__":

    import time

    start=time.time()

    sql='select * from beidafabao_75w'
    find(sql)

    end=time.time()

    print (f'操作耗时{end-start}秒')


    #一段时间之前的日期
    from datetime import datetime
    from datetime import timedelta

    def get_date(days):
        return datetime.now() - timedelta(days=days)

    print (get_date(101))

    #oracle 数据库关闭
    # cur_oracle.close()
    # conn_oracle.close()