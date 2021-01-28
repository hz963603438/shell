
import paramiko

# transport = paramiko.Transport('10.0.1.100', 22)
# pkey = paramiko.RSAKey.from_private_key_file('/root/.ssh/id_rsa')
# transport.connect(username='root', pkey=pkey)
# sftp = paramiko.SFTPClient.from_transport(transport)
# # result = sftp.put('/tmp/shijiange.txt', '/root/shijiange.txt')
# result = sftp.get('/root/shijiange.txt', '/var/shijiange.txt')
# sftp.close()
# transport.close()

def remoteExecCommand(ip,port,username,command):
    try:
        transport = paramiko.Transport(ip, port)
        pkey = paramiko.RSAKey.from_private_key_file('/root/.ssh/id_rsa')
        transport.connect(username=username, pkey=pkey)
        ssh = paramiko.SSHClient()
        ssh._transport = transport
        stdio, stdout, stderr = ssh.exec_command(command)
        channel = stdout.channel
        status = channel.recv_exit_status()
        stdout = stdout.read().decode()
        stderr = stderr.read().decode()
        return {"status": status, "stdout": stdout, "stderr": stderr}
    except Exception as e:
        print(e)
    finally:
        try:
            ssh.close()
        except Exception as e:
            print(e)
        try:
            transport.close()
        except Exception as e:
            print(e)

def remoteput(ip, port, username, localpath, remotepath):
    try:
        transport = paramiko.Transport(ip, port)
        pkey = paramiko.RSAKey.from_private_key_file('/root/.ssh/id_rsa')
        transport.connect(username=username, pkey=pkey)
        sftp = paramiko.SFTPClient.from_transport(transport)
        result = sftp.put(localpath, remotepath)
        return result

    except Exception as e:
        print(e)
    finally:
        try:
            sftp.close()
        except Exception as e:
            print(e)
        try:
            transport.close()
        except Exception as e:
            print(e)


def remoteGet(ip, port, username, remotepath, localpath):
    try:
        transport = paramiko.Transport(ip, port)
        pkey = paramiko.RSAKey.from_private_key_file('/root/.ssh/id_rsa')
        transport.connect(username=username, pkey=pkey)
        sftp = paramiko.SFTPClient.from_transport(transport)
        result = sftp.get(remotepath, localpath)
        return result
    except Exception as e:
        print( e )
    finally:
        try:
            sftp.close()
        except Exception as e:
            print(e)
        try:
            transport.close()
        except Exception as e:
            print(e)

if __name__ == "__main__":
    #result = remoteExecCommand( '10.0.1.100', 22, 'root', "ls /; ls /nonono" )
    #print( result )
    #remoteput( '10.0.1.100', 22, 'root', '/tmp/shijiange.txt', '/usr/local/src/shijiange.txt' )
    remoteGet('10.0.1.100', 22, 'root', '/usr/local/src/shijiange.txt', '/soft/python/shijiange.txt')

