# Load required Packages
library(RMySQL)
library(dplyr)
library(DBI)
library(ggplot2)
library(shiny)
library(shinythemes)
library(DT)


# Define UI for application 

ui <- fluidPage(

    # Application title
    theme = shinytheme(theme = "flatly"),
    
    titlePanel("Protein Expression Data"),
    
    # Sidebar for taking the input Protein
    sidebarLayout(
        sidebarPanel(
            selectInput(inputId = "protein",
                        label = "Choose a protein:",
                        choices = c("P1","P2","P3","P4","P5","P6","P7","P8")) ## Providing a list of proteins available in the given dataset.
        ),

        # Show a plot and output table
        mainPanel(
            
            # Output: Protein Name ----
            h3(textOutput("caption", container = span)),
            
            # Output: Expression table for chosen Protein 
            DT::dataTableOutput("tbl"),
            
            # Output: BarPlot comparing all the protein and color coding the groups ----
            plotOutput(outputId = "plot1")
        )
    )
)

# Define server logic 
server <- function(input, output, session) {
       
    # setting up a connection with AWS RDS data base instance which is hosting Mysql data base.   
     conn <- dbConnect(
        drv = RMySQL::MySQL(),
        dbname = "ashwin_db",
        host = "ashwin-db-instance.c8l8wjlyirqw.us-east-1.rds.amazonaws.com",
        username = "ashwin",
        password = "Ashwin123")
    
    # Output: Protein Name ----
    output$caption <- renderText({
        input$protein
    })
    
    # Output: Expression table for chosen Protein 
     output$tbl <- DT::renderDataTable({
        
        # running SQL query using our db connection to filter data depending on the Protein chosen by the user. 
        sql_1 <- "SELECT p_exprs.S_id,P_id,expr,G_id FROM p_exprs Left JOIN sample_tbl ON p_exprs.S_id = sample_tbl.S_id where P_id = ?id ;"
        query <- sqlInterpolate(conn, sql_1, id = input$protein ) 
        dbGetQuery(conn,query)
       
    })
     
     # Output: Plot
     output$plot1 <- renderPlot({
         
         sql_2 <- "SELECT p_exprs.S_id,P_id,expr,G_id FROM p_exprs Left JOIN sample_tbl ON p_exprs.S_id = sample_tbl.S_id where P_id = ?id ;"
         query <- sqlInterpolate(conn, sql_2, id = input$protein )
         plot1_data<-dbGetQuery(conn,query)
         
         # plotting the expression value on log scale
         p<-ggplot(plot1_data, aes(x=S_id, y=log2(expr), fill=G_id)) +
             geom_bar(stat="identity")
        
          p+labs(title="Polt")
     })
}

# Run the application 
shinyApp(ui = ui, server = server)
