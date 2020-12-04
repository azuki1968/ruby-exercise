require 'socket'
udps = UDPSocket.new()
udps.send "Hello UDP.", 0, "localhost", 10000
udps.close
