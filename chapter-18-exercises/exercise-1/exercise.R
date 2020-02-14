# load relevant libraries
library("httr")
library("jsonlite")

# Be sure and check the README.md for complete instructions!


# Use `source()` to load your API key variable from the `apikey.R` file you made.
# Make sure you've set your working directory!
# setwd("/Users/benjaminzhuang/Desktop/INFO/book-exercises/chapter-18-exercises/exercise-1")
source("apikey.R")

# Create a variable `movie_name` that is the name of a movie of your choice.
movie_name <- "Parasite"

# Construct an HTTP request to search for reviews for the given movie.
# The base URI is `https://api.nytimes.com/svc/movies/v2/`
# The resource is `reviews/search.json`
# See the interactive console for parameter details:
#   https://developer.nytimes.com/movie_reviews_v2.json
#
# You should use YOUR api key (as the `api-key` parameter)
# and your `movie_name` variable as the search query!
query_param <- list(
                "api-key" = access_token,
                "movie_name" = movie_name
               )

base_url <- "https://api.nytimes.com/svc/movies/v2/"
end_point <- "reviews/search.json"

# Send the HTTP Request to download the data
# Extract the content and convert it from JSON
response <- GET(paste0(base_url, end_point), query = query_param)
data <- fromJSON(content(request, as = "text"))

# What kind of data structure did this produce? A data frame? A list?
class(response)

# Manually inspect the returned data and identify the content of interest 
# (which are the movie reviews).
# Use functions such as `names()`, `str()`, etc.
names(data)

# Flatten the movie reviews content into a data structure called `reviews`
flatten(data$results)

# From the most recent review, store the headline, short summary, and link to
# the full article, each in their own variables


# Create a list of the three pieces of information from above. 
# Print out the list.
