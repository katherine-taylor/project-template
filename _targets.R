# _targets.R
library(targets)

# import all required packages for the analysis (minus targets)
tar_option_set(packages = c("dplyr","janitor","ggplot2","readr"))

# import functions from a different file
source("R/functions.R")

# set up options
options(tidyverse.quiet = TRUE)

# end the file with a list of target objects.
list(
  # get raw data path
  tar_target(raw_data_file,
             "data/raw_data/raw_data_file.csv",
             format = "file"),
  # load in raw data
  tar_target(raw_data,
             read_data(raw_data_file)),
  # clean raw data
  tar_target(clean_data,
             data_cleaning(raw_data)),
  # save cleaned data
  tar_target(clean_data_file,
             save_clean_data(clean_data),
             format = "file"),
  # analyze data
  tar_target(summary,
             analysis_function(clean_data)),
  #visualize data
  tar_target(plot_file,
             viz_function(clean_data),
             format = "file")
  
)
