% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data-zapf2016.R
\docType{data}
\name{dat.zapf2016}
\alias{dat.zapf2016}
\title{Agreement study from Zapf et. al (2016)}
\format{
A \code{n} times \code{R} matrix. There are \code{n = 50} row corresponding to the
different items. Each of the \code{R = 4} columns contains the ratings of
the \code{j}th judge.
}
\source{
\url{https://biomedcentral.com/articles/10.1186/s12874-016-0200-9#Sec14}
}
\usage{
dat.zapf2016
}
\description{
Agreement study (n = 200) from Zapf et al. (2016) in wide format. There are
\code{50} items \code{4} judges, and ratings from \code{1} to \code{5}. It is
the case that the same set four judges rated every item, hence this
data is suitable for Cohen's kappa.
}
\references{
Zapf, A., Castell, S., Morawietz, L. et al. Measuring inter-rater
reliability for nominal data <U+2013> which coefficients and confidence
intervals are appropriate?. BMC Med Res Methodol 16, 93 (2016).
https://doi.org/10.1186/s12874-016-0200-9
}
\keyword{datasets}
