require 'socket'

host = 'localhost'
port = 2000
path = '/index.html'

request = "GET #{path} HTTP/1.0\r\n"

socket = TCPSocket.open(host,port)

socket.puts(request)

while line = socket.gets
	puts line.chop
end

socket.close