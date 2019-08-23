require_relative '../config/environment'
require 'pry'


def welcome
  puts ""
  puts ""
  puts "Welcome to Breweries Go, where you can find and catch your favorite breweries."
  puts "------------------------------------------------------------------------------"
end

def get_login
  puts "Please select an option:"
  puts "1. Login with your Username."
  puts "2. Create a User Profile."
  puts
  # use gets to capture the user's input. 
  option = gets.chomp
  if option == '1'
    login
  elsif option == '2'
    create_a_user_profile
  else
    puts ""
    puts "*******************************************************"
    puts "The number you entered was not valid. Please try again."  
    puts "*******************************************************"  
    get_login
  end
end



def main_menu
  puts ""
  puts "Please select an option:"
  puts "1. Search for a Breweries by city."
  puts "2. See your list of Breweries."
  puts "3. Exit program."
  puts
  option = gets.chomp
  case option
  when '1'
    search_for_brewery_by_city
  when '2'
    # binding.pry
    if get_your_reviews.length == 0
      puts "It looks like you don't have any breweries in your list."
      puts "Please add breweries to your list by first searching for breweries under option 1."
      main_menu
    end
    print_my_brewery_list
    create_review_or_remove
  when '3'
    exit
  else 
    puts "Please enter a valid choice."
    get_menu_option  
  end
end


#FIRST PROMPT
welcome
#SECOND PROMPT
get_login
#THIRD PROMPT
main_menu
