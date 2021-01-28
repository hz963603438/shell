import socket


#s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#s.settimeout(2)
#
#result = s.connect_ex(('www.baidu.com', 80))
#if result == 0:
#    print("port is open")
#else:
#    print("port is net open")


import time
while True:
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(2)
    begin_time = time.time()
    result = s.connect_ex( ('www.baidu.com', 80) )
    end_time = time.time()
    run_time = (end_time-begin_time)*1000
    if result == 0:
      print( "port is open, runtime is {0:.2f}".format(run_time) )
    else:
      print( "port is not open, runtime is {0:.2f}".format(run_time) )
    time.sleep(0.5)
