#A ShinyApp to allow people to take the Revised Life Optimism Test
library(shiny)


# Define UI for application 
ui <- fluidPage(
  
   # Application title
 titlePanel("Revised Life Orientation Test"),

   # The LOTR questions with radio buttons 
  mainPanel(
      p("Please be as honest and accurate as you can throughout. Try not to let your response to one statement influence your responses to other statements. There are no 'correct' or 'incorrect' answers. Answer according to your own feelings, rather than how you think 'most people' would answer."),
      radioButtons("Q1",label=p("In uncertain times, I usually expect the best"),
                   choices=list("Strongly agree"=4,"Agree"=3,"Neutral"=2,"Disagree"=1,"Strongly disagree"=0),inline=T,selected = character(0)),
      radioButtons("Q2",label=p("It's easy for me to relax"),
                 choices=list("Strongly agree","Agree","Neutral","Disagree","Strongly disagree"),inline=T,selected = character(0)),
   radioButtons("Q3",label=p("If something can go wrong for me, it will"),
                 choices=list("Strongly agree"=0,"Agree"=1,"Neutral"=2,"Disagree"=3,"Strongly disagree"=4),inline=T,selected = character(0)),
   radioButtons("Q4",label=p("I'm always optimistic about my future"),
                 choices=list("Strongly agree"=4,"Agree"=3,"Neutral"=2,"Disagree"=1,"Strongly disagree"=0),inline=T,selected = character(0)),
   radioButtons("Q5",label=p("I enjoy my friends a lot"),
                 choices=list("Strongly agree","Agree","Neutral","Disagree","Strongly disagree"),inline=T,selected = character(0)),
   radioButtons("Q6",label=p("It's important for me to keep busy"),
                 choices=list("Strongly agree","Agree","Neutral","Disagree","Strongly disagree"),inline=T,selected = character(0)),
   radioButtons("Q7",label=p("I hardly ever expect things to go my way"),
                 choices=list("Strongly agree"=0,"Agree"=1,"Neutral"=2,"Disagree"=3,"Strongly disagree"=4),inline=T,selected = character(0)),
   radioButtons("Q8",label=p("I don't get upset too easily"),
                 choices=list("Strongly agree","Agree","Neutral","Disagree","Strongly disagree"),inline=T,selected = character(0)),
   radioButtons("Q9",label=p("I rarely count on good things happening to me"),
                 choices=list("Strongly agree"=0,"Agree"=1,"Neutral"=2,"Disagree"=3,"Strongly disagree"=4),inline=T,selected = character(0)),
   radioButtons("Q10",label=p("Overall, I expect more good things to happen to me than bad"),
                choices=list("Strongly agree"=4,"Agree"=3,"Neutral"=2,"Disagree"=1,"Strongly disagree"=0),inline=T,selected = character(0)),
#The button to get the results and link to the paper   
   br(),actionButton("dotest", "Get results"),hr(),textOutput(outputId="value"), textOutput(outputId="link"),hr(),p("To find out more about optimism and biodiversity conservation, ",a("click here", href="http://link.springer.com/article/10.1007/s10531-018-1665-0")),hr()
   ))
#Outputs
server <- function(input, output,session)  {
  
  
  observeEvent(
    eventExpr = input[["dotest"]],
    handlerExpr = {
      print("PRESSED") 
      output$value<- renderText({
       
      #Outputs generated  
          totalscore<-as.numeric(input$Q1)+as.numeric(input$Q3)+as.numeric(input$Q4)+as.numeric(input$Q7)+as.numeric(input$Q9)+as.numeric(input$Q10)
        if(is.null(input$Q1))
        {  #If they miss a question
          paste("Please answer all the questions")  
        }
        else if(is.null(input$Q2))
        {
          paste("Please answer all the questions")  
        } 
        else if(is.null(input$Q3))
        {
          paste("Please answer all the questions")  
        } 
        else if(is.null(input$Q4))
        {
          paste("Please answer all the questions")  
        } 
        else if(is.null(input$Q5))
        {
          paste("Please answer all the questions")  
        } 
        else if(is.null(input$Q6))
        {
          paste("Please answer all the questions")  
        } 
        else if(is.null(input$Q7))
        {
          paste("Please answer all the questions")  
        } 
        else if(is.null(input$Q8))
        {
          paste("Please answer all the questions")  
        } 
        else if(is.null(input$Q9))
        {
          paste("Please answer all the questions")  
        } 
        else if(is.null(input$Q10))
        {
          paste("Please answer all the questions")  
        } 
        else 
        { #Output if complete all questions
          paste("Your score was ", totalscore,"out of 24. Scores for the revised Life Orientation Test measure dispositional optimism and can range from 0 to 24. Optimistic people anticipate positive outcomes, and the higher you score on this test, the more optimistic you are. Dispositional optimism is a personality trait which relatively stable over time, but a recent meta-analysis suggested it was possible to make people more optimistic. How does your score compare to the mean score of 15.2 found in a sample of 171 conservation professionals in the UK?")
         
        }
              })
    })
  
}
 
shinyApp(ui = ui, server = server)