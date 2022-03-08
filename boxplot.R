## Importing libraries 



library(ggplot2) # to plot ggplots in R chunks
library(dplyr) # for data wrangling 
library(readr) # to read csv and xlsx files
library(plyr)
library(plotly) # to get html figure outputs using ggplotly. Only R-programminh has this option to convert ggplot outputs to plotly just by calling this library
library(tidyverse)






bxplot<- data %>%
  filter(Normal.stress..kPa. >= 350L & Normal.stress..kPa. <= 530L) %>%
  filter(Cycles %in% c(" Sort ", 
                       " Rentre ")) %>%
  filter(!(V1 %in% c("T10_gb_cyc.csv", "T11_gb_cyc.csv", "T12_gb_cyc.csv", "T7_gb_cyc.csv"
  ))) %>%
  ggplot() +
  aes(x = "", y = Stress.ratio, fill = V1) +
  geom_boxplot() +
  scale_fill_brewer(palette = "Set3", direction = 1) +
  labs(
    x = "Shear rate (mm/min)",
    y = "Stress ratio ",
    title = "Normalized shear ",
    subtitle = "500kPa CNL",
    fill = "Test name"
  ) +
  ggthemes::theme_base() +
  theme(
    legend.position = "bottom",
    axis.title.y = element_text(size = 13L,
                                face = "bold"),
    axis.title.x = element_text(size = 13L,
                                face = "bold")
  ) +
  facet_wrap(vars(V2), scales = "free_x")

bxplot

#you can directly use plotly on the graph above 
ggplotly(bxplot)