#' arpr R package
#'
#' Advanced R pipes
#' \tabular{ll}{
#' Package: \tab arpr\cr
#' Type: \tab Package\cr
#' License: \tab GPL (>= 3)\cr
#' LazyLoad: \tab yes\cr
#'}
#'
#' @name arpr
#' @docType package
#' @title  Advanced R pipes
#' @author Jirka Lewandowski \email{jirka.lewandowski@@wzb.eu}
#' @references \url{http://blog.points-of-interest.cc/}
#'
#'
#' @import magrittr
NULL

## A fix to let CRAN check NOTEs diasappear for non-standard-evaluation used
## cf. http://stackoverflow.com/questions/9439256/how-can-i-handle-r-cmd-check-no-visible-binding-for-global-variable-notes-when
globalVariables(c("."))
