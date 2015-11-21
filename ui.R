library(shiny)

shinyUI(
    
    navbarPage("Exploring Obesity",
               
               tabPanel(p(icon("info-circle"),"About"),
                      mainPanel(
                          h2("Welcome to the Exploring Obesity Mini App"),
                          
                          p("This small app allows you to look at a few features of obesity trends in the UK. The data set is published by the Health and Social Care Information Centre under an Open Government License. It can be found here:"),
                         
                           a("Data Repository - External Link", href="https://data.gov.uk/dataset/statistics_on_obesity_physical_activity_and_diet_england", target="_blank"),
                          
                          br(),br(),
                          
                          p("At the top of the page in the Navigation Bar, you have three options:"),
                          
                          p("The ",strong("About")," button will return to this page."),
                          
                          p("The ",strong("Graphs")," button will take you to a page showing a linegraph where you can change what data series is displayed."),
                          
                        p("The ",strong("View Data")," button is a drop down which will allow you to look at the data tables                         ."),
                        
                            br(),
                            p(" Pskelton 2015 - github linky here"),
                          br(),
                        
                          h3("Glossary and terms"),
                          br(),
                          p("A finished admission episode (FAE) is the first period of inpatient care under one consultant within one healthcare provider. FAEs are counted against the year in which the admission episode finishes. Admissions do not represent the number of inpatients, as a person may have more than one admission within the year."),
                        
                          p("A finished consultant episode (FCE) is a continuous period of admitted patient care under one consultant within one healthcare provider. FCEs are counted against the year in which they end. Figures do not represent the number of different patients, as a person may have more than one episode of care within the same stay in hospital or in different stays in the same year.")
                          
                        )  
                ),
                
               tabPanel(p(icon("line-chart"),"Graphs"),
                       sidebarPanel(
                           #sidebar
                           h3("Please select graph options"),
                           radioButtons("graphsby", "Show data by:",
                                        c("Gender" = "gen",
                                          "Age" = "age"),
                                        inline = T
                            ),
                           checkboxGroupInput("whatdata","Which data set should be displayed:",
                                              c("Primary Diagnosis - Solid" = "pri","Primary or Secondary - Dots" = "sec",
                                                "Bariatric Surgery - Dashes" = "sur")
                            )
                           #verbatimTextOutput(("inputvalue"))
                       ),
                       mainPanel(
                           #mainpanel
                           #h1("Brutal Main page"),
                           plotOutput("graph1")#,
                          # verbatimTextOutput("hoverout")
                       )
                ),
               
                #graph page
               navbarMenu(p(icon("table"),"View Data"),
                          tabPanel("FAE Primary Diagnosis - Gender",
                                   h3("Finished Admission Episodes in an inpatient setting with a primary diagnosis of obesity in England, by gender, 2003/04 to 2013/14"),
                                   br(),
                                   dataTableOutput("table1")
                            ),
                          tabPanel("FAE Primary Diagnosis - Age",
                                   h3("Finished Admission Episodes in an inpatient setting with a primary diagnosis of obesity in England, by age group, 2003/04 to 2013/14"),
                                   br(),
                                   dataTableOutput("table2")
                            ),
                          tabPanel("FAE Primary or Secondary Diagnosis - Gender",
                                   h3("Finished Admission Episodes in an inpatient setting with a primary or secondary diagnosis of obesity in England, by gender, 2003/04 to 2013/14"),
                                   br(),
                                   dataTableOutput("table3")
                          ),
                          tabPanel("FAE Primary or Secondary Diagnosis - Age",
                                   h3("Finished Admission Episodes in an inpatient setting with a primary or secondary diagnosis of obesity in England, by age group, 2003/04 to 2013/14"),
                                   br(),
                                   dataTableOutput("table4")
                          ),
                          tabPanel("FCE with Bariatric Surgery - Gender",
                                   h3("Finished Consultant Episodes in an inpatient setting with a primary diagnosis of obesity and a main or secondary procedure of 'Bariatric Surgery' in England, by gender, 2003/04 to 2013/14"),
                                   br(),
                                   dataTableOutput("table5")
                          ),
                          tabPanel("FCE with Bariatric Surgery - Age",
                                   h3("Finished Consultant Episodes in an inpatient setting with a primary diagnosis of obesity and a main or secondary procedure of 'Bariatric Surgery' in England, by age, 2003/04 to 2013/14"),
                                   br(),
                                   dataTableOutput("table6")
                          )
                )
     )
    
)