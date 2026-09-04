# UNHCR ggplot2 theme

`theme_unhcr` provides a basic **UNHCR** theme to use in
[`ggplot2`](https://ggplot2.tidyverse.org/reference/ggplot2-package.html)
commands.

## Usage

``` r
theme_unhcr(
  font_family = if (lato_installed()) "Lato" else "sans",
  font_size = 12,
  plot_title_size = rel(1.35),
  plot_title_margin = font_size,
  subtitle_size = font_size,
  subtitle_margin = font_size * 1.5,
  strip_text_size = rel(0.9),
  strip_text_face = "bold",
  strip_text_just = 0,
  caption_size = rel(0.7),
  caption_margin = font_size,
  axis_text = TRUE,
  axis_text_size = rel(0.9),
  axis_title = TRUE,
  axis_title_size = rel(0.9),
  axis = FALSE,
  axis_ticks = FALSE,
  grid = "XY",
  legend = TRUE,
  legend_text_size = rel(0.9),
  legend_title = FALSE,
  legend_title_size = rel(0.9),
  plot_margin = margin(font_size, font_size, font_size, font_size),
  plot_background = "#ffffff",
  void = FALSE
)
```

## Arguments

- font_family:

  Base font family "Lato". You need to have "Lato" font installed on
  your device in order to use it.

- font_size:

  Base font size in pt. Default to 12 pts.

- plot_title_size:

  Plot title font size. Default to `font_size` \* 1.35.

- plot_title_margin:

  Plot title bottom margin. Default to `font_size`.

- subtitle_size:

  Plot subtitle font size. Default to `font_size`.

- subtitle_margin:

  Plot subtitle bottom margin. Default to `font_size` \* 1.5.

- strip_text_size:

  Facet label font size. Default to `font_size` \* 0.9.

- strip_text_face:

  Facet label font face. Default to "bold".

- strip_text_just:

  Facet label justification. Default to 0.

- caption_size:

  Caption font size. Default to `font_size` \* 0.7.

- caption_margin:

  Caption top margin. Default to `font_size`.

- axis_text:

  Logical `TRUE`/`FALSE` or `xy`. Turn on and off axis label. Use `x` or
  `y` to have only the correspondent active. Default to `TRUE`.

- axis_text_size:

  Axis label font size. Default to `font_size` \* 0.9.

- axis_title:

  Logical `TRUE`/`FALSE` or `xy`. Turn on and off axis title. Use `x` or
  `y` to have only the correspondent active. Default to `TRUE`.

- axis_title_size:

  Axis title font size. Default to `font_size` \* 0.9.

- axis:

  Logical `TRUE`/`FALSE` or `xy`. Turn on and off axis. Use `x` or `y`
  to have only the correspondent axis active. Don't forget to review the
  `expand` argument of the `scale_x_*`/`scale_y_*` to avoid spacing
  between the axis and the baseline of the plot. Default to `FALSE`.

- axis_ticks:

  Logical `TRUE`/`FALSE` or `xy`. Turn on and off axis ticks. Use `x` or
  `y` to have only the correspondent axis ticks active. Default to
  `FALSE`.

- grid:

  Logical `TRUE`/`FALSE` or a combination of `X` or `x` and `Y` or
  y`. Turn on and off panel grids. Use `X`or`Y`for major grids, and`x`or`y`for minor grid. Default to`XY\`.

- legend:

  Logical `TRUE`/`FALSE`. Turn on and off the legend. Default to `TRUE`.

- legend_text_size:

  Legend key font size. Default to `font_size` \* 0.9.

- legend_title:

  Logical `TRUE`/`FALSE`. Turn on and off the legend title. Default to
  `FALSE`.

- legend_title_size:

  Legend title font size. Default to `font_size` \* 0.9.

- plot_margin:

  Plot margin (see
  [`margin`](https://ggplot2.tidyverse.org/reference/element.html)).
  Default to
  `ggplot2::margin(font_size, font_size, font_size, font_size)`.

- plot_background:

  Plot background. Put "transparent" for no background color. Default to
  "white".

- void:

  Logical `TRUE`/`FALSE`. If `TRUE`, all grid lines, ticks and axes are
  removed. Default to `FALSE`.

## Value

A ggplot2 theme object, the theme style.

## See also

[`theme_minimal`](https://ggplot2.tidyverse.org/reference/theme.html),
[`element_text`](https://ggplot2.tidyverse.org/reference/element.html),
[`ggtext::element_textbox_simple`](https://wilkelab.org/ggtext/reference/element_textbox.html)

## Examples

``` r
if (FALSE) { # \dontrun{

library(ggplot2)

data(mpg, package = "ggplot2")

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  theme_unhcr()
} # }
```
