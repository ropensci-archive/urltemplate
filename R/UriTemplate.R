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
#' @examples \dontrun{
#' # no URI given
#' x <- template()
#' x
#' x$port_mapping
#' x$ip_based_schemes
#' 
#' # give a URI
#' x <- template("http:.//example.com/foo/bar")
#' x
#' x$pattern
#' ## parse it
#' # x$parse()
#' # x$uri_parsed
#' 
#' # join
#' # base <- "http://example.com"
#' # uri <- template("relative/path")
#' # uri$parse()
#' # uri$join(base, uri)
#' }
template <- function(uri = "") {
  UriTemplate$new(uri)
}

UriTemplate <- R6::R6Class(
  "UriTemplate",
  public = list(
    pattern = NULL,
    uri_parsed = NULL,

    initialize = function(pattern) {
      assert(pattern, "character")
      self$pattern <- pattern
    },

    print = function() {
      # cat("<uri> ", sep = "\n")
      cat(paste0("<uri>: ", self$pattern %||% "none"), sep = "\n")
      invisible(self)
    }

    # # Returns an Array of variables used within the template pattern.
    # # The variables are listed in the Array in the order they appear within
    # # the pattern.  Multiple occurrences of a variable within a pattern are
    # # not represented in this Array.
    # #
    # # @return [Array] The variables present in the template's pattern.
    # def variables
    #   @variables ||= ordered_variable_defaults.map { |var, val| var }.uniq
    # end

    # # Returns a mapping of variables to their default values specified
    # # in the template. Variables without defaults are not returned.
    # #
    # # @return [Hash] Mapping of template variables to their defaults
    # def variable_defaults
    #   @variable_defaults ||=
    #     Hash[*ordered_variable_defaults.reject { |k, v| v.nil? }.flatten]
    # end
  )
)
