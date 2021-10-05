#Load packages
library(dplyr)
library(ggplot2)
library(openintro)
library(ggthemes) #Pre-built styles

#Prepackaged plot
ggplot(gpa_study_hours, aes(gpa))+
  geom_histogram(binwidth = 0.25, color = "grey60",
                 fill = "lightgoldenrod", size = 1.25)+
  labs(
    title = "GPA of Intro Stats",
    subtitle = "193 students",
    x = "GPA",
    y = "Number of Students",
    caption = "Source: 2012, Private US University"
  )+
  theme_solarized()

# Custom Plot
ggplot(gpa_study_hours, aes(gpa))+
  geom_histogram(binwidth = 0.25, size = 1.25, 
                 color ="#049CD8", fill = "#FBD000")+
  labs(
    title = "GPA of Intro Stats",
    subtitle = "193 students",
    x = "GPA",
    y = "Number of Students",
    caption = "Source: 2012, Private US University"
  )+
  theme(
    plot.background = element_rect(fill = "#43B047"),
    text = element_text(size = 16, face = "italic"),
    axis.text = element_text(color = "black"),
    panel.background = element_rect(fill = "#43B047"),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.y = element_line(color = "#E52521"),
    panel.grid.major.y = element_line(color = "#E52521", size = 1.25)
  )

