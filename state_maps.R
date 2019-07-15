setwd("C:/Summer Practicum/R")
df_merge <- read.csv("C:/Summer Practicum/df_merge.csv")
df = df_merge
library(ggplot2)
#install.packages("devtools")
#devtools::install_github("wmurphyrd/fiftystater")
library(fiftystater)



df[df$addr_state=="AL"] <- alabama
df_merge$addr_state


loan_map <- ggplot(df_merge,aes(map_id = region))+
  geom_map(aes(fill = loan_amnt), map=fifty_states)+
  expand_limits(x = fifty_states$long, y = fifty_states$lat) +
  coord_map() +
  scale_x_continuous(breaks = NULL) + 
  scale_y_continuous(breaks = NULL) +
  labs(x = "", y = "") +
  theme(legend.position = "bottom", 
        panel.background = element_blank())
loan_map



