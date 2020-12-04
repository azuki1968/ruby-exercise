require 'socket'
udps = UDPSocket.new()
udps.bind("0.0.0.0", 10000)
p udps.recv(20000)
udps.close
