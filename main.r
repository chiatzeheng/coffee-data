library(ggplot2)
# Exclude rows with missing or non-finite values
subset_data <- merged_data_cleaned[complete.cases(merged_data_cleaned$Harvest.Year, merged_data_cleaned$Total.Cup.Points),]

# Convert the columns to numeric
subset_data$Harvest.Year <- as.numeric(subset_data$Harvest.Year)
subset_data$Total.Cup.Points <- as.numeric(subset_data$Total.Cup.Points)

graph <- ggplot(subset_data, aes(x = Harvest.Year, y = Total.Cup.Points, color = Variety)) +
  geom_point(size = 3) +
  geom_smooth(method = "loess", se = FALSE, size = 1.2) +
  labs(x = "Harvest Year", y = "Total Cup Points",
       title = "Relationship between Total Cup Points and Harvest Year",
       color = "Variety") +
  theme_minimal()

print(graph)
