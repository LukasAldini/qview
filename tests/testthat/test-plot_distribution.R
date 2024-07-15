plot_distribution <- function(df, col) {
  library(ggplot2)
  plots <- lapply(names(df), function(col) {
    ggplot(df, aes_string(x = "", y = col)) +
      geom_histogram() +
      ggtitle(paste("Histogram of", col))
  })
  return(plots)
}
