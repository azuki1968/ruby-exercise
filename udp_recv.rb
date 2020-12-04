require 'socket'
udps = UDPSocket.new()
#bind(host, port) 定義したソケットをホストのポートに関連付ける
udps.bind("0.0.0.0", 10000) 
#recvでソケットからデータを引数には受け取り、文字列として返却
p udps.recv(20000)
udps.close
