
<!-- README.md is generated from README.Rmd. Please edit that file -->

# unhcrthemes <img src='man/figures/logo.svg' align="right" alt="unhcrthemes package hex sticker" width="140" />

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![R-CMD-check](https://github.com/unhcr-dataviz/unhcrthemes/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/unhcr-dataviz/unhcrthemes/actions/workflows/R-CMD-check.yaml)
<!-- [![CRAN status](https://www.r-pkg.org/badges/version/unhcrthemes)](https://CRAN.R-project.org/package=unhcrthemes) -->
<!-- badges: end -->

Simplify the creation of your data visualizations with the
`{unhcrthemes}` R package. It is designed to align your plots with
[UNHCR’s data
visualization](https://dataviz.unhcr.org/general_guidance/)
recommendations. This package offers a comprehensive `{ggplot2}` theme,
including built-in customizations and thoughtfully crafted color
palettes.

## Features

- A consistent and appealing `{ggplot2}` theme that matches [UNHCR Data
  Visualization
  Guidelines](https://dataviz.unhcr.org/general_guidance/).
- A collection of color palettes ensuring your plots are consistent with
  [UNHCR’s color scheme](https://dataviz.unhcr.org/general_guidance/).
- Easy-to-use functions to apply the theme and color palettes to your
  `{ggplot2}` plots.

## Installation

Get started by installing the `{unhcrthemes}` package from GitHub using
the `{pak}` library:

``` r
# If pak is not yet installed, uncomment the following line:
# install.packages("pak")

pak::pkg_install("unhcr-dataviz/unhcrthemes")
```

## Usage

``` r
# Load required packages
library(ggplot2)
library(unhcrthemes)
```

### Base `{ggplot2}` theme

``` r
# Apply the theme_unhcr() to your plot
ggplot(
  mtcars,
  aes(x = hp, y = mpg)
) +
  geom_point() +
  labs(
    title = "Simple scatterplot with ggplot",
    subtitle = "This plot shows the default style of theme_unhcr()",
    x = "Horsepower (hp)",
    y = "Fuel efficiency (mpg)",
    caption = "Source: mtcars"
  ) +
  theme_unhcr()
```

<img src="man/figures/README-base-plot-1.png" width="90%" style="display: block; margin: auto;" />

### Font

One of the two officially recommended fonts outlined in the [UNHCR Data
Visualization Guidelines](https://dataviz.unhcr.org/general_guidance/)
is [`Lato`](https://fonts.google.com/specimen/Lato). To ensure optimal
functionality of the `{unhcrthemes}` package, please make sure that the
`Lato` font is installed on your device prior to usage.

### Color palettes

Choose from a variety of carefully curated color palettes that harmonize
with UNHCR’s visual identity.

``` r
# Display all unhcr color palette
display_unhcr_all()
```

<img src="man/figures/README-palette-all-1.png" width="90%" style="display: block; margin: auto;" />

``` r
# Or select a specific one and limit the number of colors
display_unhcr_pal(n = 3, "pal_blue")
```

<img src="man/figures/README-palette-blue-1.png" width="90%" style="display: block; margin: auto;" />

### Scales (color/fill)

``` r
# Add color scale to your plot
ggplot(
  mtcars,
  aes(x = hp, y = mpg, color = as.factor(cyl))
) +
  geom_point(alpha = .8) +
  labs(
    title = "Simple scatterplot with ggplot",
    subtitle = "This plot shows the default style of theme_unhcr()",
    x = "Horsepower (hp)",
    y = "Fuel efficiency (mpg)",
    color = "Number of cylinder",
    caption = "Source: mtcars"
  ) +
  scale_color_unhcr_d() +
  theme_unhcr(legend_title = TRUE)
```

<img src="man/figures/README-scale-plot-1.png" width="90%" style="display: block; margin: auto;" />

### Geoms (text/label)

``` r
# Default Lato font also apply for geom_text and label
dplyr::count(mpg, class) |>
  dplyr::arrange(n) |>
  dplyr::mutate(class = factor(class, levels = class)) |>
  ggplot(aes(n, class)) +
  geom_col(fill = unhcr_pal(n = 1, "pal_blue")) +
  geom_text(aes(label = n), hjust = 0, nudge_x = 1) +
  labs(
    title = "Simple bar chart with labels using ggplot",
    subtitle = "This plot shows the default style of theme_unhcr()",
    caption = "Source: mtcars"
  ) +
  scale_x_continuous(expand = expansion(c(0, 0.1))) +
  theme_unhcr(grid = FALSE, axis = "y", axis_title = FALSE, axis_text = "y")
```

<img src="man/figures/README-geom-plot-1.png" width="90%" style="display: block; margin: auto;" />

Explore more examples of `{unhcrthemes}` in action on the [package
vignette](https://unhcr-dataviz.github.io/unhcrthemes/articles/intro-unhcrthemes.html)
or [UNHCR Data Visualization
Platform](https://dataviz.unhcr.org/tools/r/).

## Additional UNHCR Tools

- [`{refugees}`](https://github.com/PopulationStatistics/refugees): A
  comprehensive package for accessing [UNHCR Refugee Population
  Statistics
  Database](https://www.unhcr.org/refugee-statistics/download/).
- [`{unhcrdown}`](https://github.com/unhcr-dataviz/unhcrdown): UNHCR
  branded templates for [R Markdown](https://rmarkdown.rstudio.com/).
- [`quarto-revealjs-unhcr`](https://github.com/unhcr-dataviz/quarto-revealjs-unhcr):
  A [Quarto](https://quarto.org/) extension to create [UNHCR
  branded](https://www.unhcr.org/brand) `reveal.js` presentations.
- [`quarto-html-unhcr`](https://github.com/unhcr-dataviz/quarto-html-unhcr):
  A [Quarto](https://quarto.org/) extension to create [UNHCR
  branded](https://www.unhcr.org/brand) `HTML` document.
- [Data Visualization Platform](https://dataviz.unhcr.org/): A
  collection of recommendations on selecting the best type of chart,
  general dataviz design, tools and tutorials and a selection of data
  visualization products made by UNHCR.

## Acknowledgements

We extend our gratitude to the creators of the
[`{hrbrthemes}`](https://github.com/hrbrmstr/hrbrthemes),
[`{rcartocolor}`](https://github.com/Nowosad/rcartocolor) and
[`{cowplot}`](https://github.com/wilkelab/cowplot/) packages that
influenced the development of `{unhcrthemes}`.

## Contribution and Code of Conduct

Contributions to `{unhcrthemes}` are highly valued. To ensure a
welcoming and inclusive community, we follow our [Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
If you have suggestions, uncover bugs, or envision new features, kindly
submit an [issue on
GitHub](https://github.com/unhcr-dataviz/unhcrthemes/issues). To
contribute code, don’t hesitate to fork the repository and create a pull
request.

## License

This package is distributed under the [MIT
License](https://github.com/unhcr-dataviz/unhcrthemes/blob/master/LICENSE.md).
