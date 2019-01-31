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
avg_arr_delay <- flights %>% 
  group_by(dest) %>% 
  summarize(
    arr_delay = mean(arr_delay, na.rm = TRUE)
  )
arrange(b_port, desc(arr_delay))
b_port <- left_join(avg_arr_delay, airports, by = c("dest"="faa"))

large_airport <- b_port %>% 
  filter(arr_delay == max(arr_delay, na.rm = TRUE)) %>% 
  select(name)
  
print(large_airport)
rm(flights)
View(flights)
filter(flights, arr_delay == max(arr_delay))
# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?
View(airlines)
avg_arr_delay_line <- flights %>% 
  group_by(carrier)%>% 
  summarize(
    arr_delay = mean(arr_delay, na.rm = TRUE)
  )
delay_airline <- left_join(avg_arr_delay_line, airlines, by = "carrier")
View(delay_airline)

smallest_airline <- delay_airline %>% 
  filter(arr_delay == min(arr_delay, na.rm = TRUE)) %>% 
  select(name)

print(smallest_airline)
