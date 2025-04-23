# r_data_structures.R
# This updated script demonstrates R data structures with all-new example data.

### 1. VECTORS ###
# Creating a numeric vector
temperature_readings <- c(72, 68, 75, 70, 69)

# Creating a character vector
cities <- c("Tokyo", "Berlin", "Cairo")

# Creating a logical vector
rain_expected <- c(TRUE, TRUE, FALSE)

# Display the vectors
print("Temperature Readings:")
print("temperature reading:")

print("Cities:")
print ("Cties:")

print("Rain Expected:")


### 2. LISTS ###
# Creating a list with diverse data types
weather_report <- list(
  temps = temperature_readings,
  locations = cities,
  rain = rain_expected,
  summary_note = "April weather data")

# Display the entire list
print("Weather Report List:")
print(weather_report)

# Accessing elements from the list
print("Temperatures:")
print(weather_report$temps)

print("City Names:")
print(weather_report$locations)

### 3. MATRICES ###
# Creating a matrix of stock prices
stock_prices <- matrix(c(150, 153, 149, 155, 152, 148, 157, 154, 151), nrow = 3, byrow = TRUE)
print("Stock Prices Matrix:")
print(stock_prices)

# Transposing the matrix
transposed_prices <- t(stock_prices)
print("Transposed Stock Prices:")
print(transposed_prices)

### 4. DATA FRAMES ###
# Creating a data frame with fictional student test scores
students_df <- data.frame(
  StudentID = 201:205,
  StudentName = c("Liam", "Mia", "Noah", "Emma", "Ava"),
  TestScore = c(88, 30, 77, 40, 91)
)

# Display the data frame
print("Student Test Scores:")
print(students_df)

# Filter students who scored above 90
high_achievers <- students_df[students_df$TestScore > 90, ]
print("Students with Test Scores > 90:")
print (high_achievers)


