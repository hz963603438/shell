import paramiko

#upload
#transport = paramiko.Transport('10.0.1.100', 22)
#pkey = paramiko.RSAKey.from_private_key_file('/root/.ssh/id_rsa')
#transport.connect(username='root', pkey=pkey)
#sftp = paramiko.SFTPClient.from_transport(transport)
#result = sftp.put('/tmp/shijiange.txt', '/root/shijiange.txt')
#sftp.close()
#transport.close()


#download
transport = paramiko.Transport('10.0.1.100', 22)
pkey = paramiko.RSAKey.from_private_key_file('/root/.ssh/id_rsa')
transport.connect(username='root', pkey=pkey)
sftp = paramiko.SFTPClient.from_transport(transport)
# result = sftp.put('/tmp/shijiange.txt', '/root/shijiange.txt')
result = sftp.get('/root/shijiange.txt', '/var/shijiange.txt')
sftp.close()
transport.close()
