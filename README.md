
<!-- README.md is generated from README.Rmd. Please edit that file -->

# unhcrthemes

<!-- badges: start -->
<!-- badges: end -->

The goal of unhcrthemes is to provide a collection of template, palettes
and themes for plots, documents, and slides based on UNHCR branding.

## Installation

You can install the released version of unhcrthemes from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("unhcrthemes")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("vidonne/unhcrthemes")
```

## Usage

``` r
library(unhcrthemes)
library(ggplot2)
# install.packages("extrafont")
library(extrafont)

# Import system font to R, to be done once
# extrafont::font_import()
extrafont::loadfonts(device="postscript")
```

### Base ggplot2 theme

``` r
ggplot(datasets::iris, aes(x = Petal.Length, y = Petal.Width)) +
  geom_point() +
  labs(x="Petal length", y="Petal width",
      title = "Iris data ggplot2 scatterplot example",
      subtitle= "Just a simple plot to show the basic style of theme_unhcr",
      caption = "Data from datasets::iris") +
  theme_unhcr()
```

<img src="man/figures/README-plot-theme-1.png" width="100%" />
