urltemplate
===========



[![Build Status](https://travis-ci.org/ropenscilabs/urltemplate.svg?branch=master)](https://travis-ci.org/ropenscilabs/urltemplate)

URL templating following RFC6570 (<https://tools.ietf.org/html/rfc6570#page-14>).

## install


```r
devtools::install_github("ropenscilabs/urltemplate")
```


```r
library(urltemplate)
```

## variables

Get the set of keywords in a uri template


```r
variables("http:www{.domain*}{/top,next}{?q:20}")
#> [1] "domain" "top"    "next"   "q"
variables("http://www.{domain}/")
#> [1] "domain"
variables("find{?year*}")
#> [1] "year"
```

## TODO

* Implement `expand()` method
* test suite
* vignette

## Meta

* Please [report any issues or bugs](https://github.com/ropenscilabs/urltemplate/issues).
* License: MIT
* Get citation information for `urltemplate` in R doing `citation(package = 'urltemplate')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). 
By participating in this project you agree to abide by its terms.

[![ropensci_footer](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)
