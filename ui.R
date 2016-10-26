library(shiny)

# Define UI for dataset viewer application
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Properties of a Triangle"),
    sidebarPanel(
        h3('Point 1'),
        numericInput('x1', 'x', 0, min = -1000, max = 1000, step = .1),
        numericInput('y1', 'y', 0, min = -1000, max = 1000, step = .1),
        
        h3('Point 2'),
        numericInput('x2', 'x', 1, min = -1000, max = 1000, step = .1),
        numericInput('y2', 'y', 1, min = -1000, max = 1000, step = .1),
        
        h3('Point 3'),
        numericInput('x3', 'x', 2, min = -1000, max = 1000, step = .1),
        numericInput('y3', 'y', 0, min = -1000, max = 1000, step = .1)
        
        #submitButton('Submit')
    ),
    mainPanel(
        p("The shape and the size of the triangle below can be changed in the 
          side bar (left hand side) by editing the coordinates of its 
          3 corners: Type in new numbers or use the up/down controls."),
        p("The area as well as the circumference of the resulting triangle 
          is given below."),
        plotOutput('plotTriangle'),
        #h3('Properties of the Triangle'),
        h4('Area of the Triangle'),
        verbatimTextOutput("area"),
        h4('Circumference of the Triangle'),
        verbatimTextOutput("circ")
    )
  )
)

