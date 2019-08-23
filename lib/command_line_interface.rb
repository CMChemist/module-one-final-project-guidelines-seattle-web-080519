# require_relative '../config/environment'

def login
    puts ""
    puts "Please enter your username into the console."
    puts "**Please Note** Usernames are case-sensitive."
    get_username = gets.chomp
    if already_in_table?(get_username, User.all)
        $current_user = User.find_by(name: get_username)
    else
        puts "That username does not exist."
        login_failed
    end
end

def create_a_user_profile
    puts ""
    puts "Please select a username and enter it into the console."
    puts "**Please Note** Usernames are case-sensitive."
    get_username = gets.chomp
    if already_in_table?(get_username, User.all)
        puts "That username already exists."
        profile_creation_failed
    else
        $current_user = User.create(name: get_username)
    end
    
end

def login_failed
    puts "What would you like to do?"
    puts "1. Re-enter your username."
    puts "2. Create a profile."
    puts

    option = gets.chomp

    case option
    when '1'
        login
    when '2'
        create_a_user_profile
    else
        puts "Please enter a valid choice."
        login_failed
    end
end

def profile_creation_failed
    puts "What would you like to do?"
    puts "1. Enter a different username."
    puts "2. Login."
    puts
    option = gets.chomp

    case option
    when '1'
        create_a_user_profile
    when '2'
        login
    else
        puts "Please enter a valid choice."
        profile_creation_failed
    end
end

def already_in_table?(name, table)
    if table.find_by(name: name)
        result = true
    else
        result = false
    end
    result
end
  
def search_for_brewery_by_city
    puts ""
    puts "Please enter a city."
    city = gets.chomp
    hash = get_breweries(city)
    find_info(hash)
    # my_list = Brewery.where(location: city)
    # my_list.each do |brewery|
    #   puts "- #{brewery.name}"
    # end

    what_would_you_like_to_do_with_search_results
    
end

def what_would_you_like_to_do_with_search_results
    puts "What would you like to do?"
    puts "1. Add a brewery to my list." 
    puts "2. Go back to the main menu." 
    option = gets.chomp  
    
    case option
    when '1'
        add_brewery_to_my_list
    when '2'
        main_menu
    else
        puts "Please enter a valid choice."
        what_would_you_like_to_do_with_search_results
    end
end

def add_brewery_to_my_list
    puts ""
    puts "Please enter the name of the brewery you want to add to your list."
    brewery_name = gets.chomp
    brewery = Brewery.find_by(name: brewery_name)

    if !brewery
        puts "You can only add one of the breweries listed above."
        add_brewery_to_my_list
    end

    if Review.find_by(user_id: $current_user.id, brewery_id: brewery.id)
        puts ""
        puts "#{brewery_name} is already on your list."
        what_next_after_brewery_search
    else
        Review.create(user_id: $current_user.id, brewery_id: brewery.id)
        puts ""
        puts "#{brewery_name} has been added to your list."
        what_next_after_brewery_search
    end
end

def what_next_after_brewery_search
    puts "What would you like to do?"
    puts "1. Add another brewery to your list."
    puts "2. Go back to the Main Menu."
    option = gets.chomp

    case option
    when '1'
        add_brewery_to_my_list
    when '2'
        main_menu
    else
        puts "Please enter a valid choice."
        what_next_after_brewery_search
    end

end

def print_my_brewery_list
    puts
    user_list = Review.where(user_id: $current_user.id)
    puts user_list.map {|review| Brewery.find(review.brewery_id).name}
    puts
end

def create_review_or_remove
    puts "Please select an option:"
    puts "1. Give brewery a Rating"
    puts "2. See all your reviews."
    puts "3. Remove brewery from your list"
    puts "4. Go back the Main Menu."
    puts
    option = gets.chomp
    case option
    when '1'
        review_brewery  
    when '2'
        print_your_reviews
    when '3'
        remove_brewery_from_your_list
    when '4'
        main_menu
    else
        puts "Please enter a valid choice."
        create_review_or_remove
    end
  end


  def review_brewery
    puts
    puts "Which Brewery would you like to rate"
    brewery = gets.chomp
    current_brewery = Brewery.find_by(name: brewery)

    if !current_brewery
        puts
        puts "You can only review breweries that are on your list."
        review_brewery
    end

    review_exists = Review.find_by(user_id: $current_user.id, brewery_id: current_brewery.id)
    
    if !review_exists
        puts
        puts "You can only review breweries that are on your list."
        review_brewery
    end

    Review.find_by(user_id: $current_user.id, brewery_id: current_brewery.id)
    puts
    puts "What is your rating? (Please rate 1 to 5)"
    rating = gets.chomp
    if rating.to_i > 5 || rating.to_i < 1
        puts
        puts "Must be a valid rating."
        what_next_after_modifying_your_list
    end
    puts
    puts "Please put comments here"
    content = gets.chomp
    current_brewery = Brewery.find_by(name: brewery)
    my_review = Review.find_by(user_id: $current_user.id, brewery_id: current_brewery.id)
    my_review.update(rating: rating, content: content )
    what_next_after_modifying_your_list
    # else
    #     Review.create(user_id: $current_user.id, brewery_id: brewery.id)
    #     what_next_after_modifying_your_list
    # end
  end

  def get_your_reviews
    Review.where(user_id: $current_user.id)
  end

  def print_your_reviews
    reviews = get_your_reviews
    reviews.each do |review|
        puts
        puts Brewery.find(review.brewery_id).name
        puts "Rating: #{review.rating} stars."
        puts "Comments: #{review.content}"
    end
    what_next_after_modifying_your_list
  end

  def what_next_after_modifying_your_list
    puts
    puts "What you would like to do?"
    puts "1. Continue modifying your list."
    puts "2. GO back to the Main Menu."
    option = gets.chomp
    case option
    when '1'
        create_review_or_remove
    when '2'
        main_menu
    else
        puts "Please enter a valid choice."
        what_next_after_modifying_your_list
    end
  end

  def remove_brewery_from_your_list
    puts "Which brewery would you like to remove?"
    brewery = gets.chomp
    current_brewery = Brewery.find_by(name: brewery)
    
    if !current_brewery
        puts "You can only remove breweries that are on your list."
        remove_brewery_from_your_list
    end

    review_exists = Review.find_by(user_id: $current_user.id, brewery_id: current_brewery.id)
    
    if !review_exists
        puts "You can only remove breweries that are on your list."
        remove_brewery_from_your_list
    end
    
    # review_exists = Review.find_by(user_id: $current_user.id, brewery_id: current_brewery.id)
    # current_brewery = Brewery.find_by(name: brewery)
    # my_review = Review.find_by(user_id: $current_user.id, brewery_id: current_brewery.id)
    review_exists.destroy
    what_next_after_modifying_your_list
  end

