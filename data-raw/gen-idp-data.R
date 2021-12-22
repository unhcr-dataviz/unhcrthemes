library(unhcrdatapackage) ## ## remotes::install_github("unhcr/unhcrdatapackage")
library(tidyverse)
library(janitor)
library(usethis)

idp <- unhcrdatapackage::demographics |>
  clean_names() |>
  mutate(year = as.integer(year)) |>
  filter(population_type == "IDP", year >= 2010) |>
  select(year, country = country_asylum_name,
         female = female_total, male = male_total) |>
  pivot_longer(cols = female:male, names_to = "sex",
               values_to = "idp") |>
  filter(idp > 0)

glimpse(idp)

###
usethis::use_data(idp, overwrite = TRUE)
