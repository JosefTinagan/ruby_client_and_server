require 'socket'
require 'json'

host = 'localhost'
port = 2000
path = '/index.html'
posting_path = '/thanks.html'
http_version = 'HTTP/1.0'

puts "What type of request will you be doing? (GET/POST)"
input = gets.chomp.upcase!

if input == "GET"
	socket = TCPSocket.open(host,port)
	request = "GET #{path} HTTP/1.0\r\n"
	socket.print(request)
	socket.puts("\r\n")

	while line = socket.gets
		puts line.chop
	end

	socket.close
elsif input == "POST"

	puts "You choose POST"
	puts "You are registering a viking to a raid..."
	puts "What's your viking's name?"
	viking_name = gets.chomp
	puts "What's your email?"
	email = gets.chomp
	
	viking_data = {
		viking: { name: viking_name, email: email}
	} 
	p viking_data
	data_to_send = viking_data.to_json
	p data_to_send
	content_size = data_to_send.size
	#request = "POST #{posting_path} #{http_version}\r\nFrom: random@email.com\r\nUser-Agent: HTTPTool/1.0\r\nContent-Type: application/something-encoded\r\nContent-Length: #{content_size}\r\n\r\n#{data_to_send}"
	#request = request.to_json

	socket = TCPSocket.open(host,port)

		#request = "POST #{posting_path}"+"#{http_version}"
		#puts request

		socket.puts("POST #{posting_path} #{http_version}\r\n")
		socket.puts("From: Josef@j.com\r\n")
		socket.puts("User-Agent: HTTPTool/1.0\r\n")
		socket.puts("Content-Type: application/encoded\r\n")
		socket.puts("Content-Length: #{content_size}\r\n")
		socket.puts("\n")
		socket.puts("#{data_to_send}")
		socket.puts("\r\n")
	while line = socket.gets
		puts line.chop
	end
	socket.close
else
	"Invalid input...Closing..."
end

