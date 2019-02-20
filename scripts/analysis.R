# analysis.R
# 
# Author: Jonathan de Bruin and Barbara Vreede
# Project: Emissions to air project
# Creation date: 2018-09-25
# Modification date: 2018-09-25
# 
# Description: This script does the analysis on the clean data. 
# We estimated the emission for 2030 with this script.
#


# import required libraries
library(readr)
library(dplyr)
library(ggplot2)

# create the folders to store the results
dir.create(
  file.path("output", "figs"),
  recursive = TRUE,
  showWarnings = FALSE
)

# read the clean dataset in from the output folder
data_fp <- file.path("output", "emissions.csv")
data <- read_csv2(data_fp)

# focus on the totals
data_totals <- data %>% 
  filter(Source == "Road traffic, total") %>% 
  arrange(Period)

# plot emission for
(emissions_plot <- data_totals %>% 
  ggplot(aes(Period, CO2_emission)) + 
    geom_line() + labs(
      title = "Forecast of CO2 emission in The Netherlands.", 
      x = "Year", 
      y = "Emission [mln kgs]"))

# save the plot to a file in the output/figs folder
emissions_plot + ggsave(file.path("output", "figs", "CO2_total.png"))

# estimate the emission for 2030

library(forecast)

# convert the data into a time series.
ts_co2_emissions <- data_totals %>% 
  filter(Period >= 1990) %>% 
  pull(CO2_emission) %>% 
  ts(frequency=1, start= 1990)

# fit an arima model with drift to the time series
fit_co2_emissions <- auto.arima(ts_co2_emissions, seasonal=FALSE)

# Perform a forcast on the data
fcast_co2_emissions <- forecast::forecast(fit_co2_emissions, h=13)

# plot the results and save the plot to a file.
(fcast_plot <- autoplot(fcast_co2_emissions) + 
  geom_forecast(h=13) + 
  labs(
    title = "Forecast of CO2 emission in The Netherlands.", 
    x = "Year", 
    y = "Emission [mln kgs]"))

fcast_plot + ggsave(file.path("output", "figs", "forecast_CO2_emission.png"))

# write result to file.
write.csv(
  fcast_co2_emissions,
  file.path("output", "prediction_CO2_2030.csv")
)

