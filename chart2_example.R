library(tidyverse)
library(ggplot2)
df_prison_rate <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-jail-rates.csv?raw=true")

df_prison_rate <- df_prison_rate %>% 
  filter(!is.na(female_prison_pop_rate),
         !is.na(male_prison_pop_rate)) 

chart2 <- df_prison_rate %>% group_by(year) %>% summarise(female=mean(female_prison_pop_rate), male=mean(male_prison_pop_rate)) %>% 
  ggplot(aes(x=female, y=male)) +
  geom_point() + geom_smooth(method="lm",color="red") +
  labs(x="Average prison rate(female)",
       y="Average prison rate(male)",
       title="Relation of prison rate between male and female")

chart2
