
import pymysql

def getconnect():
    try:
        connect = pymysql.connect('127.0.0.1','root','123456','test',3306)
        return connect
    except Exception as e:
        print(e)

def selectbyparameters(sql, params = None):
    try:
        connect = getconnect()
        cursor = connect.cursor(pymysql.cursors.DictCursor)
        cursor.execute(sql, params)
        result = cursor.fetchall()
        return result
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

def updatebypara(sql, params = None):
    try:
        connect = getconnect()
        cursor = connect.cursor(pymysql.cursors.DictCursor)
        count = cursor.execute(sql, params)
        connect.commit()
        return count
    except Exception as e:
        connect.rollback()
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

if __name__ == "__main__":
    #sql = "select * from user where username = %s"
    #sql = "select * from user"
    #sql = "insert into user (username, password) values ('shijiange3', 'mypwd')"
    sql = "insert into user (username, password) values (%s, %s)"
    params = ("lisi", "lisipwd")
    result = updatebypara( sql, params )
    #params = ("justdoit")
    #result = selectbyparameters(sql,params)
    #result = selectbyparameters(sql)
    #result = updatebypara(sql)
    print(result)
