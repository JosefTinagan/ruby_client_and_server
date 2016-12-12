require 'socket'

hostname = 'localhost'
port = 2000

s = TCPSocket.open(hostname, port)

request = "requesting things..."
s.puts(request)


while line = s.gets
	puts line.chop
end

s.close