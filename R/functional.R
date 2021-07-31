#' Create a constant function
#'
#' @param val return value of constant function (defaults to NULL)
#' @return A function always returning \code{val} accepting arbitrary arguments (dots)
#' @export
const <- function(val = NULL) {
  function(...) {
    val
  }
}
