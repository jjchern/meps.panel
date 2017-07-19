
<!-- README.md is generated from README.Rmd. Please edit that file -->
About `meps.panel`
==================

The goal of `meps.panel` is to wrap the two-year panel files from the Medical Expenditure Panel Survey (`meps`) Household Component (HC) in an R data package. All variable labels and value labels are included.

For more information about the consolidated MEPS-HC files, see [the AHRQ webpages](https://meps.ahrq.gov/mepsweb/data_stats/download_data_files_results.jsp?cboDataYear=All&cboDataTypeY=1%2CHousehold+Full+Year+File&buttonYearandDataType=Search&cboPufNumber=All&SearchTitle=Consolidated+Data), or the example code from the [`HHS-AHRQ/MEPS` repo](https://github.com/HHS-AHRQ/MEPS) by [`@e-mitchell`](https://github.com/e-mitchell).

For another attempt of downloading the MEPS data, see [the `ajdamico/asdfree` repo](https://github.com/ajdamico/asdfree/tree/master/Medical%20Expenditure%20Panel%20Survey) by [`@ajdamico`](https://github.com/ajdamico).

Currently the package includes data from panel 16 (2011-2012), panel 17 (year 2012-2013), and panel 18 (year 2013-2014). The rest of the panel files will be packaged soon.

Related R data packages:
========================

-   Full Year Consolidated Files: [`meps.hc`](https://github.com/jjchern/meps.hc)
-   Person Round Plan Files: [`meps.prpl`](https://github.com/jjchern/meps.prpl)

Installation
============

``` r
# install.packages("devtools")
devtools::install_github("jjchern/meps.panel")

# To uninstall the package, use:
# remove.packages("meps.panel")
```
