library("dplyr")
library("tidyverse")
library("ggplot2")
library("plotly")
library("rsconnect")
library("shiny")


source("app_ui.R")
source("app_server.R")

# Run the application  
shinyApp(ui = ui, server = server)
