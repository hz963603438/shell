#!/usr/bin/python3

import pymysql
#db = pymysql.connect('127.0.0.1', 'root', '123456', 'test', 3306)
#cursor = db.cursor()
#sql = "insert into user (username, password) values ('hello', '123456');"
#result = cursor.execute(sql)
#print(result)
#db.commit()
#cursor.close()
#db.close()

#db = pymysql.connect('127.0.0.1', 'root', '123456', 'test', 3306)
#cursor = db.cursor()
#sql = "select * from user"
#
#count = cursor.execute(sql)
#result = cursor.fetchall()
#print(result)
#cursor.close()
#db.close()

#db = pymysql.connect('127.0.0.1', 'root', '123456', 'test', 3306)
##cursor = db.cursor()
#cursor = db.cursor(pymysql.cursors.DictCursor)
#sql = "select * from user"
#count = cursor.execute(sql)
#result = cursor.fetchall()
#print(result)
#
#for one in result:
#    print("id is {0}".format( one['id'] ))
#    print("username is {0}".format( one['username'] ))
#    print("password is {0}".format( one['password'] ))
#cursor.close()
#db.close()

db = pymysql.connect('127.0.0.1', 'root', '123456', 'test', 3306)
#cursor = db.cursor( pymysql.cursors.DictCursor )
#username="shijiange"
#sql = "select * from user where username='{0}'".format( username )
#count = cursor.execute(sql)
#result = cursor.fetchall()
#print( result )
#cursor.close()
#db.close()
#select * from user where username='' or '1'='1'

#cursor = db.cursor( pymysql.cursors.DictCursor )
#username="1 or 1 = 1"
#sql = "select * from user where username=%s"
#count = cursor.execute(sql,(username, ) )
#result = cursor.fetchall()
#print( result )
#cursor.close()
#db.close()


#try:
#    db = pymysql.connect('127.0.0.1', 'root', '123456', 'test', 3306)
#    cursor = db.cursor( pymysql.cursors.DictCursor )
#    username="1 or 1 = 1"
#    sql = "select * from userxxx where username=%s"
#    count = cursor.execute(sql,(username, ) )
#    result = cursor.fetchall()
#    print( result )
#    cursor.close()
#    db.close()
#except Exception as e:
#    print( e )

#try:
#    connect = pymysql.connect('127.0.0.1', 'root', '123456', 'test', 3306)
#    cursor = connect.cursor( pymysql.cursors.DictCursor )
#    username="1 or 1 = 1"
#    sql = "select * from userxxx where username=%s"
#    count = cursor.execute(sql,(username, ) )
#    print("Hello")
#    result = cursor.fetchall()
#    print( result )
#    cursor.close()
#    connect.close()
#except Exception as e:
#    print(e)
#    try:
#        cursor.close()
#    except Exception as e:
#        print(e)
#    try:
#        connect.close()
#    except Exception as e:
#        print(e)

try:
    connect = pymysql.connect('127.0.0.1', 'root', '123456', 'test', 3306)
    cursor = connect.cursor( pymysql.cursors.DictCursor )
    username="justdoit"
    sql = "select * from user where username=%s"
    count = cursor.execute(sql,(username, ) )
    result = cursor.fetchall()
    print( result )
except Exception as e:
    print(e)
finally:
    try:
        cursor.close()
    except Exception as e:
        print(e)
    try:
        connect.close()
    except Exception as e:
        print(e)
