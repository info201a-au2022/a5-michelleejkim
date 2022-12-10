# library("dplyr")
# library("tidyverse")
# library("ggplot2")
# library("plotly")
# library("rsconnect")
# library("shiny")

# loading dataset
co2_data <- read.csv("./data/owid-co2-data.csv")

first_page <- tabPanel(
  "Introduction",
  h1(strong("Relationship between Global Warming & Carbon Dioxide from Gas")),
  img("", src = "https://cdn.images.express.co.uk/img/dynamic/151/590x/Climate-change-2025-CO2-global-warming-carbon-dioxide-1308968.webp?r=1594731626139",
      width = "600", height = "300", align = "center"),
  p("Climate change is a long-term change in the average weather patterns 
    and environments. One way that facilitates the process of climate change 
    is the increase of carbon dioxide. Carbon dioxide is a greenhouse gas and 
    it has the ability to trap heat and warms the earth. Despite the vulnerability 
    of carbon dioxide, humans produce carbon dioxide emissions from energy production, 
    including burning coal, oil or natural gas. Although it’s impossible to not produce 
    carbon dioxide, it is essential to realize how much carbon dioxide are produced in 
    each country and take action to help limit climate change such as saving energy at 
    home, taking public transportations and more. ")
  
)

second_page <- tabPanel(
  "Three Important Values",
  mainPanel(
    h1(strong("Three Important Values")), 
    p("What is the average value of co2 from gas in U.S? ", strong(avg_gas_co2,"million tones")),
    p("When was co2 from gas the highest in the U.S?" , strong("Year", highest_gas_co2_year)),
    p("What is the highest value of co2 from gas in the U.S? ", strong(highest_gas_co2_value, "million tones"))
  ))



third_page <- tabPanel(
  "Production of Carbon Dioxide",
  sidebarLayout( 
    sidebarPanel( 
      sliderInput( 
        inputId = "year", label = "Select Year:",
        min = 1900, max = 2021, value = c(1900, 2021)
      ),
      selectInput( 
        inputId = "country", label = "Select Country:",
        choices = unique(co2_data$country), selected = NULL
      )),
    mainPanel(
      plotlyOutput("chart")
    )
  ),
  p("Overall, the total amount of carbon dioxide from gas produced in each country is increasing, 
  which indicates that the global temperature is also rising. This chart is important 
  because it reveals that most of the countries are producing excessive amount of 
  carbon dioxide and warns people that if they do not take any further actions, 
  climate change can impact human health and environments. Therefore, this chart
  gives people from all nation a message to take actions to limit global warming. 
 ")
)



#Define UI
ui <- navbarPage(
  "Global Warming",
  first_page,
  second_page,
  third_page
)