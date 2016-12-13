require 'socket'

host = 'localhost'
port = 2000
path = '/index.html'



puts "What type of request will you be doing? (GET/POST)"
input = gets.chomp.upcase!

if input == "GET"
	request = "GET #{path} HTTP/1.0\r\n"
elsif input == "POST"
	puts "You choose POST"
	puts "You are registering a viking to a raid..."
	puts "What's your viking's name?"
	viking_name = gets.chomp
	puts "What's your email?"
	email = gets.chomp
	
else
	"Invalid input...Closing..."
end



socket = TCPSocket.open(host,port)

socket.puts(request)

while line = socket.gets
	puts line.chop
end

socket.close