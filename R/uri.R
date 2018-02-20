urltemplate_port_mapping <- list(
  "http" = 80,
  "https" = 443,
  "ftp" = 21,
  "tftp" = 69,
  "sftp" = 22,
  "ssh" = 22,
  "svn+ssh" = 22,
  "telnet" = 23,
  "nntp" = 119,
  "gopher" = 70,
  "wais" = 210,
  "ldap" = 389,
  "prospero" = 1525
)

urltemplate_ip_based_schemes <- c("http", "https", "ftp", "tftp", 
  "sftp", "ssh", "svn+ssh", "telnet", "nntp", "gopher", "wais", 
  "ldap", "prospero")


#' Returns the set of keywords in a uri template
#'
#' @export
#' @param uri (character) any URI
#' @examples
#' # no URI given
#' x <- uri()
#' x
#' x$port_mapping
#' x$ip_based_schemes
#' 
#' # give a URI
#' x <- uri("http:.//example.com/foo/bar")
#' x
#' x$uri
#' ## parse it
#' x$parse()
#' x$uri_parsed
#' 
#' # join
#' base <- "http://example.com"
#' uri <- uri("relative/path")
#' uri$parse()
#' uri$join(base, uri)
uri <- function(x = "") {
  Uri$new(uri = x)
}

Uri <- R6::R6Class(
  "Uri",
  public = list(
    uri = NULL,
    uri_parsed = NULL,

    initialize = function(uri) {
      self$uri <- uri
    },

    print = function() {
      # cat("<uri> ", sep = "\n")
      cat(paste0("<uri>: ", self$uri %||% "none"), sep = "\n")
      invisible(self)
    },

    parse = function(...) {
      self$uri_parsed <- as.list(urltools::url_parse(self$uri, ...))
      invisible(self)
    },

    join = function(base, path) {
      path <- switch(class(path)[[1L]], character = path, Uri = path$uri)
      file.path(base, path)
    },

    port_mapping = urltemplate_port_mapping,
    ip_based_schemes = urltemplate_ip_based_schemes
  )
)
