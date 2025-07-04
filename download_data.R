library(worldmet)
library(dplyr)
library(lubridate)
library(ggplot2)

station_id <- "727930-24233"
rds_path <- "data/seattle_weather_2024.rds"  # save in a data/ folder

if (!file.exists(rds_path)) {
  seattle_weather <- importNOAA(
    code = station_id,
    year = 2024,
    hourly = TRUE,
    path = tempdir()
  )
  dir.create("data", showWarnings = FALSE)  # create folder if missing
  saveRDS(seattle_weather, rds_path)
  message("Data downloaded and saved.")
} else {
  message("Data already exists. Skipping download.")
}
