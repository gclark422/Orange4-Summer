setwd("C:/Summer Practicum/R")
df_merge <- read.csv("C:/Summer Practicum/df_merge.csv")
df = df_merge
library(ggplot2)
#install.packages("devtools")
#devtools::install_github("wmurphyrd/fiftystater")
library(fiftystater)



df$region[df$addr_state=="AL"] <- "alabama"
df$region[df$addr_state=="AK"] <- "alaska"
df$region[df$addr_state=="AZ"] <- "arizona"
df$region[df$addr_state=="AR"] <- "arkansas"
df$region[df$addr_state=="CA"] <- 'california'
df$region[df$addr_state=="CO"] <- 'colorado'
df$region[df$addr_state=="CT"] <- 'connecticut'
df$region[df$addr_state=="DE"] <- 'delaware'
df$region[df$addr_state=="FL"] <- 'florida'
df$region[df$addr_state=="GA"] <- 'georgia'
df$region[df$addr_state=="HI"] <- 'hawaii'
df$region[df$addr_state=="ID"] <- 'idaho'
df$region[df$addr_state=="IL"] <- 'illinois'
df$region[df$addr_state=="IN"] <- 'indiana'
df$region[df$addr_state=="IA"] <- 'iowa'
df$region[df$addr_state=="KS"] <- 'kansas'
df$region[df$addr_state=="KY"] <- 'kentucky'
df$region[df$addr_state=="ME"] <- 'maine'
df$region[df$addr_state=="MD"] <- 'maryland'
df$region[df$addr_state=="MA"] <- 'massachusetts'
df$region[df$addr_state=="MI"] <- 'michigan'
df$region[df$addr_state=="MN"] <- 'minnesota'
df$region[df$addr_state=="MS"] <- 'mississippi'
df$region[df$addr_state=="MO"] <- 'missouri'
df$region[df$addr_state=="MT"] <- 'montana'
df$region[df$addr_state=="NE"] <- 'nebraska'
df$region[df$addr_state=="NH"] <- 'new hampshire'
df$region[df$addr_state=="NJ"] <- 'new jersey'
df$region[df$addr_state=="NM"] <- 'new mexico'
df$region[df$addr_state=="NY"] <- 'new york'
df$region[df$addr_state=="NC"] <- 'north carolina'
df$region[df$addr_state=="ND"] <- 'north dakota'
df$region[df$addr_state=="NV"] <- 'nevada'
df$region[df$addr_state=="DE"] <- 'delaware'
df$region[df$addr_state=="OH"] <- 'ohio'
df$region[df$addr_state=="OK"] <- 'oklahoma'
df$region[df$addr_state=="OR"] <- 'oregon'
df$region[df$addr_state=="PA"] <- 'pennsylvania'
df$region[df$addr_state=="RI"] <- 'rhode island'
df$region[df$addr_state=="SC"] <- 'south carolina'
df$region[df$addr_state=="SD"] <- 'south dakota'
df$region[df$addr_state=="TN"] <- 'tennessee'
df$region[df$addr_state=="TX"] <- 'texas'
df$region[df$addr_state=="UT"] <- 'utah'
df$region[df$addr_state=="VT"] <- 'vermont'
df$region[df$addr_state=="VA"] <- 'virginia'
df$region[df$addr_state=="WA"] <- 'washignton'
df$region[df$addr_state=="WV"] <- 'west virginia'
df$region[df$addr_state=="WY"] <- 'wyoming'


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



