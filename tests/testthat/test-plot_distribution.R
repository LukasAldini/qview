test_that("plot_distribution works correctly", {
  df <- data.frame(a = rnorm(100), b = rnorm(100))
  plots <- plot_distribution(df)
  expect_true(length(plots) == 2) # 2 numeric columns
  expect_true(all(names(plots) == c("a", "b")))
})
