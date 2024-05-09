library(tidyverse)
library(questionr)
library(ggplot2)

data(hdv2003)
d <- hdv2003
head(d)

# Using the filter() function from dplyr
dplyr::filter(d, qualif == "Technicien")

# download the dataset
load(url("https://github.com/larmarange/analyse-R/raw/gh-pages/data/rp99.RData"))
df <- rp99

head(df)

# Using the ggplot() function from ggplot2
ggplot2::ggplot(data = df, aes(x = dipl.sup, y = cadres)) + 
  geom_point()


