# Exercise 5: dplyr grouped operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")
install.packages("dplyr")
# What was the average departure delay in each month?
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data
dep_delay_by_month <- flights %>% 
  group_by(month) %>% 
  summarize(
    delay = mean(dep_delay, na.rm = TRUE)
  )
View(dep_delay_by_month)


# Which month had the greatest average departure delay?
filter(dep_delay_by_month, delay == max(delay))

# If your above data frame contains just two columns (e.g., "month", and "delay"
# in that order), you can create a scatterplot by passing that data frame to the
# `plot()` function
plot(dep_delay_by_month)

# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows
head(flights)
arr_delay_by_dest <- flights %>% 
  group_by(dest) %>% 
  summarize(
    arr_delay = mean(dep_delay, na.rm = TRUE)
  )
View(arr_delay_by_dest)
high_delay_dest <- arr_delay_by_dest %>% 
  filter(arr_delay == max(arr_delay, na.rm = TRUE)) %>% 
  select(dest)

print(high_delay_dest)

# You can look up these airports in the `airports` data frame!
View(airports)

# Which city was flown to with the highest average speed?

View(flight_2)
flight_2 <- mutate(flights, speed = distance/(hour+minute/60))
dest_name <- filter(flight_2, speed == max(speed, na.rm = TRUE)) %>% 
  select(dest)
print(dest_name)


