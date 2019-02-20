# data_cleaning.R
# 
# Author: Jonathan de Bruin and Barbara Vreede
# Project: Emissions in The Netherlands in 2030
# Creation date: 2019-02-06
# Modification date: 2019-02-06
# 
# Description: This script is used to clean the raw CBS data. It removes head
# and tail rows without data and cleans the column Period. 
#

library(stringr)

source("scripts/R/cbs_file_reader.R")


# ------------------------------------------------------------------------\
#     Load Emissions data
# ------------------------------------------------------------------------\

# Read the CBS data file with the emissions.
filepath_cbs_emissions_data <- file.path("data", "Emissions_to_air__ro_190918144657.csv")

data_emissions <- read_cbs_statline(
  filepath_cbs_emissions_data, 
  col_names=c("Source", "Period", "CO2_emission",
             "N2O_emission", "CH4_emission"),
  skip_head=6, 
  skip_tail=1
)

summary(data_emissions)


# ------------------------------------------------------------------------\
#     Clean Emissions data
# ------------------------------------------------------------------------\
 

# --- Clean Period column ---

# It turns out that `Period`` column is a string column because `2017` was
# notated as `2017*`. In this section, we clean this.

data_emissions$Period = parse_integer(
  stringr::str_replace(data_emissions$Period, "[^0-9]+", "")
)


# ------------------------------------------------------------------------\
#     Export cleaned data 'data_emissions' to output folder
# ------------------------------------------------------------------------\

# create the output directory if not exists
dir.create('output', showWarnings = F)

filepath_output_data <- file.path("output", "emissions.csv")
write_csv2(data_emissions, filepath_output_data)
