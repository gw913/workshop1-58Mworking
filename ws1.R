usethis::use_git_config(user.name = "Molly K", user.email = "mok516@york.ac.uk")

# read in the data
chaff <- read.table("raw_data/chaff.txt", header = TRUE)
str(chaff)

# tidy chaff.txt so that all the names in in 1 column and the values are in another
# library tidyverse 
library(tidyverse)
# tidy into chaff2

chaff2 <- pivot_longer(data = chaff, cols = everything(),
                       names_to = "sex", values_to = "mass")
str(chaff2)
# save to file 
file <-  "../workshop1-58Mworking/chaff2.txt"
write.table(chaff2, 
            file, 
            quote = FALSE,
            row.names = FALSE)

# summarise and analyse data
chaff2 %>% 
  group_by(sex) %>% 
  summarise(mean = mean(mass),
            n = length(mass))
# females  20.5    20
# males    22.3    20
library(ggplot2)
chaffplot <- ggplot(data = chaff2, aes(x = sex,
                           y = mass)) +
  geom_boxplot() + theme_classic()

units <- "in"  
fig_w <- 3.5
fig_h <- fig_w
dpi <- 300
device <- "tiff" 

ggsave("..workshop1-58Mworking",
       plot = chaffplot,
       device = device,
       width = fig_w,
       height = fig_h,
       units = units,
       dpi = dpi)
