test_that("qview works correctly", {
  library(dplyr)
  df <- data.frame(a = rnorm(100), b = rnorm(100))
  result <- qview(df)
  expect_true("summary" %in% names(result))
  expect_true("plots" %in% names(result))
  expect_true(is.data.frame(result$summary))
  expect_true(length(result$plots) == 2) # 2 numeric columns
})
