library(shiny)

Area <- function(x1, y1, x2, y2, x3, y3) {
    
    ux <- x2 - x1
    uy <- y2 - y1
    
    vx <- x3 - x1
    vy <- y3 - y1
    
    return(abs(ux * vy - vx * uy) / 2)
}

Circ <- function(x1, y1, x2, y2, x3, y3) {
    
    ux <- x2 - x1
    uy <- y2 - y1
    
    vx <- x3 - x1
    vy <- y3 - y1
    
    wx <- x3 - x2
    wy <- y3 - y2
    
    return(sqrt(ux^2 + uy^2) + sqrt(vx^2 + vy^2) + sqrt(wx^2 + wy^2))
}

shinyServer(
  function(input, output) {
      
      output$plotTriangle <- renderPlot({
          
          x <- c(input$x1, 
                 input$x2, 
                 input$x3, 
                 input$x1)
          
          y <- c(input$y1, 
                 input$y2, 
                 input$y3, 
                 input$y1)
          
          t <- c("1", 
                 "2", 
                 "3", 
                 "1")
          
          xmin <- min(x)
          xmax <- max(x)
          if (xmax == xmin) {xmax <- xmin + 1}
          
          ymin <- min(y)
          ymax <- max(y)
          if (ymax == ymin) {ymax <- ymin + 1}
          
          plot(x, y, 
               type="l",
               lwd=10,
               xlab='x', ylab = "y", 
               xlim = c(xmin, xmax),
               ylim = c(ymin, ymax),
               col='lightblue', 
               main='Plot of the Triangle')
          grid (NULL,NULL, lty = 6, col = "cornsilk2")
          text(x, y, t)
      })
      
    output$area <- renderPrint({Area(input$x1,
                                           input$y1,
                                           input$x2,
                                           input$y2,
                                           input$x3,
                                           input$y3)})
    
    output$circ <- renderPrint({Circ(input$x1,
                                     input$y1,
                                     input$x2,
                                     input$y2,
                                     input$x3,
                                     input$y3)})
  }
)
