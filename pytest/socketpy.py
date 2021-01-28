import socket

#serversocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#serversocket.bind(('0.0.0.0', 9999))
#serversocket.listen(5)
#while True:
#    print("wait for connect ...")
#    clientsocket, addr = serversocket.accept()
#    print("one client coming ...")
#    msg = 'your ip is {0}, your port is {1}'.format(addr[0], addr[1])
#    clientsocket.send(msg.encode('utf-8'))
#    clientsocket.close()

import time
#serversocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#serversocket.bind(('0.0.0.0', 9999))
#serversocket.listen(5)
#while True:
#    print("wait for connect ...")
#    clientsocket, addr = serversocket.accept()
#    print("one client coming ...")
#    time.sleep( 5 )
#    msg = 'your ip is: {0}. your port is {1}'.format(addr[0], addr[1])
#    clientsocket.send(msg.encode('utf-8'))
#    clientsocket.close()

import threading
def myAction( clientsocket, addr ):
    time.sleep(5)
    print("one client coming ...")
    msg = 'your ip is: {0}. your port is {1}'.format(addr[0], addr[1])
    clientsocket.send(msg.encode('utf-8'))
    clientsocket.close()
serversocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
serversocket.bind(('0.0.0.0', 9999))
serversocket.listen(5)
while True:
    print("wait for connect ...")
    clientsocket, addr = serversocket.accept()
    t1 = threading.Thread( target=myAction,args=(clientsocket, addr) )
    t1.start()
