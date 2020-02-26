library(tidyverse)
library(ggimage)

picture_files <- list.files("/Users/mollylewis/Downloads/animal_pictures/", full.names = T)

pic_files_df <- tibble(full_file_name = picture_files)

clean_files <- pic_files_df %>%
  mutate(file_name = basename(full_file_name)) %>%
  separate(col = "file_name", sep = "_", into = c("function_name", "animal", "student_name")) %>%
  separate(col = "student_name", sep = "\\.", into = c("student_name", "temp")) %>%
  select(-temp)

tidy_animals <- clean_files %>%
  group_by(function_name) %>%
  mutate(n = n()) %>%
  ungroup()

ggplot(tidy_animals, aes(x = function_name, y = n)) +
  geom_image(aes(image = full_file_name), by = "width") +
  ggtitle("MRM favorite function names") +
  xlab("Favorite funtion name") +
  ylim(1, 5) +
  theme_classic()
