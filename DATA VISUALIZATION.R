#VISUALIZATIONS FOR THE DATA SCIENCE PROJECT
#Execution of all_data into visualizations
#GPA DISTRIBUTION
ggplot(all_data, aes(x = GPA)) +
  geom_histogram(binwidth = 0.2, fill = "#0073C2", color = "white") +
  labs(title = "Distribution of GPA", x = "GPA", y = "Count")

#GPA VS STUDYHOURS
ggplot(all_data, aes(x = Study_Hours, y = GPA)) +
  geom_point(alpha = 0.6, color = "#E69F00") +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  labs(title = "GPA vs Study Hours", x = "Study Hours", y = "GPA")

#GPA VS ATTENDANACE RATE
ggplot(all_data, aes(x = Attendance_Rate, y = GPA)) +
  geom_point(alpha = 0.6, color = "#56B4E9") +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  labs(title = "GPA vs Attendance Rate", x = "Attendance Rate (%)", y = "GPA")


#GPA VS GENDER
ggplot(all_data, aes(x = Gender, y = GPA, fill = Gender)) +
  geom_boxplot() +
  labs(title = "GPA by Gender", x = "Gender", y = "GPA") +
  scale_fill_brewer(palette = "Pastel1")

#CORRELATION HEAT MAP
library(corrplot)

# Select numeric columns
numeric_data <- all_data %>%
  select(GPA, Study_Hours, Attendance_Rate) %>%
  na.omit()

cor_matrix <- cor(numeric_data)

corrplot(cor_matrix, method = "color", type = "upper", tl.col = "black", tl.srt = 45)
