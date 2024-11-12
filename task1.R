setwd("~/Desktop/uni/mestrado/fraude/project")

#Import Libraries
library(tidyverse)
library(ggplot2)

cities <- read_csv("data/cities.csv")
customers <- read_csv("data/customers.csv")
merchants <- read_csv("data/merchants.csv")
transactions <- read_csv("data/transactions.csv")

save(cities,file="data/cities.Rdata")
save(customers,file="data/customers.Rdata")
save(merchants,file="data/merchants.Rdata")
save(transactions,file="data/transactions.Rdata")
