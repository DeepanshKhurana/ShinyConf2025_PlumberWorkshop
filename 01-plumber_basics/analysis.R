library(tidyverse)
library(nycflights13)
library(echarts4r)

# 1. Delay by carrier
get_delay_summary <- function(min_distance = 500) {
  flights |>
    filter(distance > min_distance) |>
    group_by(carrier) |>
    summarise(
      avg_arr_delay = mean(arr_delay, na.rm = TRUE),
      avg_dep_delay = mean(dep_delay, na.rm = TRUE),
      n_flights = n(),
      .groups = "drop"
    ) |>
    left_join(airlines, by = "carrier") |>
    arrange(desc(avg_arr_delay))
}

# 2. Delay by destination airport
get_airport_delays <- function(min_flights = 200) {
  flights |>
    group_by(dest) |>
    summarise(
      avg_arr_delay = mean(arr_delay, na.rm = TRUE),
      n_flights = n(),
      .groups = "drop"
    ) |>
    filter(n_flights >= min_flights) |>
    left_join(airports, by = c("dest" = "faa")) |>
    arrange(desc(avg_arr_delay))
}

# 3. Daily flight volume
get_daily_volume <- function(origin = NULL) {
  data <- flights
  if (!is.null(origin)) {
    data <- filter(data, origin == {{ origin }})
  }

  data |>
    group_by(date = as.Date(time_hour)) |>
    summarise(
      n_flights = n(),
      .groups = "drop"
    ) |>
    arrange(date)
}

# 4. Top destination airports from an origin
get_top_destinations <- function(origin = "JFK", top_n = 5) {
  flights |>
    filter(origin == {{ origin }}) |>
    count(dest, sort = TRUE) |>
    top_n(top_n, wt = n) |>
    left_join(airports, by = c("dest" = "faa")) |>
    arrange(desc(n))
}

# 5. Plot daily flight volume using echarts4r
plot_daily_volume <- function(origin = NULL) {
  data <- get_daily_volume(origin)
  data |>
    e_charts(date) |>
    e_line(n_flights, name = "Flights") |>
    e_title(
      text = glue::glue(
        "Daily Flights from {origin}"
      )
    ) |>
    e_tooltip(trigger = "axis") |>
    e_datazoom(show = TRUE) |>
    e_theme("westeros")
  
  # Let's customise the theme
}
