library(shiny)
shinyUI(
    pageWithSidebar(headerPanel("DDP Project 1"), 
    sidebarPanel(
        radioButtons(inputId='n', label="Prediction by",choices=c("Date" = "1", "Name"="2", "What the hell is this"="3"), selected = "1"),
        conditionalPanel(condition="input.n==1",
             div(style="display:inline-block",
                 selectInput("BD", "Give your day of birth",choices=c("1st to 10th" = "1", "11th to 20th" = "2", "21st to 31st" = "3"), selected='2')
             ),
             div(style="display:inline-block",
                 selectInput("BM", "Give your month of birth",choices= c('Jan'='1', 'Feb'='2', 'Mar'='3', 'Apr'='4', 'May'='5', 'Jun'='6', 'Jul'='7', 'Aug'='8', 'Sep'='9', 'Oct'='10', 'Nov'='11', 'Dec'='12'), selected='4')
             )
        ),
        conditionalPanel(condition="input.n==2",
             div(style="display:inline-block",
                 tags$label('Give first letter of your first name', `for` = 'FN'), 
                 tags$select(id = 'FN', class="input-small",
                 tagList(mapply(tags$option, value = 1:26, 
                            c(letters[1:26]), 
                            SIMPLIFY=FALSE)))
             ),
            div(style="display:inline-block",
                tags$label('Give first letter of your last name', `for` = 'LN'), 
                tags$select(id = 'LN', class="input-small",
                    tagList(mapply(tags$option, value = 1:26, 
                        c(letters[1:26]), 
                        SIMPLIFY=FALSE)))                                     
            )
        )
     ),
    mainPanel(h1("Welcome to fortune prediction"),
              textOutput("text1"),
              textOutput("text2"),
              htmlOutput("text") )
    )
)
    