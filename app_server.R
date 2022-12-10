# library("dplyr")
# library("tidyverse")
# library("ggplot2")
# library("plotly")
# library("rsconnect")
# library("shiny")

# Load data
co2_data <- read.csv("./data/owid-co2-data.csv")

# Calculate three values

# What is the average value of co2 in U.S? (average value) 
avg_gas_co2 <- co2_data %>%
  filter(country == "United States") %>%
  mutate(total_gas_co2 = sum(gas_co2, na.rm = TRUE)) %>% 
  summarize(avg_gas_co2 = mean(total_gas_co2)) %>%
  pull(avg_gas_co2)

# When is co2 the highest in the U.S? (year)
highest_gas_co2_year <- co2_data %>%
  filter(country == "United States") %>%
  filter(gas_co2 == max(gas_co2, na.rm = TRUE)) %>%
  pull(year)

# What is the highest value of co2 in the U.S? 
highest_gas_co2_value<- co2_data %>%
  filter(country == "United States") %>%
  filter(gas_co2 == max(gas_co2, na.rm = TRUE)) %>%
  pull(gas_co2)

# Define server logic 

server <- function(input, output) { 
  
  plot <- function(country, year) {
    df <- co2_data %>%
      filter(country %in% input$country) %>%
      filter(`year` >= input$year[1] & `year` <= input$year[2]) 
    return(df)
  } 
  
  
  output$chart <- renderPlotly({
    ggplotly(ggplot(plot(input$country & input$year), aes(x = `year`, y = `gas_co2`)) +
               geom_line(color = "purple") +
               labs(title = "The total amount of Carbon Dioxide from Gas", x = "year", y = "CO2 from Gas"))
  })
  
}

