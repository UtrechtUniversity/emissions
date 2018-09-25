# analysis.R
# 
# Author: Jonathan de Bruin and Barbara Vreede
# Project: Emissions to air project
# Creation date: 2018-09-25
# Modification date: 2018-09-25
# 
# Description: This script does the analysis on the clean data. 
# We estimated the emission for 2020 with this script.
#


# import required libraries
library(ggplot2)
library(dplyr)

# read the clean dataset in from the output folder
data_fp <- file.path("output", "emissions_to_air_190918144657_clean.csv")
data <- read.csv2(data_fp)

# focus on the totals
data_totals <- data %>% 
  filter(Source == "Road traffic, total") %>% 
  arrange(Period)

# plot emission for
data_totals %>% 
  ggplot(aes(Period, CO2.emission)) + geom_line() + 
  ggsave(file.path("figs", "CO2_total.png"))

# estimate the emission for 2020
# Bad statistics <3

a <- (data_totals$CO2.emission[nrow(data_totals)] - data_totals$CO2.emission[1]) /
  (data_totals$Period[nrow(data_totals)] - data_totals$Period[1])

est_CO2_2020 <- data_totals$CO2.emission[nrow(data_totals)] + a * (2020 - data_totals$Period[nrow(data_totals)])
print(est_CO2_2020)

# write result to file.
write.csv(
  data.frame(est_CO2_2020),
  file.path("output", "estimation_CO2_2020.csv")
)

