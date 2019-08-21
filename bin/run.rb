require_relative '../config/environment'
require 'pry'

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


puts "HELLO WORLD"
