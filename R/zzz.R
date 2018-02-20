cc <- function(x) Filter(Negate(is.null), x)

parseurl <- function(x) {
  tmp <- urltools::url_parse(x)
  tmp <- as.list(tmp)
  if (!is.na(tmp$parameter)) {
    tmp$parameter <- sapply(strsplit(tmp$parameter, "&")[[1]], function(z) {
      zz <- strsplit(z, split = "=")[[1]]
      as.list(stats::setNames(zz[2], zz[1]))
    }, USE.NAMES = FALSE)
  }
  tmp
}

last <- function(x) x[length(x)]

strextract <- function(str, pattern) regmatches(str, gregexpr(pattern, str))[[1]]

`%||%` <- function (x, y) {
  if (is.null(x) || length(x) == 0 || nchar(x) == 0) y else x
}

assert <- function(x, y) {
  if (!is.null(x)) {
    if (!inherits(x, y)) {
      stop(deparse(substitute(x)), " must be of class ",
          paste0(y, collapse = ", "), call. = FALSE)
    }
  }
}
