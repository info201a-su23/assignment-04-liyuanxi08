library(dplyr)

incarceration_WA <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/raw/main/us-prison-jail-rates-1990-WA.csv", stringsAsFactors = FALSE)

df_prison <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-pop.csv?raw=true")

summary_info <- list()

summary_info$num_observations <- nrow(df_prison)

summary_info$num_column <- ncol(df_prison)

summary_info$num_states <- length(unique(df_prison$state))

summary_info$high_p_year <- df_prison %>% 
  filter(total_pop == max(total_pop, na.rm=TRUE)) %>% pull(year)

summary_info$high_p_state <- df_prison %>% 
  filter(total_pop == max(total_pop, na.rm=TRUE)) %>% pull(state)
