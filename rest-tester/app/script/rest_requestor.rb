require 'rest-client'


option = 0

while option.to_i != 6
  system('clear')
  puts "===================="
  puts "|       Options    |"
  puts "| 1. List all users|"
  puts "| 2. Show one user |"
  puts "| 3. New user      |"
  puts "| 4. Edit user     |"
  puts "| 5. Save user     |"
  puts "| 6. Exit          |"
  puts "==================="
  print "Choose one option: "
  option = gets.chomp

  url = "http://localhost:3000"

  if option.to_i == 1
    url += "/users"
  elsif option.to_i == 2
    print "Show user number: "
    number = gets.chomp
    url += "/users/"+number
  elsif option.to_i == 3
    url += "/users/new"
  elsif option.to_i == 4
    print "Edit user number: "
    number = gets.chomp
    url += "/users/"+number+"/edit"
  elsif option.to_i == 5
    url += "/users"
  end

  if [1,2,3,4].include?(option.to_i) 
    puts RestClient.get(url)
  elsif option.to_i == 5
    puts RestClient.post(url,"")
  end

  sleep(2)

end
