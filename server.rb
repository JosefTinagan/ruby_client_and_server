require 'socket'

server = TCPServer.open(2000)

loop {
	client = server.accept
	client.puts(Time.now.ctime)
	
	request = client.gets

	#STDERR.puts request
	verb = /GET|POST/.match(request)
	path = /\/\w+\/\w+\.\w+|\/\w+\.\w+/.match(request)
	http_version = /HTTP\/\d+\.\d+/.match(request)

	client.puts verb.to_s
	client.puts path.to_s
	client.puts http_version.to_s


	if verb.to_s == "GET"
		client.puts "The Verb is GET"
	elsif verb.to_s == "POST"
		client.puts "The Verb is POST"
	end

	client.puts request.inspect
	client.puts "Closing the connection. Bye!"
	client.close
}