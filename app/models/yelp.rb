require "json"
require "http"
require "optparse"

CLIENT_ID = ENV["CLIENT_ID"]
CLIENT_SECRET = ENV["CLIENT_SECRET"]

# Constants, do not change these
API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path
TOKEN_PATH = "/oauth2/token"
GRANT_TYPE = "client_credentials"

DEFAULT_BUSINESS_ID = "yelp-san-francisco"
DEFAULT_TERM = "dinner"
DEFAULT_LOCATION = "San Francisco, CA"
SEARCH_LIMIT = 9


class Yelp
  def self.search(term, location)
      url = "#{API_HOST}#{SEARCH_PATH}"
      params = {
        term: term,
        location: location,
        limit: SEARCH_LIMIT
      }

      response = HTTP.auth("Bearer x1BCpyflrQ2j_-HRMKGQwwTV324PckXWIuG_65SwcZQmw5sCoqdaf2rk5vQcuO3QAK9cRgCHxDdL4oCwp_J5sIZQcKI3GKxuw9a1kHAETPmHXWXu-CgK8AlKYjP7WXYx").get(url, params: params)
      response.parse
  end
end
