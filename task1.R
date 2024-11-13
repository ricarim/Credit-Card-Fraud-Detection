setwd("~/Desktop/uni/mestrado/fraude/project")

#Import Libraries
library(tidyverse)
library(ggplot2)
library(dplyr)

#Load the csv's into R
cities <- read_csv("data/cities.csv")
customers <- read_csv("data/customers.csv")
merchants <- read_csv("data/merchants.csv")
transactions <- read_csv("data/transactions.csv")

# Save dataset of csv
save(cities,file="data/cities.Rdata")
save(customers,file="data/customers.Rdata")
save(merchants,file="data/merchants.Rdata")
save(transactions,file="data/transactions.Rdata")

#load dataset
load("data/cities.Rdata")
load("data/customers.Rdata")
load("data/merchants.Rdata")
load("data/transactions.Rdata")

#cities 
ggplot(cities, aes(x = city_pop)) +
  geom_histogram(bins = 30, fill = "purple") +
  labs(title = "Cities population distribution", x = "population")

#################################################################
# customers
ggplot(customers, aes(x = gender)) +
  geom_bar(fill = "purple") +
  labs(title = "Client Distribution per Gender")


  #Calculate customer age
customers <- customers %>%
  mutate(age = as.numeric(difftime(Sys.Date(), as.Date(dob), units = "weeks")) / 52.25)

ggplot(customers, aes(x = age)) +
  geom_histogram(bins = 30, fill = "purple") +
  labs(title = "Client age Distribution", x = "age")

#################################################################
#merchants
ggplot(merchants, aes(x = category)) +
  geom_bar(fill = "purple") +
  labs(title = "Distribution by Business Category", x = "category")

#################################################################
# transactions
ggplot(transactions, aes(x = amt, fill = factor(is_fraud))) +
    geom_histogram(bins = 30, position = "dodge") +
    scale_fill_manual(values = c("0" = "blue", "1" = "red"), labels = c("Legit", "Fraud")) +
    labs(title = "Distribution of transactions values", x = "amount", fill = "Type of Transaction")

ggplot(transactions, aes(x = device_os, fill = factor(is_fraud))) +
    geom_bar(position = "dodge") +
    scale_fill_manual(values = c("0" = "blue", "1" = "red"), labels = c("Legit", "Fraud")) +
    labs(title = "Fraud distribution according to each Operation System", fill = "Fraud")

