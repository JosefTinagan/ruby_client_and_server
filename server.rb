require 'socket'

server = TCPServer.open(2000)

loop {
	client = server.accept
	client.puts(Time.now.ctime)
	client.puts "Lol"
	request = client.gets

	#STDERR.puts request

	client.puts request
	client.puts "Closing the connection. Bye!"
	client.close
}