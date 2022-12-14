x <- dat.zapf2016
n <- nrow(x)
sigma <- stats::cov(x) * (n - 1) / n
mu <- colMeans(x)

alleq <- \(x, y) isTRUE(all.equal(x, y))

fleisscis <- list(
  fleissci(x, type = "adf"),
  fleissci(x, type = "elliptical"),
  fleissci(x, type = "normal")
)

fleissci_fishers <- list(
  fleissci(x, type = "adf", transform = "fisher"),
  fleissci(x, type = "elliptical", transform = "fisher"),
  fleissci(x, type = "normal", transform = "fisher")
)

congercis <- list(
  congerci(x, type = "adf"),
  congerci(x, type = "elliptical"),
  congerci(x, type = "normal")
)

congerci_fishers <- list(
  congerci(x, type = "adf", transform = "fisher"),
  congerci(x, type = "elliptical", transform = "fisher"),
  congerci(x, type = "normal", transform = "fisher")
)

test_that("fleissci yield different results", {
  for (i in seq(length(fleisscis) - 1)) {
    expect_false(alleq(fleisscis[[i]], fleisscis[[i + 1]]))
  }
})

test_that("fleissci fisher transform does something", {
  for (i in seq(length(fleisscis) - 1)) {
    expect_false(alleq(fleisscis[[i]], fleissci_fishers[[i]]))
  }
})

test_that("congerci fisher transform does something", {
  for (i in seq(length(fleisscis) - 1)) {
    expect_false(alleq(congercis[[i]], congerci_fishers[[i]]))
  }
})

test_that("congerci yield different results", {
  for (i in seq(length(congercis) - 1)) {
    expect_false(alleq(congercis[[i]], congercis[[i + 1]]))
  }
})

test_that("fleissci and congerci yield different results", {
  for (i in seq(length(congercis) - 1)) {
    expect_false(alleq(congercis[[i]], fleisscis[[i]]))
  }
})

test_that("fleissci bootstrap does something", {
  expect_false(alleq(
    fleisscis[[1]],
    fleissci(x, type = "adf", bootstrap = TRUE, n_reps = 10)
  ))
})

test_that("congerci bootstrap does something", {
  expect_false(alleq(
    congercis[[1]],
    congerci(x, type = "adf", bootstrap = TRUE, n_reps = 10)
  ))
})

test_that("print is invisible", {
  capture.output(expect_invisible(print(congercis[[1]])))
})
