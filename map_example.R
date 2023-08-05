library(dplyr)
library(ggplot2)
library(plotly)
library(usmap)

df_prison <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-pop.csv?raw=true")

num_state <- df_prison %>% 
  group_by(state) %>% 
  summarize(total_prison_pop = n())



prison_pop_map <- plot_usmap("states",
                             data = num_state,
                             values = "total_prison_pop", labels = FALSE) +
  theme(legend.position = "right") +
  labs(title = "United States Prison Population by State", fill = "Total Prison Population") +
  scale_fill_continuous(low = "lightblue", high = "darkblue")

us_map_pop_prison <- ggplotly(prison_pop_map)


