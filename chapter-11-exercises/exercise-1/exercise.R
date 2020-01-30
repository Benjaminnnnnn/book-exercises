# Exercise 1: working with data frames (review)

# Install devtools package: allows installations from GitHub
install.packages("devtools")

# Install "fueleconomy" dataset from GitHub
devtools::install_github("hadley/fueleconomy")

# Use the `libary()` function to load the "fueleconomy" package
library(fueleconomy)

# You should now have access to the `vehicles` data frame
# You can use `View()` to inspect it
View(vehicles)

# Select the different manufacturers (makes) of the cars in this data set. 
# Save this vector in a variable
manufactures <- vehicles %>% select(make) # %>% distinct(make)
manufactures

# Use the `unique()` function to determine how many different car manufacturers
# are represented by the data set
manufactures %>% unique()

# Filter the data set for vehicles manufactured in 1997
manufactured_1997 <- vehicles %>% filter(year == 1997)
head(manufactured_1997, n = 5)

# Arrange the 1997 cars by highway (`hwy`) gas milage
# Hint: use the `order()` function to get a vector of indices in order by value
# See also:
# https://www.r-bloggers.com/r-sorting-a-data-frame-by-the-contents-of-a-column/
manufactured_1997[order(manufactured_1997$hwy), ]

# Mutate the 1997 cars data frame to add a column `average` that has the average
# gas milage (between city and highway mpg) for each car
manufactured_1997 <- mutate(manufactured_1997, average = mean(manufactured_1997$hwy + manufactured_1997$cty))
manufactured_1997

# Filter the whole vehicles data set for 2-Wheel Drive vehicles that get more
# than 20 miles/gallon in the city. 
# Save this new data frame in a variable.
vehicles_2wd <- filter(vehicles, drive == "2-Wheel Drive", cty > 20)
vehicles_2wd

# Of the above vehicles, what is the vehicle ID of the vehicle with the worst 
# hwy mpg?
# Hint: filter for the worst vehicle, then select its ID.
worst_id <- vehicles_2wd %>% filter(hwy == min(hwy)) %>% select(id)
worst_id

# Write a function that takes a `year_choice` and a `make_choice` as parameters, 
# and returns the vehicle model that gets the most hwy miles/gallon of vehicles 
# of that make in that year.
# You'll need to filter more (and do some selecting)!
vehicle_model <- function(year_choice, make_choice) {
  return(vehicles %>% filter(year == year_choice & make == make_choice) %>%  filter(hwy == max(hwy)) %>% select(model))
}

# What was the most efficient Honda model of 1995?
vehicle_model(1995, "Honda")

