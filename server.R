# server.R

library(quantmod)
library(PerformanceAnalytics)


shinyServer(function(input, output) {
    
    
        
        data1 <- reactive({
                 getSymbols(input$symb_1, 
                 from = "2000-01-01",
                 to = as.character(Sys.Date()),
                 auto.assign = FALSE)
        })
        data2 <- reactive({
                 getSymbols(input$symb_2, 
                 from = "2000-01-01",
                 to = as.character(Sys.Date()),
                 auto.assign = FALSE)
        }) 
        
        #output peformance graphs
        output$plot <- renderPlot({
        d1 <- Cl(to.monthly(data1())); r1 <- na.omit(Delt(d1))
        d2 <- Cl(to.monthly(data2())); r2 <- na.omit(Delt(d2))
        PORT <- as.numeric(input$alloc)*r1 + (1-as.numeric(input$alloc))*r2
        fm <<- merge(r1,r2,PORT); names(fm) <- c(input$symb_1,input$symb_2,'PORT')
        charts.PerformanceSummary(fm)
         })
        
        #output table of performance
        output$view <- renderTable({
            input$update
            names(fm)[3] <- 'PORT.ANNUAL'
            t(table.CalendarReturns(fm[,3]))})
            
        output$results <- renderTable({
            #input$update
            d1 <- Cl(to.monthly(data1())); r1 <- na.omit(Delt(d1))
            d2 <- Cl(to.monthly(data2())); r2 <- na.omit(Delt(d2))
            PORT <- as.numeric(input$alloc)*r1 + (1-as.numeric(input$alloc))*r2
            fm <- merge(r1,r2,PORT); names(fm) <- c(input$symb_1,input$symb_2,'PORT')
            
            dd <- apply(na.omit(fm),2,maxDrawdown)
            cagr <- apply(na.omit(fm),2,Return.annualized,scale=12)
            return.df <- data.frame(rbind(cagr,dd))
            names(return.df) <- c(input$symb_1,input$symb_2,"PORT")
            return.df
            
        })
        })
    
