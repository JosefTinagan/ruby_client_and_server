require 'socket'

server = TCPServer.open(2000)

loop {
	client = server.accept
	date = Time.now.ctime
	
	request = client.gets

	#STDERR.puts request
	verb = /GET|POST/.match(request)
	path = /\/\w+\/\w+\.\w+|\/\w+\.\w+/.match(request)
	http_version = /HTTP\/\d+\.\d+/.match(request)

	file = File.join(File.dirname(__FILE__), path.to_s)
	file_exist = File.exist?(file)


	client.puts verb.to_s
	client.puts path.to_s
	client.puts http_version.to_s
	client.puts 

	client.puts file_exist
	client.puts file
	if verb.to_s == "GET"
		client.puts "The Verb is GET"
		if file_exist
			size = File.new(file).size
			content = File.read(file)
			client.puts "#{http_version} 200 OK\r\nDate: #{date}\r\nContent-Type: text/html\r\nContent-Length: #{size}\r\n\r\n#{content}"
		else
			client.puts "404 Not Found, The File does not exist!"
		end

	elsif verb.to_s == "POST"
		client.puts "The Verb is POST"
	end

	#client.puts request.inspect
	client.puts "Closing the connection. Bye!"
	client.close
}