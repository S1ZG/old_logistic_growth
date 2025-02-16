#Script to estimate the model parameters using a linear approximation

library(dplyr)

growth_data <- read.csv("experiment.csv")

#Case 1. K >> N0, t is small

#Set t<1500 because this is a point where up until then it is a linear shape showing population growth rate
data_subset1 <- growth_data %>% filter(t<1500) %>% mutate(N_log = log(N))

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)


#Case 2. N(t) = K

#Set t>2100 because this is after a point where carrying capacity has been reached
data_subset2 <- growth_data %>% filter(t>2100)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)


