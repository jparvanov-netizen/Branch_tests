install.packages("renv")
renv::init()
install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

# 2. Prepare the data
# We'll use mtcars, convert 'cyl' to a factor for better plotting,
# and calculate the average horsepower (hp) per cylinder group.
plot_data <- mtcars %>%
  mutate(cyl = as.factor(cyl)) %>% 
  group_by(cyl) %>%
  summarise(avg_hp = mean(hp))

# 3. Create the graphic
ggplot(plot_data, aes(x = cyl, y = avg_hp, fill = cyl)) +
  geom_col() +
  labs(
    title = "Average Horsepower by Cylinder Count",
    x = "Number of Cylinders",
    y = "Average HP",
    fill = "Cylinders"
  ) +
  theme_minimal()

# 4. (Optional) Show the underlying data
print(plot_data)
