# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
flights_df <- data.frame(flights)

flights_df <- flights_df %>% 
  group_by(dest) %>% 
  summarise(
    avg_arr_delay = mean(arr_delay, na.rm = TRUE)
  ) %>% 
  rename(faa = dest)
left_join(flights_df, airports, by = "faa") %>% 
  select(faa, avg_arr_delay, name)

# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?
avg_arr_delay <- flights_df %>% 
                 group_by(carrier) %>% 
                 summarise(
                   avg_arr_delay = mean(arr_delay, na.rm = TRUE)
                 ) %>% 
                 left_join(airlines, by = "carrier") %>% 
                 arrange(-avg_arr_delay)
avg_arr_delay
