require_relative '../config/environment'

Brewery.create(name: "Brew1", location: "Seattle", url: "www.brew1.com")
Brewery.create(name: "Brew2", location: "Seattle", url: "www.brew2.com")
Brewery.create(name: "Brew3", location: "Seattle", url: "www.brew3.com")
Brewery.create(name: "Brew4", location: "Seattle", url: "www.brew4.com")

User.create(name: "Sarah")
User.create(name: "John")
User.create(name: "Brad")

#2USERID,BREWERY,RATING,CONTENT

Review.create(user_id: 1, brewery_id: 4, rating: 3, content: "Beer was OK")
Review.create(user_id: 2, brewery_id: 4, rating: 4, content: "Beer was Good")
Review.create(user_id: 3, brewery_id: 4, rating: 5, content: "Beer was Awesome")
