require 'net/http'
host = 'www.tutorialspoint.com'
path = '/index.htm'
#comb = host + path

#puts comb

http = Net::HTTP.new(host)
headers, body = http.get(path)

puts headers.code
puts body

if headers.code == "200"
	print body
else
	puts "#{headers.code} #{headers.message}"
end