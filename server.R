library(shiny)
shinyServer(function(input, output) {
    getFortune<-function(f1, n1, n2, n3, n4) {
        adjH<-c("Good","OK","Great","Bad","Horrible")
        adjF<-c("Look up","Wash away","be decent","greatly increase","Lookup")
        adjR<-c("Cold","OK","Great","Bad","Hot")
        d1<-Sys.Date()-as.Date("1966/04/15", format("%Y/%m/%d"))        
        if(f1 == "1") {
            n1i <- as.numeric(n1)
            n2i<-as.numeric(n2)
            d1<-d1/n1i
            set.seed(d1)
            i<-sample(1:5, 1)
            str1<-paste("your health today will be", adjH[i])
            d1<-d1/(n1i+n2i)
            set.seed(d1)
            i<-sample(1:5, 1)
            str2<-paste("your Fiannces today will ", adjF[i])
            set.seed(n1i+n2i)
            i<-sample(1:5, 1)
           str3<-paste("your romance today will be", adjR[i])
        }
        else if (f1 == "2"){
            n1i <- as.numeric(n3)
            n2i<-as.numeric(n4)
            d1<-d1/n1i
            set.seed(d1)
            i<-sample(1:5, 1)
            str1<-paste("your health today will be", adjH[i])
            d1<-d1/(n1i+n2i)
            set.seed(d1)
            i<-sample(1:5, 1)
            str2<-paste("your Fiannces today will ", adjF[i])
            set.seed(n1i+n2i)
            i<-sample(1:5, 1)
            str3<-paste("your romance today will be", adjR[i])
        }
        else
        {
            str1 <- "Choose the type of prediction you want by clicking a radio button (you asked for help just now) - either by name or buy date."
            str2 <- "If by date, our prediction algorithm needs you to tell us your birth month and the 10 day range of the date you were born in - both are drop down lists for you to chose from."
            str3 <- " For prediction by name, just give us your first and last name initials. Enjoy!"
        }
        HTML(paste(str1, str2, str3, sep='<br/>'))  
    }

    output$text1 <- reactive({if(input$n == "1") paste("Your birth day range is ", input$BD)
                              else if (input$n == "2") paste("Your name starts with ", input$FN)
                              else "We are going to predict your health, wealth and romance for the day"})
    output$text2 <- reactive({if(input$n == "1") paste("Your birth month is ", input$BM)
                              else if (input$n == "2")  paste("Your last name starts with ", input$LN)
                              else "You may give us your initials or birth date"})
    output$text = renderUI({getFortune(input$n,input$BD,input$BM, input$FN, input$LN)})
    
    
})