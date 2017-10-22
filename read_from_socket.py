def myreceive(sock, msg_len):  # msg_len - сколько хотим прочитать
    msg = ''
    while len(msg) < msg_len:
        chunk = sock.recv(msg_len - len(msg))  # далее читаем только то что не успели
        if chunk == '':
            raise RuntimeError("broken")
        msg = msg + chunk
    return msg
