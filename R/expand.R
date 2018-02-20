#' Expand - expand a uri template with data
#'
#' @export
#' @examples
#' expand(template = 'http://www.{domain}/', variables = '{"domain": "foo.com"}')
expand <- function(template, variables) {
  sub(TEMPLATE, .ex_pand(variables), template)
}

RESERVED <- ":/?#[]@!$&'()*+,;="
OPERATOR <- "+#./;?&|!@"
MODIFIER <- ":^"
TEMPLATE <- "\\{([^\\}]+)\\}"

# x <- template <- "http://www.{domain}/"
# x <- template2 <- 'http:www{.domain*}{/top,next}{?q:20}'
# variables <- list(domain = "foo.com")

.ex_pand <- function(variables, OPERATOR, RESERVED) {
  operator <- ""
  ex_pression <- ""
  if (substring(ex_pression, 1, 1) %in% OPERATOR) {
    operator <- ex_pression[1]
    varlist <- ex_pression[2:length(ex_pression)]
  } else {
    varlist <- ex_pression
  }

  safe <- ""
  if (operator %in% c("+", "#")) {
    safe <- RESERVED
  }
  varspecs <- strsplit(varlist, ",")[[1]]
  varnames <- c()
  defaults <- list()
  for (i in seq_along(varspecs)) {
    default <- NULL
    explode <- FALSE
    prefix <- NULL
    if ("=" %in% varspecs[i]) {
      varname <- strsplit(varspecs[i], "=")[[1]]
      default <- ""
    } else {
      varname <- varspecs[i]
    }

    if (last(varname) == "*") {

    } else if (":" %in% varname) {
      prefix <- tryCatch(as.integer(varname))
    }
    #             if varname[-1] == "*":
    #                 explode = True
    #                 varname = varname[:-1]
    #             elif ":" in varname:
    #                 try:
    #                     prefix = int(varname[varname.index(":")+1:])
    #                 except ValueError:
    #                     raise ValueError("non-integer prefix '{0}'".format(
    #                        varname[varname.index(":")+1:]))
    #                 varname = varname[:varname.index(":")]

  }
}

# def expand(template, variables):
#     """
#     Expand template as a URI Template using variables.
#     """
#     def _sub(match):
#         expression = match.group(1)
#         operator = ""
#         if expression[0] in OPERATOR:
#             operator = expression[0]
#             varlist = expression[1:]
#         else:
#             varlist = expression

#         safe = ""
#         if operator in ["+", "#"]:
#             safe = RESERVED
#         varspecs = varlist.split(",")
#         varnames = []
#         defaults = {}
#         for varspec in varspecs:
#             default = None
#             explode = False
#             prefix = None
#             if "=" in varspec:
#                 varname, default = tuple(varspec.split("=", 1))
#             else:
#                 varname = varspec
#             if varname[-1] == "*":
#                 explode = True
#                 varname = varname[:-1]
#             elif ":" in varname:
#                 try:
#                     prefix = int(varname[varname.index(":")+1:])
#                 except ValueError:
#                     raise ValueError("non-integer prefix '{0}'".format(
#                        varname[varname.index(":")+1:]))
#                 varname = varname[:varname.index(":")]
#             if default:
#                 defaults[varname] = default
#             varnames.append((varname, explode, prefix))

#         retval = []
#         joiner = operator
#         start = operator
#         if operator == "+":
#             start = ""
#             joiner = ","
#         if operator == "#":
#             joiner = ","
#         if operator == "?":
#             joiner = "&"
#         if operator == "&":
#             start = "&"
#         if operator == "":
#             joiner = ","
#         for varname, explode, prefix in varnames:
#             if varname in variables:
#                 value = variables[varname]
#                 if not value and value != "" and varname in defaults:
#                     value = defaults[varname]
#             elif varname in defaults:
#                 value = defaults[varname]
#             else:
#                 continue
#             expanded = TOSTRING[operator](
#               varname, value, explode, prefix, operator, safe=safe)
#             if expanded is not None:
#                 retval.append(expanded)
#         if len(retval) > 0:
#             return start + joiner.join(retval)
#         else:
#             return ""

#     return TEMPLATE.sub(_sub, template)
