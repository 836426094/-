#coding=utf-8

import pymysql

# conn=pymysql.connect(host='127.0.0.1',user='bian',passwd='123456',db='reposts',charset='utf8')
conn=pymysql.connect(host='127.0.0.1',user='bian',passwd='123456',db='car_market',charset='utf8')
cur=conn.cursor()

def find(sql):
    cur.execute(sql)
    data=cur.fetchall()
    for i in data:
        print (type(i),i,i[0])

        if data.index(i)==100:break




# import cx_Oracle                                     #引用模块cx_Oracle
# conn=cx_Oracle.connect('bian/000000@//127.0.0.1:1521/orcl')    #连接数据库
# c=conn.cursor()                                           #获取cursor
# x=c.execute('select sysdate from dual')                   #使用cursor进行各种操作
# x.fetchone()
# c.close()                                                 #关闭cursor
# conn.close()                                              #关闭连接

import cx_Oracle
conn=cx_Oracle.connect('bian/000000@127.0.0.1:1521/orcl')
c=conn.cursor()
x=c.execute('insert into demo(v) values(:1)',['nice'])
conn.commit();
c.close()
conn.close()

if __name__=="__main__":

    sql='select * from beidafabao_75w'
    find(sql)