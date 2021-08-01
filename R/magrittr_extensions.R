#' Prefix a string of text
#'
#' Convenience function to use with magrittr
#' wraps [paste0()], hence vectorised as [paste0()]
#'
#' @examples
#' require(magrittr)
#' "xyz" %>%
#'   prefix("abc")
#'
#' @param text goes to the end, rest
#' @param ... goes to the front.
#' @export
#' @return Character. Character chain with the prefix added.
prefix <- function(text, ...) {
  paste0(..., text)
}

#' Apply a function depending on test output
#'
#' `iff` returns output of the function if and only if test is `TRUE`.
#' `iffn` returns output of the function if and only if test is `FALSE`.
#' They return the original value otherwise.
#' `iffelse` returns output of the first function if test is `TRUE`,
#' output of the second function otherwise.
#'
#' @examples
#' x <- 1
#' x %>%
#'   iff(is.na, const(0))
#' x <- NA
#' x %>%
#'   iff(is.na, const(0))
#'
#' x <- 1
#' x %>%
#'   iff(x <= 0, function(x) { x - 2 })
#' x <- -1
#' x %>%
#'   iff(x <= 0, function(x) { x - 2 })
#'
#' x <- NA
#' x %>%
#'   iffn(is.na, exp)
#' x <- 10
#' x %>%
#'   iffn(is.na, exp)
#'
#' @param obj object to apply test and fun to
#' @param test logical or function to apply to test
#' @param fun function to apply
#' @param ... passed on to test
#' @export
#' @return Output of function `fun` applied to the original value or the
#' original value, depending on the test.
iff <- function(obj, test, fun, ...) {
  if ( (is.function(test) && test(obj)) ||
       (is.logical(test) && test) ) {
    fun(obj, ...)
  } else {
    obj
  }
}

#' @rdname iff
#' @export
iffn <- function(obj, test, fun, ...) {
  if ( (is.function(test) && !test(obj)) ||
       (is.logical(test) && !test) ) {
    fun(obj, ...)
  } else {
    obj
  }
}

#' @rdname iff
#' @param true_fun function to apply when test is true
#' @param false_fun function to apply when test is false
#' @export
iffelse <- function(obj, test, true_fun, false_fun, ...) {
  if ( (is.function(test) && !test(obj)) ||
       (is.logical(test) && !test) ) {
    true_fun(obj, ...)
  } else {
    false_fun(obj, ...)
  }
}



#' Pipe into specific formal argument
#'
#' This rotates the order of the arguments such that the one named
#' in `param_name` comes first and then calls the function.
#'
#' @param x value to be piped into fun
#' @param param_name name of the argument that x should be assigned to
#' @param fun function
#' @param ... further arguments for fun
#'
#' @examples
#' require(magrittr)
#' 5L %>%
#'   pipe_into("digits", format, 2.731234567)
#'
#' @export
#' @return Output of `fun`.
pipe_into <- function(x, param_name, fun, ...) {
  x %>%
    list() %>%
    rlang::set_names(param_name) %>%
    c(list(...)) %>%
    { do.call(fun, .) }
}

#' Remove names of an object
#'
#' @param x object to unname
#' @export
#' @return x without names.
remove_names <- function(x) {
  names(x) <- NULL
  x
}

#' browser() in a magrittr pipe
#'
#' @export
#' @param x input
#' @param ... passed on to browser()
#' @return Used for side effect. Open a browser inside the pipe workflow.
browse_r <- function(x, ...) {
  print(x)
  browser(skipCalls = 2, ...)
  x
}
