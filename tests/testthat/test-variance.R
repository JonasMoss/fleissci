x <- dat.zapf2016
n <- nrow(x)
sigma <- stats::cov(x) * (n - 1) / n
mu <- colMeans(x)

test_that("avar yields different results for fleiss.", {
  results <- c(
    avar(x, type = "adf", fleiss = TRUE),
    avar(x, type = "elliptical", fleiss = TRUE),
    avar(x, type = "normal", fleiss = TRUE)
  )

  for (i in seq(length(results) - 1)) {
    expect_false(isTRUE(all.equal(results[i], results[i + 1])))
  }
})

test_that("avar yields different results for conger.", {
  results <- c(
    avar(x, type = "adf", fleiss = FALSE),
    avar(x, type = "elliptical", fleiss = FALSE),
    avar(x, type = "normal", fleiss = FALSE)
  )
  for (i in seq(length(results) - 1)) {
    expect_false(isTRUE(all.equal(results[i], results[i + 1])))
  }
})
