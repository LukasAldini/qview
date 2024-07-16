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
#' This function creates histograms and boxplots for all numeric columns in the data frame
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
    p1 <- ggplot(df, aes_string(x = col)) +
      geom_histogram(binwidth = 30, fill = "skyblue", color = "black") +
      ggtitle(paste("Histogram of", col)) +
      theme_minimal()

    p2 <- ggplot(df, aes_string(x = "factor(1)", y = col)) +
      geom_boxplot(fill = "lightgreen", color = "black") +
      xlab(col) +
      ggtitle(paste("Boxplot of", col)) +
      theme_minimal() +
      theme(axis.text.x = element_blank(),
            axis.ticks.x = element_blank())

    list(histogram = p1, boxplot = p2)
  })

  names(plots) <- names(numeric_cols)
  return(plots)
}
