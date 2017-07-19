
library(tidyverse)
library(haven)
library(stringr)
library(labelled)
library(devtools)

# Go to https://meps.ahrq.gov/mepsweb/data_stats/download_data_files_results.jsp?cboDataYear=All&cboDataTypeY=1%2CHousehold+Full+Year+File&buttonYearandDataType=Search&cboPufNumber=All&SearchTitle=Longitudinal

# 2013-2014 --------------------------------------------------------------------

## Download raw data file and SPSS programming statement

zip_url = "https://meps.ahrq.gov/mepsweb/data_files/pufs/h172ssp.zip"
spu_url = "https://meps.ahrq.gov/mepsweb/data_stats/download_data/pufs/h172/h172spu.txt"
ssp_fil = "data-raw/h172.ssp"

if (!file.exists(ssp_fil)) {
    temp = tempfile(fileext = ".zip")
    download.file(zip_url, temp)
    unzip(temp, exdir = "data-raw", junkpaths = TRUE)
}

## Raw data
read_xpt(ssp_fil) %>% rename_all(tolower) -> f2013_14
f2013_14

## Types of variables in the raw data (used in the very long sequence)
map(f2013_14, typeof) -> var_types
var_types # %>% as_tibble() %>% gather(var, type) %>% count(type)

## SPSS programming statement files
read_lines(spu_url) -> spu
spu

## Define a long sequence to extract variable label from the SPSS statement file
extract_var_la = . %>%
    as_tibble() %>%
    mutate(value = tolower(value)) %>%
    mutate(value = str_trim(value)) %>%
    mutate(i = case_when(
        str_detect(value, "variable label") ~ "variable label",
        str_detect(value, "value labels") ~ "value labels",
        str_detect(value, "execute") ~ "stop"
    )) %>%
    fill(i) %>%
    filter(i == "variable label") %>%
    select(-i) %>%
    slice(-1) %>%
    mutate(value = str_replace_all(value, "'", "")) %>%
    separate(value, c("var", "la"), extra = "merge") %>%
    deframe() %>%
    as.list()

## Assign variable labels
extract_var_la(spu) -> var_label(f2013_14)

## Define a very long sequence to extract value labels from the SPSS statement file
extract_val_la = . %>%
    as_tibble() %>%
    mutate(value = tolower(value)) %>%
    mutate(value = str_trim(value)) %>%
    mutate(i = case_when(
        str_detect(value, "variable label") ~ "variable label",
        str_detect(value, "value labels") ~ "value labels",
        str_detect(value, "execute") ~ "stop"
    )) %>%
    fill(i) %>%
    filter(i == "value labels") %>%
    select(-i) %>%
    slice(-1) %>%
    mutate(i = if_else(str_detect(value, "\\s/|\\s\\."), row_number(), NA_integer_)) %>%
    fill(i, .direction = "up") %>%
    group_by(i) %>%
    mutate(var = value[1]) %>%
    ungroup() %>%
    {split(.$value, .$var)} %>%
    map(~{
        var = .x[1]
        pieces = .x[-1] %>%
            str_replace_all("\\s/|\\s\\.|'", "") %>%
            str_split_fixed(" ", 2)
        levels = pieces[, 1]
        if (var_types[var] == "double") levels = as.double(levels)
        set_names(levels, pieces[, 2])
    })

## Assign value labels
extract_val_la(spu) -> val_labels(f2013_14)

## Convert all the labelled vectors into factors
as_factor(f2013_14) -> f2013_14

## Print and save
f2013_14
use_data(f2013_14)

# 2012-2013 --------------------------------------------------------------------

## Download raw data file and SPSS programming statement

zip_url = "https://meps.ahrq.gov/mepsweb/data_files/pufs/h164ssp.zip"
spu_url = "https://meps.ahrq.gov/mepsweb/data_stats/download_data/pufs/h164/h164spu.txt"
ssp_fil = "data-raw/h164.ssp"

if (!file.exists(ssp_fil)) {
    temp = tempfile(fileext = ".zip")
    download.file(zip_url, temp)
    unzip(temp, exdir = "data-raw", junkpaths = TRUE)
}

## Raw data
read_xpt(ssp_fil) %>% rename_all(tolower) -> f2012_13
f2012_13

## Types of variables in the raw data (used in the very long sequence)
map(f2012_13, typeof) -> var_types
var_types

## SPSS programming statement files
read_lines(spu_url) -> spu
spu

## Assign variable labels
extract_var_la(spu) -> var_label(f2012_13)

## Assign value labels
extract_val_la(spu) -> val_labels(f2012_13)

## Convert all the labelled vectors into factors
as_factor(f2012_13) -> f2012_13

## Print and save
f2012_13
use_data(f2012_13)

# 2011-2012 --------------------------------------------------------------------

## Download raw data file and SPSS programming statement

zip_url = "https://meps.ahrq.gov/mepsweb/data_files/pufs/h156ssp.zip"
spu_url = "https://meps.ahrq.gov/mepsweb/data_stats/download_data/pufs/h156/h156spu.txt"
ssp_fil = "data-raw/h156.ssp"

if (!file.exists(ssp_fil)) {
    temp = tempfile(fileext = ".zip")
    download.file(zip_url, temp)
    unzip(temp, exdir = "data-raw", junkpaths = TRUE)
}

## Raw data
read_xpt(ssp_fil) %>% rename_all(tolower) -> f2011_12
f2011_12

## Types of variables in the raw data (used in the very long sequence)
map(f2011_12, typeof) -> var_types
var_types

## SPSS programming statement files
read_lines(spu_url) -> spu
spu

## Assign variable labels
extract_var_la(spu) -> var_label(f2011_12)

## Assign value labels
extract_val_la(spu) -> val_labels(f2011_12)

## Convert all the labelled vectors into factors
as_factor(f2011_12) -> f2011_12

## Print and save
f2011_12
use_data(f2011_12)


# Delete raw ssp files ----------------------------------------------------

unlink("data-raw/*.ssp")
