import paramiko

transport = paramiko.Transport('10.0.1.100', 22)
pkey = paramiko.RSAKey.from_private_key_file('/root/.ssh/id_rsa')
transport.connect(username='root',pkey=pkey)
ssh = paramiko.SSHClient()
ssh._transport = transport
stdio,stdout,stderr = ssh.exec_command("sh /root/test/pytest/shijiange.sh")
channel = stdout.channel
status = channel.recv_exit_status()
stdout = stdout.read().decode()
stderr = stderr.read().decode()
ssh.close()
transport.close()
print("stdout is" + stdout)
print("stderr is" + stderr)
print("status is" + str(status))

sys.exit()
