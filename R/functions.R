# functions.R

# this file contains functions sourced into _targets.R 
# for the purpose of running a statistical analysis.

read_data <- function(raw_data_path){
  raw_data <- read_csv(raw_data_path, col_types = cols())
  raw_data
}

data_cleaning <- function(raw_data){
  clean_data <- clean_names(raw_data)
  clean_data
}

# functions that export a file need to return the file path
save_clean_data <- function(clean_data){
  write_csv(clean_data, "data/clean_data/clean_data.csv")
  return("data/clean_data/clean_data.csv")
}

analysis_function <- function(clean_data){
  summary(clean_data)
}

viz_function <- function(clean_data){
  ggplot(clean_data, aes(x = bill_length_mm, y = bill_depth_mm, fill = species))+ 
    geom_point()
  ggsave("figures/plot.png", width = 7, height = 7)
  return("figures/plot.png")
}