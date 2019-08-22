require_relative '../config/environment'
require 'pry'


def welcome
    puts "Welcome to Breweries Go, where you can find and catch your favorite breweries."
    # self.get_username
end

#FIRST PROMPT
welcome

# $current_user = ""
# def get_username
#     puts "Please a username and enter it into the console."
#     # binding.pry
#     $current_user = gets.chomp
#     #username
# end

# def prompt_user_creation
#     User.create(name: get_username)
# end
  
# def get_user_profile
#     User.find_by(name: get_username)
# end


  


def get_login
  puts "Please select an option:"
  puts "1. Login with your Username."
  puts "2. Create a User Profile."
  # use gets to capture the user's input. 
  option = gets.chomp
  if option == '1'
    puts "Please select a username and enter it into the console."
    get_username = gets.chomp
    $current_user = User.find_by(name: get_username)
  elsif option == '2'
    puts "Please select a username and enter it into the console."
    get_username = gets.chomp
    $current_user = User.create(name: get_username)
  else
    puts "Please enter a number that corresponds to one of the options above."   
    get_login
  end
end



#SECOND PROMPT
get_login


def get_menu_option
  puts "Please select an option:"
  puts "1. Search for a Breweries by city."
  puts "2. See your list of Breweries."
  option = gets.chomp
  if option == '1'
    puts "Please enter city"
    city = gets.chomp
    my_list = Brewery.where(location: city)
    my_list.each do |brewery|
        Review.create(user_id: $current_user.id, brewery_id: brewery.id)
    end
    user_list = my_list.map{|brew| brew.name}
    puts user_list
  elsif option == '2'
    # binding.pry
      my_list = Review.where(user_id: $current_user.id)
      puts my_list
  else 
    puts "Please enter a number that corresponds to one of the options above." 
    get_menu_option  
  end
end

#THIRD PROMPT
get_menu_option


def create_review
  puts "Please select an option:"
  puts "1. Give brewery a Rating"
  puts "2. Remove brewery from your list"
  option = gets.chomp
  if option == '1'
    puts "What Brewery would you like to rate"
    brewery = gets.chomp
    puts "What is your rating? (Please rate 1 to 5)"
    rating = gets.chomp
    puts "Please put comments here"
    content = gets.chomp
    current_brewery = Brewery.find_by(name: brewery)
    my_review = Review.find_by(user_id: $current_user.id, brewery_id: current_brewery.id)
    my_review.update(rating: rating, content: content )
  elsif option == '2'
    puts "Which brewery would you like to remove?"
    brewery = gets.chomp
    current_brewery = Brewery.find_by(name: brewery)
    my_review = Review.find_by(user_id: $current_user.id, brewery_id: current_brewery.id)
  end
end

#FOURTH PROMPT
create_review










