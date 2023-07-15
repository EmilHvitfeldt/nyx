#' Title
#'
#' @return Starts theme selector
#' @export
#'
#' @examplesIf FALSE
#' start_themer()
start_themer <- function() {
  # Define UI for application that draws a histogram
  ui <- shiny::fluidPage(
    shiny::headerPanel("hello"),

    shiny::actionButton("columns", "Add columns"),
    shiny::actionButton("section", "Add Section"),
    shiny::actionButton("fullImage", "Add Full image")
  )

  # Define server logic required to draw a histogram
  server <- function(input, output) {
    shiny::observeEvent(input$columns, {
      rstudioapi::insertText('## Columns\n\n::: columns\n::: {.column width="50%"}\nleft\n:::\n::: {.column width="50%"}\nright\n:::\n:::\n\n')
    })
    shiny::observeEvent(input$section, {
      rstudioapi::insertText('# Section\n\n')
    })
    shiny::observeEvent(input$fullImage, {
      rstudioapi::insertText('##\n\n![](PATHTOIMAGE){.absolute top="0" left="0" width="100%" height="100%" style="max-height:100%; max-width:100%;"}\n\n')
    })
  }

  # Run the application
  shiny::runApp(list(ui = ui, server = server), launch.browser = rstudioapi::viewer)
}
