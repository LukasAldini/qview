#' Summarize Data
#'
#' This function gives a basic summary for numeric columns in a data frame
#' @param df The data frame
#' @return The data frame with summaries for numeric columns
#' @examples
#' df <- data.frame(a = rnorm(100), b = rnorm(100))
#' summarize_data(df)
#' @export
summarize_data <- function(df) {
  library(dplyr)
  summary_df <- df %>%
    summarise(across(where(is.numeric), list(
      mean = ~mean(.x, na.rm = TRUE),
      median = ~median(.x, na.rm = TRUE),
      min = ~min(.x, na.rm = TRUE),
      max = ~max(.x, na.rm = TRUE),
      sd = ~sd(.x, na.rm = TRUE)
    )))

  return(summary_df)
}

#' Plot the Distribution
#'
#' This function creates histograms and boxplots for all numeric columns a data frame
#' @param df The dataframe
#' @return A list of ggplot objects from the dataframe
#' @examples
#' df <- data.frame(a = rnorm(100), b = rnorm(100))
#' plot_distribution(df)
#' @export
plot_distribution <- function(df) {
  library(ggplot2)
  library(dplyr)

  numeric_cols <- df %>% select(where(is.numeric))
  plots <- lapply(names(numeric_cols), function(col) {
    # Use a dynamic binwidth calculation or a fixed number of bins
    num_bins <- 30
    binwidth <- (max(df[[col]], na.rm = TRUE) - min(df[[col]], na.rm = TRUE)) / num_bins

    p1 <- ggplot(df, aes(x = !!sym(col))) +
      geom_histogram(binwidth = binwidth, fill = "red", color = "black") +
      ggtitle(paste("Histogram of", col)) +
      theme_minimal()

    p2 <- ggplot(df, aes(y = !!sym(col))) +
      geom_boxplot(fill = "lightgrey", color = "black") +
      xlab(col) +
      ggtitle(paste("Boxplot of", col)) +
      theme_minimal()

    list(histogram = p1, boxplot = p2)
  })

  names(plots) <- names(numeric_cols)
  return(plots)
}

#' Quick View of Data
#'
#' This function provides a summary and distribution plots for a data frame
#' @param df A data frame.
#' @return A list containing summary statistics and distribution plots of the data frame
#' @examples
#' df <- data.frame(a = rnorm(100), b = rnorm(100))
#' qview(df)
#' @export
qview <- function(df) {
  summary_df <- summarize_data(df)
  plots <- plot_distribution(df)
  return(list(summary = summary_df, plots = plots))
}
