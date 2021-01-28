
import mysqlpy
sql= "select * from user"
result = mysqlpy.selectbyparameters(sql)
print(result)
