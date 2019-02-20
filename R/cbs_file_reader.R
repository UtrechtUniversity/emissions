# cbs_file_reader.R
# 
# Author: Jonathan de Bruin and Barbara Vreede
# Project: Emissions in The Netherlands in 2030
# Creation date: 2019-02-06
# Modification date: 2019-02-06
# 
# Description: Function to read CBS statline files. These files do have header
# and tail information that needs to get removed before parsing the CSV.
#

library(readr)

read_cbs_statline <- function(file, col_names=FALSE, skip_head=NULL, skip_tail=1){
  
  # Read all lines of the file.
  data_lines <- read_lines(file)
  
  # Skip the lines with the header information.
  if (!is.null(skip_head)){
    data_lines <- data_lines[skip_head:length(data_lines)]
  }
  
  # Skip the last line of the CSV. This line contains the copyright and the date
  # on which the datasets was downloaded. Useful, but not for now.
  if (!is.null(skip_tail)){
    data_lines <- head(data_lines, -skip_tail)
  }
  
  # Return a tibble with the data.
  return (read_delim(paste0(data_lines, collapse="\n"), ";", col_names=col_names))
}