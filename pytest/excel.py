import xlwt

#workbook = xlwt.Workbook()
#shijiange = workbook.add_sheet('shijiange')
##shijiange.write(0,0,'server_name')
##shijiange.write(0,1,'server_ip')
##shijiange.write(1,0,'shijiange')
##shijiange.write(1,1,'192.168.1.1')
##shijiange.write(2,0,'justdoit')
##shijiange.write(2,1,'192.168.1.2')
#shijiangedata = [
#    ['server_name', 'server_ip'],
#    ['shijange', '192.168.1.1'],
#    ['justdoit', '192.168.1.2'],
#    ['lisi', '192.168.1.3'],
#]
#for i in range(0, len(shijiangedata)):
#    print(len(shijiangedata[i]))
#    for j in range(0, len(shijiangedata[i])):
#        shijiange.write(i, j, shijiangedata[i][j] )
#workbook.save('/tmp/servers.xls')
##workbook.save('/tmp/shijiange.xls')
#

#import xlrd
#workbook = xlrd.open_workbook('/tmp/servers.xls')
#servers = workbook.sheet_by_index(0)
#print( servers.cell(0,0).value )
#print( servers.cell(0,1).value )
#print( servers.cell(1,0).value )

import xlrd
workbook = xlrd.open_workbook('/tmp/servers.xls')
servers = workbook.sheet_by_index(0)
for i in range(0, servers.nrows):
    value = []
    for j in range(0, servers.ncols):
        value.append( servers.cell( i, j ).value )
    if i == 0:
        pass
        #can use if
    else:
        print( value )
