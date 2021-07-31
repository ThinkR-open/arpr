#' Prefix a path
#'
#' file.path with arguments reversed
#'
#' @param path path to be prefixed
#' @param prefix path to be appended before
#' @param ... passed on to file.path
#' @return \code{file.path(prefix, path, ...)}
#' @export
prefix_path <- function(path, prefix, ...) {
  file.path(prefix, path, ...)
}
