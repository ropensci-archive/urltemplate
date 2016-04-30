#' Get variables that can be expanded
#'
#' @export
#' @param x A template
#' @examples \dontrun{
#' variables("http:www{.domain*}{/top,next}{?q:20}")
#' variables("http://www.{domain}/")
#' variables("find{?year*}")
#' variables("www{.dom*}")
#' variables("{x,hello,y}")
#' variables("{#path:6}/here")
#' variables("up{+path}{var}/here")
#' }
variables <- function(x) {
  vars <- list()
  res <- strextract(x, TEMPLATE)
  res <- gsub("\\{|\\}", "", res)
  out <- c()
  for (i in seq_along(res)) {
    if (res[i] %in% OPERATOR) {
      res <- res[2:length(res)]
    }
    resspec <- strsplit(res[i], ",")[[1]]
    for (j in seq_along(resspec)) {
      # handle prefix values
      var <- strsplit(resspec[j], ":")[[1]][[1]]
      # handle composite values
      if (grepl("\\*$", var)) {
        var <- sub("\\*$", "", var)
      }
      var <- gsub("[[:punct:]]", "", var)
      out <- c(out, var)
    }
  }
  return(out)
}
