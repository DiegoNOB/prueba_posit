load("datos.RData")

#### PAQUETES ####
library(shiny)
library(shinyjs)
library(shinyalert)
library(shinyWidgets)
library(shinycssloaders)
library(dplyr)
library(tidyr)
library(stringr)
library(DT)
library(meta)
#devtools::install_version("meta", version = "6.0-0", repos = "http://cran.us.r-project.org")

#### INTERFAZ ####

MiInterfaz <- fluidPage(

  navbarPage(
    
    id = "id_navbar",
    theme = "estilo.css",
    title = "Titulo App",
    
    tabPanel(
      
      title = "Analysis",
      
      sidebarPanel(
        width = 3,
        radioButtons(
          inputId = "id_feo",
          label = "Filtro I",
          choices = c("red", "black", "white")
        )
      ), 
      
      mainPanel(
        
        width = 9,

        tabsetPanel(
          
          type = "pills",
          
          tabPanel(
            title = "Forest Plot / Meta-analysis",
            tableOutput(outputId = "tabla")
          )

        )
      ) #Fin del Main Panel
    ), #Fin del tabpanel 1

    tabPanel(title = "Summary")
    
  ) #navbarpage
)

#### SERVIDOR ####

MiServer <- function(input, output, session) {
  
  output$tabla <- renderTable(datos)
  
}

#### DEPLOY APP ####

shinyApp(ui = MiInterfaz, server = MiServer)
