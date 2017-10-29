def mysend(sock, msg):
    totalsent = 0
    while totalsent < len(msg):
        sent = sock.send(msg[totalsent:])  # начиная со смещения totalsent
        if sent == 0:
            raise RuntimeError("broken")
        totalsent = totalsent + sent
