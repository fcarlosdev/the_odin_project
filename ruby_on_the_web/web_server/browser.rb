require 'socket'
require 'json'

host = 'localhost'
port = 2000

system "clear"

puts "Choose the type of request you want to send to server"
puts "1 - Request a resourse (GET)"
puts "2 - Send data to the server (POST)"
print "Option: "
method = gets.chomp
system "clear"
request = ""

if method.eql?"1"
  path = "./index_.html"
  request = "GET #{path} HTTP/1.0\r\n\r\n"
elsif method.eql?"2"
  print "Enter your name: "
  name = gets.chomp
  print "Enter you email: "
  email = gets.chomp

  path = "./thanks.html"
  data = {:viking => {:name=>"#{name}", :email=>"#{email}"} }.to_json
  request = "POST #{path} HTTP/1.0\r\n"+
            "From:#{email}\r\n"+
            "User-Agent:Simple Browser\r\n"+
            "Content-Type:application/json\r\n"+
            "Content-Length:#{data.length}\r\n\r\n#{data}"
else
  puts "Operation unkown."
  exit
end

system "clear"
socket = TCPSocket.open(host,port)
socket.print(request)
response = socket.read
headers,body = response.split("\r\n\r\n", 2)
print headers+"\r\n\r\n"
print body
