% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/magrittr_extensions.R
\name{prefix}
\alias{prefix}
\title{Prefix a string of text}
\usage{
prefix(text, ...)
}
\arguments{
\item{text}{goes to the end, rest}

\item{...}{goes to the front.}
}
\value{
Character. Character chain with the prefix added.
}
\description{
Convenience function to use with magrittr
wraps \code{\link[=paste0]{paste0()}}, hence vectorised as \code{\link[=paste0]{paste0()}}
}
\examples{
require(magrittr)
"xyz" \%>\%
  prefix("abc")

}
