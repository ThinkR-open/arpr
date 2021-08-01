
<!-- README.md is generated from README.Rmd. Please edit that file -->

# arpr

<!-- badges: start -->

[![R-CMD-check](https://github.com/statnmap/arpr/workflows/R-CMD-check/badge.svg)](https://github.com/statnmap/arpr/actions)
<!-- badges: end -->

The goal of arpr is to provide convenience functions for programming
with magrittr pipes. Conditional pipes, a string prefixer and a function
to pipe the given object into a specific argument given by character
name are currently supported. It is named after the dadaist Hans Arp, a
friend of Rene Magritte.

*Note that the {arpr} package was originally created by [Jirka
Lewandowski](https://github.com/jirkalewandowski). The present
repository is a fork to be able to continue development of this package,
required for [{gitlabr}](https://github.com/statnmap/gitlabr).*

## Installation

You can install the released version of arpr from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("arpr")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("statnmap/arpr")
```

## Examples

``` r
library(arpr)
```

-   Prefix a string of text

``` r
"xyz" %>%
   prefix("abc")
#> [1] "abcxyz"
```

-   `iff()` applies a function if and only if test is TRUE
    -   otherwise return input value unchanged
    -   `iffn()` is if and only if test is FALSE

``` r
x <- 1
x %>%
  iff(is.na, const(0))
#> [1] 1
x <- NA
x %>%
  iff(is.na, const(0))
#> [1] 0

x <- 1
x %>%
  iff(x <= 0, function(x) { x - 2 })
#> [1] 1
x <- -1
x %>%
  iff(x <= 0, function(x) { x - 2 })
#> [1] -3

x <- NA
x %>%
  iffn(is.na, exp)
#> [1] NA
x <- 10
x %>%
  iffn(is.na, exp)
#> [1] 22026.47
```

-   Pipe into specific formal argument

``` r
5L %>%
  pipe_into("digits", format, 2.731234567)
#> [1] "2.7312"
```
