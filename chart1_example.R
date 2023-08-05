library(tidyverse)
library(ggplot2)
library(RColorBrewer)

incarceration_WA <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/raw/main/us-prison-jail-rates-1990-WA.csv")

all_races <- incarceration_WA %>% 
  select(
    year, 
    aapi_jail_pop_rate,
    black_jail_pop_rate,
    latinx_jail_pop_rate,
    native_jail_pop_rate,
    white_jail_pop_rate
  )

pivoted <- all_races %>% 
  pivot_longer(cols = !year,
               names_to = "race", 
               values_to = "prison_pop")

by_year_by_race <- pivoted %>% 
  group_by(year, race) %>% 
  summarize(total_prison_pop = sum(prison_pop, na.rm = TRUE))

race_labels <- c("AAPI", "Black", "Latinx", "Native", "White")

chart1 <- ggplot(data = by_year_by_race) +
  geom_line(
    mapping = aes(x = year, 
                  y = total_prison_pop, 
                  color = race)) +
  scale_color_brewer(labels = race_labels, palette = "Set1") +
  
  labs(title = "Total Prison Population Rate over Time in WA", x = "Year", y = "Total Prison Pop Rate", color = "Races")

chart1

