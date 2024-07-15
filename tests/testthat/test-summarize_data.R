test_that("summarize_data works correctly", {
  df <- data.frame(a = rnorm(100), b = rnorm(100))
  summary_df <- summarize_data(df)
  expect_true(ncol(summary_df) == 10) # 5 stats * 2 columns
  expect_true(all(colnames(summary_df) == c("a_mean", "a_median", "a_min", "a_max", "a_sd", "b_mean", "b_median", "b_min", "b_max", "b_sd")))
})
