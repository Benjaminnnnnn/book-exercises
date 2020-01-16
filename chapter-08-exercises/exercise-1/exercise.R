# Exercise 1: creating and accessing lists

# Create a vector `my_breakfast` of everything you ate for breakfast
my_breakfast <- c("eggs", "oatmeal", "bread", "bananas")
my_breakfast
# Create a vector `my_lunch` of everything you ate (or will eat) for lunch
my_lunch <- c("green peper", "eggs", "rice", "dumplings")
my_lunch
# Create a list `meals` that has contains your breakfast and lunch
meals <- list(my_breakfast=my_breakfast, my_lunch=my_lunch)
meals
# Add a "dinner" element to your `meals` list that has what you plan to eat 
# for dinner
meals$my_dinner <- "undecided"
meals

# Use dollar notation to extract your `dinner` element from your list
# and save it in a vector called 'dinner'
meals$my_dinner

# Use double-bracket notation to extract your `lunch` element from your list
# and save it in your list as the element at index 5 (no reason beyond practice)
meals[5] <- meals[[2]]
meals
# Use single-bracket notation to extract your breakfast and lunch from your list
# and save them to a list called `early_meals`
early_meals <- meals[1:2]
early_meals

### Challenge ###

# Create a list that has the number of items you ate for each meal
# Hint: use the `lappy()` function to apply the `length()` function to each item
list_length <- lapply(meals, length)
list_length

# Write a function `add_pizza` that adds pizza to a given meal vector, and
# returns the pizza-fied vector
add_pizza <- function(meal) {
  meal[length(meal) + 1] <- "pizza"
  pizza_fied <- meal
}
meal <- c("fries", "crab", "cod")
add_pizza(meal)
meal
print(add_pizza(meal))
# Create a vector `better_meals` that is all your meals, but with pizza!
better_meals <- meal[meal != "pizza"]
better_meals

