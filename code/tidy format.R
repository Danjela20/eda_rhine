# Load libraries
library(data.table)
library(ggplot2)

# Step 1: Simulated data.table with country names, catchment area, and elevation
set.seed(123)
hydro_countries <- data.table(
country = c("Norway", "Sweden", "Finland", "Denmark", "Iceland"),
  catchment_area = sample(1000:5000, 5),
  elevation = sample(300:800, 5),
  year_start = sample(1970:1980, 5),
  year_end = sample(1990:2000, 5)
)

# Step 2: Extract key columns
country_info <- hydro_countries[, .(country, catchment_area, elevation)]
print(country_info)

# Step 3: Convert to tidy format
country_long <- melt(
  country_info,
  id.vars = "country",
  variable.name = "attribute",
  value.name = "measurement"
)
print(country_long)

# Step 4: Scatter plot of catchment area vs. elevation
ggplot(country_info, aes(x = catchment_area, y = elevation)) +
  geom_point(color = "darkcyan", size = 3) +
  labs(
    title = "Catchment Area vs. Elevation by Country",
    x = "Catchment Area (km²)",
    y = "Elevation (m)"
  ) +
  theme_minimal()

# Step 5: Plot observation coverage period
coverage_period <- hydro_countries[, .(country, year_start, year_end)]

ggplot(coverage_period, aes(y = country)) +
  geom_segment(
    aes(x = year_start, xend = year_end, yend = country),
    size = 2,
    color = "dodgerblue4"
  ) +
  labs(
    title = "Observation Period by Country",
    x = "Year",
    y = "Country"
  ) +
  theme_minimal()

# Step 6: Highlight missing data years (optional)
years_all <- 1970:2000
coverage_list <- list()

for (i in 1:nrow(hydro_countries)) {
  cn <- hydro_countries$country[i]
  sy <- hydro_countries$year_start[i]
  ey <- hydro_countries$year_end[i]
  for (yr in years_all) {
    coverage_list[[length(coverage_list) + 1]] <- list(
      country = cn,
      year = yr,
      has_data = (yr >= sy & yr <= ey)
    )
  }
}

coverage_dt <- rbindlist(coverage_list)

ggplot(coverage_dt, aes(x = year, y = country, fill = has_data)) +
  geom_tile(color = "white") +
  scale_fill_manual(
    values = c("TRUE" = "darkgreen", "FALSE" = "red3"),
    name = "Data Available?"
  ) +
  labs(
    title = "Runoff Data Availability by Country",
    x = "Year",
    y = "Country"
  ) +
  theme_minimal()

