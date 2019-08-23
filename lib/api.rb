require_relative '../config/environment'
require "json"
require "http"
require "pry"

# require "optparse"


# Place holders for Yelp Fusion's API key. Grab it
# from https://www.yelp.com/developers/v3/manage_app
API_KEY = '5DYoPcPQV0HKJ8-Rsw4C8KbR6KAw4VIu9BbeeOHuYgFy9t5w9OowoUiMT4RTjZUFneIC1IHIX68lVWgwQ9E1SgTksgpR1cXoAL93R-jdp5OQAOwj5wpLQ6c_S25dXXYx'



# Constants, do not change these
API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/" # trailing / because we append the business id to the path


DEFAULT_BUSINESS_ID = "yelp-seattle"
DEFAULT_TERM = "Brewery"
DEFAULT_LOCATION = "Seattle, WA"
SEARCH_LIMIT = 10


def search(location)
url = "#{API_HOST}#{SEARCH_PATH}"
params = {
term: DEFAULT_TERM,
location: location,
limit: SEARCH_LIMIT
}
response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
response.parse
end

def get_breweries(location)
hash = search(location)
end

def get_names(hash)
puts hash["businesses"].map{|x| x["name"]}
end

def find_names(location)
hash = search(location)
puts hash["businesses"].map{|x| x["name"]}
end


hash = get_breweries("Tacoma, WA")

def find_info(hash)
info = []
hash["businesses"].each do |x|
info << x["name"]
info << x["location"]["address1"]
info << x["location"]["city"]
info << x["phone"]
Brewery.create(name: x["name"], location: x["location"]["address1"] + "\n" + x["location"]["city"], phone: x["phone"])
info << "\n"
end
puts info
end


