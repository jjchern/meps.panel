
<!-- README.md is generated from README.Rmd. Please edit that file -->
About `meps.panel`
==================

[![Travis-CI Build Status](https://travis-ci.org/jjchern/meps.panel.svg?branch=master)](https://travis-ci.org/jjchern/meps.panel) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/jjchern/meps.panel?branch=master&svg=true)](https://ci.appveyor.com/project/jjchern/meps.panel) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/meps.panel)](https://cran.r-project.org/package=meps.panel)

The goal of `meps.panel` is to wrap the two-year panel files from the Medical Expenditure Panel Survey (`meps`) Household Component (HC) in an R data package. All variable labels and value labels are included.

For more information about the consolidated MEPS-HC panel files, see [the AHRQ webpages](https://meps.ahrq.gov/mepsweb/data_stats/download_data_files_results.jsp?cboDataYear=All&cboDataTypeY=1%2CHousehold+Full+Year+File&buttonYearandDataType=Search&cboPufNumber=All&SearchTitle=Longitudinal), or the example code from the [`HHS-AHRQ/MEPS` repo](https://github.com/HHS-AHRQ/MEPS) by [`@e-mitchell`](https://github.com/e-mitchell).

For another attempt of downloading the MEPS data, see [the `ajdamico/asdfree` repo](https://github.com/ajdamico/asdfree/tree/master/Medical%20Expenditure%20Panel%20Survey) by [`@ajdamico`](https://github.com/ajdamico).

Currently the package includes data from panel 16 (2011-2012), panel 17 (year 2012-2013), and panel 18 (year 2013-2014). The rest of the panel files will be packaged soon.

All MEPS-Related R data packages:
=================================

-   Full Year Consolidated Files: [`meps.hc`](https://github.com/jjchern/meps.hc)
-   Person Round Plan Files: [`meps.prpl`](https://github.com/jjchern/meps.prpl)
-   Two-Years Longitudinal Files: [`meps.panel`](https://github.com/jjchern/meps.panel)

Installation
============

``` r
# install.packages("devtools")
devtools::install_github("jjchern/meps.panel")

# To uninstall the package, use:
# remove.packages("meps.panel")
```

Usage
=====

``` r
# Load tibble for better printout
library(tibble)

meps.panel::f2013_14
#> # A tibble: 16,714 x 3,454
#>      duid    pid dupersid       panel                 yearind saqrds24
#>    <fctr> <fctr>   <fctr>      <fctr>                  <fctr>   <fctr>
#>  1  40001    101 40001101 18 panel 18 1 in both 2013 and 2014    1 yes
#>  2  40001    102 40001102 18 panel 18 1 in both 2013 and 2014    1 yes
#>  3  40001    103 40001103 18 panel 18 1 in both 2013 and 2014     0 no
#>  4  40001    104 40001104 18 panel 18 1 in both 2013 and 2014     0 no
#>  5  40002    101 40002101 18 panel 18 1 in both 2013 and 2014    1 yes
#>  6  40004    101 40004101 18 panel 18 1 in both 2013 and 2014    1 yes
#>  7  40004    102 40004102 18 panel 18 1 in both 2013 and 2014    1 yes
#>  8  40004    103 40004103 18 panel 18 1 in both 2013 and 2014     0 no
#>  9  40004    104 40004104 18 panel 18 1 in both 2013 and 2014     0 no
#> 10  40004    105 40004105 18 panel 18 1 in both 2013 and 2014     0 no
#> # ... with 16,704 more rows, and 3448 more variables: all5rds <fctr>,
#> #   died <fctr>, inst <fctr>, military <fctr>, entrsrvy <fctr>,
#> #   leftus <fctr>, other <fctr>, famid1 <fctr>, famid2 <fctr>,
#> #   famid3 <fctr>, famid4 <fctr>, famid5 <fctr>, famidy1 <fctr>,
#> #   famidy2 <fctr>, famidyr1 <fctr>, famidyr2 <fctr>, cpsfamy1 <fctr>,
#> #   cpsfamy2 <fctr>, fcszy1 <fctr>, fcszy2 <fctr>, fcrpy1 <fctr>,
#> #   fcrpy2 <fctr>, ruletr1 <fctr>, ruletr2 <fctr>, ruletr3 <fctr>,
#> #   ruletr4 <fctr>, ruletr5 <fctr>, ruletry1 <fctr>, ruletry2 <fctr>,
#> #   rusize1 <fctr>, rusize2 <fctr>, rusize3 <fctr>, rusize4 <fctr>,
#> #   rusize5 <fctr>, rusizey1 <fctr>, rusizey2 <fctr>, ruclas1 <fctr>,
#> #   ruclas2 <fctr>, ruclas3 <fctr>, ruclas4 <fctr>, ruclas5 <fctr>,
#> #   ruclasy1 <fctr>, ruclasy2 <fctr>, famsze1 <fctr>, famsze2 <fctr>,
#> #   famsze3 <fctr>, famsze4 <fctr>, famsze5 <fctr>, famszey1 <fctr>,
#> #   famszey2 <fctr>, fmrsy1 <fctr>, fmrsy2 <fctr>, famsy1 <fctr>,
#> #   famsy2 <fctr>, famszyr1 <fctr>, famszyr2 <fctr>, famrfpy1 <fctr>,
#> #   famrfpy2 <fctr>, region1 <fctr>, region2 <fctr>, region3 <fctr>,
#> #   region4 <fctr>, region5 <fctr>, regiony1 <fctr>, regiony2 <fctr>,
#> #   refprs1 <fctr>, refprs2 <fctr>, refprs3 <fctr>, refprs4 <fctr>,
#> #   refprs5 <fctr>, refprsy1 <fctr>, refprsy2 <fctr>, resp1 <fctr>,
#> #   resp2 <fctr>, resp3 <fctr>, resp4 <fctr>, resp5 <fctr>, respy1 <fctr>,
#> #   respy2 <fctr>, proxy1 <fctr>, proxy2 <fctr>, proxy3 <fctr>,
#> #   proxy4 <fctr>, proxy5 <fctr>, proxyy1 <fctr>, proxyy2 <fctr>,
#> #   intvlang <fctr>, begrfm1 <fctr>, begrfm2 <fctr>, begrfm3 <fctr>,
#> #   begrfm4 <fctr>, begrfm5 <fctr>, begrfy1 <fctr>, begrfy2 <fctr>,
#> #   begrfy3 <fctr>, begrfy4 <fctr>, begrfy5 <fctr>, endrfm1 <fctr>,
#> #   endrfm2 <fctr>, endrfm3 <fctr>, ...
```
