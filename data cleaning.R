install.packages("tidytuesdayR")
tuesdata <- tidytuesdayR::tt_load('2022-09-27')
artists <- tuesdata$artists
library(tidyverse)
library(scales)

clean_artists <- artists |>
  group_by(race) |>
  select(race, type, artists_n) |>
  filter(type == "Writers And Authors")

race_type_plot <- clean_artists |>
  ggplot(aes(x = race, y = artists_n)) +
  geom_col() +
  scale_y_continuous(labels=scales::number_format(),
                     breaks = c(0, 25000, 50000, 75000, 100000, 125000, 150000, 175000, 200000)) +
  labs(title = "Number of Writers and Authors by Race",
       subtitle = "The overwhelming majority of authors are white.",
       x = "Race", y = "Number",
       caption = "Data: National Endowment for the Arts") + 
  theme_minimal()
