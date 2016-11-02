require 'jumpstart_auth'
require 'bitly'

class MicroBlogger
  attr_reader :client

  def initialize
    puts 'Initializing MicroBblogger'
    @client = JumpstartAuth.twitter
    Bitly.use_api_version_3
  end

  def tweet(message)
    if message.length <= 140
      @client.update(message)
    else
      puts "The message length is grather than 140 characters."
    end
  end

  def run
    system "clear"
    puts "Welcome to the JSL Twitter Client!"
    command = ""
    while command != "q"
      printf "enter command: "
      input = gets.chomp
      parts = input.split(" ")
      command = parts[0]
      case command
        when 'q' then puts "Goodbye!"
        when 't' then tweet(parts[1..-1].join(" "))
        when 'dm' then dm(parts[1], parts[2..-1].join(" "))
        when 'span' then spam_my_followers(parts[1..-1].join(" "))
        when 'elt' then everyones_last_tweet
        when 's' then shorten(parts[1..-1].join(" "))
        when 'turl' then tweet(parts[1..-2].join(" ") + " " + shorten(parts[-1]))
        else
          puts "Sorry, I don't know how to #{command}"
      end
    end
  end

  def dm(target, message)
    puts "Trying to send #{target} this direct message:"
    puts message
    message = "d @#{target} #{message}"
    screen_names = @client.followers.collect { |follower| @client.user(follower).screen_name }
    if (screen_names.include?target)
      tweet(message)
    else
      puts "You can only send a DM to people who follow you."
    end
  end

  def followers_list
    screen_names = []
    @client.followers.each do |follower|
      screen_names << @client.user(follower).screen_name
    end
    return screen_names
  end

  def spam_my_followers(message)
    followers = followers_list
    followers.each do |follower|
      dm(follower, message)
    end
  end

  def everyones_last_tweet
    friends = @client.friends.collect {|friend| @client.user(friend)}
    friends.sort_by {|friend| friend.screen_name}
    friends.each do |friend|
      puts "Result #{friend.id}"
      puts "Name #{friend.name}"
      timestamp = friend.status.created_at
      puts "#{friend.screen_name} said this #{friend.status.text} on #{timestamp.strftime("%A, %b %d")}..."
      puts ""
    end
  end

  def shorten(original_url)
    # Shortening code
    puts "Shortening this URL: #{original_url}"
    shortened_url = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
    return shortened_url.shorten(original_url).short_url
  end

end

blogger = MicroBlogger.new
blogger.run

# @SpamBotTest123456

# bb77d428023b17462816019b028832305834bb08
