require "byebug"

class CLI

  def initialize
    @current_user = nil
  end

  def login
    puts "Input your email:"
    email = gets.chomp
    @current_user = User.find_by_email(email)
  end

  def make_choice
    puts "What do you want to do?"
    puts "0. Create shortened URL"
    puts "1. Visit shortened URL"

    inputs = gets.chomp.to_i

    if inputs == 0
      puts "Type in your long url"
      long_url = gets.chomp
      # debugger
      short_url_obj = ShortenedUrl.create_for_user_and_long_url!(@current_user, long_url)
      puts "Short url is #{short_url_obj.short_url}"
    else
      puts "Type in the shortened URL"
      short_url = gets.chomp
      shortened_url = ShortenedUrl.find_by_short_url(short_url)
      Launchy.open(shortened_url.long_url)
    end
  end

  def run
    login
    make_choice
    puts "Goodbye!"
  end

end

CLI.new.run
