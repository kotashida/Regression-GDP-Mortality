library(ggplot2)
library(tidyr)
library(readr)

gdp_file_path <- "C:/Users/shida/OneDrive/Programming/Projects/Regression Analysis Correlation Between Child Mortality and GDP per Capita (PPP)/API_NY.GDP.PCAP.PP.CD_DS2_en_csv_v2_31760.csv"
mortality_file_path <- "C:/Users/shida/OneDrive/Programming/Projects/Regression Analysis Correlation Between Child Mortality and GDP per Capita (PPP)/API_SH.DYN.MORT_DS2_en_csv_v2_31650.csv"

# Read data
gdp_data <- read.csv(gdp_file_path, header = TRUE, skip = 4)
mortality_data <- read.csv(mortality_file_path, header = TRUE, skip = 4)

# Clean data
columns_to_exclude <- c("Country.Code", "Indicator.Name", "Indicator.Code")
gdp_data_cleaned <- gdp_data[, !(names(gdp_data) %in% columns_to_exclude)]
mortality_data_cleaned <- mortality_data[, !(names(mortality_data) %in% columns_to_exclude)]
gdp_data_cleaned <- gdp_data_cleaned[, names(gdp_data_cleaned) != "X"]
mortality_data_cleaned <- mortality_data_cleaned[, names(mortality_data_cleaned) != "X"]

# Reshape data
gdp_long <- pivot_longer(gdp_data_cleaned, cols = -Country.Name, names_to = "Year", values_to = "GDP")
mortality_long <- pivot_longer(mortality_data_cleaned, cols = -Country.Name, names_to = "Year", values_to = "Mortality")

# Convert 'Year' to numeric
gdp_long$Year <- as.numeric(sub("^X", "", gdp_long$Year))
mortality_long$Year <- as.numeric(sub("^X", "", mortality_long$Year))

# Merge datasets
combined_data_long <- merge(gdp_long, mortality_long, by = c("Country.Name", "Year"))

# Remove NAs
combined_data_long <- na.omit(combined_data_long)

# Filter data
us_data <- combined_data_long[combined_data_long$Country.Name == "United States", ]

# Create plot
ggplot(us_data, aes(x = GDP, y = Mortality)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Infant Mortality vs. GDP per capita (United States)",
       x = "GDP per capita, PPP (current international $)",
       y = "Mortality rate, infant (per 1,000 live births)") +
  theme_minimal()
