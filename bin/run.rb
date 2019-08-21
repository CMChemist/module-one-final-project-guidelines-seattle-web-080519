require_relative '../config/environment'
require 'pry'


def welcome
    puts "Welcome to Breweries Go, where you can find and catch your favorite breweries."
end
  
def get_login
  puts "Please select an option:"
  puts "1. Login with your Username."
  puts "2. Create a User Profile."

  # use gets to capture the user's input. 
  option = gets.chomp
  option
end

def prompt_user_creation
  User.create(name: get_username)
end

def get_user_profile
  User.find_by(name: get_username)
end

def get_username
  puts "Please a username and enter it into the console."
  # binding.pry
  username = gets.chomp
  username
end

def get_menu_option
  puts "Please select an option:"
  puts "1. Search for a Breweries by city."
  puts "2. See your list of Breweries."
    
  # use gets to capture the user's input.
  option = gets.chomp
  return option
end






welcome

option = get_login

if option == '1'
    current_user = get_user_profile
elsif option == '2'
    current_user = prompt_user_creation
else
    puts "Please enter a number that corresponds to one of the options above."   
end

binding.pry

option = get_menu_option

if option == '1'
    
elsif option == '2'
    
else
    puts "Please enter a number that corresponds to one of the options above."   
end



  

