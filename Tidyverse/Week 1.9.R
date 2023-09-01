library(tidyverse)
library(remotes)
install.packages("palmerpenguins")
palmerpenguins::penguins %>%
    count(island, species) %>%

# Construct anm contingency table of counts for islands (rows) by species
# (colums) using the pivot functions we just duiscussed

pivot_wider(.,
            id_cols = "island",
            names_from = "species",
            values_from = "n")


## Question 2 ##

#Load data. Then use pivot command to convert dataset to long format
gapminder <- read.csv("gapminder_fertility (1).csv")
gapminder %>%
pivot_longer(cols = "X1960":"X2015",
             names_to = "year",
             values_to = "fertility") %>%
  mutate(yearsep = ifelse(year <1990,
                          "Before 1990",
                          "After 1990")) %>%
  group_by(continent, yearsep) %>%
  summarise(avg_rate = mean(fertility,
                            na.rm = TRUE))

## Question 3 ##

library(nycflights13)
nycflights13::flights

## Questin 4 ##

install.packages("repurrrsive")
library(repurrrsive)
View(sw_people)
View(sw_starships)
View(sw_films)
View(sw_planets)

people <- tibble(people = sw_people) %>%
  unnest_wider(people)

ships <- tibble(ships = sw_starships) %>%
  unnest_wider(ships)
