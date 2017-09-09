require 'rest-client'

puts "Trying Rest Client API"
print "Search for: "
look_for = gets.chomp
response = RestClient.get "https://www.google.com/" ,{params: {q: look_for}}
puts "STATUS: #{response.code}"
puts "HEADER: #{response.headers}"
puts "COOKIES: #{response.cookies}"
puts "BODY: #{response.body}"
