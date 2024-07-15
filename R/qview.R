##' Summarize Data
##'
##' This function gives a basic summary for numeric columns in a data frame
##' @param df The data frame
##' @return The data frame with summarys for numeric columns
##' @examples
##' df <- data.frame(a = rnorm(100), b = rnorm(100))
##' summarize_data(df)
##' @export
summarize_data <- function(df) {
  library(dplyr)
  summary_df <- df %>%
    summarise(across(where(is.numeric), list(
      mean = mean,
      median = median,
      min = min,
      max = max,
      sd = sd
    ), na.rm = TRUE))

  return(summary_df)
}

##' Plot Distribution
##'
##' This function creates histograms and boxplots for all numeric columns in a data frame.
##' @param df A data frame.
##' @return A list of ggplot objects.
##' @examples
##' df <- data.frame(a = rnorm(100), b = rnorm(100))
##' plot_distribution(df)
##' @export
plot_distribution <- function(df) {
  library(ggplot2)
  numeric_cols <- df %>% dplyr::select(where(is.numeric))
  plots <- lapply(names(numeric_cols), function(col) {
    p1 <- ggplot(df, aes_string(col)) +
      geom_histogram(binwidth = 30) +
      ggtitle(paste("Histogram of", col))

    p2 <- ggplot(df, aes_string("", col)) +
      geom_boxplot() +
      ggtitle(paste("Boxplot of", col))

    list(histogram = p1, boxplot = p2)
  })
  names(plots) <- names(numeric_cols)
  return(plots)
}

##' Quick View of Data
##'
##' This function provides a summary and distribution plots for a data frame.
##' @param df A data frame.
##' @return A list containing summary statistics and distribution plots.
##' @examples
##' df <- data.frame(a = rnorm(100), b = rnorm(100))
##' qview(df)
##' @export
qview <- function(df) {
  summary_df <- summarize_data(df)
  plots <- plot_distribution(df)
  return(list(summary = summary_df, plots = plots))
}
