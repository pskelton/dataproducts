library(shiny)

source("datastrip.R")

library(reshape2)
library(ggplot2)

shinyServer(function(input, output){
    
    #graph outputs on datasets pages
    output$table1 = renderDataTable({yeartotals})
    output$table2 = renderDataTable({totalsbyage})
    
    output$table3 = renderDataTable({secyeartotals})
    output$table4 = renderDataTable({sectotalsbyage})
    
    output$table5 = renderDataTable({surgerytotals})
    output$table6 = renderDataTable({surgerybyage})
    
    # graph output code
    output$graph1 <- renderPlot({
      
        # need to melt data to long format depending on plot options
        if (input$graphsby == "gen"){
            # totals by gender
            prim <- melt(yeartotals,"Year")
            seco <- melt(secyeartotals,"Year")
            surg <- melt(surgerytotals,"Year")
        }
        
        if (input$graphsby == "age"){
            #totals by age
            prim <- melt(totalsbyage,"Year")
            seco <- melt(sectotalsbyage,"Year")
            surg <- melt(surgerybyage,"Year")
        }
         
        # create plot using ggplot2 
       plot <- ggplot() + ggtitle("Obesity data Graph") + xlab("Year") + ylab("Admissions")+theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), legend.title = element_blank())
            
            # conditionally add data frame lines depending on user selection
           if ( "pri" %in% input$whatdata ){
               plot = plot + geom_line(data=prim, aes(x=Year, y=value, group=variable, col=variable), linetype =1)
           }
       
            if ( "sec" %in% input$whatdata ){
                plot = plot + geom_line(data=seco, aes(x=Year,y=value,group=variable, col= variable), linetype =3)
            }
            
            if ( "sur" %in% input$whatdata ){
                plot =  plot + geom_line(data=surg, aes(x=Year, y= value, group=variable, col=variable) , linetype =5)
            }
       
            #if no data is selected then blank grah
            if ( length(input$whatdata) == 0 ){
                plot <- ggplot(data=prim, aes(x=Year,y=value)) + geom_blank() + ggtitle("Obesity data Graph") + xlab("Year") + ylab("Admissions") + annotate("text",x=6,y=6000,label="Please select a data set!") +theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
            }
        
       plot
        
        
    })
    
    
})