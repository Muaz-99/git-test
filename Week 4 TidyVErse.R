library(tidyverse)
iris
tbl_iris <- as_tibble(iris)
tbl_iris
view(tbl_iris)

# Subsetting data.frame
iris[1, ] #first row
iris[ ,1]  # First column

#subsetting tibbles

tbl_iris[1, ] #same as data.frame
tbl_iris[, 1] #a bit different
tbl[, 1, drop = TRUE]

# PArtial MAtching
iris$Species
tbl_iris$Sp

data.frame{
  x = 1:3,
  y = c("A","B", "C")
  z = factor}n

}

storms
EDAWR::storms

EDAWR::cases

EDAWR::pollution

cases
pivot_longer(cases,
             cols = c("2011", "2012","2013"),
             names_to = "year",
             values_to = "count")

EDAWR::pollution
pivot_wider(pollution,
            id_cols = "city",
            names_from = "size",
            values_from = "amount")

EDAWR::storms
separate(storms,
         col = "date",
         into = c("year", "month", "day"),
         sep="-")
library(nycflights13)
library(nycflights13)
flights
view(flights)
?flights
# How many flights to LAX did each of the legacy carriers (AA, UA, DL and US)
#have in MAy from JFK, and what is their average duration?

flights %>%
  filter(dest =="LAX") %>%
  filter(origin=="JFK") %>%
  filter(carrier %in% c("AA", "UA", "DL", "US")) %>%
  filter(month == 5) %>%
  select(carrier, month, origin, dest, air_time) %>%
  summarise (
    count = n(),
    avg_dur = mean(air_time, na.rm = TRUE)
  )

# Group wrangling
pollution %>%
 group_by(city) %>%
   summarise(
    sun=sum(amount),
    count = n(),
    mean = mean(amount)
  )