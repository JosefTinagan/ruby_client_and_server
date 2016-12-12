require 'socket'
require 'net/http'


host = 'www.tutorialspoint.com'
port = 80
path = '/index.htm'


request = "GET #{path} HTTP/1.0\r\n\r\n"


http = Net::HTTP.new(host)
puts http
headers, body = http.get(path)

puts headers.code.inspect
puts body 
if headers.code.to_s === "200"
	puts body
else
	puts "#{headers.code} #{headers.message}"
end
=begin


socket = TCPSocket.open(host,port)
socket.print(request)
response = socket.read

headers, body = response.split("\r\n\r\n", 2)
print headers
print body
=end