# Load packages

library(dplyr) 
library(tidyr) 
library(stat242) 

# Life expectancy

## Mean and standard deviation for life expectancy by country.
life_stats <- project_data %>%
  group_by(country) %>%
  filter(!is.na(life_exp)) %>%
  summarize(life_mean = mean(life_exp),
            life_sd = sd(life_exp))

## Mean and standard deviation for life expectancy by continent.
life_stats <- project_data %>%
  group_by(continent) %>%
  filter(!is.na(life_exp)) %>%
  summarize(life_mean = mean(life_exp),
            life_sd = sd(life_exp))

## Mean and standard deviation for life expectancy by year.
life_stats <- project_data %>% 
  group_by(year) %>%
  filter(!is.na(life_exp)) %>% 
  summarize(mean(life_exp))

## Five number summary for life expectancy for each continent across all years.
life_stats <- project_data %>% 
  group_by(continent) %>% 
  summarize(five_num = fivenum(life_exp),
            num_countries = n()/12) %>% 
  mutate(name = c("min", "q1", "med", "q3", "max")) %>% 
  pivot_wider(names_from = name, 
              values_from = five_num)

## Five number summary for life expectancy for each country across all years.
life_stats <- project_data %>% 
  group_by(country) %>%
  filter(!is.na(life_exp)) %>% 
  summarize(five_num = fivenum(life_exp),) %>%
  mutate(name = c("min", "q1", "med", "q3", "max")) %>% 
  pivot_wider(names_from = name, 
              values_from = five_num)

# Number of phones

## Mean and standard deviation for number of active phones by country.
phone_stats <- project_data %>%
  group_by(country) %>%
  filter(!is.na(num_phones)) %>%
  summarize(num_phones_mean = mean(num_phones),
            num_phones_sd = sd(num_phones))

## Mean and standard deviation for number of active phones by continent. 
phone_stats <- project_data %>%
  group_by(continent) %>%
  filter(!is.na(num_phones)) %>%
  summarize(phone_mean = mean(num_phones),
            phone_sd = sd(num_phones))

## Mean and standard deviation for number of active phones by year. 
phone_stats <- project_data %>%
  group_by(year) %>%
  filter(!is.na(num_phones)) %>%
  summarize(phone_mean = mean(num_phones),
            phone_sd = sd(num_phones))

## Five number summary for number of active phones for each continent across all years.
phone_stats <- project_data %>% 
  group_by(continent) %>% 
  summarize(five_num = fivenum(num_phones),) %>% 
  mutate(name = c("min", "q1", "med", "q3", "max")) %>% 
  pivot_wider(names_from = name, 
              values_from = five_num)

## Five number summary for number of active phones for each country across all years.
phone_stats <- project_data %>% 
  group_by(country) %>% 
  summarize(five_num = fivenum(num_phones),) %>% 
  mutate(name = c("min", "q1", "med", "q3", "max")) %>% 
  pivot_wider(names_from = name, 
              values_from = five_num)